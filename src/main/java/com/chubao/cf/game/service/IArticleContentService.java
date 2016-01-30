package com.chubao.cf.game.service;

import com.chubao.cf.game.domain.Article;

/**
 * 创建者: 程峰
 * 创建时间: 16/1/24 下午1:42
 * 任务号:
 * 创建说明: 文章操作业务逻辑service
 */
public interface IArticleContentService {
    /**
     * 根据文章id获取文章
     * @param articleId 文章id
     * @return 文章
     */
    Article getArticle(Integer articleId);

    /**
     * 根据文章功能名称获得文章
     * @param value 文章功能名称，如 /familySafety/about, /familySafety/process ...
     * @return 文章
     */
    Article getArticle(String value);
    /**
     * 编辑内容
     * @param article 编辑内容
     */
    void editContent(Article article);

}
