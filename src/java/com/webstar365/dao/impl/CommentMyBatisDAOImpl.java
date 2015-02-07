package com.webstar365.dao.impl;

import com.webstar365.dao.CommentDAO;
import com.webstar365.pojo.Comment;
import com.webstar365.pojo.SearchCondition;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

public class CommentMyBatisDAOImpl extends SqlMapClientDaoSupport implements CommentDAO {

    /**
     * 查询评论（按评论编号）
     * @param commentId 评论编号
     * @return 成功：符合条件的评论 | 失败：null
     */
    public Comment findCommentByCommentId(Long commentId) {
        return (Comment) getSqlMapClientTemplate().queryForObject("findCommentByCommentId", commentId);
    }
    
    /**
     * 查询评论（按网站编号）
     * @param searchCondition 搜索条件（包含网站编号、页码、页尺寸）
     * @return 成功：符合条件的评论的集合 | 失败：null
     */
    public List<Comment> findCommentsByWebsiteId(SearchCondition searchCondition) {
        return getSqlMapClientTemplate().queryForList("findCommentsByWebsiteId", searchCondition);
    }
    
    /**
     * 查询评论（按用户编号）
     * @param searchCondition 搜索条件（包含用户编号、页码、页尺寸）
     * @return 成功：符合条件的评论的集合 | 失败：null
     */
    public List<Comment> findCommentsByUserId(SearchCondition searchCondition) {
        return getSqlMapClientTemplate().queryForList("findCommentsByUserId", searchCondition);
    }
    
    /**
     * 查询评论（按网站编号、用户编号）
     * @param comment 评论（包含网站编号、用户编号）
     * @return 成功：符合条件的评论 | 失败：null 
     */
    public Comment findCommentByWebsiteIdAndUserId(Comment comment) {
        return (Comment) getSqlMapClientTemplate().queryForObject("findCommentByWebsiteIdAndUserId", comment);
    }
    
    /**
     * 查询最新评论（按网站编号）
     * @param websiteId 网站编号
     * @return 成功：符合条件的评论的集合 | 失败：null
     */
    public List<Comment> findNewCommentsByWebsiteId(Long websiteId) {
        return getSqlMapClientTemplate().queryForList("findNewCommentsByWebsiteId", websiteId);
    }

    /**
     * 添加评论
     * @param comment 新评论
     * @return 成功：新评论的编号 | 失败：null
     */
    public Long addComment(Comment comment) {
        return (Long) getSqlMapClientTemplate().queryForObject("addComment", comment);
    }

    /**
     * 修改评论
     * @param comment 新评论（按评论编号）
     * @return 成功：1 | 失败：0
     */
    public Long modifyCommentByComemntId(Comment comment) {
        return (Long) getSqlMapClientTemplate().queryForObject("modifyCommentByCommentId", comment);
    }
    
    /**
     * 删除评论（按评论编号）
     * @param commentId 评论编号
     * @return 成功：1 | 失败：null
     */
    public Long deleteCommentByCommentId(Long commentId) {
        return (Long) getSqlMapClientTemplate().queryForObject("deleteCommentByCommentId", commentId);
    }
    
    /**
     * 统计评论数量（按网站编号）
     * @param websiteId 网站编号
     * @return 成功：评论数量 | 失败：null
     */
    public Long countCommentNumByWebsiteId(Long websiteId) {
        return (Long) getSqlMapClientTemplate().queryForObject("countCommentNumByWebsiteId", websiteId);
    }
    
    /**
     * 统计评论数量（按用户编号）
     * @param userId 用户编号
     * @return 成功：评论数量 | 失败：null
     */
    public Long countCommentNumByUserId(Long userId) {
        return (Long) getSqlMapClientTemplate().queryForObject("countCommentNumByUserId", userId);
    }


}
