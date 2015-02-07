<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>

<%-- 验证管理员未登录 --%>
<% 
    if(request.getSession().getAttribute("ADMIN") != null) {
        response.sendRedirect("../admin/newNotice.jsp"); 
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
        <title>星象仪 - 管理员登录</title>
    </head>
    <body>
        <s:form action="account/adminLogin">
            帐号<s:textfield name="admin.adminAccount" />
            密码<s:password name="admin.adminPass" />
            <s:submit value="登录" />
        </s:form>
    </body>
</html>
