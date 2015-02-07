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
        result - success：成功 | error：修改密码失败
--%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>
            <s:if test='#result == "success"'>
                星象仪 - 密码重置成功
            </s:if>
            <s:elseif test='#result == "error"'>
                星象仪 - 密码重置失败
            </s:elseif>
        </title>
        <!-- CSS文件 -->
        <link type="text/css" rel="stylesheet" href="css/global.css" />
        <link type="text/css" rel="stylesheet" href="css/account/resetUserPassResult.css" />
    </head>
    <body>
        <%-- 头部 --%>
        <jsp:include page="../special/header.jsp" />
        <div class="wrapper">
            <fieldset>
                <legend>
                    <s:if test='#result == "success"'>
                        密码重置成功
                    </s:if>
                    <s:elseif test='#result == "error"'>
                        密码重置失败
                    </s:elseif>
                </legend>
                <s:if test='#result == "success"'>
                    <p>密码重置成功。</p>
                    <a class="login" href="account/userLogin.jsp">登录</a>
                </s:if>
                <s:elseif test='#result == "error"'>
                    <p>密码重置失败，请联系网站管理员。</p>
                    <a class="goHome" href="index.jsp">返回首页</a>
                </s:elseif>
            </fieldset>
        </div>
        <%-- 尾部 --%>
        <jsp:include page="../special/footer.jsp" />
    </body>
</html>