package com.chubao.cf.game.controller.admin;

import com.chubao.cf.game.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * 创建者: 程峰
 * 创建时间: 16/1/31 上午1:04
 * 任务号:
 * 创建说明:
 */
@Controller
@RequestMapping(value = "/admin/user")
public class AdminUserController {

    @Autowired
    private IUserService userService;

    @RequestMapping
    public String home(){
        return "redirect:/admin/user/manage";
    }

    @RequestMapping(value = "/manage",method = RequestMethod.GET)
    public String manage(Model model){

        model.addAttribute("users",userService.getAllUsers());
        return "/admin/manageUser";
    }

    @RequestMapping(value = "/changeAdminPassword",method = RequestMethod.GET)
    public String changeCodeView(Model model){
        return "/admin/changeAdminPassword";
    }

    @RequestMapping(value = "/changeAdminPassword",method = RequestMethod.POST)
    public String changeAdminPass(String oldPassword,String newPassword,Model model,RedirectAttributes redirectAttributes){
        if(userService.changePassword(1,oldPassword,newPassword)){
            redirectAttributes.addFlashAttribute("flag","true");
            redirectAttributes.addFlashAttribute("msg","修改成功");
        } else {
            redirectAttributes.addFlashAttribute("flag","false");
            redirectAttributes.addFlashAttribute("msg","原密码错误");
        }
        return "redirect:/admin/user/changeAdminPassword";
    }
}
