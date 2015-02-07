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

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>星象仪 - 分类：${cat.catName}</title>
        <!-- CSS文件 -->
        <link type="text/css" rel="stylesheet" href="css/global.css" />
        <link type="text/css" rel="stylesheet" href="css/search/websitesByCatId.css" />
        <!-- JS文件 -->
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/search/websitesByCatId.js"></script>
    </head>
    <body>
        <%-- 头部 --%>
        <jsp:include page="../special/header.jsp" />
        <div class="wrapper">
            <div class="search">
                <s:form action="search/websites" method="get" theme="simple">
                    <s:hidden name="by" value="catId" />
                    <s:hidden name="searchCondition.catId" value="%{#request.cat.catId}" />
                    <s:hidden cssClass="displayStyle" name="displayStyle" value="%{#displayStyle}" />
                    <s:hidden cssClass="searchPageNo" name="searchCondition.page.pageNo" />
                </s:form>
                <h1>分类：${cat.catName}（${websiteNum}个）</h1>
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