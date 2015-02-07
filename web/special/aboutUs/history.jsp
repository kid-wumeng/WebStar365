<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <title>星象仪 - 关于星象仪 - 大事记</title>
        <!-- CSS文件 -->
        <link type="text/css" rel="stylesheet" href="css/global.css" />
        <link type="text/css" rel="stylesheet" href="css/special/aboutUs/history.css" />
    </head>
    <body>
        <%-- 头部 --%>
        <jsp:include page="../../special/header.jsp" />
        <div class="wrapper history">
            <%-- 导航 --%>
            <jsp:include page="../../special/aboutUs/nav.jsp" />
            <div class="main">
                <ul>
                    <li><span>2013年3月21日</span> - 星象仪正式上线运行。</li>
                </ul>
            </div>
        </div>
        <%-- 尾部 --%>
        <jsp:include page="../../special/footer.jsp" />
    </body>
</html>
