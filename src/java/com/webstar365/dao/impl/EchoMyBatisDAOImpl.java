package com.webstar365.dao.impl;

import com.webstar365.dao.EchoDAO;
import com.webstar365.pojo.Echo;
import com.webstar365.pojo.SearchCondition;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

public class EchoMyBatisDAOImpl extends SqlMapClientDaoSupport implements EchoDAO {

    /**
     * 查询回应（按评论编号）
     * @param searchCondition 搜索条件（包含评论编号、页码、页尺寸）
     * @return 成功：符合条件的回应的集合 | 失败：null
     */
    public List<Echo> findEchoesByCommentId(SearchCondition searchCondition) {
        return getSqlMapClientTemplate().queryForList("findEchoesByCommentId", searchCondition);
    }
    
    /**
     * 添加回应
     * @param echo 新回应
     * @return 成功：1 | 失败：null
     */
    public Long addEcho(Echo echo) {
        return (Long) getSqlMapClientTemplate().queryForObject("addEcho", echo);
    }
    
    /**
     * 统计回应数量（按评论编号）
     * @param commentId 评论编号
     * @return 成功：回应数量 | 失败：null
     */
    public Long countEchoNumByCommentId(Long commentId) {
        return (Long) getSqlMapClientTemplate().queryForObject("countEchoNumByCommentId", commentId);
    }

}
