package com.webstar365.pojo;

public class Admin {
   
    private int adminId;  //管理员编号
    private String adminAccount;  //管理员帐号 
    private String adminPass;  //管理员密码
    private String adminName;  //管理员名
    private int adminLv;  //管理员级别

    /* getter */
    public int getAdminId() { return adminId; }
    public String getAdminAccount() { return adminAccount; }
    public String getAdminPass() { return adminPass; }
    public String getAdminName() { return adminName; }
    public int getAdminLv() { return adminLv; }
    /* setter */
    public void setAdminId(int adminId) { this.adminId = adminId; }
    public void setAdminAccount(String adminAccount) { this.adminAccount = adminAccount; }
    public void setAdminPass(String adminPass) { this.adminPass = adminPass; }
    public void setAdminName(String adminName) { this.adminName = adminName; }
    public void setAdminLv(int adminLv) { this.adminLv = adminLv; }

}
