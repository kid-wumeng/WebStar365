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

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>星象仪管理系统 - 编辑属性近义词</title>
        <!-- CSS文件 -->
        <link type="text/css" rel="stylesheet" href="css/global.css" />
        <link type="text/css" rel="stylesheet" href="css/admin/editAttrSynonyms.css" />
        <!-- JS文件 -->
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/admin/editAttrSynonyms.js"></script>
    </head>
    <body>
        <div class="wrapper">
            <jsp:include page="../admin/header.jsp"/>
            <jsp:include page="../admin/sidebar.jsp" />
            <div class="main">
                <h2>属性：${attr.attrName}</h2>
                <s:form action="admin/addAttrSynonym" theme="simple">
                    <div class="newAttrSynonymName">
                        <label>属性近义词</label>
                        <s:textfield name="attrSynonym.attrSynonymName" />
                        <s:hidden name="attrSynonym.attrId" value="%{#request.attr.attrId}" />
                    </div>
                    <s:submit cssClass="add" value="添加属性近义词" />
                </s:form> 
                <hr />
                <table>
                    <tr>
                        <th>编号</th>
                        <th>属性近义词</th>
                    </tr>
                    <s:iterator value="attrSynonyms">
                    <tr attrSynonymId="${attrSynonymId}">
                        <td class="attrSynonymId">
                            <span>${attrSynonymId}<span>
                        </td>
                        <td class="attrSynonymName">
                            <span>${attrSynonymName}</span>
                            <a href="#">修改</a>
                        </td>
                        <td class="delete">
                            <a href="admin/deleteAttrSynonym?attrSynonym.attrSynonymId=${attrSynonymId}&attrSynonym.attrId=${attr.attrId}">删除</a>
                        </td>
                    </tr>
                    </s:iterator>
                </table>
            </div>
        </div>
    </body>
</html>
