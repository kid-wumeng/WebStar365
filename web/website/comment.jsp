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
        <title>星象仪 - 评论详情与回应</title>
        <!-- CSS文件 -->
        <link type="text/css" rel="stylesheet" href="css/global.css" />
        <link type="text/css" rel="stylesheet" href="css/website/comment.css" />
        <!-- JS文件 -->
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/website/comment.js"></script>
    </head>
    <body>
        <%-- 头部 --%>
        <jsp:include page="../special/header.jsp" />
        <div class="wrapper">
            <div class="comment"><%-- 评论 --%>
                <div class="userFace"><%-- 用户头像 --%>
                    <s:if test="#comment.commentUser.userFaceFlag != 0">
                        <img src="userFaces/${comment.commentUser.userId}.jpg" />
                    </s:if>
                    <s:else>
                        <img src="images/icons/common/defaultUserFace.jpg" />
                    </s:else>
                </div>
                <div class="row1">
                    <a class="commentUser" href="user/userData?user.userId=${comment.commentUser.userId}">${comment.commentUser.userNickName}</a><%-- 评论用户的昵称 --%>
                    对
                    <a class="commentWebsite" href="website/website?website.websiteId=${comment.commentWebsite.websiteId}">${comment.commentWebsite.websiteName}</a><%-- 评论的网站名 --%>
                    的评论
                    <span class="commentStar"><%-- 评论星数 --%>
                        <img src="images/icons/star/star${comment.commentStar}.png" />
                    </span>
                </div>
                <div class="row2">
                    <span class="commentPublishDateTime"><%-- 评论发表时间 --%>
                        发表于 <s:date name="#comment.commentPublishDateTime" format="yyyy-MM-dd HH:mm:ss" />
                    </span>
                </div>
                <div class="commentContent"><%-- 评论内容 --%>
                    ${comment.commentContent}
                </div>
            </div>
            <div class="commentEchoes">
                <h2 class="echoLabel">对此评论的回应(+${comment.commentEchoNum})：</h2>
                <s:if test="#session.USER != null">
                    <div class="addEcho">
                        <s:form action="user/addEcho" theme="simple">
                            <s:textarea cssClass="echoContent" name="echo.echoContent" />
                            <s:hidden name="echo.commentId" value="%{#comment.commentId}" />
                            <s:hidden name="echo.userId" value="%{#comment.commentUser.userId}" />
                            <a class="publish" href="#">发表回应</a>
                        </s:form>
                    </div>
                </s:if>
                <s:iterator value="#echoes" id="echo">
                <div class="echo">
                    <div class="userFace"><%-- 用户头像 --%>
                        <s:if test="#echo.echoUser.userFaceFlag != 0">
                        <img src="userFaces/${echoUser.userId}.jpg" />
                        </s:if>
                        <s:else>
                        <img src="images/userFaces/0.jpg" />
                        </s:else>
                    </div>
                    <div class="row1">
                        <a class="echoUser" href="user/userData?user.userId=${echoUser.userId}">${echoUser.userNickName}</a><%-- 评论用户的昵称 --%>
                    </div>
                    <div class="echoContent"><%-- 评论内容 --%>
                        ${echoContent}
                    </div>
                    <div class="row2">
                        <span class="echoPublishDateTime"><%-- 评论发表时间 --%>
                            发表于 <s:date name="#echo.echoPublishDateTime" format="yyyy-MM-dd HH:mm:ss" />
                        </span>
                    </div>
                </div>
                </s:iterator>
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
                <s:form cssClass="searchEchos" action="website/comment" theme="simple">
                    <s:hidden name="searchCondition.commentId" value="%{#comment.commentId}" />
                    <s:hidden cssClass="searchPageNo" name="searchCondition.page.pageNo" value="%{#page.pageNo}" />
                </s:form>
            </div>
        </div>
    </body>
</html>
