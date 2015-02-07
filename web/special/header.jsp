<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<link type="text/css" rel="stylesheet" href="css/special/header.css" />
<div class="header">
    <div class="top">
        <div class="logo"></div>
    </div>
    <div class="nav">
        <div class="menu">
        <s:if test="#session.USER == null">
            <a class="home" href="index.jsp">首页</a>
            <a href="account/userLogin.jsp">登录</a>
            <a class="register" href="account/userRegister.jsp">注册</a>
        </s:if>
        <s:elseif test="#session.USER != null">
            <a class="home" href="index.jsp">首页</a>
            <span>欢迎您的到来：${USER.userNickName}</span>
            <a href="user/myComments?searchCondition.userId=${USER.userId}&searchCondition.page.pageNo=1">我的评论</a>
            <a href="user/myUserData?user.userId=${USER.userId}">个人资料</a>
            <a class="logout" href="account/userLogout">退出</a>
        </s:elseif>
        </div>
    </div>
</div>