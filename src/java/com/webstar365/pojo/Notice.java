package com.webstar365.pojo;

import java.util.Date;

public class Notice {
    
    private Integer noticeId;      //公告编号
    private String noticeTitle;    //公告标题
    private String noticeContent;  //公告内容
    private Date noticePublishDateTime;   //公告发布的日期与时间
    private Date noticeLastEditDateTime;  //公告最后编辑的日期与时间
    private Admin noticeAdmin;  //发布公告的管理员

    /* getter */
    public Integer getNoticeId() { return noticeId; }
    public String getNoticeTitle() { return noticeTitle; }
    public String getNoticeContent() { return noticeContent; }
    public Date getNoticePublishDateTime() { return noticePublishDateTime; }
    public Date getNoticeLastEditDateTime() { return noticeLastEditDateTime; }
    public Admin getNoticeAdmin() { return noticeAdmin; }
    /* setter */
    public void setNoticeId(Integer noticeId) { this.noticeId = noticeId; }
    public void setNoticeTitle(String noticeTitle) { this.noticeTitle = noticeTitle; }
    public void setNoticeContent(String noticeContent) { this.noticeContent = noticeContent; }
    public void setNoticePublishDateTime(Date noticePublishDateTime) { this.noticePublishDateTime = noticePublishDateTime; }
    public void setNoticeLastEditDateTime(Date noticeLastEditDateTime) { this.noticeLastEditDateTime = noticeLastEditDateTime; }
    public void setNoticeAdmin(Admin noticeAdmin) { this.noticeAdmin = noticeAdmin; }
    
}
