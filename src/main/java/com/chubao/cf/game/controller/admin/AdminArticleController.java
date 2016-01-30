package com.chubao.cf.game.controller.admin;

import com.chubao.cf.game.domain.Article;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * 创建者: 程峰
 * 创建时间: 16/1/24 下午2:40
 * 任务号:
 * 创建说明: 文章控制器
 */

@Controller
public class AdminArticleController {
    @RequestMapping(value = "/admin/article/edit",method = RequestMethod.POST)
    public String editArticle(Article article,@RequestParam("pre") String preUrl){
        return "redirect:"+preUrl;
    }
}
