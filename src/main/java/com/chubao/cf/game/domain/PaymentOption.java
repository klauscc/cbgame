package com.chubao.cf.game.domain;

import java.util.HashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 创建者: 程峰
 * 创建时间: 16/2/19 下午3:40
 * 任务号:
 * 创建说明: 游戏充值选项
 */
public class PaymentOption {

    /**
     * 游戏id
     */
    private Integer gameId;
    /**
     * 货币单位
     */
    private String currency="元宝";

    /**
     * 人民币兑换游戏货币比例，1人民币兑换rate的游戏货币
     */
    private String rate= initialRate;

    private static final String initialRate = "1:100;10:1000;20:2000;50:5000;100:10000;500:50000;";
    private static final String rateRgx = "([0-9]+:[0-9]+;)+";

    public PaymentOption(){

    }

    public PaymentOption(Integer gameId) {
        this.gameId = gameId;
    }

    public Integer getGameId() {
        return gameId;
    }

    public void setGameId(Integer gameId) {
        this.gameId = gameId;
    }

    public String getCurrency() {
        return currency;
    }

    public void setCurrency(String currency) {
        this.currency = currency;
    }

    public String getRate() {
        return rate;
    }

    public void setRate(String rate) {
        Pattern pattern = Pattern.compile(rateRgx);
        Matcher matcher = pattern.matcher(rate);
        if(matcher.matches()){
            this.rate = rate;
        } else {
            this.rate = initialRate;
        }
    }

    public HashMap<String,String> rateMap(){
        String[] rates = rate.split(";");
        HashMap<String,String> rateMap = new HashMap<>();
        for (String rate1 : rates) {
            String[] tmp = rate1.split(":");
            rateMap.put(tmp[0], tmp[1]);
        }
        return rateMap;
    }

}
