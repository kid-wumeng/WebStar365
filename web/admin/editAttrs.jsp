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
        allAttrs - 全部属性的集合
            attr - 属性
                attrId - 属性编号
                attrName - 属性名
                attrIntro - 属性介绍
--%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>星象仪管理系统 - 编辑属性</title>
        <!-- CSS文件 -->
        <link type="text/css" rel="stylesheet" href="css/global.css" />
        <link type="text/css" rel="stylesheet" href="css/admin/editAttrs.css" />
        <!-- JS文件 -->
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/admin/editAttrs.js"></script>
    </head>
    <body>
        <div class="wrapper">
            <jsp:include page="../admin/header.jsp"/>
            <jsp:include page="../admin/sidebar.jsp" />
            <div class="main">
                <s:form action="admin/addAttr" theme="simple">
                    <div class="newAttrName">
                        <label>属性名</label>
                        <s:textfield name="attr.attrName" />
                    </div>
                    <div class="newAttrIntro">
                        <label>属性介绍</label>
                        <s:textarea name="attr.attrIntro" />
                    </div>
                    <s:submit cssClass="add" value="添加属性" />
                </s:form> 
                <hr />
                <table>
                    <tr>
                        <th>编号</th>
                        <th>属性名</th>
                        <th>介绍</th>
                    </tr>
                    <s:iterator value="allAttrs">
                    <tr attrId="${attrId}">
                        <td class="attrId">
                            <span>${attrId}<span>
                        </td>
                        <td class="attrName">
                            <span>${attrName}</span>
                            <a href="#">修改</a>
                        </td>
                        <td class="attrIntro">
                            <span>${attrIntro}</span>
                            <a href="#">修改</a>
                        </td>
                        <td class="showAttrSynonym">
                            <a href="admin/editAttrSynonyms?attr.attrId=${attrId}">查看属性近义词</a>
                        </td>
                        <td class="delete">
                            <a href="admin/deleteAttr?attr.attrId=${attrId}">删除属性</a>
                        </td>
                    </tr>
                    </s:iterator>
                </table>
            </div>
        </div>
    </body>
</html>
