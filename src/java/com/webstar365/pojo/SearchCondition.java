package com.webstar365.pojo;

import java.util.Date;

public class SearchCondition {

    private String keywords;  //关键词（可以是多关键词）
    private String websiteNameKeyword;    //网站名的关键词
    private String websiteDomainKeyword;  //网站域名的关键词
    private Long websiteId;       //网站编号
    private Long websiteIdStart;  //网站编号（开始）
    private Long websiteIdEnd;    //网站编号（结束）
    private Long commentId;  //评论编号
    private Integer catId;        //分类编号
    private Long attrId;        //属性编号
    private String attrIds;       //属性编号的集合
    private Integer adminId;      //管理员编号
    private Integer addWebsiteYearStart;   //添加网站的年份（开始）  
    private Integer addWebsiteMonthStart;  //添加网站的月份（开始）
    private Integer addWebsiteDayStart;    //添加网站的日份（开始）
    private Integer addWebsiteYearEnd;     //添加网站的年份（结束）
    private Integer addWebsiteMonthEnd;    //添加网站的月份（结束）
    private Integer addWebsiteDayEnd;      //添加网站的日份（结束）
    private Date addWebsiteDateStart;  //添加网站的日期（开始）
    private Date addWebsiteDateEnd;  //添加网站的日期（结束）
    private Long userId;  //用户编号
    private Integer websiteCheckStatus;  //网站审核状态
    private Page page;  //页面（包含目标页码、页尺寸等信息）


    /* getter */
    public String getKeywords() { return keywords; }
    public String getWebsiteNameKeyword() { return websiteNameKeyword; }
    public String getWebsiteDomainKeyword() { return websiteDomainKeyword; }
    public Long getWebsiteId() { return websiteId; }
    public Long getWebsiteIdStart() { return websiteIdStart; }
    public Long getWebsiteIdEnd() { return websiteIdEnd; }
    public Long getCommentId() { return commentId; }
    public Integer getCatId() { return catId; }
    public Long getAttrId() { return attrId; }
    public String getAttrIds() { return attrIds; }
    public Integer getAdminId() { return adminId; }
    public Integer getAddWebsiteYearStart() { return addWebsiteYearStart; }
    public Integer getAddWebsiteMonthStart() { return addWebsiteMonthStart; }
    public Integer getAddWebsiteDayStart() { return addWebsiteDayStart; }
    public Integer getAddWebsiteYearEnd() { return addWebsiteYearEnd; }
    public Integer getAddWebsiteMonthEnd() { return addWebsiteMonthEnd; }
    public Integer getAddWebsiteDayEnd() { return addWebsiteDayEnd; }
    public Date getAddWebsiteDateStart() { return addWebsiteDateStart; }
    public Date getAddWebsiteDateEnd() { return addWebsiteDateEnd; }
    public Long getUserId() { return userId; }
    public Integer getWebsiteCheckStatus() { return websiteCheckStatus; }
    public Page getPage() { return page; }
    /* setter */
    public void setKeywords(String keywords) { this.keywords = keywords; }
    public void setWebsiteNameKeyword(String websiteNameKeyword) { this.websiteNameKeyword = websiteNameKeyword; }
    public void setWebsiteDomainKeyword(String websiteDomainKeyword) { this.websiteDomainKeyword = websiteDomainKeyword; }
    public void setWebsiteId(Long websiteId) { this.websiteId = websiteId; }
    public void setWebsiteIdStart(Long websiteIdStart) { this.websiteIdStart = websiteIdStart; }
    public void setWebsiteIdEnd(Long websiteIdEnd) { this.websiteIdEnd = websiteIdEnd; }
    public void setCommentId(Long commentId) { this.commentId = commentId; }
    public void setCatId(Integer catId) { this.catId = catId; }
    public void setAttrId(Long attrId) { this.attrId = attrId; }
    public void setAttrIds(String attrIds) { this.attrIds = attrIds; }
    public void setAdminId(Integer adminId) { this.adminId = adminId; }
    public void setAddWebsiteYearStart(Integer addWebsiteYearStart) { this.addWebsiteYearStart = addWebsiteYearStart; }
    public void setAddWebsiteMonthStart(Integer addWebsiteMonthStart) { this.addWebsiteMonthStart = addWebsiteMonthStart; }
    public void setAddWebsiteDayStart(Integer addWebsiteDayStart) { this.addWebsiteDayStart = addWebsiteDayStart; }
    public void setAddWebsiteYearEnd(Integer addWebsiteYearEnd) { this.addWebsiteYearEnd = addWebsiteYearEnd; }
    public void setAddWebsiteMonthEnd(Integer addWebsiteMonthEnd) { this.addWebsiteMonthEnd = addWebsiteMonthEnd; }
    public void setAddWebsiteDayEnd(Integer addWebsiteDayEnd) { this.addWebsiteDayEnd = addWebsiteDayEnd; }
    public void setAddWebsiteDateStart(Date addWebsiteDateStart) { this.addWebsiteDateStart = addWebsiteDateStart; }
    public void setAddWebsiteDateEnd(Date addWebsiteDateEnd) { this.addWebsiteDateEnd = addWebsiteDateEnd; }
    public void setUserId(Long userId) { this.userId = userId; }
    public void setWebsiteCheckStatus(Integer websiteCheckStatus) { this.websiteCheckStatus = websiteCheckStatus; }
    public void setPage(Page page) { this.page = page; }

}
