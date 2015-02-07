package com.webstar365.pojo;

import java.util.List;

public class Website {
    
    private Long websiteId;  //网站编号
    private String websiteName;  //网站名
    private String websiteDomain;  //网站域名
    private String websiteBriefIntro;  //网站简介
    private String websiteDetailedIntro;  //网站详细介绍
    private String websiteOwner;  //网站所有者
    private Integer websiteEstablishYear;  //网站成立年份
    private Integer websiteEstablishMonth;  //网站成立月份
    private Integer websiteEstablishDay;  //网站成立日份
    private Cat websiteCat;  //网站分类
    private Attr websiteAttr;  //网站的某个属性
    private List<Attr> websiteAttrs;  //网站属性的集合
    private Float websiteStar;  //网站星数
    private Integer websiteStarNum;  //网站星星个数
    private Float websiteScore;  //网站分数
    private Float websiteImport;  //网站的重要性
    private String websiteCoverPath;  //网站封面的路径

    /* getter */
    public Long getWebsiteId() { return websiteId; }
    public String getWebsiteName() { return websiteName; }
    public String getWebsiteDomain() { return websiteDomain; }
    public String getWebsiteBriefIntro() { return websiteBriefIntro; }
    public String getWebsiteDetailedIntro() { return websiteDetailedIntro; }
    public String getWebsiteOwner() { return websiteOwner; }
    public Integer getWebsiteEstablishYear() { return websiteEstablishYear; }
    public Integer getWebsiteEstablishMonth() { return websiteEstablishMonth; }
    public Integer getWebsiteEstablishDay() { return websiteEstablishDay; }
    public Cat getWebsiteCat() { return websiteCat; }
    public Attr getWebsiteAttr() { return websiteAttr; }
    public List<Attr> getWebsiteAttrs() { return websiteAttrs; }
    public Float getWebsiteStar() { return websiteStar; }
    public Integer getWebsiteStarNum() { return websiteStarNum; }
    public Float getWebsiteScore() { return websiteScore; }
    public Float getWebsiteImport() { return websiteImport; }
    public String getWebsiteCoverPath() { return websiteCoverPath; }
    /* setter */
    public void setWebsiteId(Long websiteId) { this.websiteId = websiteId; }
    public void setWebsiteName(String websiteName) { this.websiteName = websiteName; }
    public void setWebsiteDomain(String websiteDomain) { this.websiteDomain = websiteDomain; }
    public void setWebsiteBriefIntro(String websiteBriefIntro) { this.websiteBriefIntro = websiteBriefIntro; }
    public void setWebsiteDetailedIntro(String websiteDetailedIntro) { this.websiteDetailedIntro = websiteDetailedIntro; }
    public void setWebsiteOwner(String websiteOwner) { this.websiteOwner = websiteOwner; }
    public void setWebsiteEstablishYear(Integer websiteEstablishYear) { this.websiteEstablishYear = websiteEstablishYear; }
    public void setWebsiteEstablishMonth(Integer websiteEstablishMonth) { this.websiteEstablishMonth = websiteEstablishMonth; }
    public void setWebsiteEstablishDay(Integer websiteEstablishDay) { this.websiteEstablishDay = websiteEstablishDay; }
    public void setWebsiteCat(Cat websiteCat) { this.websiteCat = websiteCat; }    
    public void setWebsiteAttr(Attr websiteAttr) { this.websiteAttr = websiteAttr; }
    public void setWebsiteAttrs(List<Attr> websiteAttrs) { this.websiteAttrs = websiteAttrs; }
    public void setWebsiteStar(Float websiteStar) { this.websiteStar = websiteStar; }
    public void setWebsiteScore(Float websiteScore) { this.websiteScore = websiteScore; }
    public void setWebsiteImport(Float websiteImport) { this.websiteImport = websiteImport; }
    public void setWebsiteCoverPath(String websiteCoverPath) { this.websiteCoverPath = websiteCoverPath; }
    public void setWebsiteStarNum(Integer websiteStarNum) { this.websiteStarNum = websiteStarNum; }


}
