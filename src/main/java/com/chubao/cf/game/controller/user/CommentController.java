package com.chubao.cf.game.controller.user;

import com.chubao.cf.game.domain.Comment;
import com.chubao.cf.game.service.ICommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpSession;

/**
 * 创建者: 程峰
 * 创建时间: 16/1/16 下午11:47
 * 任务号:
 * 创建说明:
 */
@Controller
@RequestMapping(value = "/comment")
@SessionAttributes("captchaToken")
public class CommentController {

    @Autowired
    private ICommentService commentService;

    @RequestMapping(value = "/add",method = RequestMethod.POST)
    @ResponseBody
    public String addComment(Comment comment, String currentUrl,String token,HttpSession session){
        if(((String)session.getAttribute("captchaToken")).equalsIgnoreCase(token)){
            commentService.addComment(comment);
            return "{\"error\":\"0\",\"msg\":\"提交成功\"}";
        } else {
            return "{\"error\":\"1\",\"msg\":\"验证码错误\"}";
        }
    }
}
