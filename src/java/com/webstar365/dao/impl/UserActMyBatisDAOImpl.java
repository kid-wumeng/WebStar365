package com.webstar365.dao.impl;

import com.webstar365.dao.UserActDAO;
import com.webstar365.pojo.UserAct;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

public class UserActMyBatisDAOImpl extends SqlMapClientDaoSupport implements UserActDAO {

    /**
     * 添加用户行为（按关键词搜索网站）
     * @param userAct 用户行为（包含用户编号、关键词）
     */
    public void addUserAct_searchWebsitesByKeywords(UserAct userAct) {
        getSqlMapClientTemplate().queryForObject("addUserAct_searchWebsitesByKeywords", userAct);
    }
    
}
