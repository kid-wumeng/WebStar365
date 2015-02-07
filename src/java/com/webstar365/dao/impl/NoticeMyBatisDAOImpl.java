package com.webstar365.dao.impl;

import com.webstar365.dao.NoticeDAO;
import com.webstar365.pojo.Notice;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

public class NoticeMyBatisDAOImpl extends SqlMapClientDaoSupport implements NoticeDAO {

    /**
     * 查询新公告
     * @return 成功：新公告 | 失败：null
     */
    public Notice findNewNotice() {
        return (Notice) getSqlMapClientTemplate().queryForObject("findNewNotice");
    }
    
}
