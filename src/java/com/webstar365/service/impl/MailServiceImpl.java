package com.webstar365.service.impl;

import com.webstar365.common.utils.MailUtils;
import com.webstar365.common.utils.SecurityUtils;
import com.webstar365.pojo.Mail;
import com.webstar365.pojo.User;
import com.webstar365.pojo.UserPassReset;
import com.webstar365.service.MailService;

public class MailServiceImpl implements MailService {

    private Mail newUserValidMail;
    
    /**
     * 发送新用户验证邮件
     * @param user 新用户（包含用户编号、加密后的用户帐号） 
     */
    public void sendNewUserValidMail(User user) {
        Long userId = user.getUserId();
        String userAccountMD5 = SecurityUtils.toMD5(user.getUserAccount());
        String validURL = "http://webstar365.com" + "/account/newUserMailValidate?user.userId=" + userId + "&user.userAccount=" + userAccountMD5;
        String validLink = "<a href='" + validURL + "'>" + validURL + "</a>";
        newUserValidMail.setMailContent("请点击以下链接完成验证：" + validLink);
        newUserValidMail.setReceiverName(user.getUserNickName());  //将用户昵称设为收件人
        newUserValidMail.setReceiverAddress(user.getUserEmail());  //将用户电子邮箱设为收件地址
        MailUtils.send(newUserValidMail);  //发送邮件
    }
    
    /**
     * 发送用户密码重置验证邮件
     * @param user 新用户（包含用户昵称、用户电子邮箱） 
     * @param userPassReset 用户密码重置邮箱验证记录 
     */
    public void sendUserPassResetValidMail(User user, UserPassReset userPassReset) {
        String validURL = "http://webstar365.com" + "/account/userPassResetMailValidate?userPassReset.userId=" + userPassReset.getUserId() + "&userPassReset.validString=" + userPassReset.getValidString();
        String validLink = "<a href='" + validURL + "'>" + validURL + "</a>";
        newUserValidMail.setMailContent("" + validLink);
        newUserValidMail.setReceiverName(user.getUserNickName());  //将用户昵称设为收件人
        newUserValidMail.setReceiverAddress(user.getUserEmail());  //将用户电子邮箱设为收件地址
        MailUtils.send(newUserValidMail);  //发送邮件
    }

    /* getter */
    public Mail getNewUserValidMail() { return newUserValidMail; }
    /* setter */
    public void setNewUserValidMail(Mail newUserValidMail) { this.newUserValidMail = newUserValidMail; }
    
}
