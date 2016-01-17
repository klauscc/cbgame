package com.chubao.cf.game.controller.user;

import com.chubao.cf.game.domain.Game;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 创建者: 程峰
 * 创建时间: 16/1/16 下午11:46
 * 任务号:
 * 创建说明:
 */

@Controller
public class GameController {

    @RequestMapping(value = "/game/{gameId}",method = RequestMethod.GET)
    public String getGame(@PathVariable Integer gameId,Model model){
        //todo
        return "game-page";
    }

    @RequestMapping(value = "/game/{gameId}",method = RequestMethod.POST)
    public String editGame(@PathVariable Integer gameId,@RequestBody Game game,Model model){
        //todo
        return "redirect:";
    }
}
