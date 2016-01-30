package com.chubao.cf.game.repository.mapper;

import com.chubao.cf.game.domain.GameDeveloper;

import java.util.List;

/**
 * 创建者: 程峰
 * 创建时间: 16/1/22 下午7:15
 * 任务号:
 * 创建说明: 游戏类型dao
 */
public interface IGameDeveloperDao {

    /**
     * 获取所有开发者
     * @return 开发者
     */
    List<GameDeveloper> getGameDeveloper();

    GameDeveloper getGameDeveloperById(Integer developerId);
    /**
     * 添加开发者
     * @param gameDeveloper 游戏类型
     */
    void addGameDeveloper(GameDeveloper gameDeveloper);

    /**
     * 编辑游戏类型
     * @param gameDeveloper 游戏类型
     */
    void editGameDeveloper(GameDeveloper gameDeveloper);

    /**
     * 删除游戏类型
     * @param developerId 类型id
     */
    void deleteGameDeveloper(int developerId);
}
