package com.webstar365.pojo;

import java.util.Date;

public class WebsiteRecommend {
    
    private Long websiteId;  //网站编号
    private String websiteName;  //网站名
    private String websiteDomain;  //网站域名
    private String websiteIntro;  //网站介绍
    private Long userId;  //推荐网站的用户编号
    private User user;  //推荐网站的用户
    private Integer adminId;  //负责审核的管理员编号
    private Admin admin;  //负责审核的管理员
    private Integer websiteCheckStatus;  //审核状态
    private Date websiteRecommendDateTime;  //推荐网站的日期与时间
    private Date websiteCheckPassDateTime;  //审核通过的日期与时间
    private String websiteCheckFailReason;  //审核失败的理由

    /* getter */
    public Long getWebsiteId() { return websiteId; }
    public String getWebsiteName() { return websiteName; }
    public String getWebsiteDomain() { return websiteDomain; }
    public String getWebsiteIntro() { return websiteIntro; }
    public Long getUserId() { return userId; }
    public User getUser() { return user; }
    public Integer getAdminId() { return adminId; }
    public Admin getAdmin() { return admin; }
    public Integer getWebsiteCheckStatus() { return websiteCheckStatus; }
    public Date getWebsiteRecommendDateTime() { return websiteRecommendDateTime; }
    public Date getWebsiteCheckPassDateTime() { return websiteCheckPassDateTime; }
    public String getWebsiteCheckFailReason() { return websiteCheckFailReason; }
    /* setter */
    public void setWebsiteId(Long websiteId) { this.websiteId = websiteId; }
    public void setWebsiteName(String websiteName) { this.websiteName = websiteName; }
    public void setWebsiteDomain(String websiteDomain) { this.websiteDomain = websiteDomain; }
    public void setWebsiteIntro(String websiteIntro) { this.websiteIntro = websiteIntro; }
    public void setUserId(Long userId) { this.userId = userId; }
    public void setUser(User user) { this.user = user; }
    public void setAdminId(Integer adminId) { this.adminId = adminId; }
    public void setAdmin(Admin admin) { this.admin = admin; }
    public void setWebsiteCheckStatus(Integer websiteCheckStatus) { this.websiteCheckStatus = websiteCheckStatus; }
    public void setWebsiteRecommendDateTime(Date websiteRecommendDateTime) { this.websiteRecommendDateTime = websiteRecommendDateTime; }
    public void setWebsiteCheckPassDateTime(Date websiteCheckPassDateTime) { this.websiteCheckPassDateTime = websiteCheckPassDateTime; }
    public void setWebsiteCheckFailReason(String websiteCheckFailReason) { this.websiteCheckFailReason = websiteCheckFailReason; }

}
