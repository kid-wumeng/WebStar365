package com.webstar365.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.webstar365.common.utils.SecurityUtils;
import com.webstar365.pojo.Admin;
import com.webstar365.pojo.User;
import com.webstar365.pojo.UserPassReset;
import com.webstar365.service.AdminService;
import com.webstar365.service.MailService;
import com.webstar365.service.UserService;


public class AccountAction extends ActionSupport {
    
    private UserService userService;
    private AdminService adminService;
    private MailService mailService;
    private User user;
    private UserPassReset userPassReset;
    private Admin admin;
    private boolean agree;  //是否同意注册协议
    private boolean cookieFlag;  //是否设置cookie

    /**
     * 新用户注册
     * @return 
     */
    public String userRegister() {
        if(!agree) {
            ActionContext.getContext().put("success", false);
            ActionContext.getContext().put("errorReason", 1);
            return ERROR;  //不同意注册协议
        }
        if(userService.checkUserAccount(user.getUserAccount())) {
            ActionContext.getContext().put("success", false);
            ActionContext.getContext().put("errorReason", 2);
            return ERROR;  //用户帐号已存在
        }
        else if(userService.checkUserNickName(user.getUserNickName())) {
            ActionContext.getContext().put("success", false);
            ActionContext.getContext().put("errorReason", 3);
            return ERROR;  //用户昵称已存在
        }
        else {
            Long newUserId = userService.addUserWaitValidate(user);  //添加新用户（待验证状态）
            if(newUserId != null) {
                user.setUserId(newUserId);
                mailService.sendNewUserValidMail(user);  //发送验证邮件
                ActionContext.getContext().put("success", true);
                return SUCCESS;
            }
            else {
                ActionContext.getContext().put("success", false);
                ActionContext.getContext().put("errorReason", 4);
                return ERROR;  //新用户添加失败
            } 
        }
    }
    
    /**
     * 发送新用户验证邮件
     * @return 
     */
    public String sendNewUserValidMail() {
        user.setUserPass(SecurityUtils.toMD5(user.getUserPass()));
        User userWaitValidate = userService.findUserWaitValidateByAccountAndPass(user);  //查询待验证用户
        if(userWaitValidate != null) {
            mailService.sendNewUserValidMail(userWaitValidate);
            return SUCCESS;
        }
        else {
            ActionContext.getContext().put("errorReason", 2);
            return ERROR;  //待验证用户查不出
        }
    }
    
    /**
     * 新用户邮件验证
     * @return 
     */
    public String newUserMailValidate() {
        if(user.getUserId()!=null && user.getUserAccount() != null) {
            User userWaitValidate = userService.findUserWaitValidateById(user.getUserId());  //根据验证邮件中的待验证用户编号，查询待验证用户帐号
            if(userWaitValidate != null) {
                String userAccountWaitValidate = SecurityUtils.toMD5(userWaitValidate.getUserAccount());  //对查询出的帐号进行MD5加密
                if(user.getUserAccount().equals(userAccountWaitValidate)) {  //比较验证邮件中的帐号与查出来的帐号
                    Long newUserId = userService.addUserByUserWaitValidate(userWaitValidate);
                    if(newUserId != null) {
                        user = userService.findUserByUserId(newUserId);
                        if(user != null) {
                            userService.saveUserCookie(user, 15);
                            ActionContext.getContext().getSession().put("USER", user);
                            return SUCCESS;
                        }
                        else {
                            ActionContext.getContext().put("errorReason", 5);
                            return ERROR;  //新用户查不出
                        }
                    }
                    else {
                        ActionContext.getContext().put("errorReason", 4);
                        return ERROR;  //待验证用户无法变为正式用户
                    }
                }
                else {
                    ActionContext.getContext().put("errorReason", 3);
                    return ERROR;  //验证邮件中的帐号与查询出的帐号不相同
                }
            }
            else {
                ActionContext.getContext().put("errorReason", 2);
                return ERROR;  //待验证用户查不出
            }
        }
        else {
            ActionContext.getContext().put("errorReason", 1);
            return ERROR;  //验证邮件中的用户编号或用户帐号为空
        }
    }   
    
