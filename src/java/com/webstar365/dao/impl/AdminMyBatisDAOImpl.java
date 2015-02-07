package com.webstar365.dao.impl;

import com.webstar365.dao.AdminDAO;
import com.webstar365.pojo.Admin;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

public class AdminMyBatisDAOImpl extends SqlMapClientDaoSupport implements AdminDAO {

    /**
     * 查询全部管理员
     * @return 成功：全部管理员的集合 | 失败：null
     */
    public List<Admin> findAllAdmins() {
        return getSqlMapClientTemplate().queryForList("findAllAdmins");
    }
    
    /**
     * 查询管理员（按帐号、密码）
     * @param admin 管理员（其中包含帐号、密码）
     * @return 成功：符合条件的管理员 | 失败：null
     */
    public Admin findAdminByAccountAndPass(Admin admin) {
        return (Admin) getSqlMapClientTemplate().queryForObject("findAdminByAccountAndPass", admin);
    }
    
}
