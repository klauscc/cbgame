package com.chubao.cf.game.repository.mapper;

import com.chubao.cf.game.domain.Game;
import com.chubao.cf.game.domain.GameType;

import java.util.List;

/**
 * 创建者: 程峰
 * 创建时间: 16/1/17 下午10:54
 * 任务号:
 * 创建说明: 游戏数据库操作
 */
public interface IGameDao {

    /**
     * 获取符合种类和页数的游戏，根据添加时间倒序排列
     * @param type 游戏类型
     * @param begin 开始第几项
     * @param num 取几项
     * @return 游戏
     */
    List<Game> getGamesByTypeAndPage(int type,int begin, int num);

    List<Game> getGames();
    /**
     * 根据页数获取游戏,根据添加时间倒序排列
     * @param begin 开始第几项
     * @param num 取几项
     * @return 游戏
     */
    List<Game> getGamesByPage(int begin, int num);

    /**
     * 返回游戏
     * @param gameId 游戏id
     * @return 游戏
     */
    Game getGameById(int gameId);

    /**
     * 修改游戏信息
     * @param game 游戏
     */
    void editGame(Game game);

    /**
     * 添加游戏
     * @param game 游戏
     */
    void addGame(Game game);

    /**
     * 删除游戏
     * @param gameId 游戏id
     */
    void deleteGame(int gameId);

}
