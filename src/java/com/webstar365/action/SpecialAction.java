package com.webstar365.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.webstar365.pojo.Article;
import com.webstar365.pojo.Attr;
import com.webstar365.pojo.Page;
import com.webstar365.pojo.SearchCondition;
import com.webstar365.service.ArticleService;
import com.webstar365.service.AttrService;
import java.util.List;

public class SpecialAction extends ActionSupport {
    
    private ArticleService articleService;
    private AttrService attrService;
    private Article article;
    private List<Article> articles;
    List<Attr> attrs;
    
    /**
     * 显示首页
     * @return 
     */
    public String showHome() {
        article = articleService.findNewArticleWithCover();
        articles = articleService.findNewArticlesWithoutCover();
        attrs = attrService.findHotAttrs();
        if(true) {
            ActionContext.getContext().put("newArticleWithCover", article);
            ActionContext.getContext().put("newArticlesWithoutCover", articles);
            ActionContext.getContext().put("hotAttrs", attrs);
            return SUCCESS;
        }
        else {
            ActionContext.getContext().put("errorReason", "无法正确显示首页。");
            return ERROR;  //最新文章或热门属性查询失败
        }
    }
    
    /* getter */
    public ArticleService getArticleService() { return articleService; }
    public AttrService getAttrService() { return attrService; }
    /* setter */
    public void setArticleService(ArticleService articleService) { this.articleService = articleService; }
    public void setAttrService(AttrService attrService) { this.attrService = attrService; }
    
}
