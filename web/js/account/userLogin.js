$(document).ready(function(){
    
    $(".login").click(function(){
        var userAccount = $(".userLogin .userAccount input").val();
        var userPass = $(".userLogin .userPass input").val();
        var cookieFlag = $(".userLogin .rememberMe input").attr("checked") == "checked" ? true : false;
        if(userAccount == "") 
            alert("帐号不能为空。");
        else if(userPass == "") 
            alert("密码不能为空。");
        else {
            /* 添加待验证用户，并返回结果 */
            $.post(
                "account/userLogin",
                {
                    "user.userAccount" : userAccount,
                    "user.userPass" : userPass,
                    "cookieFlag" : cookieFlag
                },
                function(xml) {
                    var success = $(xml).find("success").text();
                    if(success == "true") {
                        window.location.href="index.jsp";
                    }
                    else {
                        var errorReason = $(xml).find("errorReason").text();
                        if(errorReason == 1) {
                            var sendMailFlag = confirm("此帐号尚未激活，请到注册时填写的邮箱收取验证邮件。是否再次发送验证邮件？（确定：发送 | 取消：不发送）");
                            if(sendMailFlag == true) {
                                $(".sendNewUserValidMail .userAccount").val(userAccount);
                                $(".sendNewUserValidMail .userPass").val(userPass);
                                $(".sendNewUserValidMail").submit();
                            }
                        }
                        else if(errorReason == 2)
                            alert("帐号或密码错误。");
                    }
                }
            );
        }
        return false;
    });

});