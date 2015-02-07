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
        <title>星象仪管理系统 - 添加一个网站</title>
        <!-- CSS文件 -->
        <link type="text/css" rel="stylesheet" href="css/global.css" />
        <link type="text/css" rel="stylesheet" href="css/admin/editWebsite.css" />
        <!-- JS文件 -->
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/admin/editWebsite.js"></script>
    </head>
    <body>
        <div class="wrapper">
            <jsp:include page="../admin/header.jsp"/>
            <jsp:include page="../admin/sidebar.jsp" />
            <div class="main">
                <s:form action="admin/modifyWebsite" enctype="multipart/form-data" theme="simple">
                    <s:hidden name="website.websiteId" value="%{#website.websiteId}" />
                    <div class="websiteName">
                        <label>站名</label>
                        <s:textfield name="website.websiteName" />
                    </div>
                    <div class="websiteDomain">
                        <label>网址</label>
                        <s:textfield name="website.websiteDomain" />
                    </div>
                    <div class="websiteOwner">
                        <label>所有者</label>
                        <s:textfield name="website.websiteOwner" />
                    </div>
                    <div class="websiteEstablishDateTime">
                        <label>成立日期</label>
                        <s:select name="website.websiteEstablishYear" list="#years" />年
                        <s:select name="website.websiteEstablishMonth" list="#months" />月
                        <s:select name="website.websiteEstablishDay" list="#days" />日
                    </div>
                    <div class="websiteCat">
                        <label>分类</label>
                        <s:select cssClass="catId" name="website.websiteCat.catId" list="#allCats" listKey="catId" listValue="catName" />
                    </div>
                    <div class="websiteAttrs">
                        <label>属性</label>
                        <s:textfield cssClass="selectedAttrNames" disabled="true" />
                        <button class="selectAttrs" type="button">选择属性</button>
                        <div class="selectedAttrIds">
                            <s:if test="#website.websiteAttrs != null">
                                <s:iterator value="#website.websiteAttrs" id="attr">
                                    <s:hidden name="website.websiteAttrs.attrId" value="%{#attr.attrId}" />
                                </s:iterator>
                            </s:if>
                        </div>
                        <div class="oldSelectedAttrNames"><s:if test="#website.websiteAttrs != null"><s:iterator value="#website.websiteAttrs">${attrName} </s:iterator></s:if></div>
                    </div>
                    <div class="websiteCover">
                        <label>封面</label>
                        <s:file name="file" size="80" />
                    </div>
                    <div class="websiteBriefIntro">
                        <label>简介</label>
                        <s:textarea name="website.websiteBriefIntro" />
                    </div>
                    <div class="websiteDetailedIntro">
                        <label>详细介绍</label>
                        <s:textarea name="website.websiteDetailedIntro" />
                    </div>
                    <hr />
                    <s:reset cssClass="reset" value="重置" />
                    <s:submit cssClass="modify" value="确认修改" />
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
