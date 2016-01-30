package com.chubao.cf.game.service;

import com.chubao.cf.game.config.Constants;
import com.chubao.cf.game.domain.Article;
import com.chubao.cf.game.repository.mapper.IArticleDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 创建者: 程峰
 * 创建时间: 16/1/24 下午1:46
 * 任务号:
 * 创建说明: 文章内容操作业务逻辑，适用于预定义id的文章，如:家长监护部分，简介部分
 */
@Service
public class ArticleContentService implements IArticleContentService {
    @Autowired
    private IArticleDao articleDao;


    public Article getArticle(Integer articleId){
        return articleDao.getArticle(articleId);
    }

    @Override
    public Article getArticle(String value) {
        Article article;
        if("/familySafety/about".equals(value)){  //家长监护简介界面
            article = getArticle(Constants.getFamilySafetyIntroductionArticleId());
        } else if("/familySafety/process".equals(value)){ //家长监护申请流程界面
            article = getArticle(Constants.getFamilySafetyProcessArticleId());
        } else if("/familySafety/FAQs".equals(value)){    //家长监护常见问题界面
            article = getArticle(Constants.getFamilySafetyFAQsArticleId());
        } else if("/familySafety/contactUs".equals(value)){   //家长监护联系我们界面
            article = getArticle(Constants.getFamilySafetyContactUsArticleId());
        } else if("contactUs".equals(value)){   //联系我们页面
            article = getArticle(Constants.getContactUsArticleId());
        }
        else{ //默认简介界面
            article = getArticle(Constants.getAboutArticleId());
        }
        return article;
    }

    @Override
    public void editContent(Article article) {
        Article oldArticle = articleDao.getArticle(article.getArticleId());
        oldArticle.setContent(article.getContent());
        articleDao.editArticle(oldArticle);
    }

}
