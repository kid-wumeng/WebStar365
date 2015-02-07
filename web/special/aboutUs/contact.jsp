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
        <title>星象仪 - 关于星象仪 - 联系我们</title>
        <!-- CSS文件 -->
        <link type="text/css" rel="stylesheet" href="css/global.css" />
        <link type="text/css" rel="stylesheet" href="css/special/aboutUs/contact.css" />
    </head>
    <body>
        <%-- 头部 --%>
        <jsp:include page="../../special/header.jsp" />
        <div class="wrapper contact">
            <%-- 导航 --%>
            <jsp:include page="../../special/aboutUs/nav.jsp" />
            <dl>
                <dt>电子邮箱</dt>
                <dd>
                    xingxiangyi@163.com
                </dd>
            </dl>
        </div>
        <%-- 尾部 --%>
        <jsp:include page="../../special/footer.jsp" />
    </body>
</html>
