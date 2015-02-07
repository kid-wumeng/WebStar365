package com.webstar365.pojo;

import java.util.Date;

public class Echo {
    
    private Long echoId;               //回应编号
    private String echoContent;        //回应内容
    private Date echoPublishDateTime;  //回应发表的日期与时间
    private Long commentId;  //回应所属的评论编号
    private Long userId;    //发表回应的用户编号
    private User echoUser;  //发表回应的用户

    /* getter */
    public Long getEchoId() { return echoId; }
    public String getEchoContent() { return echoContent; }
    public Date getEchoPublishDateTime() { return echoPublishDateTime; }
    public Long getCommentId() { return commentId; }
    public Long getUserId() { return userId; }
    public User getEchoUser() { return echoUser; }
    /* setter */
    public void setEchoId(Long echoId) { this.echoId = echoId; }
    public void setEchoContent(String echoContent) { this.echoContent = echoContent; }
    public void setEchoPublishDateTime(Date echoPublishDateTime) { this.echoPublishDateTime = echoPublishDateTime; }
    public void setCommentId(Long commentId) { this.commentId = commentId; }
    public void setUserId(Long userId) { this.userId = userId; }
    public void setEchoUser(User echoUser) { this.echoUser = echoUser; }

}
