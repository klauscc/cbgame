package com.chubao.cf.game.service;

import com.chubao.cf.game.domain.Game;

import java.util.ArrayList;
import java.util.Map;

/**
 * 创建者: 程峰
 * 创建时间: 16/1/17 下午9:13
 * 任务号:
 * 创建说明: 获取游戏内容service接口
 */

public interface IGameService {
    /**
     * 获取所有符合要求的游戏
     * @param type 游戏类型
     * @param page 第几页
     * @return 符合要求的游戏
     */
    ArrayList<Game> getGamesByTypeAndPage(int type,int page);

    /**
     * 获取所有游戏
     * @return 游戏
     */
    ArrayList<Game> getGames();
    /**
     * 根据游戏id返回该游戏信息
     * @param gameId 游戏id
     * @return 游戏
     */
    Game getGameById(int gameId);


    /**
     * 添加游戏
     * @param game 游戏
     */
    void addGame(Game game);

    /**
     * 编辑游戏
     * @param game 游戏
     */
    void editGame(Game game);

    /**
     * 将游戏置顶
     * @param gameId 游戏id
     * @param is 1为置顶，0为取消置顶
     */
    void topGame(Integer gameId,Integer is);

    /**
     * 删除游戏
     * @param gameId 游戏id
     */
    void deleteGame(Integer gameId);
}
