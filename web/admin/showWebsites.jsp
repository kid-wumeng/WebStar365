<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <title>星象仪管理系统 - 网站搜索结果</title>
        <!-- CSS文件 -->
        <link type="text/css" rel="stylesheet" href="css/global.css" />
        <link type="text/css" rel="stylesheet" href="css/admin/showWebsites.css" />
    </head>
    <body>
        <div class="wrapper">
            <jsp:include page="../admin/header.jsp"/>
            <jsp:include page="../admin/sidebar.jsp" />
            <div class="main">
                <table>
                    <tr>
                        <th>编号</th>
                        <th>网站名</th>
                        <th>地址</th>
                        <th>分类</th>
                        <th>属性</th>
                        <th>星数</th>
                        <th>分数</th>
                    </tr>
                    <s:iterator value="#websites" id="website">
                    <tr>
                        <td class="websiteId">
                            <span>${websiteId}</span>
                        </td>
                        <td class="websiteName">
                            <a href="http://${websiteDomain}" target="_blank">${websiteName}</a>
                        </td>
                        <td class="websiteDomain">
                            <a href="http://${websiteDomain}" target="_blank">${websiteDomain}</a>
                        </td>
                        <td class="websiteCat">
                            <span>${websiteCat.catName}</span>
                        </td>
                        <td class="websiteAttrs">
                            <span><s:iterator value="#website.websiteAttrs">${attrName} </s:iterator></span>
                        </td>
                        <td class="websiteStar star${websiteStarNum}">
                            <span>${websiteStarNum}</span>
                        </td>
                        <td class="websiteScore star${websiteStarNum}">
                            <span><fmt:formatNumber type="number" value="${websiteScore}" maxFractionDigits="2" /></span>
                        </td>
                        <td class="show">
                            <a href="website/website?website.websiteId=${websiteId}" target="_blank">查看</a>
                        </td>
                        <td class="edit">
                            <a href="admin/editWebsite?website.websiteId=${websiteId}" target="_blank">编辑</a>
                        </td>
                        <td class="delete">
                            <a href="admin/editWebsite?website.websiteId=${websiteId}">删除</a>
                        </td>
                    </tr>
                    </s:iterator>
                </table>
            </div>
        </div>
    </body>
</html>
