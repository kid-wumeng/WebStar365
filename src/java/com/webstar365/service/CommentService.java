package com.webstar365.service;

import com.webstar365.pojo.Comment;
import com.webstar365.pojo.SearchCondition;
import java.util.List;

public interface CommentService {
    
    public Comment findCommentByCommentId(Long commentId);  //查询评论（按评论编号）
    public List<Comment> findCommentsByWebsiteId(SearchCondition searchCondition);  //查询评论（按网站编号）
    public List<Comment> findCommentsByUserId(SearchCondition searchCondition);  //查询评论（按用户编号）
    public Comment findCommentByWebsiteIdAndUserId(Comment comment);  //查询评论（按网站编号、用户编号）
    public List<Comment> findNewCommentsByWebsiteId(Long websiteId);  //查询最新评论（按网站编号）
    public Long addComment(Comment comment);  //添加评论
    public boolean modifyUserComment(Comment comment);  //修改评论
    public boolean deleteUserComment(Long commentId);  //删除评论（按评论编号）
    public Long countCommentNumByWebsiteId(Long websiteId);  //统计评论数量（按网站编号）
    public Long countCommentNumByUserId(Long websiteId);  //统计评论数量（按用户编号）
    
}
