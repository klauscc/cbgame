package com.chubao.cf.game.controller.admin;

import com.chubao.cf.game.domain.Game;
import com.chubao.cf.game.domain.PaymentOption;
import com.chubao.cf.game.service.IGameService;
import com.chubao.cf.game.service.IPaymentService;
import com.chubao.cf.game.service.others.HtmlSafety;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.HashMap;

/**
 * 创建者: 程峰
 * 创建时间: 16/2/20 下午2:10
 * 任务号:
 * 创建说明: 充值相关
 */
@Controller
@RequestMapping(value = "/admin")
public class AdminPaymentController {

    @Autowired
    private IPaymentService paymentService;
    @Autowired
    private IGameService gameService;

    @RequestMapping(value = "/payment",method = RequestMethod.GET)
    public String paymentView(Model model){
        ArrayList<Game> games = gameService.getGames();
        HashMap<String,PaymentOption> paymentOptions = paymentService.getGamePaymentOptions();
        HashMap<String,String> gameHashMap = new HashMap<>();
        for(Game game:games){
            gameHashMap.put(game.getGameId().toString(),game.getName());
        }
        model.addAttribute("gameMap",gameHashMap);
        model.addAttribute("gamePaymentOptions",paymentOptions);
        return "/admin/payment";
    }

    @RequestMapping(value = "/payment",method = RequestMethod.POST)
    public String payment(PaymentOption paymentOption,Model model,RedirectAttributes redirectAttributes){
        paymentOption.setCurrency(HtmlSafety.none(paymentOption.getCurrency()));
        paymentService.setPaymentOption(paymentOption);
        redirectAttributes.addFlashAttribute("flag", "true");
        redirectAttributes.addFlashAttribute("editGameId",paymentOption.getGameId());
        redirectAttributes.addFlashAttribute("msg","修改成功");
        return "redirect:/admin/payment";
    }
}
