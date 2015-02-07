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

<%--
    request范围下的变量：
        success - true：密码修改成功 | false：密码修改失败
--%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>
            <s:if test="#success == true">
                星象仪 - 密码修改成功
            </s:if>
            <s:elseif test="#success == true">
                星象仪 - 密码修改失败
            </s:elseif>
        </title>
        <!-- CSS文件 -->
        <link type="text/css" rel="stylesheet" href="css/global.css" />
        <link type="text/css" rel="stylesheet" href="css/user/account/modifyUserPassResult.css" />
    </head>
    <body>
        <%-- 头部 --%>
        <jsp:include page="../../special/header.jsp" />
        <div class="wrapper">
            <fieldset>
                <legend>
                    <s:if test="#success == true">
                        密码修改成功
                    </s:if>
                    <s:elseif test="#success == false">
                        密码修改失败
                    </s:elseif>
                </legend>
                <s:if test="#success == true">
                    <p>操作成功，请记住您的新密码。</p>
                    <a class="goHome" href="index.jsp">返回首页</a>
                </s:if>
                <s:elseif test="#success == false">
                    <p>请联系网站管理员。</p>
                    <a class="again" href="user/account/editUserData?user.userId=${USER.userId}">再次尝试</a>
                    <a class="goHome" href="index.jsp">返回首页</a>
                </s:elseif>
            </fieldset>
        </div>
        <%-- 尾部 --%>
        <jsp:include page="../../special/footer.jsp" />
    </body>
</html>
