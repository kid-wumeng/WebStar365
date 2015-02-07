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
        errorReason - 1：超时 | 2：作废 3：查询失败 
--%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>星象仪 - 密码重置 - 邮件验证失败</title>
        <!-- CSS文件 -->
        <link type="text/css" rel="stylesheet" href="css/global.css" />
        <link type="text/css" rel="stylesheet" href="css/account/userPassResetMailValidateError.css" />
    </head>
    <body>
        <%-- 头部 --%>
        <jsp:include page="../special/header.jsp" />
        <div class="wrapper">
            <fieldset>
                <legend>密码重置 - 邮件验证失败</legend>
                <s:if test="#errorReason == 1">
                    <p>验证邮件超时。</p>
                    <p class="errorReason">如有疑问请咨询网站管理员。</p>
                    <a class="again" href="account/lostUserPass.jsp">再次尝试</a>
                </s:if>
                <s:elseif test="#errorReason == 2">
                    <p>本验证邮件已作废，请收取最新的验证邮件。</p>
                    <p class="errorReason">如有疑问请咨询网站管理员。</p>
                    <a class="again" href="account/lostUserPass.jsp">再次尝试</a>
                </s:elseif>
                <s:elseif test="#errorReason == 3">
                    <p class="errorReason">失败原因未知，请联系网站管理员。</p>
                    <a class="again" href="account/lostUserPass.jsp">再次尝试</a>
                </s:elseif>
            </fieldset>
        </div>
        <%-- 尾部 --%>
        <jsp:include page="../special/footer.jsp" />
    </body>
</html>
