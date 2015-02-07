<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
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
        <title>星象仪 - 全部文章</title>
        <!-- CSS文件 -->
        <link type="text/css" rel="stylesheet" href="css/global.css" />
        <link type="text/css" rel="stylesheet" href="css/list/allArticles.css" />
    </head>
    <body>
        <%-- 头部 --%>
        <jsp:include page="../special/header.jsp" />
        <div class="wrapper">
            <ul class="articles">
                <s:iterator value="#articles" id="article">
                <li>
                    <a class="articleTitle" href="${articleLink}" target="_blank">${articleTitle}</a>
                    <span class="articlePublishDateTime"><s:date name="#article.articlePublishDateTime" format="yyyy-MM-dd HH:mm:ss" /></span>
                </li>   
                </s:iterator>
            </ul>
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
            <s:form cssClass="searchArticles" action="list/allArticles" theme="simple">
                <s:hidden cssClass="searchPageNo" name="searchCondition.page.pageNo" value="%{#page.pageNo}" />
            </s:form>
        </div>
        <%-- 尾部 --%>
        <jsp:include page="../special/footer.jsp" />
    </body>
</html>
