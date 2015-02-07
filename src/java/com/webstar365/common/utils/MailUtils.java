package com.webstar365.common.utils;

import com.webstar365.pojo.Mail;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailUtils {
    
    /**
     * 发送邮件
     * @param mail 邮件 
     */
    public static void send(Mail mail) {
        send(
            mail.getSMTPHost(), mail.getSMTPHostLoginName(), mail.getSMTPHostLoginPass(),
            mail.getSenderName(), mail.getSenderAddress(), 
            mail.getReceiverName(), mail.getReceiverAddress(),
            mail.getMailSubject(), mail.getMailContent(), mail.getMailContentType()
        );
    }
    
    /**
     * 发送邮件
     * @param SMTPHost SMTP服务器
     * @param SMTPHostLoginName SMTP服务器登录名
     * @param SMTPHostLoginPass SMTP服务器密码
     * @param senderName 发件人名
     * @param senderAddress 发件人邮箱地址
     * @param receiverName 收件人名
     * @param receiverAddress 收件人邮箱地址
     * @param mailSubject 邮件主题
     * @param mailContent 邮件内容
     * @param mailContentType 邮件内容的类型
     */
    public static void send(
                            String SMTPHost, String SMTPHostLoginName, String SMTPHostLoginPass, 
                            String senderName, String senderAddress,
                            String receiverName, String receiverAddress, 
                            String mailSubject, String mailContent, String mailContentType
                       ) 
    {
        Properties props = new Properties();
        props.put("mail.smtp.host", SMTPHost);  //SMTP服务器
        props.put("mail.smtp.auth", "true");  //需要SMTP验证
        try {
            /* 邮件会话 */
            Session mailSession = Session.getDefaultInstance(props);  //创建邮件会话 
            mailSession.setDebug(true);//在控制台显示Debug信息
            /* 邮件信息 */
            Message mailMessage=new MimeMessage(mailSession);  //创建邮件信息
            mailMessage.setFrom(new InternetAddress(senderAddress, senderName));  //发件人
            mailMessage.addRecipient(Message.RecipientType.TO,new InternetAddress(receiverAddress, receiverName));  //收件人
            mailMessage.setSubject(mailSubject);  //邮件主题
            mailMessage.setContent(mailContent, mailContentType);  //邮件内容
            mailMessage.saveChanges();  //存储邮件信息
            /* 邮件传输 */
            Transport transport = mailSession.getTransport("smtp");  //创建发送渠道
            transport.connect(SMTPHost, SMTPHostLoginName, SMTPHostLoginPass);  //连接邮箱服务器，验证登录名和密码
            transport.sendMessage(mailMessage, mailMessage.getAllRecipients());  //发送邮件
            transport.close();
        } catch(Exception e) {
            System.out.println(e);
        }
    }
    
}
