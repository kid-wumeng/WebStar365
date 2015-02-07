package com.webstar365.service.impl;

import com.webstar365.dao.ArticleDAO;
import com.webstar365.pojo.Article;
import com.webstar365.pojo.SearchCondition;
import com.webstar365.service.ArticleService;
import java.util.List;

public class ArticleServiceImpl implements ArticleService {
    
    private ArticleDAO articleDAO;

    /**
     * 查询全部文章
     * @param searchCondition 搜索条件（包含页码、页尺寸）
     * @return 成功：符合条件的文章的集合 | 失败：null
     */
    public List<Article> findAllArticles(SearchCondition searchCondition) {
        searchCondition.getPage().setPageSize(searchCondition.getPage().getArticlePageSize());  //使用文章页尺寸
        return articleDAO.findAllArticles(searchCondition);
    }
    
    /**
     * 查询新文章（有题图模式）
     * @return 成功：符合条件的文章 | 失败：null
     */
    public Article findNewArticleWithCover() {
        return articleDAO.findNewArticleWithCover();
    }

    /**
     * 查询新文章（无题图模式）
     * @return 成功：符合条件的文章的集合 | 失败：null
     */
    public List<Article> findNewArticlesWithoutCover() {
        return articleDAO.findNewArticlesWithoutCover();
    }
    
    /**
     * 统计文章数量
     * @return 成功：文章数量 | 失败：null
     */
    public Long countArticleNum() {
        return articleDAO.countArticleNum();
    }
    
    /* getter */
    public ArticleDAO getArticleDAO() { return articleDAO; }
    /* setter */
    public void setArticleDAO(ArticleDAO articleDAO) { this.articleDAO = articleDAO; }

}
