package com.chubao.cf.game.service;

import com.chubao.cf.game.domain.GameDeveloper;

import java.util.ArrayList;

/**
 * 创建者: 程峰
 * 创建时间: 16/1/22 下午7:28
 * 任务号:
 * 创建说明: 开发者service接口
 */
public interface IGameDeveloperService {

    /**
     * 获取开发者
     * @return 开发者
     */
    ArrayList<GameDeveloper> getGameDeveloper();

    GameDeveloper getGameDeveloperById(Integer developerId);
    /**
     * 添加开发者
     * @param gameDeveloper 开发者
     */
    void addGameDeveloper(GameDeveloper gameDeveloper);

    /**
     * 编辑开发者
     * @param gameDeveloper 开发者
     */
    void editGameDeveloper(GameDeveloper gameDeveloper);

    /**
     * 删除开发者
     * @param DeveloperId 开发者id
     */
    void deleteGameDeveloper(int DeveloperId);
}
