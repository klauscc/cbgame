package com.chubao.cf.game.service;

import com.chubao.cf.game.domain.GameType;

import java.util.ArrayList;

/**
 * 创建者: 程峰
 * 创建时间: 16/1/22 下午7:28
 * 任务号:
 * 创建说明: 游戏类型service接口
 */
public interface IGameTypeService {

    /**
     * 获取游戏类型
     * @return 游戏类型
     */
    ArrayList<GameType> getGameType();

    GameType getGameTypeById(Integer typeId);

    /**
     * 添加游戏类型
     * @param gameType 游戏类型
     */
    void addGameType(GameType gameType);

    /**
     * 编辑游戏类型
     * @param gameType 游戏类型
     */
    void editGameType(GameType gameType);

    /**
     * 删除游戏类型
     * @param typeId 类型id
     */
    void deleteGameType(int typeId);
}
