package com.webstar365.service.impl;

import com.webstar365.common.utils.WebUtils;
import com.webstar365.dao.CommentDAO;
import com.webstar365.dao.UserDAO;
import com.webstar365.pojo.Comment;
import com.webstar365.pojo.SearchCondition;
import com.webstar365.pojo.Website;
import com.webstar365.service.CommentService;
import com.webstar365.service.UploadService;
import java.io.File;
import java.util.List;

public class CommentServiceImpl implements CommentService {
    
    private CommentDAO commentDAO;
    private UserDAO userDAO;
    private Comment comment;
    private List<Comment> comments;
    
    /**
     * 查询评论（按评论编号）
     * @param commentId 评论编号
     * @return 成功：符合条件的评论 | 失败：null
     */
    public Comment findCommentByCommentId(Long commentId) {
        comment = commentDAO.findCommentByCommentId(commentId);
        /* 将评论内容中的换行符换成<br /> */
        if(comment.getCommentContent() != null) {
            comment.setCommentContent(comment.getCommentContent().replaceAll("\n", "<br />"));
        }
        return comment;
    }
    
    /**
     * 查询评论（按网站编号）
     * @param searchCondition 搜索条件（包含网站编号、页码、页尺寸）
     * @return 成功：符合条件的评论的集合 | 失败：null
     */
    public List<Comment> findCommentsByWebsiteId(SearchCondition searchCondition) {
        searchCondition.getPage().setPageSize(searchCondition.getPage().getCommentPageSize());  //使用评论页尺寸
        comments = commentDAO.findCommentsByWebsiteId(searchCondition);
        for(Comment comment : comments) {
            /* 将评论内容中的换行符换成<br /> */
            if(comment.getCommentContent() != null) {
                comment.setCommentContent(comment.getCommentContent().replaceAll("\n", "<br />"));
            }
        }
        return comments;
    }
    
    /**
     * 查询评论（按用户编号）
     * @param searchCondition 搜索条件（包含用户编号、页码、页尺寸）
     * @return 成功：符合条件的评论的集合 | 失败：null
     */
    public List<Comment> findCommentsByUserId(SearchCondition searchCondition) {
        searchCondition.getPage().setPageSize(searchCondition.getPage().getCommentPageSize());  //使用评论页尺寸
        comments = commentDAO.findCommentsByUserId(searchCondition);
        for(Comment comment : comments) {
            /* 将评论内容中的换行符换成<br /> */
            if(comment.getCommentContent() != null) {
                comment.setCommentContent(comment.getCommentContent().replaceAll("\n", "<br />"));
            }
            /* 判断网站封面是否存在，如果不存在，设封面为默认（defaultWebsiteCover.jpg） */
            Website website = comment.getCommentWebsite();
            String websiteCoverPath = WebUtils.getRootPath() + UploadService.WEBSITE_COVERS_SAVE_PATH + "\\" + website.getWebsiteId() + ".png";
            File websiteCover = new File(websiteCoverPath);
            if(websiteCover.exists()) 
                website.setWebsiteCoverPath(websiteCover.getName());
            else
            website.setWebsiteCoverPath("defaultWebsiteCover");
            comment.setCommentWebsite(website);
        }
        return comments;
    }
    
    /**
     * 查询评论（按网站编号、用户编号）
     * @param comment 评论（包含网站编号、用户编号）
     * @return 成功：符合条件的评论 | 失败：null 
     */
    public Comment findCommentByWebsiteIdAndUserId(Comment comment) {
        comment = commentDAO.findCommentByWebsiteIdAndUserId(comment);
        /* 将评论内容中的换行符换成<br /> */
        if(comment != null) {
            comment.setCommentContent(comment.getCommentContent().replaceAll("\n", "<br />"));
        }
        return comment;
    }
    
    /**
     * 查询最新评论（按网站编号）
     * @param websiteId 网站编号
     * @return 成功：符合条件的评论的集合 | 失败：null
     */
    public List<Comment> findNewCommentsByWebsiteId(Long websiteId) {
        comments = commentDAO.findNewCommentsByWebsiteId(websiteId);
        for(Comment comment : comments) {
            /* 将评论内容中的换行符换成<br /> */
            if(comment.getCommentContent() != null) {
                comment.setCommentContent(comment.getCommentContent().replaceAll("\n", "<br />"));
            }
        }
        return comments;
    }

    /**
     * 添加评论
     * @param comment 新评论
     * @return 成功：新评论的编号 | 失败：null
     */
    public Long addComment(Comment comment) {
        return commentDAO.addComment(comment);
    }

    
    /**
     * 修改评论
     * @param comment 新评论
     * @return 成功：true | 失败：false
     */
    public boolean modifyUserComment(Comment comment) {
        Long flag = commentDAO.modifyCommentByComemntId(comment);
        if(flag == 1) {
            return true;
        }
        else {
            return false;  //修改评论失败
        }
    }
    
    /**
     * 删除评论（按评论编号）
     * @param commentId 评论编号
     * @param nowUsertId 当前用户编号
     * @return 成功：true | 失败：false
     */
    public boolean deleteUserComment(Long commentId) {
        Long flag = commentDAO.deleteCommentByCommentId(commentId);
        if(flag == 1) {
            return true;
        }
        else {
            return false;  //删除评论失败
        }
    }
    
    /**
     * 统计评论数量（按网站编号）
     * @param websiteId 网站编号
     * @return 成功：评论数量 | 失败：null
     */
    public Long countCommentNumByWebsiteId(Long websiteId) {
        return commentDAO.countCommentNumByWebsiteId(websiteId);
    }
    
    /**
     * 统计评论数量（按用户编号）
     * @param userId 网站编号
     * @return 成功：评论数量 | 失败：null
     */
    public Long countCommentNumByUserId(Long userId) {
        return commentDAO.countCommentNumByUserId(userId);
    }
    
    /* getter */
    public CommentDAO getCommentDAO() { return commentDAO; }
    public UserDAO getUserDAO() { return userDAO; }
    /* setter */
    public void setCommentDAO(CommentDAO commentDAO) { this.commentDAO = commentDAO; }
    public void setUserDAO(UserDAO userDAO) { this.userDAO = userDAO; }

}