    /**
     * 用户登录
     * @return 
     */
    public String userLogin() {
        user.setUserPass(SecurityUtils.toMD5(user.getUserPass()));
        User formalUser = userService.findUserByAccountAndPass(user);  //查询正式用户
        if(formalUser != null) {
            ActionContext.getContext().getSession().put("USER", formalUser);
            if(cookieFlag) {
                userService.saveUserCookie(formalUser, 30);
            }
            ActionContext.getContext().put("success", true);
            return SUCCESS;
        }
        else {
            User userWaitValidate = userService.findUserWaitValidateByAccountAndPass(user);  //查询待验证用户
            if(userWaitValidate != null) {
                ActionContext.getContext().put("success", false);
                ActionContext.getContext().put("errorReason", 1);
                return ERROR;  //用户尚在等待邮件验证
            }
            else {
                ActionContext.getContext().put("success", false);
                ActionContext.getContext().put("errorReason", 2);
                return ERROR;  //帐号或密码错误（在正式用户和待验证用户中都不存在符合条件的用户）
            }
        }
    }
    
    /**
     * 用户退出
     * @return 
     */
    public String userLogout() {
        user = (User) ActionContext.getContext().getSession().get("USER");
        userService.saveUserCookie(user, 0);  //清除用户Cookie
        ActionContext.getContext().getSession().remove("USER");  //移除用户Session
        return SUCCESS;
    }
    
    /**
     * 发送用户密码重置验证邮件
     * @return 
     */
    public String sendUserPassResetValidMail() {
        user = userService.findUserByUserAccount(user.getUserAccount());
        if(user != null) {
            userPassReset = userService.addUserPassReset(user.getUserId());
            if(userPassReset != null) {
                ActionContext.getContext().put("userEmailStarMode", user.getUserEmailStarMode());
                ActionContext.getContext().put("result", 0);
                mailService.sendUserPassResetValidMail(user, userPassReset);  //发送验证邮件
                return SUCCESS;
            }
            else {
                ActionContext.getContext().put("result", 1);
                return ERROR;  //用户密码重置邮箱验证记录添加失败
            }
            
        }
        else {
            ActionContext.getContext().put("result", 2);
            return ERROR;  //查询用户出错或用户电子邮箱为空
        }
    }
    
    /**
     * 用户密码重置邮件验证
     * @return 
     */
    public String userPassResetMailValidate() {
        Integer flag = userService.checkUserPassReset(userPassReset);
        if(flag == 0) {
            ActionContext.getContext().put("userId", userPassReset.getUserId());
            ActionContext.getContext().put("flag", true);
            return SUCCESS;
        }
        else if(flag == 1) {
            ActionContext.getContext().put("errorReason", 1);
            return ERROR;  //超时
        }
        else if(flag == 2) {
            ActionContext.getContext().put("errorReason", 2);
            return ERROR;  //作废
        }
        else {
            ActionContext.getContext().put("errorReason", 3);
            return ERROR;  //查询失败
        }
    }
    
    /**
     * 重置用户密码
     * @return 
     */
    public String resetUserPass() {
        boolean flag = userService.modifyUserPassByUserId(user);
        if(flag) {
            ActionContext.getContext().put("result", "success");
            return SUCCESS;
        }
        else {
            ActionContext.getContext().put("result", "error");
            return ERROR;  //修改密码失败
        }
    }
    
    /**
     * 管理员登录
     * @return 登录成功：后台管理系统 | 登录失败：登录页
     */
    public String adminLogin() {
        admin = adminService.findAdminByAccountAndPass(admin);
        if(admin != null) {
            ActionContext.getContext().getSession().put("ADMIN", admin);
            return SUCCESS;
        }
        else
            return INPUT;
    }
    
    /* getter */
    public UserService getUserService() { return userService; }
    public AdminService getAdminService() { return adminService; }
    public MailService getMailService() { return mailService; }
    public User getUser() { return user; }
    public UserPassReset getUserPassReset() { return userPassReset; }
    public Admin getAdmin() { return admin; }
    public boolean isAgree() { return agree; }
    public boolean isCookieFlag() { return cookieFlag; }
    /* setter */
    public void setUserService(UserService userService) { this.userService = userService; }
    public void setAdminService(AdminService adminService) { this.adminService = adminService; }
    public void setMailService(MailService mailService) { this.mailService = mailService; }
    public void setUser(User user) { this.user = user; }
    public void setUserPassReset(UserPassReset userPassReset) { this.userPassReset = userPassReset; }
    public void setAdmin(Admin admin) { this.admin = admin; }
    public void setAgree(boolean agree) { this.agree = agree; }
    public void setCookieFlag(boolean cookieFlag) { this.cookieFlag = cookieFlag; }

}
