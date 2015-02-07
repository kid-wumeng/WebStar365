<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<%-- 获取根目录路径 --%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<base href="<%=basePath%>">

<%--
    request范围下的变量：
        websites - 网站的集合
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
                websiteStarNum - 网站星星个数
                websiteScore - 网站分数
                websiteImport - 网站的重要性
                websiteCoverPath - 网站封面的路径
--%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>星象仪 - 关键词：${searchCondition.keywords}</title>
        <!-- CSS文件 -->
        <link type="text/css" rel="stylesheet" href="css/global.css" />
        <link type="text/css" rel="stylesheet" href="css/search/websitesByKeywords.css" />
        <!-- JS文件 -->
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/search/websitesByKeywords.js"></script>
    </head>
    <body>
        <%-- 头部 --%>
        <jsp:include page="../special/header.jsp" />
        <div class="wrapper">
            <div class="search">
                <s:form action="search/websites" method="get" theme="simple">
                    <s:hidden name="by" value="keywords" />
                    <s:hidden cssClass="displayStyle" name="displayStyle" value="%{#displayStyle}" />
                    <s:textfield cssClass="searchBox" name="searchCondition.keywords" />
                    <s:hidden cssClass="searchPageNo" name="searchCondition.page.pageNo" />
                    <a class="searchButton" href="#">搜索</a>
                </s:form>
                <a class="advancedSearch" href="#">高级搜索</a>
                <a class="list" href="#"></a>
                <a class="grid" href="#"></a>
                <a class="table" href="#"></a>
            </div>
            <s:if test='#displayStyle == "list"'>
                <jsp:include page="../search/websites_list.jsp" />
            </s:if>
            <s:elseif test='#displayStyle == "grid"'>
                <jsp:include page="../search/websites_grid.jsp" />
            </s:elseif>
            <s:elseif test='#displayStyle == "table"'>
                <jsp:include page="../search/websites_table.jsp" />
            </s:elseif>
            <div class="page">
                <s:hidden cssClass="nowPageNo" value="%{#page.pageNo}" />
                <s:hidden cssClass="totalPageNum" value="%{#page.totalPageNum}" />
                <s:if test="#page.pageNo > 1 && #page.pageNo <= #page.totalPageNum"><a class="pageButton firstPage" href="#">首页</a></s:if>
                <s:if test="#page.pageNo > 1 && #page.pageNo <= #page.totalPageNum"><a class="pageButton prevPage" href="#">上一页</a></s:if>
                <s:if test="#page.pageNo >= 1 && #page.pageNo < #page.totalPageNum"><a class="pageButton nextPage" href="#">下一页</a></s:if>
                <s:if test="#page.pageNo >= 1 && #page.pageNo < #page.totalPageNum"><a class="pageButton lastPage" href="#">末页</a></s:if>
                <span class="pageNoAndNum">${page.pageNo}/${page.totalPageNum}</span>
                <span class="targetPageNo">第<s:textfield />页</span>
                <a class="pageButton goto" href="#">跳转</a>
            </div>
        </div>
        <%-- 尾部 --%>
        <jsp:include page="../special/footer.jsp" />
    </body>
</html>
