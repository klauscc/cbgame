package com.chubao.cf.game.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 创建者: 程峰
 * 创建时间: 16/1/16 下午9:39
 * 任务号:
 * 创建说明:
 */
@Controller
public class HomeController {

    @RequestMapping(value = "/")
    public String home(){
        return "page_home";
    }

}
