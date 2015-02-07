<%@page contentType="text/html" pageEncoding="UTF-8" %>
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
        <title>星象仪 - 全部属性</title>
        <!-- CSS文件 -->
        <link type="text/css" rel="stylesheet" href="css/global.css" />
        <link type="text/css" rel="stylesheet" href="css/list/allAttrs.css" />
        <!-- JS文件 -->
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/list/allAttrs.js"></script>
    </head>
    <body>
        <%-- 头部 --%>
        <jsp:include page="../special/header.jsp" />
        <div class="wrapper">
            <dl>
                <s:iterator value="allAttrs">
                <a href="search/websites?by=attrId&searchCondition.attrId=${attrId}&searchCondition.page.pageNo=1">
                    <dt>${attrName}</dt>
                    <dd>${attrIntro}</dd>
                </a>
                </s:iterator>
            </dl>
        </div>
        <%-- 尾部 --%>
        <jsp:include page="../special/footer.jsp" />
    </body>
</html>