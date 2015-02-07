package com.webstar365.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.webstar365.pojo.*;
import com.webstar365.service.AttrService;
import com.webstar365.service.CatService;
import com.webstar365.service.WebsiteService;
import java.util.List;

public class SearchAction extends ActionSupport {
    
    private CatService catService;
    private AttrService attrService;
    private WebsiteService websiteService;
    private Cat cat;
    private Attr attr;
    private Website website;
    private List<Website> websites;
    private String by;  //按什么方式
    private SearchCondition searchCondition;  //搜索条件
    private String displayStyle;  //网站搜索结果的展现风格（列表：list | 格子：grid | 表格：table）
    private Page page;

    private static final String SUCCESS_BY_KEYWORDS = "successByKeywords";
    private static final String SUCCESS_BY_CAT_ID = "successByCatId";
    private static final String SUCCESS_BY_ATTR_ID = "successByAttrId";
    
    
    /**
     * 搜索网站集合
     * @return
     */
    public String searchWebsites() {
        /* 查询网站（按分类编号） */
        if("catId".equals(by)) {
            cat = catService.findCatByCatId(searchCondition.getCatId());
            websites = websiteService.findWebsitesByCatId(searchCondition);
            if(cat != null && websites != null) {
                ActionContext.getContext().put("cat", cat);
                ActionContext.getContext().put("websites", websites);
                /* 传递展现风格 */
                if(!"list".equals(displayStyle) && !"grid".equals(displayStyle) && !"table".equals(displayStyle)) {
                    displayStyle = "list";
                }
                ActionContext.getContext().put("displayStyle", displayStyle);
                page.setPageNo(searchCondition.getPage().getPageNo());
                Long websiteNum = websiteService.countWebsiteNumByCatId(searchCondition.getCatId());
                if(websiteNum != null) {
                    page.setTotalPageNum(websiteNum % page.getWebsitePageSize() == 0 ? websiteNum / page.getWebsitePageSize() : websiteNum / page.getWebsitePageSize() + 1);
                    ActionContext.getContext().put("websiteNum", websiteNum);
                    ActionContext.getContext().put("page", page);
                    return SUCCESS_BY_CAT_ID;
                }
                else {
                    ActionContext.getContext().put("errorReason", "无法显示搜索结果。");
                    return ERROR;  //统计网站数量出错
                }
            }
            else {
                ActionContext.getContext().put("errorReason", "无法显示搜索结果。");
                return ERROR;  //分类或网站查询出错
            }
        }
        /* 查询网站（按属性编号） */
        else if("attrId".equals(by)) {
            attr = attrService.findAttrByAttrId(searchCondition.getAttrId());
            websites = websiteService.findWebsitesByAttrId(searchCondition);
            if(attr != null && websites != null) {
                ActionContext.getContext().put("attr", attr);
                ActionContext.getContext().put("websites", websites);
                /* 传递展现风格 */
                if(!"list".equals(displayStyle) && !"grid".equals(displayStyle) && !"table".equals(displayStyle)) {
                    displayStyle = "list";
                }
                ActionContext.getContext().put("displayStyle", displayStyle);
                page.setPageNo(searchCondition.getPage().getPageNo());
                Long websiteNum = websiteService.countWebsiteNumByAttrId(searchCondition.getAttrId());
                if(websiteNum != null) {
                    page.setTotalPageNum(websiteNum % page.getWebsitePageSize() == 0 ? websiteNum / page.getWebsitePageSize() : websiteNum / page.getWebsitePageSize() + 1);
                    ActionContext.getContext().put("websiteNum", websiteNum);
                    ActionContext.getContext().put("page", page);
                    return SUCCESS_BY_ATTR_ID;
                }
                else {
                    ActionContext.getContext().put("errorReason", "无法显示搜索结果。");
                    return ERROR;  //统计网站数量出错
                }
            }
            else {
                ActionContext.getContext().put("errorReason", "无法显示搜索结果。");
                return ERROR;  //属性或网站查询出错
            }
        }
        /* 查询网站（按关键词） */
        else if("keywords".equals(by)) {
            if(ActionContext.getContext().getSession().get("USER") != null) {
                searchCondition.setUserId(((User) ActionContext.getContext().getSession().get("USER")).getUserId());
            }
            websites = websiteService.findWebsitesByKeywords(searchCondition);
            if(websites != null) {
                ActionContext.getContext().put("keywords", searchCondition.getKeywords());
                ActionContext.getContext().put("websites", websites);
                /* 传递展现风格 */
                if(!"list".equals(displayStyle) && !"grid".equals(displayStyle) && !"table".equals(displayStyle)) {
                    displayStyle = "list";
                }
                ActionContext.getContext().put("displayStyle", displayStyle);
                page.setPageNo(searchCondition.getPage().getPageNo());
                Long websiteNum = websiteService.countWebsiteNumByKeywords(searchCondition);
                if(websiteNum != null) {
                    page.setTotalPageNum(websiteNum % page.getWebsitePageSize() == 0 ? websiteNum / page.getWebsitePageSize() : websiteNum / page.getWebsitePageSize() + 1);
                    ActionContext.getContext().put("page", page);
                    return SUCCESS_BY_KEYWORDS;
                }
                else {
                    ActionContext.getContext().put("errorReason", "无法显示搜索结果。");
                    return ERROR;  //统计网站数量出错
                }
            }
            else
                ActionContext.getContext().put("errorReason", "无法显示搜索结果。");
                return ERROR;
        }
        else {
            ActionContext.getContext().put("errorReason", "搜索条件错误。");
            return ERROR;  //未接收到by或by值不符合条件，跳转至ERROR页
        }
    }

    /* getter */
    public CatService getCatService() { return catService; }
    public AttrService getAttrService() { return attrService; }
    public WebsiteService getWebsiteService() { return websiteService; }
    public Cat getCat() { return cat; }
    public Attr getAttr() { return attr; }
    public Website getWebsite() { return website; }
    public String getBy() { return by; }
    public SearchCondition getSearchCondition() { return searchCondition; }
    public String getDisplayStyle() { return displayStyle; }
    public Page getPage() { return page; }
    /* setter */
    public void setCatService(CatService catService) { this.catService = catService; }
    public void setAttrService(AttrService attrService) { this.attrService = attrService; }
    public void setWebsiteService(WebsiteService websiteService) { this.websiteService = websiteService; }
    public void setCat(Cat cat) { this.cat = cat; }
    public void setAttr(Attr attr) { this.attr = attr; }
    public void setWebsite(Website website) { this.website = website; }
    public void setBy(String by) { this.by = by; }
    public void setSearchCondition(SearchCondition searchCondition) { this.searchCondition = searchCondition; }
    public void setDisplayStyle(String displayStyle) { this.displayStyle = displayStyle; }
    public void setPage(Page page) { this.page = page; }

}
