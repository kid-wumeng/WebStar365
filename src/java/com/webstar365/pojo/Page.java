package com.webstar365.pojo;

public class Page {
    
    private Long pageNo;        //页码
    private Long totalPageNum;  //总页数
    private Long pageSize;  //页尺寸（每页存放多少条记录）
    private Long websitePageSize;   //网站页尺寸
    private Long websiteRecommendPageSize;   //网站推荐页尺寸
    private Long commentPageSize;   //评论页尺寸
    private Long echoPageSize;      //回应页尺寸
    private Long articlePageSize;      //文章页尺寸

    /* getter */
    public Long getPageNo() { return pageNo; }
    public Long getTotalPageNum() { return totalPageNum; }
    public Long getPageSize() { return pageSize; }
    public Long getWebsitePageSize() { return websitePageSize; }
    public Long getWebsiteRecommendPageSize() { return websiteRecommendPageSize; }
    public Long getCommentPageSize() { return commentPageSize; }
    public Long getEchoPageSize() { return echoPageSize; }
    public Long getArticlePageSize() { return articlePageSize; }
    /* setter  */
    public void setPageNo(Long pageNo) { this.pageNo = pageNo; }
    public void setTotalPageNum(Long totalPageNum) { this.totalPageNum = totalPageNum; }
    public void setPageSize(Long pageSize) { this.pageSize = pageSize; }
    public void setWebsitePageSize(Long websitePageSize) { this.websitePageSize = websitePageSize; }
    public void setWebsiteRecommendPageSize(Long websiteRecommendPageSize) { this.websiteRecommendPageSize = websiteRecommendPageSize; }
    public void setCommentPageSize(Long commentPageSize) { this.commentPageSize = commentPageSize; }
    public void setEchoPageSize(Long echoPageSize) { this.echoPageSize = echoPageSize; }
    public void setArticlePageSize(Long articlePageSize) { this.articlePageSize = articlePageSize; }
    
}
