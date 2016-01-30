package com.chubao.cf.game.controller.user;

import com.chubao.cf.game.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 创建者: 程峰
 * 创建时间: 16/1/16 下午11:47
 * 任务号:
 * 创建说明:
 */
@Controller
public class UserController {

    @Autowired
    private IUserService userService;
    private final static String invalid = "{\"valid\": \"false\"}";
    private final static String valid = "{\"valid\":\"true\"}";

    @RequestMapping(value = "/register/validate", method = RequestMethod.POST)
    @ResponseBody
    public String ValidateFields(String type, String value) {
        if (userService.checkIfRegistered(type, value)) {
            return invalid;
        } else {
            return valid;
        }
    }
}
