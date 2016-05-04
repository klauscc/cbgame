package com.chubao.cf.game.controller;

import com.chubao.cf.game.config.Constants;
import com.chubao.cf.game.controller.util.SecurityCode;
import com.chubao.cf.game.domain.Article;
import com.chubao.cf.game.domain.Game;
import com.chubao.cf.game.domain.PaymentOption;
import com.chubao.cf.game.domain.User;
import com.chubao.cf.game.service.*;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 创建者: 程峰
 * 创建时间: 16/1/16 下午9:39
 * 任务号:
 * 创建说明: 主页
 */
@Controller
public class HomeController {

    @Autowired
    private IGameService gameService;
    @Autowired
    private IArticleContentService articleService;
    @Autowired
    private UserService userService;
    @Autowired
    private HttpSession session;
    @Autowired
    private SecurityCode securityCode;
    @Autowired
    private IPaymentService paymentService;
    /**
     * 主页
     * @param model 数据模型
     * @return 模板
     */
    @RequestMapping(value = "/")
    public String home(Model model){
        List<Game> games = gameService.getGamesByTypeAndPage(0, 1);
        model.addAttribute("title","触宝游戏");
        model.addAttribute("games",games);
        return "/user/index";
    }


    /**
     * 关于我们
     * @param model 数据模型
     * @return 模板
     */
    @RequestMapping(value = "/about")
    public String about(Model model){
        Article article = articleService.getArticle(Constants.getAboutArticleId());
        model.addAttribute("title","触宝游戏|关于我们");
        model.addAttribute("article",article);
        return "/user/article";
    }

    /**
     * 联系我们
     * @param model 数据模型
     * @return 模板
     */
    @RequestMapping(value = "/contactUs")
    public String contactUs(Model model){
        Article article = articleService.getArticle(Constants.getContactUsArticleId());
        model.addAttribute("title","触宝游戏|联系我们");
        model.addAttribute("article",article);
        return "/user/article";
    }

    /**
     * 关于我们
     * @param model 数据模型
     * @return 模板
     */
    @RequestMapping(value = "/license")
    public String license(Model model){
        HashMap<String,String> article = new HashMap<>();
        article.put("content","<img class=\"img-responsive\" style=\"width:80%;\" src=\"home/assets/img/license.jpg\" />");
        article.put("title","经营许可");
        model.addAttribute("title","触宝游戏|经营许可");
        model.addAttribute("article",article);
        return "/user/article";
    }

    /**
     * 充值页面
     * @param model 数据模型
     * @return 模板
     */
    @RequestMapping(value = "/payment",method = RequestMethod.GET)
    public String payment(Model model){
        ArrayList<Game> games = gameService.getGames();
        HashMap<String,String> gameList = new HashMap<>();
        for(Game game:games){
            gameList.put(game.getGameId().toString(),game.getName());
        }
        HashMap<String,PaymentOption> gamePaymentOptions = paymentService.getGamePaymentOptions();
        HashMap<String,HashMap<String,String>> gameRateMap = paymentService.getGamePaymentOptionsOfRateMap();
        HashMap<String,String> initialRateMap = gameRateMap.get(games.get(0).getGameId().toString());
        HashMap<String,String> initialPayment = new HashMap<>();
        for(Map.Entry<String,String> entry:initialRateMap.entrySet()){
            initialPayment.put(entry.getKey(),entry.getKey()+" RMB");
        }
        model.addAttribute("gameList",gameList);
        model.addAttribute("gameRateMap",gameRateMap);
        model.addAttribute("gamePaymentOptions",gamePaymentOptions);
        model.addAttribute("initialPayment",initialPayment);
        model.addAttribute("initialSelectedGame",games.get(0).getGameId().toString());
        return "/user/payment";
    }

    /**
     * 家长监护
     * @return 重定向到家长监护简介
     */
    @RequestMapping(value = "/familySafety")
    public String familySafety(){
        return "redirect:/familySafety/about";
    }

    /**
     * 家长监护
     * @param value 参数选项: about(简介)、process(申请流程)、FAQs(常见问题)、(contactUs)联系我们
     * @param model 数据模型
     * @return
     */
    @RequestMapping(value = "/familySafety/{value}")
    public String familySafetyOfContent(@PathVariable String value, Model model){
        Article article = articleService.getArticle("/familySafety/"+value);
        model.addAttribute("article",article);
        model.addAttribute("title", "触宝游戏|家长监护");
        return "/user/familySafety";
    }

    /**
     * 登陆
     * @param model 数据模型
     * @return 登陆页面
     */
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginView(Model model){
        return "/user/login";
    }

    @RequestMapping(value = "/logout")
    public String logout(){
        session.removeAttribute("adminUserId");
        session.removeAttribute("userId");
        return "redirect:/admin/login";
    }


    /**
     * 处理登陆请求
     * @param userName 用户名
     * @param password 密码
     * @param token 验证码
     * @param model 数据模型
     * @return json格式数据，登陆结果
     */
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    @ResponseBody
    public String loginProcess(String userName,String password, String token, Model model){
        if(!securityCode.checkCode(token,session)){
            return "{\"error\":\"1\",\"msg\":\"验证码错误\",\"to\":\"/login\"}";
        }
        User user = userService.login(userName,password);
        if(null == user){
            return "{\"error\":\"2\",\"msg\":\"用户名或密码错误\",\"to\":\"/login\"}";
        } else if("ADMIN".equals(user.getAuthority())){
            return "{\"error\":\"0\",\"msg\":\"登陆成功\",\"to\":\"/admin\"}";
        }else {
            return "{\"error\":\"0\",\"msg\":\"登陆成功\",\"to\":\"/\"}";
        }
    }

    @RequestMapping(value = "/register",method = RequestMethod.GET)
    public String registerView(){
        return "/user/register";
    }

    @RequestMapping(value = "/register",method = RequestMethod.POST)
    @ResponseBody
    public String register(User user,String token){
        if(!securityCode.checkCode(token,session)){
            return "{\"error\":\"1\",\"msg\":\"验证码错误\",\"to\":\"/\"}";
        }
        if(userService.checkUser(user)){
            userService.addUser(user);
            return "{\"error\":\"0\",\"msg\":\"注册成功!\",\"to\":\"/\"}";
        }
        return "{\"error\":\"1\",\"msg\":\"参数错误\",\"to\":\"/\"}";
    }


    /**
     * 获取admin密码的md5，工作环境注释掉!important //todo
     * @return
     */
//    @RequestMapping(value = "/test")
//    @ResponseBody
//    public String test(){
//        return userService.passwordDigest("admin");
//    }

}
