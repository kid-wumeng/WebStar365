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
        <title>星象仪 - 用户登录</title>
        <!-- CSS文件 -->
        <link type="text/css" rel="stylesheet" href="css/global.css" />
        <link type="text/css" rel="stylesheet" href="css/account/userLogin.css" />
        <!-- JS文件 -->
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/account/userLogin.js"></script>
    </head>
    <body>
        <%-- 头部 --%>
        <jsp:include page="../special/header.jsp" />
        <div class="wrapper">
            <fieldset>
                <legend>用户登录</legend>
                <div class="note">
                    <div class="userRegister">
                        <span>还没有星象仪帐号？</span>
                        <a href="#">立即注册</a>
                    </div>
                    <div class="resetPass">
                        <span>忘记密码了？</span>
                        <a href="account/lostUserPass.jsp">重置密码</a>
                    </div>
                </div>
                <s:form cssClass="userLogin" action="account/userLogin" theme="simple">
                    <div class="userAccount">
                        <label>帐号</label>
                        <s:textfield name="user.userAccount" />
                    </div>
                    <div class="userPass">
                        <label>密码</label>
                        <s:password name="user.userPass" />
                    </div>
                    <div class="rememberMe">
                        <s:checkbox name="cookieFlag" />
                        <label>记住我</label>
                    </div>
                    <a class="login" href="#">登录</a>
                </s:form>
            </fieldset>
        </div>
        <s:form cssClass="sendNewUserValidMail" action="account/sendNewUserValidMail"> 
            <s:hidden cssClass="userAccount" name="user.userAccount" />
            <s:hidden cssClass="userPass" name="user.userPass" />
        </s:form>
        <%-- 尾部 --%>
        <jsp:include page="../special/footer.jsp" />
    </body>
</html>
