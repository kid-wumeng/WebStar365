<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>

<%-- 验证用户已登录 --%>
<% 
    if(request.getSession().getAttribute("USER") == null) {
        response.sendRedirect("../account/userLogin.jsp"); 
        return;
    }
%>

<%-- 获取根目录路径 --%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<base href="<%=basePath%>">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>星象仪 - 发生错误</title>
        <!-- CSS文件 -->
        <link type="text/css" rel="stylesheet" href="css/global.css" />
        <link type="text/css" rel="stylesheet" href="css/user/error.css" />
    </head>
    <body>
        <%-- 头部 --%>
        <jsp:include page="../special/header.jsp" />
        <div class="wrapper">
            <P>抱歉，您遇到了一些错误。</p>
            <s:if test="#errorReason != null">
                <P>错误原因：${errorReason}</p>
            </s:if>
            <s:else>
                <p>未知。</p>
            </s:else>
            <p>若有疑问，请咨询网站管理员。</p>
            <a class="goHome" href="index.jsp">返回首页</a>
        </div>
    </body>
</html>
