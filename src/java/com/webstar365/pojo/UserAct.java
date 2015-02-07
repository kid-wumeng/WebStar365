package com.webstar365.pojo;

public class UserAct {
    
    private Long userActId;  //用户行为编号
    private Long userId;  //用户编号
    private String keywords;  //关键词的集合

    /* getter */
    public Long getUserActId() { return userActId; }
    public Long getUserId() { return userId; }
    public String getKeywords() { return keywords; }
    /* setter */
    public void setUserActId(Long userActId) { this.userActId = userActId; }
    public void setUserId(Long userId) { this.userId = userId; }
    public void setKeywords(String keywords) { this.keywords = keywords; }
    
}
