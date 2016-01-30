package com.chubao.cf.game.controller.user;

import com.chubao.cf.game.domain.Comment;
import com.chubao.cf.game.domain.Game;
import com.chubao.cf.game.domain.GameDeveloper;
import com.chubao.cf.game.domain.GameType;
import com.chubao.cf.game.service.ICommentService;
import com.chubao.cf.game.service.IGameDeveloperService;
import com.chubao.cf.game.service.IGameService;
import com.chubao.cf.game.service.IGameTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;

/**
 * 创建者: 程峰
 * 创建时间: 16/1/16 下午11:46
 * 任务号:
 * 创建说明:
 */

@Controller
@RequestMapping(value = "/game")
public class GameController {

    @Autowired
    private IGameService gameService;
    @Autowired
    private IGameTypeService typeService;
    @Autowired
    private IGameDeveloperService developerService;
    @Autowired
    private ICommentService commentService;


    @RequestMapping
    public String getAllGame(Model model){
        ArrayList<Game> games = gameService.getGames();
        ArrayList<GameType> gameTypes = new ArrayList<>();
        ArrayList<GameDeveloper> gameDevelopers = new ArrayList<>();
        ArrayList<Double> gameRates = new ArrayList<>();
        ArrayList<Integer> commentCounts = new ArrayList<>();
        for(Game game:games){
            gameTypes.add(typeService.getGameTypeById(game.getTypeId()));
            gameDevelopers.add(developerService.getGameDeveloperById(game.getDeveloperId()));
            gameRates.add(commentService.caculateRate(game.getGameId()));
            commentCounts.add(commentService.commentCount(game.getGameId()));
        }

        model.addAttribute("games",games);
        model.addAttribute("gameTypes",gameTypes);
        model.addAttribute("gameDevelopers",gameDevelopers);
        model.addAttribute("gameRates",gameRates);
        model.addAttribute("commentCounts",commentCounts);
        return "/user/gameListPage";
    }

    /**
     * 游戏详情页:游戏信息，游戏评论
     *
     * @param gameId 游戏Id.根据gameId展示该游戏所有信息
     * @param model  数据模板
     * @return 跳转到展示该游戏信息的模板
     */
    @RequestMapping(path = "/{gameId}", method = RequestMethod.GET)
    public String getGame(@PathVariable String gameId, Model model) {

        int game = 1;
        Game thisGame;
        try {
            game = Integer.parseInt(gameId);
            thisGame = gameService.getGameById(game);
            if(null == thisGame){   //游戏为空
                return "redirect:/";
            } else {
                ArrayList<Comment> comments = (ArrayList<Comment>) commentService.getCommentsBygameId(game);
                model.addAttribute("title",thisGame.getName());
                model.addAttribute("game", thisGame);    //添加游戏
                model.addAttribute("gameType",typeService.getGameTypeById(thisGame.getTypeId()));
                model.addAttribute("gameDeveloper",developerService.getGameDeveloperById(thisGame.getDeveloperId()));
                model.addAttribute("gameImages",thisGame.getImageArray());  //游戏图片
                model.addAttribute("comments",comments); //添加评论
                model.addAttribute("rate",commentService.caculateRate(game));
                model.addAttribute("currentUrl","/game/"+gameId);
                return "/user/gameSinglePage";
            }
        } catch (NumberFormatException e) {
            return "redirect:/";
        }
    }

}
