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
        <title>星象仪 - 我的评论</title>
        <!-- CSS文件 -->
        <link type="text/css" rel="stylesheet" href="css/global.css" />
        <link type="text/css" rel="stylesheet" href="css/user/myComments.css" />
        <!-- JS文件 -->
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/user/myComments.js"></script>
    </head>
    <body>
        <%-- 头部 --%>
        <jsp:include page="../special/header.jsp" />
        <div class="wrapper">
            <h1>我的评论</h1>
            <!-- 我的评论 -->
            <div class="myComments">
                <s:iterator value="#myComments" id="comment">
                <div class="comment" commentId="${comment.commentId}" commentStar="${comment.commentStar}"><%-- 每条评论 --%>
                    <div class="websiteCover"><%-- 封面 --%>
                        <s:if test='#comment.commentWebsite.websiteCoverPath == "defaultWebsiteCover"'>
                            <img src="images/icons/common/defaultWebsiteCover.jpg" />
                        </s:if>
                        <s:else>
                            <img src="websiteCovers/${commentWebsite.websiteCoverPath}" />
                        </s:else>
                    </div> 
                    <div class="row1">
                        <a class="websiteName" href="website/website?website.websiteId=${commentWebsite.websiteId}">${commentWebsite.websiteName}</a><%-- 评论的网站名 --%>
                        <a class="websiteDomain" href="http://${commentWebsite.websiteDomain}" target="_blank">(${commentWebsite.websiteDomain})</a><%-- 评论的网站域名 --%>
                        <span class="commentStar"><%-- 评论星数 --%>
                            <img src="images/icons/star/star${commentStar}.png" />
                        </span>
                    </div>
                    <div class="commentContent"><%-- 评论内容 --%>
                        <p>${commentContent}</p>
                        <a class="commentEcho" href="website/comment?searchCondition.commentId=${commentId}&searchCondition.page.pageNo=1"><%-- 评论回应数量 --%>
                            >> 评论全文与回应<s:if test="#comment.commentEchoNum > 0"><span>(+${commentEchoNum})</span></s:if>
                        </a>
                    </div>
                    <div class="row2">
                        <span class="commentPublishDateTime"><%-- 评论发表时间 --%>
                            发表于 <s:date name="#comment.commentPublishDateTime" format="yyyy-MM-dd HH:mm:ss" />
                        </span>
                        <span class="edit"><%-- 修改此评论 --%>
                            <a href="#">修改</a>
                        </span>
                        <span class="delete"><%-- 删除此评论 --%>
                            <a href="#">删除</a>
                        </span>
                    </div>
                </div>
                </s:iterator>
            </div>
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
            <s:form cssClass="searchComments" action="user/myComments" theme="simple">
                <s:hidden name="searchCondition.userId" value="%{#session.USER.userId}" />
                <s:hidden cssClass="searchPageNo" name="searchCondition.page.pageNo" value="%{#page.pageNo}" />
            </s:form>
        </div>
        <div class="editComment">
            <s:form action="user/modifyComment" theme="simple">
                <div class="row1">
                    <h1>评论：${website.websiteName}</h1>
                    <a href="#"></a>
                </div>
                <div class="row2">
                    <span class="ask">您想给「${website.websiteName}」几颗星？</span>
                    <span class="selectStar"><%-- 评论星数 --%>
                        <a star="1" href="#" class="first"></a>
                        <a star="2" href="#"></a>
                        <a star="3" href="#"></a>
                        <a star="4" href="#"></a>
                        <a star="5" href="#"></a>
                        <a star="6" href="#"></a>
                        <a star="7" href="#"></a>
                    </span>
                    <span class="hint"></span>
                </div>
                <s:hidden name="comment.commentStar" />
                <div class="row3">
                    <span class="label">评论内容：</span>
                    <span class="remainWordNum">5000</span>
                </div>
                <s:textarea cssClass="editCommentContent" name="comment.commentContent" value="%{#myComment.commentContent}" />
                <div class="row4">
                    <s:submit cssClass="publish" value="发表评论" />
                </div>
                <s:hidden name="comment.commentWebsite.websiteId" value="%{#website.websiteId}" />
                <s:hidden name="comment.commentUser.userId" value="%{#userId}" />
            </s:form>
        </div>
        <%-- 尾部 --%>
        <jsp:include page="../special/footer.jsp" />
    </body>
</html>
