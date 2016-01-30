package com.chubao.cf.game.service;

import com.chubao.cf.game.domain.Comment;

import java.util.List;

/**
 * 创建者: 程峰
 * 创建时间: 16/1/20 上午10:27
 * 任务号:
 * 创建说明: 获取评论相关内容
 */
public interface ICommentService {

    /**
     * 根据评论id获取评论
     * @param commentId 评论id
     * @return 评论
     */
    Comment getCommentById(int commentId);

    /**
     * 根据游戏id获取该游戏的评论
     * @param gameId 游戏id
     * @return 评论
     */
    List<Comment> getCommentsBygameId(int gameId);

    /**
     * 添加评论
     * @param comment 评论
     */
    void addComment(Comment comment);

    /**
     * 删除评论
     * @param commentId 评论id
     */
    void deleteComment(Integer commentId);

    /**
     * 计算游戏评分
     * @param comment 评论
     * @return 评分
     */
    Double caculateRates(List<Comment> comment);

    /**
     * 根据游戏id计算平均评分
     * @param gameId 游戏id
     * @return 评分
     */
    Double caculateRate(Integer gameId);

    /**
     * 评论个数
     * @param gameId 游戏id
     * @return 评论个数
     */
    Integer commentCount(Integer gameId);
}
