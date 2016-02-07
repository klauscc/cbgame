package com.chubao.cf.game.controller.admin;

import com.chubao.cf.game.config.Constants;
import com.chubao.cf.game.domain.Game;
import com.chubao.cf.game.domain.GameDeveloper;
import com.chubao.cf.game.domain.GameType;
import com.chubao.cf.game.service.GameService;
import com.chubao.cf.game.service.IGameDeveloperService;
import com.chubao.cf.game.service.IGameTypeService;
import com.chubao.cf.game.service.others.UploadService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;

/**
 * 创建者: 程峰
 * 创建时间: 16/1/22 下午2:25
 * 任务号:
 * 创建说明: admin游戏控制器
 */
@Controller
@RequestMapping(value = "/admin/game")
public class AdminGameController {

    @Autowired
    private IGameTypeService gameTypeService;
    @Autowired
    private IGameDeveloperService gameDeveloperService;
    @Autowired
    private GameService gameService;
    @Autowired
    private UploadService uploadService;

    private static final Logger logger = LoggerFactory.getLogger(AdminGameController.class);
    /**
     * 添加游戏界面
     * @param model 传入模板参数
     * @return 模板名称
     */
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String addGameView(Model model){
        //游戏类型
        ArrayList<GameType> gameTypes = gameTypeService.getGameType();
        HashMap<String ,String> gameTypeMap = new HashMap<>();
        for(GameType gameType : gameTypes){
            gameTypeMap.put(gameType.getTypeId().toString(),gameType.getName());
        }
        //开发者
        ArrayList<GameDeveloper> developers = gameDeveloperService.getGameDeveloper();
        HashMap<String ,String > gameDeveloperMap = new HashMap<>();
        for(GameDeveloper developer : developers){
            gameDeveloperMap.put(developer.getDeveloperId().toString(),developer.getName());
        }

        model.addAttribute("title", "触乐游戏管理平台|添加游戏");
        model.addAttribute("gameType",gameTypeMap);
        model.addAttribute("gameDeveloper",gameDeveloperMap);
        return "/admin/addGame";
    }

    /**
     * 处理前端添加游戏表单提交的数据。
     * @param post 海报
     * @param game 游戏
     * @param model 传入模板参数
     * @return 模板名称
     */
    @RequestMapping(value = "/add",method = RequestMethod.POST)
    public String addGame(@RequestPart("gamePost") MultipartFile post, Game game,String[] imageUrl,Model model,RedirectAttributes redirectAttributes,HttpServletRequest request){
        game.setPost(uploadService.saveImage(post, Constants.getImagesUploadSecondDir(),request));
        game.setImages(game.assembleImages(imageUrl));
        gameService.addGame(game);
        redirectAttributes.addFlashAttribute("addSuccess", "添加成功");
        redirectAttributes.addFlashAttribute("gameShowUrl", "/game/" + game.getGameId());
        redirectAttributes.addFlashAttribute("gameEditUrl", "/admin/game/edit/" + game.getGameId());
        return "redirect:/admin/game/add";
    }

    /**
     * 编辑游戏前端页面
     * @param gameId 游戏id
     * @param model 数据模板
     * @return 模板
     */
    @RequestMapping(value = "/edit/{gameId}",method = RequestMethod.GET)
    public String editGameView(@PathVariable Integer gameId,Model model){
        Game game = gameService.getGameById(gameId);
        if(null == game){
            logger.warn("游戏id:{}不存在，企图编辑",gameId);
            return "/";
        }
        //游戏类型
        ArrayList<GameType> gameTypes = gameTypeService.getGameType();
        HashMap<String ,String> gameTypeMap = new HashMap<>();
        for(GameType gameType : gameTypes){
            gameTypeMap.put(gameType.getTypeId().toString(),gameType.getName());
        }
        //开发者
        ArrayList<GameDeveloper> developers = gameDeveloperService.getGameDeveloper();
        HashMap<String ,String > gameDeveloperMap = new HashMap<>();
        for(GameDeveloper developer : developers){
            gameDeveloperMap.put(developer.getDeveloperId().toString(),developer.getName());
        }

        model.addAttribute("title", "触乐游戏管理平台|添加游戏");
        model.addAttribute("gameType", gameTypeMap);
        model.addAttribute("gameDeveloper", gameDeveloperMap);
        model.addAttribute("game", game);
        return "/admin/editGame";
    }

    @RequestMapping(value = "/edit/top/{gameId}",method = RequestMethod.GET)
    public String topGame(@PathVariable Integer gameId,@RequestParam(required = false,defaultValue = "0")Integer is,RedirectAttributes redirectAttributes){
        gameService.topGame(gameId, is);
        Game game = gameService.getGameById(gameId);
        if(null != game) {
            if(is == 1) {
                redirectAttributes.addFlashAttribute("top", "置顶成功");
            } else{
                redirectAttributes.addFlashAttribute("top", "取消置顶成功");
            }
            redirectAttributes.addFlashAttribute("gameName", game.getName());
            redirectAttributes.addFlashAttribute("gameUrl","/game/"+gameId);
        }
        return "redirect:/admin/game/manage";
    }

    /**
     * 处理前端添加游戏表单提交的数据。
     * @param post 海报
     * @param game 游戏
     * @param model 传入模板参数
     * @return 模板名称
     */
    @RequestMapping(value = "/edit/{gameId}",method = RequestMethod.POST)
    public String editGame(@RequestPart("gamePost") MultipartFile post, Game game,String[] imageUrl,Model model,RedirectAttributes redirectAttributes,HttpServletRequest request){
        Game oldGame = gameService.getGameById(game.getGameId());
        if(!post.isEmpty()){
            game.setPost(uploadService.saveImage(post, Constants.getImagesUploadSecondDir(),request));
        } else {
            game.setPost(oldGame.getPost());
        }
        game.setImages(game.assembleImages(imageUrl));
        gameService.editGame(game);
        redirectAttributes.addFlashAttribute("editSuccess", "编辑成功");
        redirectAttributes.addFlashAttribute("gameShowUrl", "/game/" + game.getGameId());
        return "redirect:/admin/game/edit/"+game.getGameId();
    }

    /**
     * 管理游戏。以列表的形式列出所有游戏，提供一些操作按钮。
     * @param model 传入模板参数
     * @return 模板名称
     */
    @RequestMapping(value = "/manage")
    public String manageGame(Model model){
        ArrayList<Game> games = gameService.getGames();
        model.addAttribute("games", games);
        model.addAttribute("title", "触宝游戏管理平台|管理游戏");
        return "/admin/manageGame";
    }

    @RequestMapping(value = "/delete/{gameId}")
    public String deleteGame(@PathVariable Integer gameId,RedirectAttributes redirectAttributes){
        Game game = gameService.getGameById(gameId);
        if(null != game) {
            gameService.deleteGame(gameId);
            redirectAttributes.addFlashAttribute("deleteFlag","true");
            redirectAttributes.addFlashAttribute("msg", "删除成功");
            redirectAttributes.addFlashAttribute("gameName",game.getName());
        }else{
            redirectAttributes.addFlashAttribute("deleteFlag","false");
            redirectAttributes.addFlashAttribute("msg","删除失败!无此游戏");
        }
        return "/admin/game/manage";
    }
}
