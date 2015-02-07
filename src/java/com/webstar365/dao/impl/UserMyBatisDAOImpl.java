package com.webstar365.dao.impl;

import com.webstar365.dao.UserDAO;
import com.webstar365.pojo.User;
import com.webstar365.pojo.UserPassReset;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

public class UserMyBatisDAOImpl extends SqlMapClientDaoSupport implements UserDAO {

    /**
     * 查询正式用户（按正式用户编号）
     * @param userId 正式用户编号
     * @return 成功：符合条件的用户 | 失败：null
     */
    public User findUserByUserId(Long userId) {
        return (User) getSqlMapClientTemplate().queryForObject("findUserByUserId", userId);
    }
    
    /**
     * 查询用户资料（按正式用户编号）
     * @param userId 正式用户编号
     * @return 成功：符合条件的用户 | 失败：null
     */
    public User findUserDataByUserId(Long userId) {
        return (User) getSqlMapClientTemplate().queryForObject("findUserDataByUserId", userId);
    }
    
    /**
     * 查询正式用户、待验证用户（按用户帐号）
     * @param userAccount 用户帐号
     * @return 成功：符合条件的用户(只返回用户编号) | 失败：null
     */
    public User findUserByAccount(String userAccount) {
        return (User) getSqlMapClientTemplate().queryForObject("findUserByAccount", userAccount);
    }

    /**
     * 查询正式用户（按用户帐号）
     * @param userAccount 用户帐号
     * @return 成功：符合条件的用户（只返回用户Email） | 失败：null
     */
    public User findUserByUserAccount(String userAccount) {
        return (User) getSqlMapClientTemplate().queryForObject("findUserByUserAccount", userAccount);
    }
    
    /**
     * 查询正式用户、待验证用户（按用户昵称）
     * @param userNickName 用户昵称
     * @return 成功：符合条件的用户(只返回用户编号) | 失败：null
     */    
    public User findUserByNickName(String userNickName) {
        return (User) getSqlMapClientTemplate().queryForObject("findUserByNickName", userNickName);
    }
    
    /**
     * 查询待验证用户（按待验证用户编号）
     * @param userId 待验证用户编号
     * @return 成功：待验证用户的编号 | 失败：null
     */
    public User findUserWaitValidateById(Long userId) {
        return (User) getSqlMapClientTemplate().queryForObject("findUserWaitValidateById", userId);
    }

    /**
     * 查询正式用户（按帐号、密码）
     * @param user 用户（其中包含帐号、密码）
     * @return 成功：符合条件的用户 | 失败：null
     */
    public User findUserByAccountAndPass(User user) {
        return (User) getSqlMapClientTemplate().queryForObject("findUserByAccountAndPass", user);
    }

    /**
     * 查询待验证用户（按帐号、密码）
     * @param user 用户（其中包含帐号、密码）
     * @return 成功：符合条件的用户 | 失败：null
     */
    public User findUserWaitValidateByAccountAndPass(User user) {
        return (User) getSqlMapClientTemplate().queryForObject("findUserWaitValidateByAccountAndPass", user);
    }
    
    /**
     * 查询用户编号（按评论编号）
     * @param commentId 评论编号
     * @return 成功：符合条件的用户编号 | 失败：null
     */
    public Long findUserIdByCommentId(Long commentId) {
        return (Long) getSqlMapClientTemplate().queryForObject("findUserIdByCommentId", commentId);
    }
    
    /**
     * 查询用户密码重置邮件验证记录（按用户编号、验证字符串）
     * @param userPassReset 用户密码重置邮件验证记录（包含用户编号、验证字符串）
     * @return 成功：符合条件的用户密码重置邮件验证记录 | 失败：null
     */
    public UserPassReset findUserPassResetByUserIdAndValidString(UserPassReset userPassReset) {
        return (UserPassReset) getSqlMapClientTemplate().queryForObject("findUserPassResetByUserIdAndValidString", userPassReset);
    }
    
    /**
     * 添加待验证用户
     * @param user 新用户
     * @return 成功：待验证用户的编号 | 失败：null
     */
    public Long addUserWaitValidate(User user) {
        return (Long) getSqlMapClientTemplate().queryForObject("addUserWaitValidate", user);
    }

    /**
     * 添加正式用户（将待验证用户变为正式用户）
     * @param user 待验证用户
     * @return 成功：新正式用户的编号 | 失败：null
     */
    public Long addUserByUserWaitValidate(User user) {
        return (Long) getSqlMapClientTemplate().queryForObject("addUserByUserWaitValidate", user);
    }
    
    /**
     * 添加用户密码重置邮件验证记录
     * @param userPassReset 用户密码重置邮件验证记录
     * @return 成功：1 | 失败：null
     */
    public Long addUserPassReset(UserPassReset userPassReset) {
        return (Long) getSqlMapClientTemplate().queryForObject("addUserPassReset", userPassReset);
    }

    /**
     * 修改用户密码（按用户编号）
     * @param user 用户（包含用户编号、用户新密码）
     * @return 成功：1 | 失败：0
     */
    public Long modifyUserPassByUserId(User user) {
        return (Long) getSqlMapClientTemplate().queryForObject("modifyUserPassByUserId", user);
    }
    
    /**
     * 修改用户资料（按用户编号）
     * @param user 用户（包含用户编号、要修改的用户资料）
     * @return 成功：1 | 失败：0
     */
    public Long modifyUserDataByUserId(User user) {
        return (Long) getSqlMapClientTemplate().queryForObject("modifyUserDataByUserId", user);
    }

    /**
     * 修改用户头像标志位（按用户编号）
     * @param user 用户
     * @return 成功：1 | 失败：0
     */
    public Long modifyUserFaceFlagByUserId(User user) {
        return (Long) getSqlMapClientTemplate().queryForObject("modifyUserFaceFlagByUserId", user);
    }

    /**
     * 修改用户密码重置的验证状态，全部设为无效（按用户编号）
     * @param userId 用户编号
     * @return 成功：影响的行数 | 失败：null
     */
    public Long modifyUserPassResetValidStatusByUserId(Long userId) {
        return (Long) getSqlMapClientTemplate().queryForObject("modifyUserPassResetValidStatusByUserId", userId);
    }

}
