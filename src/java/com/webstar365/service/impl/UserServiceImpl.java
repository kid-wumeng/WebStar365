package com.webstar365.service.impl;

import com.webstar365.common.utils.SecurityUtils;
import com.webstar365.common.utils.WebUtils;
import com.webstar365.dao.AreaDAO;
import com.webstar365.dao.UserDAO;
import com.webstar365.pojo.Area;
import com.webstar365.pojo.User;
import com.webstar365.pojo.UserPassReset;
import com.webstar365.service.UserService;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;

public class UserServiceImpl implements UserService {

    private UserDAO userDAO;
    private AreaDAO areaDAO;
    private User user;
    private Area area;

    
    /**
     * 核对用户帐号
     * @param userAccount 用户帐号
     * @return 存在符合条件的用户：true | 不存在符合条件的用户：false
     */
    public boolean checkUserAccount(String userAccount) {
        user = userDAO.findUserByAccount(userAccount);
        if(user != null) {
            return true;
        }
        else {
            return false;
        }
    }

    /**
     * 核对用户昵称
     * @param userNickName 用户昵称
     * @return 存在符合条件的用户：true | 不存在符合条件的用户：false
     */  
    public boolean checkUserNickName(String userNickName) {
        user = userDAO.findUserByNickName(userNickName);
        if(user != null) {
            return true;
        }
        else {
            return false;
        }
    }
    
    /**
     * 核对用户密码重置邮件验证记录
     * @param userPassReset 用户密码重置邮件验证记录（包含用户编号、验证字符串）
     * @return 验证成功：0 | 超时：1 | 作废：2 |查询失败：3
     */
    public Integer checkUserPassReset(UserPassReset userPassReset) {
        userPassReset = userDAO.findUserPassResetByUserIdAndValidString(userPassReset);
        if(userPassReset == null) {
            return 3;  //查询失败
        }
        else if(userPassReset.getValidStatus() == 0) {
            return 2;  //作废
        }
        else {
            GregorianCalendar mailSendDateTime = new GregorianCalendar();
            mailSendDateTime.setTime(userPassReset.getMailSendDateTime());
            GregorianCalendar mailValidDateTime = new GregorianCalendar();
            long td = mailValidDateTime.getTimeInMillis() - mailSendDateTime.getTimeInMillis();
            if(td < 12 * 60 * 60 * 1000) {
                userDAO.modifyUserPassResetValidStatusByUserId(userPassReset.getUserId());
                return 0;  //验证成功
            }
            else {
                return 1;  //超时
            }
        }
    }
    
    /**
     * 查询正式用户（按正式用户编号）
     * @param userId 正式用户编号
     * @return 成功：符合条件的用户 | 失败：null
     */
    public User findUserByUserId(Long userId) {
        return userDAO.findUserByUserId(userId);
    }

    /**
     * 查询正式用户邮箱（按用户帐号）
     * @param userAccount 用户帐号
     * @return 成功：符合条件的用户（只返回用户Email） | 失败：null
     */
    public User findUserByUserAccount(String userAccount) {
        user = userDAO.findUserByUserAccount(userAccount);
        if(user != null && user.getUserEmail() != null) {
            char[] emailWords = user.getUserEmail().toCharArray();
            for(int i = 0; i < emailWords.length; i++) {
                if(emailWords[i] == '@') {
                    break;
                }
                else {
                    if(i <= 2) {
                        continue;
                    }
                    else {
                        emailWords[i] = '*';
                    }
                }
            }
            user.setUserEmailStarMode(new String(emailWords));
            return user;
        }
        else {
            return null;  //用户或用户邮箱为空
        }
    }
    
    /**
     * 查询用户资料（按正式用户编号）
     * @param userId 正式用户编号
     * @return 成功：符合条件的用户 | 失败：null
     */
    public User findUserDataByUserId(Long userId) {
        user = userDAO.findUserDataByUserId(userId);
        if(user != null) {
            
            if(user.getUserLv1AreaId() == null && user.getUserLv2AreaId() == null) {
                user.setUserLv1AreaId("0");
            }
            else if(user.getUserLv2AreaId() != null) {
                area = areaDAO.findAreaByAreaId(Integer.parseInt(user.getUserLv2AreaId()));
                user.setUserArea(area);
            }
            else {
                area = areaDAO.findAreaByAreaId(Integer.parseInt(user.getUserLv1AreaId()));
                user.setUserArea(area);
            }
            if(user.getUserBirthday() != null) {
                Calendar userBirthday = new GregorianCalendar();
                userBirthday.setTime(user.getUserBirthday());
                user.setUserBirthdayYear(userBirthday.get(Calendar.YEAR));
                user.setUserBirthdayMonth(userBirthday.get(Calendar.MONTH) + 1);
                user.setUserBirthdayDay(userBirthday.get(Calendar.DAY_OF_MONTH));
            }
        }
        return user;
    }
    
    /**
     * 查询待验证用户（按待验证用户编号）
     * @param userId 待验证用户编号
     * @return 成功：待验证用户的编号 | 失败：null
     */
    public User findUserWaitValidateById(Long userId) {
        return userDAO.findUserWaitValidateById(userId);
    }
    
    /**
     * 查询正式用户（按帐号、密码）
     * @param user 用户（其中包含帐号、密码）
     * @return 成功：符合条件的用户 | 失败：null
     */
    public User findUserByAccountAndPass(User user) {
        return userDAO.findUserByAccountAndPass(user);
    }

