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
--%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>星象仪管理系统 - 批量添加新网站</title>
        <!-- CSS文件 -->
        <link type="text/css" rel="stylesheet" href="css/global.css" />
        <link type="text/css" rel="stylesheet" href="css/admin/editNewWebsites.css" />
        <!-- JS文件 -->
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/admin/editNewWebsites.js"></script>
    </head>
    <body>
        <div class="wrapper">
            <jsp:include page="../admin/header.jsp"/>
            <jsp:include page="../admin/sidebar.jsp" />
            <div class="main">
                <s:form action="admin/addWebsites" enctype="multipart/form-data" theme="simple">
                    <s:iterator begin="0" end="9" step="1" status="st">
                    <div class="website" websiteIndex="${st.index}">
                        <h2>第${st.index + 1}个网站：</h2>
                        <div class="row1">
                            <div class="websiteName">
                                <label>站名</label>
                                <s:textfield name="websites[%{#st.index}].websiteName" />
                            </div>
                            <div class="websiteDomain">
                                <label>地址</label>
                                <s:textfield  name="websites[%{#st.index}].websiteDomain" />
                            </div>
                        </div>
                        <div class="row2">
                            <div class="websiteOwner">
                                <label>所有者</label>
                                <s:textfield name="websites[%{#st.index}].websiteOwner" />
                            </div>
                            <div class="websiteEstablishDateTime">
                                <label>成立日期</label>
                                <s:select name="websites[%{#st.index}].websiteEstablishYear" list="#years" />年
                                <s:select name="websites[%{#st.index}].websiteEstablishMonth" list="#months" />月
                                <s:select name="websites[%{#st.index}].websiteEstablishDay" list="#days" />日
                            </div>
                        </div>
                        <div class="row3">
                            <div class="websiteCat">
                                <label>分类</label>
                                <s:select cssClass="c1" name="websites[%{#st.index}].websiteCat.catId" list="#allCats" listKey="catId" listValue="catName" />
                            </div>
                            <div class="websiteAttrs">
                                <label>属性</label>
                                <s:textfield cssClass="selectedAttrNames" disabled="true" />
                                <button class="selectAttrs" type="button">选择属性</button>
                                <div class="selectedAttrIds"></div>
                            </div>
                        </div>
                        <div class="row4">
                            <div class="websiteBriefIntro">
                                <label>简介</label>
                                <s:textarea name="websites[%{#st.index}].websiteBriefIntro" />
                            </div>
                        </div>
                    </div>
                    </s:iterator>
                    <s:reset cssClass="reset" value="重置" />
                    <s:submit cssClass="add" value="添加网站" />
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
