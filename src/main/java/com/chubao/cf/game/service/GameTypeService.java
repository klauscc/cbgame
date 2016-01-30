package com.chubao.cf.game.service;

import com.chubao.cf.game.domain.GameType;
import com.chubao.cf.game.repository.mapper.IGameTypeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;

/**
 * 创建者: 程峰
 * 创建时间: 16/1/22 下午7:28
 * 任务号:
 * 创建说明:
 */
@Service
public class GameTypeService implements IGameTypeService {
    @Autowired
    private IGameTypeDao gameTypeDao;

    @Override
    public ArrayList<GameType> getGameType() {

        return (ArrayList<GameType>) gameTypeDao.getGameTypes();
    }

    @Override
    public GameType getGameTypeById(Integer typeId) {
        GameType gameType = gameTypeDao.getGameTypeById(typeId);
        if(null == gameType){
            return new GameType();
        }else {
            return gameType;
        }
    }

    @Override
    public void addGameType(GameType gameType) {
        gameType.setTimeAdded(new Date());
        gameTypeDao.addGameType(gameType);
    }

    @Override
    public void editGameType(GameType gameType) {
        gameTypeDao.editGameType(gameType);
    }

    @Override
    public void deleteGameType(int typeId) {
        gameTypeDao.deleteGameType(typeId);
    }
}
