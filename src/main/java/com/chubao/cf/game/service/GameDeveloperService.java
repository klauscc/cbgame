package com.chubao.cf.game.service;

import com.chubao.cf.game.domain.GameDeveloper;
import com.chubao.cf.game.repository.mapper.IGameDeveloperDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;

/**
 * 创建者: 程峰
 * 创建时间: 16/1/22 下午7:28
 * 任务号:
 * 创建说明:开发者service
 */
@Service
public class GameDeveloperService implements IGameDeveloperService {
    @Autowired
    private IGameDeveloperDao gameDeveloperDao;

    @Override
    public ArrayList<GameDeveloper> getGameDeveloper() {

        return (ArrayList<GameDeveloper>) gameDeveloperDao.getGameDeveloper();
    }

    @Override
    public GameDeveloper getGameDeveloperById(Integer developerId) {
        GameDeveloper gameDeveloper = gameDeveloperDao.getGameDeveloperById(developerId);
        if(null == gameDeveloper){
            return new GameDeveloper();
        }else {
            return gameDeveloper;
        }
    }

    @Override
    public void addGameDeveloper(GameDeveloper gameDeveloper) {
        gameDeveloper.setTimeAdded(new Date());
        gameDeveloperDao.addGameDeveloper(gameDeveloper);
    }

    @Override
    public void editGameDeveloper(GameDeveloper gameDeveloper) {
        gameDeveloperDao.editGameDeveloper(gameDeveloper);
    }

    @Override
    public void deleteGameDeveloper(int developerId) {
        gameDeveloperDao.deleteGameDeveloper(developerId);
    }
}
