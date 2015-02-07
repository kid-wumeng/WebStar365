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
        <title>星象仪 - 编辑用户资料</title>
        <!-- CSS文件 -->
        <link type="text/css" rel="stylesheet" href="css/global.css" />
        <link type="text/css" rel="stylesheet" href="css/user/account/editUserData.css" />
        <!-- JS文件 -->
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/user/account/editUserData.js"></script>
    </head>
    <body>
        <%-- 头部 --%>
        <jsp:include page="../../special/header.jsp" />
        <div class="wrapper">
            <fieldset>
                <legend>修改个人资料</legend>
                <s:form cssClass="userFacePreviewForm" action="user/account/addUserFacePreview" enctype="multipart/form-data" theme="simple">
                    <div class="userFacePreview">
                        <s:if test="#userFacePreviewFileName != null">
                            <img src="temp/userFacePreviews/${userFacePreviewFileName}" />
                        </s:if>
                        <s:elseif test="#user.userFaceFlag == 1">
                            <img src="userFaces/${user.userId}.jpg" />
                        </s:elseif>
                        <s:else>
                            <img src="images/icons/common/defaultUserFace.jpg" />
                        </s:else>
                        <label>选择头像</label>
                        <s:file name="file" id="img" size="30" />
                    </div>
                    <s:hidden name="user.userId" value="%{#user.userId}" />
                    <s:hidden name="user.userPersonalIntro" value="%{#user.userPersonalIntro}" />
                    <s:hidden name="user.userSex" value="%{#user.userSex}" />
                    <s:hidden name="user.userBirthdayYear" value="%{#user.userBirthdayYear}" />
                    <s:hidden name="user.userBirthdayMonth" value="%{#user.userBirthdayMonth}" />
                    <s:hidden name="user.userBirthdayDay" value="%{#user.userBirthdayDay}" />
                    <s:hidden name="user.userLv1AreaId" value="%{#user.userLv1AreaId}" />
                    <s:hidden name="user.userLv2AreaId" value="%{#user.userLv2AreaId}" />
                </s:form>
                <s:form cssClass="modifyUserData" action="user/account/modifyUserData" theme="simple">
                    <s:hidden name="user.userId" value="%{#session.USER.userId}" />
                    <s:hidden name="user.userFacePreviewFileName" value="%{#userFacePreviewFileName}" />
                    <div class="userPersonalIntro">
                        <label>自我简介</label>
                        <s:textarea name="user.userPersonalIntro" value="%{#user.userPersonalIntro}" />
                    </div>
                    <div class="userSex">
                        <label>性别</label>
                        <input type="radio" name="user.userSex" value="1" <s:if test="#user.userSex==1">checked="true"</s:if> />男
                        <input type="radio" name="user.userSex" value="2" <s:if test="#user.userSex==2">checked="true"</s:if> />女
                        <input type="radio" name="user.userSex" value="0" <s:if test="#user.userSex==0">checked="true"</s:if> />保密
                    </div>
                    <div class="userBirthday">
                        <label>生日</label>
                        <s:select name="user.userBirthdayYear" list="#years" value="%{#user.userBirthdayYear}" />年
                        <s:select name="user.userBirthdayMonth" list="#months" value="%{#user.userBirthdayMonth}" />月
                        <s:select name="user.userBirthdayDay" list="#days" value="%{#user.userBirthdayDay}" />日
                    </div>
                    <div class="userArea">
                        <label>所在地</label>
                        <s:select cssClass="lv1Areas" name="user.userLv1AreaId" list="#areas" listKey="areaId" listValue="areaName" value="%{#user.userLv1AreaId}" />
                        <select class="lv2Areas" name="user.userLv2AreaId">
                            <option value="0">不限</option>
                        </select>
                    </div>
                    <div class="allLv2Areas">
                        <select class="0">
                            <option value="0">不限</option>
                        </select>
                        <s:iterator value="#areas" id="lv1Area">
                            <s:if test="#lv1Area.childrenArea != null">
                                <s:select cssClass="%{#lv1Area.areaId}" list="#lv1Area.childrenArea" listKey="areaId" listValue="areaName" value="%{#user.userLv2AreaId}" />
                            </s:if>
                        </s:iterator>  
                    </div>
                    <a class="sure" href="#">确定修改</a> 
                </s:form>
            </fieldset>
        </div>
        <%-- 尾部 --%>
        <jsp:include page="../../special/footer.jsp" />
    </body>
</html>
