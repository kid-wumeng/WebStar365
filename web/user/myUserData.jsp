<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>

<%-- 验证用户已登录 --%>
<% 
    if(request.getSession().getAttribute("USER") == null) {
        response.sendRedirect("../account/userLogin.jsp"); 
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
        <title>星象仪 - 我的资料</title>
        <!-- CSS文件 -->
        <link type="text/css" rel="stylesheet" href="css/global.css" />
        <link type="text/css" rel="stylesheet" href="css/user/myUserData.css" />
    </head>
    <body>
        <%-- 头部 --%>
        <jsp:include page="../special/header.jsp" />
        <div class="wrapper">
            <div class="userFace">
                <s:if test="#user.userFaceFlag != 0">
                    <img src="userFaces/${user.userId}.jpg" />
                </s:if>
                <s:else>
                    <img src="images/icons/common/defaultUserFace.jpg" />
                </s:else>
                <div>
                    <a class="userCommentNum" href="user/comments?searchCondition.userId=${user.userId}&searchCondition.page.pageNo=1">
                        <span class="num">${commentNum}</span>
                        <span class="label">评论</span>
                    </a>
                    <a class="userFriendNum" href="user/temp_noFriendSystem.jsp">
                        <span class="num">0</span>
                        <span class="label">好友</span>
                    </a>
                </div>
            </div>
            <div class="userData">
                <span class="userNickName">${user.userNickName}</span>
                <s:if test="#user.userSex == 1">
                    <span class="userSex man">男</span>
                </s:if>
                <s:elseif test="#user.userSex == 2">
                    <span class="userSex woman">女</span>
                </s:elseif>    
                <span class="userBirthday"><s:date name="#user.userBirthday" format="yyyy-MM-dd" /></span>
                <span class="userArea">${user.userArea.parentArea.areaName} ${user.userArea.areaName}</span>
                <p class="userPersonalIntro">${user.userPersonalIntro}</p>
                <a class="editUserData" href="user/account/editUserData?user.userId=${USER.userId}">修改资料</a> 
                <a class="editUserPass" href="user/account/editUserPass.jsp">修改密码</a> 
            </div>
            <div class="userHistory">
                <h1>Ta的历史</h1>
            </div>
        </div>
        <%-- 尾部 --%>
        <jsp:include page="../special/footer.jsp" />
    </body