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
        <title>星象仪 - 关于星象仪 - 概述</title>
        <!-- CSS文件 -->
        <link type="text/css" rel="stylesheet" href="css/global.css" />
        <link type="text/css" rel="stylesheet" href="css/special/aboutUs/outline.css" />
    </head>
    <body>
        <%-- 头部 --%>
        <jsp:include page="../../special/header.jsp" />
        <div class="wrapper outline">
            <%-- 导航 --%>
            <jsp:include page="../../special/aboutUs/nav.jsp" />
            <p>星象仪成立于2013年3月21日，理念是成为<span>「 互联网站点 搜索 + 评论 + 价值传播 的一体化平台 」</span>。</p>
            <dl>
                <dt>我想搜索网站！</dt>
                <dd>
                    我想看网络公开课，哪里有？<br />
                    我想开个轻博客，哪里的最好？<br />
                    我想找动漫游戏的圈子，同好们都聚集在哪些站点？<br />
                    有时候，你就是想找那么些个网站，但却无从下手。<br />
                    百度？搜出来的太眼花缭乱！朋友推荐？太过片面啦。<br />
                    难道就没有专门搜索网站的地方嘛？<br />
                    没错，我们做的，就是搜索网站的网站！<br />
                    系统、全面地整理互联网站点，并能根据你输入的关键词检索相关网站，这就是星象仪。
                </dd>
                <dt>我想评论网站！</dt>
                <dd>
                    这个下载站的资源好全面呀！<br />
                    这个站点设计得好漂亮！<br />
                    啊啊啊，这个论坛的管理员好讨厌喔！<br />
                    来吧，对你喜欢 / 讨厌的站点发表个评论。<br />
                    赤、橙、黄、绿、青、蓝、紫，集齐七颗星星的网站能召唤出神龙？<br />
                    当然，你的评论也会帮助后来的寻求者。<br />
                    评论嘛，文艺青年去豆瓣，影迷去时光网，吃货去大众点评。想对互联网评头论足的请来星象仪！
                </dd>
                <dt>星象仪的价值所在！</dt>
                <dd>
                    寻找感兴趣的网域。 －－ by 每个网虫<br />
                    讨论同类站点的人，一般都有共同爱好。 －－ by 寻找知音者<br />
                    我想看看同行们设计的人气网站，以寻求灵感与借鉴。 －－ by 站长、Web设计师<br />
                    我想……成为互联网兴衰的见证人，记录过去、探索未来的这张网。<br />
                </dd>
            </dl>
        </div>
        <%-- 尾部 --%>
        <jsp:include page="../../special/footer.jsp" />
    </body>
</html>
