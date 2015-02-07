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
        <title>星象仪 - 新用户注册</title>
        <!-- CSS文件 -->
        <link type="text/css" rel="stylesheet" href="css/global.css" />
        <link type="text/css" rel="stylesheet" href="css/account/userRegister.css" />
        <!-- JS文件 -->
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/account/userRegister.js"></script>
    </head>
    <body>
        <%-- 头部 --%>
        <jsp:include page="../special/header.jsp" />
        <div class="wrapper">
            <fieldset>
                <legend>新用户注册</legend>
                <s:form cssClass="userRegister" action="account/userRegister" theme="simple">
                    <div class="userAccount">
                        <label>帐号</label>
                        <s:textfield name="user.userAccount" />
                        <span>只能使用小写字母或数字，6~18位</span>
                    </div>
                    <div class="userPass">
                        <label>密码</label>
                        <s:password name="user.userPass" />
                        <span>只能使用小写字母或数字，6~18位</span>
                    </div>
                    <div class="userPass2">
                        <label>密码确认</label>
                        <s:password />
                        <span>请再输入一遍密码</span>
                    </div>
                    <div class="userNickName">
                        <label>昵称</label>
                        <s:textfield name="user.userNickName" />
                        <span>取一个自己喜欢的名字吧，不超过12位字符</span>
                    </div>
                    <div class="userEmail">
                        <label>电子邮箱</label>
                        <s:textfield name="user.userEmail" />
                        <span>您最常用的电子邮箱地址，注册需通过邮件验证</span>
                    </div>
                    <div class="agree">
                        <input type="checkbox" name="agree" value="true" />
                        <label>我已阅读并同意<a href="special/aboutUs/userAgree.jsp" target="_blank">注册协议内容</a></label>
                    </div>
                    <a class="register" href="#">创建新账号</a>
                </s:form>
            </fieldset>
        </div>
        <%-- 尾部 --%>
        <jsp:include page="../special/footer.jsp" />
    </body>
</html>

