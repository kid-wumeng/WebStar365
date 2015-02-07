package com.webstar365.service;

import com.webstar365.pojo.Article;
import com.webstar365.pojo.SearchCondition;
import java.util.List;

public interface ArticleService {
    
    public List<Article> findAllArticles(SearchCondition searchCondition);  //查询全部文章
    public Article findNewArticleWithCover();  //查询新文章（有题图模式）
    public List<Article> findNewArticlesWithoutCover();  //查询新文章（无题图模式）
    public Long countArticleNum();  //统计文章数量
    
}
