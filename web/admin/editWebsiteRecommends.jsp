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
        allCats - 全部分类的集合
            cat - 分类
                catId - 分类编号
                catName - 分类名
        allAttrs - 全部属性的集合
            attr - 属性
                attrId - 属性编号
                attrName - 属性名
                attrIntro - 属性介绍
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
        years - 年份的集合 
        months - 月份的集合
        days - 日份的集合
--%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>星象仪管理系统 - 查看网站推荐</title>
        <!-- CSS文件 -->
        <link type="text/css" rel="stylesheet" href="css/global.css" />
        <link type="text/css" rel="stylesheet" href="css/admin/editWebsiteRecommends.css" />
        <!-- JS文件 -->
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/admin/editWebsiteRecommends.js"></script>
    </head>
    <body>
        <div class="wrapper">
            <jsp:include page="../admin/header.jsp"/>
            <jsp:include page="../admin/sidebar.jsp" />
            <div class="main">
                <div class="checkStatusNav">
                    <a class="<s:if test="#checkStatus == 0">nowShow</s:if>" href="admin/editWebsiteRecommends?searchCondition.websiteCheckStatus=0&searchCondition.page.pageNo=1">待审核</a>
                    <a class="<s:if test="#checkStatus == 1">nowShow</s:if>" href="admin/editWebsiteRecommends?searchCondition.websiteCheckStatus=1&searchCondition.page.pageNo=1">已通过审核</a>
                    <a class="<s:if test="#checkStatus == 2">nowShow</s:if>" href="admin/editWebsiteRecommends?searchCondition.websiteCheckStatus=2&searchCondition.page.pageNo=1">未通过审核</a>
                </div>
                <table>
                <s:iterator value="#websiteRecommends" id="websiteRecommend">
                    <tr websiteId="${websiteId}" websiteCheckStatus="${websiteCheckStatus}">
                        <td>${websiteId}</td>
                        <td class="websiteName">${websiteName}</td>
                        <td class="websiteDomain">${websiteDomain}</td>
                        <td><s:date name="#websiteRecommend.websiteRecommendDateTime" format="yyyy-MM-dd HH:mm:ss" /></td>
                        <td><a class="showWebsiteDetails" href="#">详情</a></td>
                        <s:if test="#checkStatus == 0">
                            <td class="wait">待审核</td>
                        </s:if>
                        <s:elseif test="#checkStatus == 1">
                            <td class="pass">审核通过</td>
                        </s:elseif>
                        <s:elseif test="#checkStatus == 2">
                            <td class="fail">审核未通过</td>
                        </s:elseif>
                        <td><a class="editCheckStatus" href="#">修改状态</a></td>
                        <td class="userNickName">${user.userNickName}</td>
                        <td class="websiteIntro">${websiteIntro}</td>
                        <td class="adminName">${admin.adminName}</td>
                        <td class="websiteCheckFailReason">${websiteCheckFailReason}</td>
                    </tr>
                </s:iterator>
                </table>
                <div class="page">
                    <s:hidden cssClass="nowPageNo" value="%{#page.pageNo}" />
                    <s:hidden cssClass="totalPageNum" value="%{#page.totalPageNum}" />
                    <s:if test="#page.pageNo > 1 && #page.pageNo <= #page.totalPageNum"><input type="button" class="firstPage" value="首页" /></s:if>
                    <s:if test="#page.pageNo > 1 && #page.pageNo <= #page.totalPageNum"><input type="button" class="prevPage" value="上一页" /></s:if>
                    <s:if test="#page.pageNo >= 1 && #page.pageNo < #page.totalPageNum"><input type="button" class="nextPage" value="下一页" /></s:if>
                    <s:if test="#page.pageNo >= 1 && #page.pageNo < #page.totalPageNum"><input type="button" class="lastPage" value="末页" /></s:if>
                    <span class="pageNoAndNum">${page.pageNo}/${page.totalPageNum}</span>
                    <span class="targetPageNo">第<s:textfield />页</span>
                    <input type="button" class="goto" value="跳转" />
                    <s:form cssClass="searchWebsiteRecommends" action="admin/editWebsiteRecommends" theme="simple">
                        <s:hidden name="searchCondition.websiteCheckStatus" value="%{#checkStatus}" />
                        <s:hidden cssClass="searchPageNo" name="searchCondition.page.pageNo" value="%{#page.pageNo}" />
                    </s:form>
                </div>
            </div>
        </div>
        <div class="websiteDetails">
            <div class="checkInfo">
                <span class="adminName"></span>
                <span class="websiteCheckFailReason"></span>
            </div>
            <div class="websiteInfo">
                <span class="websiteCheckStatus"></span>
                <span class="userNickName"></span>
                <span class="websiteName"></span>
                <span class="websiteDomain"></span>
                <span>介绍：</span>
                <p class="websiteIntro"></p>
            </div>
            <div class="close">
                <button>关闭详情</button>
            </div>
        </div>
        <div class="selectCheckStatus">
            <s:form theme="simple">
                <input type="radio" name="websiteCheckStatus" value="0" /><label class="selectWait">待审核</label>
                <input type="radio" name="websiteCheckStatus" value="1" /><label class="selectPass">通过审核</label>
                <input type="radio" name="websiteCheckStatus" value="2" /><label class="selectFail">有问题，审核失败</label>
                <s:hidden cssClass="checkStatusOfPage" value="%{#checkStatus}" />
                <s:submit value="确认" />
            </s:form>
        </div>
    </body>
</html>
