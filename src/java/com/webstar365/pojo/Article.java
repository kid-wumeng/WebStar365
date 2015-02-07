package com.webstar365.pojo;

import java.util.Date;

public class Article {
    
    private Long articleId;         //文章编号
    private String articleTitle;    //文章标题
    private String articleNavRead;  //文章导读
    private String articleLink;     //文章链接
    private Boolean articleCoverFlag;  //文章是否有题图
    private Date articlePublishDateTime;  //文章发表的日期与时间

    /* getter */
    public Long getArticleId() { return articleId; }
    public String getArticleTitle() { return articleTitle; }
    public String getArticleNavRead() { return articleNavRead; }
    public String getArticleLink() { return articleLink; }
    public Boolean getArticleCoverFlag() { return articleCoverFlag; }
    public Date getArticlePublishDateTime() { return articlePublishDateTime; }
    /* setter */
    public void setArticleId(Long articleId) { this.articleId = articleId; }
    public void setArticleTitle(String articleTitle) { this.articleTitle = articleTitle; }
    public void setArticleNavRead(String articleNavRead) { this.articleNavRead = articleNavRead; }
    public void setArticleLink(String articleLink) { this.articleLink = articleLink; }
    public void setArticleCoverFlag(Boolean articleCoverFlag) { this.articleCoverFlag = articleCoverFlag; }
    public void setArticlePublishDateTime(Date articlePublishDateTime) { this.articlePublishDateTime = articlePublishDateTime; }

    
}