    /**
     * 查询待验证用户（按帐号、密码）
     * @param user 用户（其中包含帐号、密码）
     * @return 成功：符合条件的用户 | 失败：null
     */
    public User findUserWaitValidateByAccountAndPass(User user) {
        return userDAO.findUserWaitValidateByAccountAndPass(user);
    }
    
    /**
     * 添加待验证用户
     * @param user 新用户
     * @return 成功：待验证用户的编号 | 失败：null
     */
    public Long addUserWaitValidate(User user) {
        user.setUserPass(SecurityUtils.toMD5(user.getUserPass()));  //对用户密码进行MD5加密
        return userDAO.addUserWaitValidate(user);
    }
    
    /**
     * 添加正式用户（将待验证用户变为正式用户）
     * @param user 待验证用户
     * @return 成功：新正式用户的编号 | 失败：null
     */
    public Long addUserByUserWaitValidate(User user) {
        return userDAO.addUserByUserWaitValidate(user);
    }
    
    /**
     * 添加用户密码重置邮件验证记录
     * @param userId 要重置密码的用户编号
     * @return 成功：新用户密码重置邮件验证记录 | 失败：null
     */
    public UserPassReset addUserPassReset(Long userId) {
        UserPassReset userPassReset = new UserPassReset();
        userPassReset.setUserId(userId);
        userPassReset.setValidString(SecurityUtils.toMD5("vs" + new Date().toString()));
        userPassReset.setMailSendDateTime(new Date());
        Long flag = userDAO.addUserPassReset(userPassReset);
        if(flag == 1) {
            return userPassReset;
        }
        else {
            return null;
        }
    }
    
    /**
     * 修改用户密码（按用户编号）
     * @param user 用户（包含用户编号、用户新密码）
     * @return 成功：true | 失败：false
     */
    public boolean modifyUserPassByUserId(User user) {
        user.setUserPass(SecurityUtils.toMD5(user.getUserPass()));  //对用户密码进行MD5加密
        Long flag = userDAO.modifyUserPassByUserId(user);
        if(flag == 1 || flag == 0) {
            return true;
        }
        else {
            return false;
        }
    }
    
    /**
     * 修改用户资料（按用户编号）
     * @param user 用户（包含用户编号、要修改的用户资料）
     * @return 成功：1 | 失败：0
     */
    public Long modifyUserDataByUserId(User user) {
        if(user.getUserBirthdayYear() != null && user.getUserBirthdayMonth() != null && user.getUserBirthdayDay() != null) {
            Calendar userBirthday = new GregorianCalendar(
                                                user.getUserBirthdayYear(), 
                                                user.getUserBirthdayMonth() - 1, 
                                                user.getUserBirthdayDay()
            );
            user.setUserBirthday(userBirthday.getTime());
        }
        Integer userLv1AreaId = Integer.parseInt(user.getUserLv1AreaId());
        Integer userLv2AreaId = Integer.parseInt(user.getUserLv2AreaId());
        user.setUserArea(new Area());
        if(userLv2AreaId != null && userLv2AreaId != 0) {
            user.getUserArea().setAreaId(userLv2AreaId);
        }
        else if(userLv1AreaId != null  && userLv1AreaId != 0) {
            user.getUserArea().setAreaId(userLv1AreaId);
        }
        else {
            user.getUserArea().setAreaId(null);
        }
        return userDAO.modifyUserDataByUserId(user);
    }
    
    /**
     * 保存用户Cookie
     * @param user 
     */
    public void saveUserCookie(User user, int days) {
        HttpServletResponse response = ServletActionContext.getResponse();
        Cookie userIdCookie = new Cookie("userId", String.valueOf(user.getUserId()));
        Cookie userAccountCookie = new Cookie("userAccount", SecurityUtils.toMD5(user.getUserAccount()));
        userIdCookie.setPath("/WebStar365/");
        userAccountCookie.setPath("/WebStar365/");
        userIdCookie.setMaxAge(3600 * 24 * days);
        userAccountCookie.setMaxAge(3600 * 24 * days);
        response.addCookie(userIdCookie);
        response.addCookie(userAccountCookie);
    }
    
    
    /**
     * 核对用户Cookie
     * @return 成功：符合条件的用户 | 失败：null
     */
    public User checkUserCookie() {
        HttpServletRequest request = ServletActionContext.getRequest();
        Cookie[] cookies = request.getCookies();
        if (cookies != null && cookies.length > 0) {
            String userId = WebUtils.getCookieValue(cookies, "userId");
            String userAccount = WebUtils.getCookieValue(cookies, "userAccount");
            if(userId != null && userAccount != null) {
                User user = userDAO.findUserByUserId(Long.valueOf(userId));
                if(user != null) {
                    if(userAccount.equals(SecurityUtils.toMD5(user.getUserAccount()))) {
                        return user;
                    }
                    else {
                        return null;  //用户编号和用户帐号对不上
                    }
                }
                else {
                    return null;  //无法根据此用户编号获取用户或查询失败
                }
            }
            else {
                return null;  //用户编号或用户帐号为空
            }
        }
        else {
            return null;  //一个Cookie也没有或读不出
        }
    }
    
    
    /* getter */
    public UserDAO getUserDAO() { return userDAO; }
    public AreaDAO getAreaDAO() { return areaDAO; }
    /* setter */
    public void setUserDAO(UserDAO userDAO) { this.userDAO = userDAO; }
    public void setAreaDAO(AreaDAO areaDAO) { this.areaDAO = areaDAO; }

}
