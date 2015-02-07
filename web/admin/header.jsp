<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<link type="text/css" rel="stylesheet" href="css/admin/header.css" />
<div class="header">
    <h1>星象仪网站管理系统</h1>
    <div class="row1">
        <span class="adminName">管理员：${ADMIN.adminName}</span>
        <span class="adminLv">（Lv：${ADMIN.adminLv}）</span>
        <s:hidden cssClass="adminId" value="%{#session.ADMIN.adminId}" />
    </div>
</div>
