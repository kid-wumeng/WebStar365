package com.webstar365.dao;

import com.webstar365.pojo.Admin;
import java.util.List;

public interface AdminDAO {
    
    public List<Admin> findAllAdmins();  //查询全部管理员
    public Admin findAdminByAccountAndPass(Admin admin);  //查询管理员（按帐号、密码）
    
}
