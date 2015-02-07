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

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>星象仪 - 密码重置</title>
        <!-- CSS文件 -->
        <link type="text/css" rel="stylesheet" href="css/global.css" />
        <link type="text/css" rel="stylesheet" href="css/account/lostUserPass.css" />
        <!-- JS文件 -->
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/account/lostUserPass.js"></script>
    </head>
    <body>
        <%-- 头部 --%>
        <jsp:include page="../special/header.jsp" />
        <div class="wrapper">
            <fieldset>
                <legend>重置密码</legend>
                <s:form cssClass="validUserAccount" action="account/sendUserPassResetValidMail" theme="simple">
                    <div class="userAccount">
                        <label>请输入注册时的帐号：</label>
                        <s:textfield name="user.userAccount" />
                    </div>
                    <a class="sure" href="#">确定</a>
                </s:form>
             </fieldset>
        </div>
        <%-- 尾部 --%>
        <jsp:include page="../special/footer.jsp" />
    </body>
</html>
