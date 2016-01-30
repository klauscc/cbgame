package com.chubao.cf.game.service;

import com.chubao.cf.game.domain.Comment;
import com.chubao.cf.game.repository.mapper.ICommentDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Random;

/**
 * 创建者: 程峰
 * 创建时间: 16/1/20 上午10:41
 * 任务号:
 * 创建说明: 获取评论相关内容服务
 */
@Service
public class CommentService implements ICommentService {

    @Autowired
    private ICommentDao commentDao;
    /**
     * 根据评论id获取评论
     * @param commentId 评论id
     * @return 评论
     */
    @Override
    public Comment getCommentById(int commentId) {
        return commentDao.getCommentById(commentId);
    }

    /**
     * 根据游戏id获取该游戏的评论
     * @param gameId 游戏id
     * @return 评论
     */
    @Override
    public List<Comment> getCommentsBygameId(int gameId) {
        return commentDao.getCommentByGameId(gameId);
    }

    @Override
    public void addComment(Comment comment) {
        if("".equals(comment.getNickName())){
            comment.setNickName("用户" + new Random().nextInt());
        }
        comment.setTimeAdded(new Date());
        commentDao.addComment(comment);
    }

    @Override
    public void deleteComment(Integer commentId) {
        commentDao.deleteComment(commentId);
    }

    @Override
    public Double caculateRates(List<Comment> comments) {
        double totalRates= 0D;
        if(comments.size()==0){
            return 5D;
        }
        for(Comment comment : comments){
            totalRates += comment.getRate();
        }
        return totalRates/(comments.size());
    }

    @Override
    public Double caculateRate(Integer gameId) {
        Double rate = commentDao.gameAverageRate(gameId);
        if(null == rate || rate.compareTo(0D) == 0){
            rate = 5D;
        }
        return rate;
    }

    @Override
    public Integer commentCount(Integer gameId) {
        return commentDao.commentCounts(gameId);
    }
}
