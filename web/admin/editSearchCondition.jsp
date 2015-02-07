<%@page contentType="text/html" pageEncoding="UTF-8" %>
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
        allCats - 全部分类的集合
            cat - 分类
                catId - 分类编号
                catName - 分类名
        allAttrs - 全部属性的集合
            attr - 属性
                attrId - 属性编号
                attrName - 属性名
                attrIntro - 属性介绍
        allAdmins - 全部管理员的集合
            admin - 管理员
                adminId - 管理员编号 
                adminAccount - 管理员帐号
                adminName - 管理员名
                adminLv - 管理员级别
        years - 年份的集合 
        months - 月份的集合
        days - 日份的集合
--%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>星象仪管理系统 - 搜索网站</title>
        <!-- CSS文件 -->
        <link type="text/css" rel="stylesheet" href="css/global.css" />
        <link type="text/css" rel="stylesheet" href="css/admin/editSearchCondition.css" />
        <!-- JS文件 -->
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/admin/editSearchCondition.js"></script>
    </head>
    <body>
        <div class="wrapper">
            <jsp:include page="../admin/header.jsp"/>
            <jsp:include page="../admin/sidebar.jsp" />
            <div class="main">
                <s:form action="admin/searchWebsites" theme="simple">
                    <div class="websiteName">
                        <label>站名关键词</label>
                        <s:textfield name="searchCondition.websiteNameKeyword" />
                    </div>
                    <div class="websiteDomain">
                        <label>地址关键词</label>
                        <s:textfield name="searchCondition.websiteDomainKeyword" />
                    </div>
                    <div class="websiteId">
                        <label>编号范围</label>
                        <s:textfield name="searchCondition.websiteIdStart" /> - <s:textfield name="searchCondition.websiteIdEnd" />
                    </div>
                    <div class="websiteCat">
                        <label>分类</label>    
                        <s:select name="searchCondition.catId" list="#allCats" listKey="catId" listValue="catName" />
                    </div>
                    <div class="websiteAttrs">
                        <label>属性</label>
                        <s:textfield cssClass="selectedAttrNames" disabled="true" />
                        <button class="selectAttrs" type="button">选择属性</button>
                        <div class="selectedAttrIds"></div>
                    </div>
                    <div class="adminName">
                        <label>添加网站的管理员</label>
                        <s:select name="searchCondition.adminId" list="#allAdmins" listKey="adminId" listValue="adminName" />
                    </div>
                    <div class="websiteAddDateTime">
                        <label>添加网站的日期范围</label>
                        <s:select name="searchCondition.addWebsiteYearStart" list="#years" />年
                        <s:select name="searchCondition.addWebsiteMonthStart" list="#months" />月
                        <s:select name="searchCondition.addWebsiteDayStart" list="#days" />日 
                        -
                        <s:select name="searchCondition.addWebsiteYearEnd" list="#years" />年
                        <s:select name="searchCondition.addWebsiteMonthEnd" list="#months" />月
                        <s:select name="searchCondition.addWebsiteDayEnd" list="#days" />日
                    </div>
                    <hr />
                    <s:reset cssClass="reset" value="重置条件" />
                    <s:submit cssClass="find" value="查询网站" />
                </s:form>
            </div>
        </div>
        <div class="attrOption">
            <ul>
                <s:iterator value="#allAttrs">
                <li attrId="${attrId}" selectedFlag="no"><a href="#">${attrName}</a></li>
                </s:iterator>
                <button>选择以上属性</button>
            </ul>
        </div>
    </body>
</html>
