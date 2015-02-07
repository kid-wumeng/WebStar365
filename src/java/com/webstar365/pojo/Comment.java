package com.webstar365.pojo;

import java.util.Date;

public class Comment {
    
    private Long commentId;         //评论编号
    private Integer commentStar;    //评论星数
    private String commentContent;  //评论内容
    private Date commentPublishDateTime;   //评论发表的日期时间
    private Date commentLastEditDateTime;  //评论最后修改的日期时间
    private Website commentWebsite;  //评论所属的网站
    private Long userId;        //发表评论的用户编号
    private User commentUser;        //发表评论的用户
    private Long commentEchoNum;     //评论的回应数量

    /* getter */
    public Long getCommentId() { return commentId; }
    public Integer getCommentStar() { return commentStar; }
    public String getCommentContent() { return commentContent; }
    public Date getCommentPublishDateTime() { return commentPublishDateTime; }
    public Date getCommentLastEditDateTime() { return commentLastEditDateTime; }
    public Website getCommentWebsite() { return commentWebsite; }
    public Long getUserId() { return userId; }
    public User getCommentUser() { return commentUser; }
    public Long getCommentEchoNum() { return commentEchoNum; }
    /* setter */
    public void setCommentId(Long commentId) { this.commentId = commentId; }
    public void setCommentStar(Integer commentStar) { this.commentStar = commentStar; }
    public void setCommentContent(String commentContent) { this.commentContent = commentContent; }
    public void setCommentPublishDateTime(Date commentPublishDateTime) { this.commentPublishDateTime = commentPublishDateTime; }
    public void setCommentLastEditDateTime(Date commentLastEditDateTime) { this.commentLastEditDateTime = commentLastEditDateTime; }
    public void setCommentWebsite(Website commentWebsite) { this.commentWebsite = commentWebsite; }
    public void setUserId(Long userId) { this.userId = userId; }
    public void setCommentUser(User commentUser) { this.commentUser = commentUser; }
    public void setCommentEchoNum(Long commentEchoNum) { this.commentEchoNum = commentEchoNum; }

}
