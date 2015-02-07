package com.webstar365.pojo;

import java.util.Date;

public class UserPassReset {
    
    private Long userId;
    private String validString;
    private Date mailSendDateTime;
    private Integer validStatus;

    /* getter */
    public Long getUserId() { return userId; }
    public String getValidString() { return validString; }
    public Date getMailSendDateTime() { return mailSendDateTime; }
    public Integer getValidStatus() { return validStatus; }
    /* setter */
    public void setUserId(Long userId) { this.userId = userId; }
    public void setValidString(String validString) { this.validString = validString; }
    public void setMailSendDateTime(Date mailSendDateTime) { this.mailSendDateTime = mailSendDateTime; }
    public void setValidStatus(Integer validStatus) { this.validStatus = validStatus; }
    
}
