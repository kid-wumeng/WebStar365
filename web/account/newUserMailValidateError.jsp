<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>

<%-- 验证用户未登录 --%>
<% 
    if(request.getSession().getAttribute("USER") != null) {
        response.sendRedirect("../index.jsp"); 
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
    request范围下的变量：
        errorReason - 1：验证邮件中的用户编号或用户帐号为空 | 2：待验证用户查不出 | 3：验证邮件中的帐号与查询出的帐号不相同 4：待验证用户无法变为正式用户 5：新用户查不出 
--%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>星象仪 - 新用户注册失败</title>
        <!-- CSS文件 -->
        <link type="text/css" rel="stylesheet" href="css/global.css" />
        <link type="text/css" rel="stylesheet" href="css/account/newUserMailValidateError.css" />
    </head>
    <body>
        <%-- 头部 --%>
        <jsp:include page="../special/header.jsp" />
        <div class="wrapper">
            <fieldset>
                <legend>新用户注册 - 注册失败</legend>
                <p>注册失败（错误码：${errorReason}），请联系网站管理员。</p>
                <a class="again" href="account/userRegister.jsp">重新注册</a>
            </fieldset>
        </div>
        <%-- 尾部 --%>
        <jsp:include page="../special/footer.jsp" />
    </body>
</html>
