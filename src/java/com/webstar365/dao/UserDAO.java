package com.webstar365.dao;

import com.webstar365.pojo.User;
import com.webstar365.pojo.UserPassReset;

public interface UserDAO {
    
    public User findUserByUserId(Long userId);  //查询正式用户（按正式用户编号）
    public User findUserDataByUserId(Long userId);  //查询用户资料（按正式用户编号）
    public User findUserByAccount(String userAccount);  //查询正式用户、待验证用户（按用户帐号）
    public User findUserByUserAccount(String userAccount);  //查询正式用户（按用户帐号）
    public User findUserByNickName(String userNickName);  //查询正式用户、待验证用户（按用户昵称）
    public User findUserWaitValidateById(Long userId);  //查询待验证用户（按待验证用户编号）
    public User findUserByAccountAndPass(User user);  //查询正式用户（按帐号、密码）
    public User findUserWaitValidateByAccountAndPass(User user);  //查询待验证用户（按帐号、密码）
    public Long findUserIdByCommentId(Long commentId);  //查询用户编号（按评论编号）
    public UserPassReset findUserPassResetByUserIdAndValidString(UserPassReset userPassReset);  //查询用户密码重置邮件验证记录（按用户编号、验证字符串）
    public Long addUserWaitValidate(User user);  //添加待验证用户
    public Long addUserByUserWaitValidate(User user);  //添加正式用户（将待验证用户变为正式用户）
    public Long addUserPassReset(UserPassReset userPassReset);  //添加用户密码重置邮件验证记录
    public Long modifyUserPassByUserId(User user);  //修改用户密码（按用户编号）
    public Long modifyUserDataByUserId(User user);  //修改用户资料（按用户编号）
    public Long modifyUserFaceFlagByUserId(User user);  //修改用户头像标志位（按用户编号）
    public Long modifyUserPassResetValidStatusByUserId(Long userId);  //修改用户密码重置的验证状态，全部设为无效（按用户编号）
    
}
