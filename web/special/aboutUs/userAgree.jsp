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
        <title>星象仪 - 关于星象仪 - 用户注册协议</title>
        <!-- CSS文件 -->
        <link type="text/css" rel="stylesheet" href="css/global.css" />
        <link type="text/css" rel="stylesheet" href="css/special/aboutUs/userAgree.css" />
    </head>
    <body>
        <%-- 头部 --%>
        <jsp:include page="../../special/header.jsp" />
        <div class="wrapper outline">
            <%-- 导航 --%>
            <jsp:include page="../../special/aboutUs/nav.jsp" />
            <p>若您成功注册为星象仪用户，我们默认您已阅读并同意以下协议。</p>
            <dl>
                <dt>一、用户行为</dt>
                <dd>
                    禁止用户发表含暴力、情色、赌博、欺诈以及其它不符合国家相关法律规定的言论与资料。<br />
                    禁止用户恶意辱骂、教唆其它用户。<br />
                    违反上述规定者，我们有权在不通知本人的情况下停止提供服务。
                </dd>
                <dt>二、网站资料</dt>
                <dd>
                    引用星象仪网站相关信息与图标时请注明来源；未经许可不得将其用于商业活动。<br />
                    本站收录的网站资料均整理自互联网或由用户提供，本站不保证其有效性；若涉及侵权，请联系网站管理员。<br />
                    用户发表的评论与回应皆属于用户本人所有，引用时应得到用户本人同意；本站不对其言论内容负责。
                </dd>
            </dl>
        </div>
        <%-- 尾部 --%>
        <jsp:include page="../../special/footer.jsp" />
    </body>
</html>
