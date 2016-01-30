package com.chubao.cf.game.repository.mapper;

import com.chubao.cf.game.domain.Article;
import com.chubao.cf.game.domain.Game;

import java.util.List;

/**
 * 创建者: 程峰
 * 创建时间: 16/1/17 下午10:54
 * 任务号:
 * 创建说明: 文章操作
 */
public interface IArticleDao {

    /**
     * 根据文章id获取文章
     * @param articleId 文章id
     * @return 文章
     */
    Article getArticle(int articleId);

    /**
     * 修改文章信息
     * @param article 文章
     */
    void editArticle(Article article);

    /**
     * 添加文章
     * @param article 文章
     */
    void addArticle(Article article);

    /**
     * 删除游戏
     * @param articleId 文章id
     */
    void deleteArticle(int articleId);
}
