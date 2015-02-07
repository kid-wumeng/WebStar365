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
        <title>星象仪 - 推荐网站</title>
        <!-- CSS文件 -->
        <link type="text/css" rel="stylesheet" href="css/global.css" />
        <link type="text/css" rel="stylesheet" href="css/user/recommendWebsite.css" />
        <!-- JS文件 -->
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/user/recommendWebsite.js"></script>
    </head>
    <body>
        <%-- 头部 --%>
        <jsp:include page="../special/header.jsp" />
        <div class="wrapper">
            <ul class="explain">
                <li>1、我们不收录血腥暴力、情色、赌博、欺诈以及其它不符合国家相关法律规定的网站。</li>
                <li>2、推荐的网站会进行人工审核，审核期间请耐心等待，勿重复提交同一网站。</li>
                <li>3、请尽可能介绍推荐的网站，以便尽快通过审核。</li>
            </ul>
            <s:form cssClass="recommendWebsite" action="recommendWebsite" theme="simple">
                <div class="websiteName">
                    <label>站名</label>
                    <s:textfield name="websiteRecommend.websiteName" />
                </div>
                <div class="websiteDomain">
                    <label>地址</label>
                    <s:textfield name="websiteRecommend.websiteDomain" />
                </div>
                <div class="websiteIntro">
                    <label>介绍</label>
                    <s:textarea name="websiteRecommend.websiteIntro" />
                </div>
                <s:hidden cssClass="websiteRecommendUserId" name="websiteRecommend.userId" value="%{#session.USER.userId}" />
                <a class="submit" href="#">提交</a>
            </s:form>
        </div>
        <%-- 尾部 --%>
        <jsp:include page="../special/footer.jsp" />
    </body>
</html>
