package com.chubao.cf.game.service;

import com.chubao.cf.game.config.Constants;
import com.chubao.cf.game.domain.Article;
import com.chubao.cf.game.domain.Game;
import com.chubao.cf.game.domain.PaymentOption;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 * 创建者: 程峰
 * 创建时间: 16/2/20 下午1:26
 * 任务号:
 * 创建说明: 充值服务
 */
@Service
public class PaymentService implements IPaymentService {

    @Autowired
    private IArticleContentService articleContentService;
    @Autowired
    private IGameService gameService;

    private ObjectMapper objectMapper = new ObjectMapper();

    @Override
    public HashMap<String, PaymentOption> getGamePaymentOptions() {
        Article payment = articleContentService.getArticle(Constants.getGamePaymentArticleId());
        HashMap<String,PaymentOption> gamePaymentOptions = new HashMap<>();
        try {
            gamePaymentOptions = objectMapper.readValue(payment.getContent(), new TypeReference<HashMap<String,PaymentOption>>(){});
        } catch (IOException e) {
            setInitialPaymentOption();
            gamePaymentOptions=getGamePaymentOptions();
        }
        return gamePaymentOptions;
    }

    @Override
    public HashMap<String, HashMap<String, String>> getGamePaymentOptionsOfRateMap() {
        HashMap<String,PaymentOption> paymentOptionHashMap = getGamePaymentOptions();
        HashMap<String,HashMap<String,String>> rateMap = new HashMap<>();
        for(Map.Entry<String,PaymentOption> entry:paymentOptionHashMap.entrySet()){
            rateMap.put(entry.getKey(),entry.getValue().rateMap());
        }
        return rateMap;
    }

    @Override
    public PaymentOption getPaymentOption(Integer gameId) {
        HashMap<String,PaymentOption> paymentOptionHashMap = getGamePaymentOptions();
        return paymentOptionHashMap.get(gameId.toString());
    }

    @Override
    public void setPaymentOption(PaymentOption paymentOption) {
        HashMap<String,PaymentOption> paymentOptionHashMap = getGamePaymentOptions();
        paymentOptionHashMap.put(paymentOption.getGameId().toString(),paymentOption);
        setPaymentOptions(paymentOptionHashMap);
    }

    @Override
    public void setInitialPaymentOption() {
        ArrayList<Game> games = gameService.getGames();
        HashMap<String,PaymentOption> paymentOptionHashMap = new HashMap<>();
        for(Game game:games){
            paymentOptionHashMap.put(game.getGameId().toString(),new PaymentOption(game.getGameId()));
        }
        setPaymentOptions(paymentOptionHashMap);
    }

    @Override
    public void setPaymentOptions(HashMap<String, PaymentOption> paymentOptions) {
        Article paymentOption = articleContentService.getArticle(Constants.getGamePaymentArticleId());
        try {
            paymentOption.setContent(objectMapper.writeValueAsString(paymentOptions));
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        articleContentService.editContent(paymentOption);
    }
}
