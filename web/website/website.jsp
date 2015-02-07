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
    session范围下的变量：
        USER - 登录用户（可能存在）
            userId - 用户编号
            userAccount - 用户帐号
            userNickName - 用户昵称
            userEmail - 用户电子邮箱
            userStatus - 用户状态

    request范围下的变量：
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
        myComment - 当前登录用户对此网站的评论（尚未评论则为null）
        comments - 本网站的最新评论的集合
            comment - 评论
                commentId - 帖子编号
                commentStar - 帖子内容
                commentContent - 帖子内容
                commentPublishDateTime - 发表帖子的日期与时间
                commentLastEditDateTime - 帖子所属的网站编号
                commentUser - 发表帖子的用户
                    userId - 用户编号
                    userAccount - 用户帐号
                    userNickName - 用户昵称
                    userEmail - 用户电子邮箱
                    userFaceFlag - 用户是否有头像（有：1 | 无：0）
                    userStatus - 用户状态
        commentNum - 评论数量
--%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>
            星象仪 - ${website.websiteName} - ${website.websiteDomain} - ${website.websiteCat.catName} -
            <s:iterator value="#website.websiteAttrs">
                ${attrName}
            </s:iterator>
        </title>
        <!-- CSS文件 -->
        <link type="text/css" rel="stylesheet" href="css/global.css" />
        <link type="text/css" rel="stylesheet" href="css/website/website.css" />
        <!-- JS文件 -->
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/website/website.js"></script>
    </head>
    <body>
        <%-- 头部 --%>
        <jsp:include page="../special/header.jsp" />
        <div class="wrapper">
            <%-- 主体 --%>
            <div class="main">
                <%-- 网站封面 --%>
                <div class="websiteCover"><%-- 网站封面 --%>
                    <s:if test='#website.websiteCoverPath == "defaultWebsiteCover"'>
                        <img src="images/icons/common/defaultWebsiteCover.jpg" />
                    </s:if>
                    <s:else>
                        <img src="websiteCovers/${website.websiteCoverPath}" />
                    </s:else>
                </div>
                <%-- 网站概述 --%>
                <div class="websiteOutline">
                    <h1 class="websiteName"><a href="http://${website.websiteDomain}" target="_blank">${website.websiteName}</a></h1><%-- 网站名 --%>
                    <div class="starAndScore">
                        <span class="websiteStar"><%-- 星数 --%>
                            <s:if test="#website.websiteStar == 0">
                                <span class="lackCommentNum">少于10人点评</span>
                            </s:if>
                            <s:elseif test="#website.websiteStar >= 1 && #website.websiteStar <= 7">
                                <img src="images/icons/star/star${website.websiteStarNum}.png" />
                            </s:elseif>
                        </span>
                        <span class="websiteScore star${website.websiteStarNum}"><%-- 分数 --%>
                            <s:if test="#website.websiteStar != 0">
                                <fmt:formatNumber type="number" value="${website.websiteScore}" maxFractionDigits="2" />
                            </s:if>
                        </span>
                        <s:if test="#session.USER != null">
                            <s:if test="#myComment.commentStar == 0"><%-- 评论 / 修改评论按钮 --%>
                                <a class="remark" href="#">评论</a>
                            </s:if>
                            <s:else>
                                <a class="remark" href="#">修改评论</a>
                            </s:else>
                        </s:if>
                    </div>
                    <p class="websiteBriefIntro">${website.websiteBriefIntro}</p><%-- 网站简介 --%>
                    <hr />
                </div>
                <%-- 网站详述 --%>
                <div class="websiteDetail">
                    <p class="websiteDetailedIntro">${website.websiteDetailedIntro}</p><%-- 网站详细介绍 --%>
                </div>
                <hr class="hr2" />
                <!-- 网站评论 -->
                <div class="websiteComments">
                    <s:iterator value="#comments" id="comment">
                    <div class="comment"><%-- 每条评论 --%>
                        <div class="userFace"><%-- 用户头像 --%>
                            <s:if test="#comment.commentUser.userFaceFlag != 0">
                                <img src="userFaces/${commentUser.userId}.jpg" />
                            </s:if>
                            <s:else>
                                <img src="images/icons/common/defaultUserFace.jpg" />
                            </s:else>
                        </div>
                        <div class="row1">
                            <a class="commentUser" href="user/userData?user.userId=${commentUser.userId}">${commentUser.userNickName}</a><%-- 评论用户的昵称 --%>
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
                        </div>
                    </div>
                    </s:iterator>
                    <s:if test="#commentNum > 10">
                    <div class="moreComments">
                        <a href="website/comments?searchCondition.websiteId=${website.websiteId}&searchCondition.page.pageNo=1">>> 更多评论（共${commentNum}条）</a>
                    </div>
                    </s:if> 
                </div>
            </div>
            <%-- 侧栏 --%>
            <div class="sidebar">
                <div class="websiteData"><%-- 网站基本数据 --%>
                    <dl>
                        <div><dt>网站名：</dt><dd><a href="http://${website.websiteDomain}" target="_blank">${website.websiteName}</a></dd></div>
                        <div><dt>域名：</dt><dd><a href="http://${website.websiteDomain}" target="_blank">${website.websiteDomain}</a></dd></div>
                        <div><dt>所有者：</dt><dd>${website.websiteOwner}</dd></div>
                        <div>
                            <dt>成立日期：</dt>
                            <dd>
                                ${website.websiteEstablishYear}<s:if test="#website.websiteEstablishMonth != null"> - </s:if>${website.websiteEstablishMonth}<s:if test="#website.websiteEstablishDay != null"> - </s:if>${website.websiteEstablishDay}
                            </dd>
                        </div>
                        <div>
                            <dt>分类：</dt>
                            <dd><a href="search/websites?by=catId&searchCondition.catId=${website.websiteCat.catId}&searchCondition.pageNo=1">${website.websiteCat.catName}</a></dd>
                        </div>
                        <div>
                            <dt>属性：</dt>
                            <dd>
                                <s:iterator value="#website.websiteAttrs">
                                    <a class="attrName" href="search/websites?by=attrId&searchCondition.attrId=${attrId}&searchCondition.page.pageNo=1">${attrName}</a>
                                </s:iterator>
                            </dd>
                        </div>
                    </dl>    
                </div>
            </div>
        </div>
        <s:if test="#session.USER != null">
            <div class="editComment">
                <s:form action="user/addComment" theme="simple">
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
                    <s:hidden name="comment.commentStar" value="%{#myComment.commentStar}" />
                    <div class="row3">
                        <span class="label">评论内容：</span>
                        <span class="remainWordNum">5000</span>
                    </div>
                    <s:textarea cssClass="editCommentContent" name="comment.commentContent" value="%{#myComment.commentContent}" />
                    <div class="row4">
                        <a class="publish" href="#">发表评论</a>
                    </div>
                    <s:hidden name="comment.commentId" value="%{#myComment.commentId}" />
                    <s:hidden name="comment.commentWebsite.websiteId" value="%{#website.websiteId}" />
                    <s:if test="#myComment.commentId != 0">
                        <s:hidden name="comment.commentUser.userId" value="%{#myComment.userId}" />
                    </s:if>
                    <s:else>
                        <s:hidden name="comment.commentUser.userId" value="%{#session.USER.userId}" />
                    </s:else>
                </s:form>
            </div>
        </s:if>
    </body>
</html>
