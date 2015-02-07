package com.webstar365.action;

import com.webstar365.pojo.Attr;
import com.webstar365.pojo.Cat;
import com.webstar365.service.AttrService;
import com.webstar365.service.CatService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.webstar365.pojo.*;
import com.webstar365.service.ArticleService;
import java.util.List;

public class ListAction extends ActionSupport {
    
    private CatService catService;
    private AttrService attrService;
    private ArticleService articleService;
    private List<Cat> cats;
    private List<Attr> attrs;
    private List<Article> articles;
    private SearchCondition searchCondition;
    private Page page;
    
    /**
     * 显示全部分类
     * @return SUCCESS：全部分类页 | ERROR：错误页
     */
    public String showAllCats() {
        cats = catService.findAllCats();
        if(cats != null) {
            ActionContext.getContext().put("allCats", cats);
            return SUCCESS;
        }
        else 
            ActionContext.getContext().put("errorReason", "无法显示分类。");
            return ERROR;  //分类查询失败
    }

    /**
     * 显示全部属性
     * @return 
     */
    public String showAllAttrs() {
        attrs = attrService.findAllAttrs();
        if(attrs != null) {
            ActionContext.getContext().put("allAttrs", attrs);
            return SUCCESS;
        }
        else {
            ActionContext.getContext().put("errorReason", "无法显示属性。");
            return ERROR;  //属性查询失败
        }
    }
    
    /**
     * 显示全部文章
     * @return 
     */
    public String showAllArticles() {
        articles = articleService.findAllArticles(searchCondition);
        Long articleNum = articleService.countArticleNum();
        if(articles != null && articles != null) {
            page.setPageNo(searchCondition.getPage().getPageNo());
            page.setTotalPageNum(articleNum % page.getArticlePageSize() == 0 ? articleNum / page.getArticlePageSize() : articleNum / page.getArticlePageSize() + 1);
            ActionContext.getContext().put("articles", articles);
            ActionContext.getContext().put("page", getPage());
            return SUCCESS;
        }
        else {
            ActionContext.getContext().put("errorReason", "无法显示文章。");
            return ERROR;  //文章查询失败
        }
    }
    
    /* getter */
    public CatService getCatService() { return catService; }
    public AttrService getAttrService() { return attrService; }
    public ArticleService getArticleService() { return articleService; }
    public SearchCondition getSearchCondition() { return searchCondition; }
    public Page getPage() { return page; }
    /* setter */
    public void setCatService(CatService catService) { this.catService = catService; }
    public void setAttrService(AttrService attrService) { this.attrService = attrService; }
    public void setArticleService(ArticleService articleService) { this.articleService = articleService; }
    public void setSearchCondition(SearchCondition searchCondition) { this.searchCondition = searchCondition; }
    public void setPage(Page page) { this.page = page; }

}
