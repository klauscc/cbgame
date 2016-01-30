package com.chubao.cf.game.repository.mapper;

import com.chubao.cf.game.domain.Comment;

import java.util.List;

/**
 * 创建者: 程峰
 * 创建时间: 16/1/20 上午10:43
 * 任务号:
 * 创建说明: 评论dao
 */
public interface ICommentDao {

    /**
     * 获取评论
     * @param commentId 评论id
     * @return 评论
     */
    Comment getCommentById(int commentId);

    /**
     * 获取某个游戏的所有评论
     * @param gameId 游戏id
     * @return 评论
     */
    List<Comment> getCommentByGameId(int gameId);

    /**
     * 添加评论
     * @param comment 评论
     */
    void addComment(Comment comment);

    /**
     * 删除评论
     * @param commentId 评论id
     */
    void deleteComment(int commentId);

    /**
     * 游戏平均评分
     * @param gameId 游戏id
     * @return 游戏平均评分
     */
    Double gameAverageRate(int gameId);

    /**
     * 评论个数
     * @param gameId 游戏id
     * @return 评论个数
     */
    Integer commentCounts(int gameId);
}
