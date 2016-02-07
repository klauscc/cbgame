package com.chubao.cf.game.controller.admin;

import com.chubao.cf.game.domain.Article;
import com.chubao.cf.game.service.ArticleContentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;

/**
 * 创建者: 程峰
 * 创建时间: 16/1/22 下午2:27
 * 任务号:
 * 创建说明: 家长监护控制器
 */
@Controller
@RequestMapping(value = "/admin/familySafety")
public class AdminFamilySafetyController {

    @Autowired
    private ArticleContentService articleService;

    /**
     * 家长监护编辑界面
     * @param model 传入模板参数
     * @return 模板名称
     */
    @RequestMapping(value = "/{value}", method = RequestMethod.GET)
    public String dispacher(@PathVariable String value,Model model,HttpServletRequest request){
        Article article = articleService.getArticle("/familySafety/"+value);
        model.addAttribute("article",article);
        model.addAttribute("currentUrl",request.getServletPath());
        model.addAttribute("title", "触宝游戏管理平台|家长监护");
        return "/admin/editArticle";
    }

    @RequestMapping(value = "/{value}",method = RequestMethod.POST)
    public String processEdit(@PathVariable String value,Article article,Model model,RedirectAttributes redirectAttributes){
        articleService.editContent(article);
        redirectAttributes.addFlashAttribute("edited","true");
        redirectAttributes.addFlashAttribute("goLink","/familySafety/"+value);
        return "redirect:/admin/familySafety/"+value;
    }

}
