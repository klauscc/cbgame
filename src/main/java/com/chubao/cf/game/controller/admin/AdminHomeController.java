package com.chubao.cf.game.controller.admin;

import com.chubao.cf.game.domain.Article;
import com.chubao.cf.game.service.IArticleContentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * 创建者: 程峰
 * 创建时间: 16/1/22 下午1:36
 * 任务号:
 * 创建说明: admin页面home管理控制器
 */
@Controller
@RequestMapping(value = "/admin")
public class AdminHomeController {
    @Autowired
    private IArticleContentService articleService;
    @RequestMapping
    public String index(){
        return "redirect:/admin/game/manage";
    }

    @RequestMapping(value = "/about")
    public String companyIntroduction(Model model){
        model.addAttribute("article",articleService.getArticle("about"));
        model.addAttribute("editUrl","/admin/edit/about");
        model.addAttribute("title","触宝游戏管理平台|公司简介");
        return "/admin/editArticle";
    }
    @RequestMapping(value = "/contactUs")
    public String contactUs(Model model){
        model.addAttribute("article",articleService.getArticle("contactUs"));
        model.addAttribute("editUrl","/admin/edit/contactUs");
        model.addAttribute("title","触宝游戏管理平台|联系我们");
        return "/admin/editArticle";
    }
    @RequestMapping(value = "/edit/{value}",method = RequestMethod.POST)
    public String processEdit(@PathVariable String value,Article article,Model model,RedirectAttributes redirectAttributes){
        articleService.editContent(article);
        redirectAttributes.addFlashAttribute("edited", "true");
        redirectAttributes.addFlashAttribute("goLink", "/" + value);
        return "redirect:/admin/"+value;
    }

    @RequestMapping(value = "/login",method = RequestMethod.GET)
    public String loginView(Model model){
        return "/login";
    }

    @RequestMapping(value = "/logout")
    public String logOut(){
        return "/logout";
    }

    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String processLogin(){
        return "/login";
    }

}
