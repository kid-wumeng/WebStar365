package com.webstar365.service;

import com.webstar365.pojo.User;
import com.webstar365.pojo.UserPassReset;

public interface MailService {
    
    public void sendNewUserValidMail(User user);  //发送新用户验证邮件
    public void sendUserPassResetValidMail(User user, UserPassReset userPassReset);  //发送用户密码重置验证邮件
    
}
