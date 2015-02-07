package com.webstar365.service;

import com.webstar365.pojo.User;
import com.webstar365.pojo.UserPassReset;

public interface UserService {
    
    public boolean checkUserAccount(String userAccount);  //核对用户帐号
    public boolean checkUserNickName(String userNickName);  //核对用户昵称
    public Integer checkUserPassReset(UserPassReset userPassReset);  //核对用户密码重置邮件验证记录
    public User findUserByUserId(Long userId);  //查询正式用户（按正式用户编号）
    public User findUserByUserAccount(String userAccount);  //查询正式用户（按用户帐号）
    public User findUserDataByUserId(Long userId);  //查询用户资料（按正式用户编号）
    public User findUserWaitValidateById(Long userId);  //查询待验证用户（按待验证用户编号）
    public User findUserByAccountAndPass(User user);  //查询正式用户（按帐号、密码）
    public User findUserWaitValidateByAccountAndPass(User user);  //查询待验证用户（按帐号、密码）
    public Long addUserWaitValidate(User user);  //添加待验证用户
    public Long addUserByUserWaitValidate(User user);  //添加正式用户（将待验证用户变为正式用户）
    public UserPassReset addUserPassReset(Long userId);  //添加用户密码重置邮件验证记录
    public boolean modifyUserPassByUserId(User user);  //修改用户密码（按用户编号）
    public Long modifyUserDataByUserId(User user);  //修改用户资料（按用户编号）
    public void saveUserCookie(User user, int days);  //保存用户Cookie
    public User checkUserCookie();  //核对用户Cookie
            
}
