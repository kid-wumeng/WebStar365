package com.webstar365.pojo;

import java.util.Date;

public class User {
    
    private Long userId;  //用户编号
    private String userAccount;  //用户帐号
    private String userPass;  //用户密码
    private String userNickName;  //用户昵称
    private String userEmail;  //用户电子邮箱
    private String userEmailStarMode;  //用户电子邮箱（星号保护模式）
    private Integer userFaceFlag;  //用户是否有头像（有：1 | 无：0）
    private Integer userStatus;  //用户状态
    private String userPersonalIntro;  //用户个人简介
    private Integer userSex;  //用户性别
    private Date userBirthday;  //用户生日
    private Integer userBirthdayYear;  //用户生日（年）
    private Integer userBirthdayMonth;  //用户生日（月）
    private Integer userBirthdayDay;  //用户生日（日）
    private Area userArea;  //用户所在地区
    private String userLv1AreaId;  //用户所在一级地区编号
    private String userLv2AreaId;  //用户所在二级地区编号
    private Date userRegisterDateTime;  //用户注册的日期与时间  
    private String userFacePreviewFileName;  //用户头像预览文件名

    /* getter */
    public Long getUserId() { return userId; }
    public String getUserAccount() { return userAccount; }
    public String getUserPass() { return userPass; }
    public String getUserNickName() { return userNickName; }
    public String getUserEmail() { return userEmail; }
    public String getUserEmailStarMode() { return userEmailStarMode; }
    public Integer getUserFaceFlag() { return userFaceFlag; }
    public Integer getUserStatus() { return userStatus; }
    public String getUserPersonalIntro() { return userPersonalIntro; }
    public Integer getUserSex() { return userSex; }
    public Date getUserBirthday() { return userBirthday; }
    public Integer getUserBirthdayYear() { return userBirthdayYear; }
    public Integer getUserBirthdayMonth() { return userBirthdayMonth; }
    public Integer getUserBirthdayDay() { return userBirthdayDay; }
    public Area getUserArea() { return userArea; }
    public String getUserLv1AreaId() { return userLv1AreaId; }
    public String getUserLv2AreaId() { return userLv2AreaId; }
    public Date getUserRegisterDateTime() { return userRegisterDateTime; }
    public String getUserFacePreviewFileName() { return userFacePreviewFileName; }
    /* setter */
    public void setUserId(Long userId) { this.userId = userId; }
    public void setUserAccount(String userAccount) { this.userAccount = userAccount; }
    public void setUserPass(String userPass) { this.userPass = userPass; }
    public void setUserNickName(String userNickName) { this.userNickName = userNickName; }
    public void setUserEmail(String userEmail) { this.userEmail = userEmail; }
    public void setUserEmailStarMode(String userEmailStarMode) { this.userEmailStarMode = userEmailStarMode; }
    public void setUserFaceFlag(Integer userFaceFlag) { this.userFaceFlag = userFaceFlag; }
    public void setUserStatus(Integer userStatus) { this.userStatus = userStatus; }
    public void setUserPersonalIntro(String userPersonalIntro) { this.userPersonalIntro = userPersonalIntro; }
    public void setUserSex(Integer userSex) { this.userSex = userSex; }
    public void setUserBirthday(Date userBirthday) { this.userBirthday = userBirthday; }
    public void setUserBirthdayYear(Integer userBirthdayYear) { this.userBirthdayYear = userBirthdayYear; }
    public void setUserBirthdayMonth(Integer userBirthdayMonth) { this.userBirthdayMonth = userBirthdayMonth; }
    public void setUserBirthdayDay(Integer userBirthdayDay) { this.userBirthdayDay = userBirthdayDay; }
    public void setUserArea(Area userArea) { this.userArea = userArea; }
    public void setUserLv1AreaId(String userLv1AreaId) { this.userLv1AreaId = userLv1AreaId; }
    public void setUserLv2AreaId(String userLv2AreaId) { this.userLv2AreaId = userLv2AreaId; }
    public void setUserRegisterDateTime(Date userRegisterDateTime) { this.userRegisterDateTime = userRegisterDateTime; }
    public void setUserFacePreviewFileName(String userFacePreviewFileName) { this.userFacePreviewFileName = userFacePreviewFileName; }

}
