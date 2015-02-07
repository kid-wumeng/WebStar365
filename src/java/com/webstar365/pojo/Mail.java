package com.webstar365.pojo;

public class Mail {
    
    private String SMTPHost;           //SMTP主机
    private String SMTPHostLoginName;  //SMTP主机登录名
    private String SMTPHostLoginPass;  //SMTP主机登录密码
    private String senderName;       //发件人名
    private String senderAddress;    //发件人邮箱地址
    private String receiverName;     //收件人名
    private String receiverAddress;  //收件人邮箱地址
    private String mailSubject;      //邮件主题
    private String mailContent;      //邮件内容
    private String mailContentType;  //邮件内容的类型

    /* getter */
    public String getSMTPHost() { return SMTPHost; }
    public String getSMTPHostLoginName() { return SMTPHostLoginName; }
    public String getSMTPHostLoginPass() { return SMTPHostLoginPass; }
    public String getSenderName() { return senderName; }
    public String getSenderAddress() { return senderAddress; }
    public String getReceiverName() { return receiverName; }
    public String getReceiverAddress() { return receiverAddress; }
    public String getMailSubject() { return mailSubject; }
    public String getMailContent() { return mailContent; }
    public String getMailContentType() { return mailContentType; }
    /* setter */
    public void setSMTPHost(String SMTPHost) { this.SMTPHost = SMTPHost; }
    public void setSMTPHostLoginName(String SMTPHostLoginName) { this.SMTPHostLoginName = SMTPHostLoginName; }
    public void setSMTPHostLoginPass(String SMTPHostLoginPass) { this.SMTPHostLoginPass = SMTPHostLoginPass; }
    public void setSenderName(String senderName) { this.senderName = senderName; }
    public void setSenderAddress(String senderAddress) { this.senderAddress = senderAddress; }
    public void setReceiverName(String receiverName) { this.receiverName = receiverName; }
    public void setReceiverAddress(String receiverAddress) { this.receiverAddress = receiverAddress; }
    public void setMailSubject(String mailSubject) { this.mailSubject = mailSubject; }
    public void setMailContent(String mailContent) { this.mailContent = mailContent; }
    public void setMailContentType(String mailContentType) { this.mailContentType = mailContentType; }

}
