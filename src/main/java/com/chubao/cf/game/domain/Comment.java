package com.chubao.cf.game.domain;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

/**
 * 创建者: 程峰
 * 创建时间: 16/1/16 下午10:56
 * 任务号:
 * 创建说明: 对文章或者游戏评论bean
 */
public class Comment {

    /**
     * 评论id
     */
    private Integer commentId;
    /**
     * 父评论id
     */
    private Integer parentId;
    /**
     * 游戏id
     */
    private Integer gameId;
    /**
     * 文章Id
     */
    private Integer articleId;
    /**
     * 用户id
     */
    private Integer userId;
    /**
     * 昵称
     */
    private String nickName="";
    /**
     * 评论内容
     */
    private String content="";
    /**
     * 评分
     */
    private Double rate = 5D;
    /**
     * 添加日期
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss" ,timezone = "GMT+8")
    private Date timeAdded;
    /**
     * 是否删除
     */
    private Boolean isDelete;

    public Integer getCommentId() {
        return commentId;
    }

    public void setCommentId(Integer commentId) {
        this.commentId = commentId;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public Integer getGameId() {
        return gameId;
    }

    public void setGameId(Integer gameId) {
        this.gameId = gameId;
    }

    public Integer getArticleId() {
        return articleId;
    }

    public void setArticleId(Integer articleId) {
        this.articleId = articleId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Double getRate() {
        return rate;
    }

    public void setRate(Double rate) {
        this.rate = rate;
    }

    public Date getTimeAdded() {
        return timeAdded;
    }

    public void setTimeAdded(Date timeAdded) {
        this.timeAdded = timeAdded;
    }

    public Boolean getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(Boolean isDelete) {
        this.isDelete = isDelete;
    }
}
