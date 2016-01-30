package com.chubao.cf.game.service;

import com.chubao.cf.game.config.Constants;
import com.chubao.cf.game.domain.Game;
import com.chubao.cf.game.repository.mapper.IGameDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;

/**
 * 创建者: 程峰
 * 创建时间: 16/1/17 下午10:43
 * 任务号:
 * 创建说明: 获取游戏相关内容service
 */
@Service
public class GameService implements IGameService {

    @Autowired
    private IGameDao gameDao;

    /**
     * 根据游戏类型和第几页获取游戏列表
     *
     * @param type 游戏类型
     * @param page 第几页
     * @return 游戏
     */
    @Override
    public ArrayList<Game> getGamesByTypeAndPage(int type, int page) {
        int pageSize = Constants.getPerPage();
        int begin = (page > 0) ? pageSize * (page - 1) : 0;
        ArrayList<Game> games;
        if (0 >= type) {
            games = (ArrayList<Game>) gameDao.getGamesByPage(begin, pageSize);
        } else {
            games = (ArrayList<Game>) gameDao.getGamesByTypeAndPage(type, begin, pageSize);
        }
        return games;
    }

    @Override
    public ArrayList<Game> getGames() {
        return (ArrayList<Game>) gameDao.getGames();
    }

    /**
     * 根据游戏id获取游戏
     *
     * @param gameId 游戏id
     * @return 游戏
     */
    @Override
    public Game getGameById(int gameId) {
        if (gameId < 0) {
            return null;
        } else {
            return gameDao.getGameById(gameId);
        }
    }

    @Override
    public void addGame(Game game) {
        game.setTimeAdded(new Date());
        gameDao.addGame(game);
    }

    @Override
    public void editGame(Game game) {
        gameDao.editGame(game);
    }

    @Override
    public void topGame(Integer gameId,Integer is) {
        Game game = getGameById(gameId);
        if(null != game){
            if(is == 1) {
                game.setTop(1);
            }else {
                game.setTop(0);
            }
            editGame(game);
        }
    }

    @Override
    public void deleteGame(Integer gameId) {
        gameDao.deleteGame(gameId);
    }
}
