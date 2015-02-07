<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>

<%-- 验证管理员已登录 --%>
<% 
    if(request.getSession().getAttribute("ADMIN") == null) {
        response.sendRedirect("../account/adminLogin.jsp"); 
        return;
    }
%>

<%-- 获取根目录路径 --%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<base href="<%=basePath%>">

<%--
    session范围下的变量：
        ADMIN - 登录管理员
            adminId - 管理员编号
            adminAccount - 管理员帐号
            adminName - 管理员名
            adminLv - 管理员级别
--%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>星象仪管理系统 - 公告</title>
        <!-- CSS文件 -->
        <link type="text/css" rel="stylesheet" href="css/global.css" />
        <link type="text/css" rel="stylesheet" href="css/admin/newNotice.css" />
    </head>
    <body>
        <div class="wrapper">
            <jsp:include page="../admin/header.jsp"/>
            <jsp:include page="../admin/sidebar.jsp" />
            <div class="main">
                <h2>${newNotice.noticeTitle}</h2>
                <span><s:date name="#newNotice.noticePublishDateTime" format="yyyy-MM-dd hh:mm:ss" /></span>
                <p>${newNotice.noticeContent}</p>
            </div>
        </div>
    </body>
</html>
