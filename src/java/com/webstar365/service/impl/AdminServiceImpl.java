package com.webstar365.service.impl;

import com.webstar365.dao.AdminDAO;
import com.webstar365.pojo.Admin;
import com.webstar365.service.AdminService;
import java.util.List;

public class AdminServiceImpl implements AdminService {
    
    private AdminDAO adminDAO;
    private Admin admin;
    private List<Admin> admins;
    
    
    /**
     * 查询全部管理员
     * @return 成功：全部管理员的集合 | 失败：null
     */
    public List<Admin> findAllAdmins() {
        admins = adminDAO.findAllAdmins();
        admin = new Admin();
        admin.setAdminId(0);
        admin.setAdminName("");
        admins.add(0, admin);
        return admins;
        
    }
    
    /**
     * 查询管理员（按帐号、密码）
     * @param admin 管理员（其中包含帐号、密码）
     * @return 成功：符合条件的管理员 | 失败：null
     */
    public Admin findAdminByAccountAndPass(Admin admin) {
        return adminDAO.findAdminByAccountAndPass(admin);
    }
    
    public AdminDAO getAdminDAO() { return adminDAO; }
    public void setAdminDAO(AdminDAO adminDAO) { this.adminDAO = adminDAO; }
    
}
