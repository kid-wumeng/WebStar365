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
        result - 0：成功 | 1：用户密码重置邮箱验证记录添加失败 | 2：查询用户出错或用户电子邮箱为空
--%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>
            <s:if test="#result == 0">
                星象仪 - 发送验证邮件成功
            </s:if>
            <s:elseif test="#result == 1 || #result == 2">
                星象仪 - 发送验证邮件失败
            </s:elseif>
        </title>
        <!-- CSS文件 -->
        <link type="text/css" rel="stylesheet" href="css/global.css" />
        <link type="text/css" rel="stylesheet" href="css/account/sendUserPassResetValidMailResult.css" />
    </head>
    <body>
        <%-- 头部 --%>
        <jsp:include page="../special/header.jsp" />
        <div class="wrapper">
            <fieldset>
                <legend>
                    <s:if test="#result == 0">
                        发送验证邮件成功
                    </s:if>
                    <s:elseif test="#result == 1 || #result == 2">
                        发送验证邮件失败
                    </s:elseif>
                </legend>
                <s:if test="#result == 0">
                    <p>已发送密码重置验证邮件至：${userEmailStarMode}</p>
                    <p>寄送过程可能需要数分钟，请耐心等待。</p>
                    <p>请收取邮件并按提示操作（12小时内有效）。</p>
                </s:if>
                <s:elseif test="#result == 1">
                    <p class="errorReason">错误原因未知，请联系网站管理员。</p>
                    <a class="goHome" href="index.jsp">返回首页</a>
                </s:elseif>
                <s:elseif test="#result == 2">
                    <p class="errorReason">您输入的帐号不存在。</p>
                    <a class="again" href="account/lostUserPass.jsp">再次尝试</a>
                </s:elseif>
            </fieldset>
        </div>
        <%-- 尾部 --%>
        <jsp:include page="../special/footer.jsp" />
    </body>
</html>
