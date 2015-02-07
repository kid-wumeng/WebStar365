<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>

<%-- 验证管理员已登录 --%>
<% 
    if(request.getSession().getAttribute("ADMIN") == null) {
        response.sendRedirect("../account/adminLogin.jsp"); 
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
        newWebsites - 新网站的集合
            website - 网站
                websiteId - 网站编号
                websiteDomain - 网站域名
                websiteName - 网站名   
                websiteBriefIntro - 网站简介
                websiteDetailedIntro - 网站详细介绍
                websiteEstablishYear - 网站成立年份
                websiteEstablishMonth - 网站成立月份
                websiteEstablishDay - 网站成立日份
                websiteCat - 网站分类
                    catId - 分类编号
                    catName - 分类名
                websiteStar - 网站星数
                websiteScore - 网站分数
--%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>星象仪管理系统 - 添加新网站的封面</title>
        <!-- CSS文件 -->
        <link type="text/css" rel="stylesheet" href="css/global.css" />
        <link type="text/css" rel="stylesheet" href="css/admin/editNewWebsiteCovers.css" />
        <!-- JS文件 -->
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/admin/editNewWebsiteCovers.js"></script>
    </head>
    <body>
        <div class="wrapper">
            <jsp:include page="../admin/header.jsp"/>
            <jsp:include page="../admin/sidebar.jsp" />
            <div class="main">
                <s:form action="admin/addNewWebsiteCovers" enctype="multipart/form-data" theme="simple">
                    <h2>上传新网站的封面</h2>
                    <s:iterator value="newWebsites" id="website" status="st">
                    <div class="websiteCover">
                        <s:hidden cssClass="uploadCoverFlag" name="uploadCoverFlags[%{#st.index}]" value="false" />
                        <s:hidden name="websites[%{#st.index}].websiteId" value="%{#website.websiteId}" />
                        <h3>No.${websiteId} - ${websiteName}（${websiteDomain}）</h3>
                        <s:file name="files" size="80" />
                    </div>
                    </s:iterator>
                    <hr />
                    <s:reset cssClass="reset" value="重置" />
                    <s:submit cssClass="upload" value="上传" />
                </s:form>
            </div>
        </div>
    </body>
</html>
