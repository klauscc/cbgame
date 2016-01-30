package com.chubao.cf.game.domain;

import com.chubao.cf.game.service.others.HtmlSafety;
import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

/**
 * 创建者: 程峰
 * 创建时间: 16/1/16 下午10:56
 * 任务号:
 * 创建说明: 文章bean
 */
public class Article {

    /**
     * 文章Id
     */
    private Integer articleId;
    /**
     * 用户Id
     */
    private Integer userId;
    /**
     * 标题
     */
    private String title;
    /**
     * 文章内容
     */
    private String content;
    /**
     * 海报Url
     */
    private String post;
    /**
     * 置顶
     */
    private Integer top;
    /**
     * 添加日期
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss" ,timezone = "GMT+8")
    private Date timeAdded;
    /**
     * 编辑日期
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss" ,timezone = "GMT+8")
    private Date timeEdit;
    /**
     * 是否删除
     */
    private Boolean isDelete;

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

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        if(null == title){
            return;
        } else {
            this.title = HtmlSafety.relaxed(title);
        }
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        if(null == content){
            return;
        } else {
            this.content = HtmlSafety.relaxed(content);
        }
    }

    public String getPost() {
        return post;
    }

    public void setPost(String post) {
        if(null == post){
            return;
        } else {
            this.post = HtmlSafety.relaxed(post);
        }
    }

    public Integer getTop() {
        return top;
    }

    public void setTop(Integer top) {
        this.top = top;
    }

    public Date getTimeAdded() {
        return timeAdded;
    }

    public void setTimeAdded(Date timeAdded) {
        this.timeAdded = timeAdded;
    }

    public Date getTimeEdit() {
        return timeEdit;
    }

    public void setTimeEdit(Date timeEdit) {
        this.timeEdit = timeEdit;
    }

    public Boolean getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(Boolean isDelete) {
        this.isDelete = isDelete;
    }
}
