package com.webstar365.dao.impl;

import com.webstar365.dao.AreaDAO;
import com.webstar365.dao.ArticleDAO;
import com.webstar365.pojo.Article;
import com.webstar365.pojo.SearchCondition;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

public class ArticleMyBatisDAOImpl extends SqlMapClientDaoSupport implements ArticleDAO {

    /**
     * 查询全部文章
     * @param searchCondition 搜索条件（包含页码、页尺寸）
     * @return 成功：符合条件的文章的集合 | 失败：null
     */
    public List<Article> findAllArticles(SearchCondition searchCondition) {
        return getSqlMapClientTemplate().queryForList("findAllArticles", searchCondition);
    }
    
    /**
     * 查询新文章（有题图模式）
     * @return 成功：符合条件的文章 | 失败：null
     */
    public Article findNewArticleWithCover() {
        return (Article) getSqlMapClientTemplate().queryForObject("findNewArticleWithCover");
    }

    /**
     * 查询新文章（无题图模式）
     * @return 成功：符合条件的文章的集合 | 失败：null
     */
    public List<Article> findNewArticlesWithoutCover() {
        return getSqlMapClientTemplate().queryForList("findNewArticlesWithoutCover");
    }

    /**
     * 统计文章数量
     * @return 成功：文章数量 | 失败：null
     */
    public Long countArticleNum() {
        return (Long) getSqlMapClientTemplate().queryForObject("countArticleNum");
    }
    
}
