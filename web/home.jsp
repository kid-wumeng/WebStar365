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
        <title>星象仪 - 互联网站点 搜索 + 评论 + 价值传播 的一体化平台</title>
        <link rel="icon" type="image/x-icon" href="images/icons/common/shortCutIcon.png" />
        <link rel="shortcut icon" href="images/icons/common/shortCutIcon.png" >  
        <!-- CSS文件 -->
        <link type="text/css" rel="stylesheet" href="css/global.css" />
        <link type="text/css" rel="stylesheet" href="css/home.css" />
        <!-- JS文件 -->
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/home.js"></script>
    </head>
    
    <body>
        <%-- 头部 --%>
        <jsp:include page="special/header.jsp" />
        <div class="wrapper">
            <div class="article">
                <div class="articleCover">
                    <a href="${newArticleWithCover.articleLink}" target="_blank"><img src="articleCovers/${newArticleWithCover.articleId}.jpg" /></a>
                </div>
                <div class="articleNavRead">
                    <p>${newArticleWithCover.articleNavRead}</p>
                </div>
                <ul class="otherArticles">
                    <hr />
                    <s:iterator value="#newArticlesWithoutCover">
                    <li><a href="${articleLink}" target="_blank">${articleTitle}</a></li>
                    </s:iterator>
                    <a class="more" href="list/allArticles?searchCondition.page.pageNo=1">>> 更多文章</a>
                </ul>
            </div>
            <div class="search">
                <s:form action="search/websites" method="get" theme="simple">
                    <s:hidden name="by" value="keywords" />
                    <s:textfield cssClass="searchBox" name="searchCondition.keywords" />
                    <s:hidden name="searchCondition.page.pageNo" value="1" />
                    <a class="searchButton" href="#">搜索网站</a>
                </s:form>
            </div>  
            <div class="help">
                <a href="special/aboutUs/outline.jsp">星象仪是个神马玩意？！</a>
            </div>
            <div class="cats">
                <a class="cat1" href="search/websites?by=catId&searchCondition.catId=1&searchCondition.pageNo=1">资讯资源</a>
                <a class="cat2" href="search/websites?by=catId&searchCondition.catId=2&searchCondition.pageNo=1">社交互动</a>
                <a class="cat3" href="search/websites?by=catId&searchCondition.catId=3&searchCondition.pageNo=1">电子商务</a>
                <a class="cat4" href="search/websites?by=catId&searchCondition.catId=4&searchCondition.pageNo=1">网络服务</a>
            </div>
            <div class="hotAttrs">
                <span class="label">热门属性：</span>
                <ul>
                    <s:iterator value="#hotAttrs" status="st">
                        <li><a href="search/websites?by=attrId&searchCondition.attrId=${attrId}&searchCondition.page.pageNo=1">${attrName}</a></li>
                    </s:iterator>
                </ul>
                <span class="allAttrs"><a href="list/allAttrs">>> 查看全部属性</a></span>
            </div>
            <div class="hotKeywords">
                <span class="label">热门关键词：</span>
                <ul>
                    <li><a href="search/websites?by=keywords&searchCondition.keywords=公开课&searchCondition.page.pageNo=1">公开课</a></li>
                    <li><a href="search/websites?by=keywords&searchCondition.keywords=设计素材&searchCondition.page.pageNo=1">设计素材</a></li>
                    <li><a href="search/websites?by=keywords&searchCondition.keywords=图片墙&searchCondition.page.pageNo=1">图片墙</a></li>
                    <li><a href="search/websites?by=keywords&searchCondition.keywords=英雄联盟&searchCondition.page.pageNo=1">英雄联盟</a></li>
                    <li><a href="search/websites?by=keywords&searchCondition.keywords=广告联盟&searchCondition.page.pageNo=1">广告联盟</a></li>
                </ul>
            </div>
            <div class="ad">
                
            </div>
            <%-- 尾部 --%>
            <jsp:include page="special/footer.jsp" />
        </div>
    </body>
</html>
