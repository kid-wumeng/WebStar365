$(document).ready(function(){
    var nowLv1AreaId;  //当前选择的一级地区编号
    
    nowLv1AreaId = $(".userArea .lv1Areas").attr("value");
    $(".userArea .lv2Areas").html($(".allLv2Areas select[class=" + nowLv1AreaId + "]").html());
    
    /* 选择用户头像后，刷新页面显示预览图 */
    $(".userFacePreview input[type=file]").change(function(){
        /* 记录当前用户填写的资料 */
        var userPersonalIntro = $(".userPersonalIntro textarea").attr("value");
        var userSex = $(".userSex :radio[checked]").attr("value");
        var userBirthdayYear = $(".userBirthday select[name='user.userBirthdayYear']").attr("value");
        var userBirthdayMonth = $(".userBirthday select[name='user.userBirthdayMonth']").attr("value");
        var userBirthdayDay = $(".userBirthday select[name='user.userBirthdayDay']").attr("value");
        var userLv1AreaId = $(".userArea .lv1Areas").attr("value");
        var userLv2AreaId = $(".userArea .lv2Areas").attr("value");
        $(".userFacePreviewForm input[name='user.userPersonalIntro']").attr("value", userPersonalIntro);
        $(".userFacePreviewForm input[name='user.userSex']").attr("value", userSex);
        $(".userFacePreviewForm input[name='user.userBirthdayYear']").attr("value", userBirthdayYear);
        $(".userFacePreviewForm input[name='user.userBirthdayMonth']").attr("value", userBirthdayMonth);
        $(".userFacePreviewForm input[name='user.userBirthdayDay']").attr("value", userBirthdayDay);
        $(".userFacePreviewForm input[name='user.userLv1AreaId']").attr("value", userLv1AreaId);
        $(".userFacePreviewForm input[name='user.userLv2AreaId']").attr("value", userLv2AreaId);
        /* 提交表单 */
        $(".userFacePreviewForm").submit();
    });
    
    /* 一级地区改变时，联动改变二级地区 */
    $(".userArea .lv1Areas").change(function(){
        nowLv1AreaId = $(this).attr("value");
        $(".userArea .lv2Areas").html($(".allLv2Areas select[class=" + nowLv1AreaId + "]").html());
    });
    
    /* 修改用户资料 */
    $(".modifyUserData .sure").click(function(){
        var userPersonalIntroWordNum = $(".userPersonalIntro textarea").val().length;
        if(userPersonalIntroWordNum > 100) {
            alert("个人介绍字数太多，请不要超过100个字。现在字数：" + userPersonalIntroWordNum);
            return false;
        }
        $(".modifyUserData").submit();
        return false;        
    });
});

