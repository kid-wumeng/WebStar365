package com.webstar365.action;

import com.webstar365.pojo.Comment;
import com.webstar365.pojo.Echo;
import com.webstar365.pojo.User;
import com.webstar365.pojo.Website;
import com.webstar365.service.CommentService;
import com.webstar365.service.EchoService;
import com.webstar365.service.WebsiteService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.webstar365.pojo.*;
import java.util.List;

public class WebsiteAction extends ActionSupport {
    
    private WebsiteService websiteService;
    private CommentService commentService; 
    private EchoService echoService; 
    private Website website;
    private Comment comment;
    private List<Comment> comments;
    private List<Echo> echoes;
    private SearchCondition searchCondition;
    private Page page;
    
    /**
     * 显示单个网站
     * @return SUCCESS：单个网站详细信息页 | ERROR：错误页
     */
    public String showWebsite() {
            website = websiteService.findWebsiteByWebsiteId(website.getWebsiteId());
            comments = commentService.findNewCommentsByWebsiteId(website.getWebsiteId());
            Long commentNum = commentService.countCommentNumByWebsiteId(website.getWebsiteId());
            User USER = (User) ActionContext.getContext().getSession().get("USER");
            if(USER != null) {
                comment.setCommentWebsite(website);
                comment.setCommentUser(USER);
                comment = commentService.findCommentByWebsiteIdAndUserId(comment);
            }
            /* 如果尚未评论，则设编号为0，星数为0，内容为空 */
            if(comment == null) {
                comment = new Comment();
                comment.setCommentId(Long.valueOf(0));
                comment.setCommentStar(0);
                comment.setCommentContent("");
            }
            if(website != null && comments != null && commentNum != null) {
                ActionContext.getContext().put("website", website);
                ActionContext.getContext().put("myComment", comment);
                ActionContext.getContext().put("comments", comments);
                ActionContext.getContext().put("commentNum", commentNum);
                return SUCCESS;
            }
            else {
                ActionContext.getContext().put("errorReason", "无法显示网站详情。");
                return ERROR;  //网站 | 评论 | 评论数量查询失败
            }
    }
    
    /**
     * 显示某网站的评论
     * @return 
     */
    public String showComments() {
        website = websiteService.findWebsiteByWebsiteId(searchCondition.getWebsiteId());
        comments = commentService.findCommentsByWebsiteId(searchCondition);
        Long commentNum = commentService.countCommentNumByWebsiteId(searchCondition.getWebsiteId());
        if(website != null && comments != null && commentNum != null) {
            page.setPageNo(searchCondition.getPage().getPageNo());  
            page.setTotalPageNum(commentNum % page.getCommentPageSize() == 0 ? commentNum / page.getCommentPageSize() : commentNum / page.getCommentPageSize() + 1);
            ActionContext.getContext().put("website", website);
            ActionContext.getContext().put("comments", comments);
            ActionContext.getContext().put("page", page);
            return SUCCESS;
        }
        else {
            ActionContext.getContext().put("errorReason", "无法显示评论。");
            return ERROR;  //网站 | 评论 | 评论数量查询失败
        }
    }
    
    /**
     * 显示评论详情
     * @return 
     */
    public String showComment() {
        comment = commentService.findCommentByCommentId(comment.getCommentId());
        echoes = getEchoService().findEchoesByCommentId(searchCondition);
        Long echoNum = echoService.countEchoNumByCommentId(searchCondition.getCommentId());
        if(comment != null && echoes != null && echoNum != null) {
            page.setPageNo(searchCondition.getPage().getPageNo());  
            page.setTotalPageNum(echoNum % page.getEchoPageSize() == 0 ? echoNum / page.getEchoPageSize() : echoNum / page.getEchoPageSize() + 1);
            ActionContext.getContext().put("comment", comment);
            ActionContext.getContext().put("echoes", echoes);
            ActionContext.getContext().put("page", page);
            return SUCCESS;
        }
        else {
            ActionContext.getContext().put("errorReason", "无法显示评论全文与回应。");
            return ERROR;  //评论 | 回应 | 回应数量查询出错
        }
    }
    
    
    /* getter */
    public WebsiteService getWebsiteService() { return websiteService; }
    public CommentService getCommentService() { return commentService; }
    public EchoService getEchoService() { return echoService; }
    public Website getWebsite() { return website; }
    public Comment getComment() { return comment; }
    public List<Comment> getComments() { return comments; }
    public SearchCondition getSearchCondition() { return searchCondition; }
    public Page getPage() { return page; }
    /* setter */
    public void setWebsiteService(WebsiteService websiteService) { this.websiteService = websiteService; }
    public void setCommentService(CommentService commentService) { this.commentService = commentService; }
    public void setEchoService(EchoService echoService) { this.echoService = echoService; }
    public void setWebsite(Website website) { this.website = website; }
    public void setComment(Comment comment) { this.comment = comment; }
    public void setComments(List<Comment> comments) { this.comments = comments; }
    public void setSearchCondition(SearchCondition searchCondition) { this.searchCondition = searchCondition; }
    public void setPage(Page page) { this.page = page; }

}
