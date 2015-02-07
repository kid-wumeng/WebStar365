<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>

<%-- 验证是否正常访问至此页面 --%>
<% 
    if(request.getSession().getAttribute("flag") != "true") {
        response.sendRedirect("../index.jsp"); 
        return;
    }
%>

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
        <title>星象仪 - 重置密码</title>
        <!-- CSS文件 -->
        <link type="text/css" rel="stylesheet" href="css/global.css" />
        <link type="text/css" rel="stylesheet" href="css/account/resetUserPass.css" />
        <!-- JS文件 -->
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/account/resetUserPass.js"></script>
    </head>
    <body>
        <%-- 头部 --%>
        <jsp:include page="../special/header.jsp" />
        <div class="wrapper">
            <fieldset>
                <legend>重置密码</legend>
                <s:form cssClass="resetUserPass" action="account/resetUserPass" theme="simple">
                    <div class="userPass">
                        <label>密码</label>
                        <s:password name="user.userPass" />
                        <span>只能使用小写英文或数字，6~18位</span>
                    </div>
                    <div class="userPass2">
                        <label>确认密码</label>
                        <s:password />
                        <span>请再输入一遍密码</span>
                    </div>
                    <s:hidden name="user.userId" value="%{#userId}" />
                    <a class="reset" href="#">重置密码</a>
                </s:form>
            </fieldset>
        </div>
        <%-- 尾部 --%>
        <jsp:include page="../special/footer.jsp" />
    </body>
</html>
