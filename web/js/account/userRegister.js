$(document).ready(function(){
    
    $(".register").click(function(){
        var userAccount = $(".userRegister .userAccount input").val();
        var userPass = $(".userRegister .userPass input").val();
        var userPass2 = $(".userRegister .userPass2 input").val();
        var userNickName = $(".userRegister .userNickName input").val();
        var userEmail = $(".userRegister .userEmail input").val();
        var agree = $(".userRegister .agree input").attr("checked") == "checked" ? true : false;
        if(userAccount == "") 
            alert("帐号不能为空。");
        else if(userAccount.length < 6)
            alert("帐号太短，至少要6位。");
        else if(userAccount.length > 18)
            alert("帐号太长，最多18位。");
        else if(!/^([a-z]|[0-9])+$/.test(userAccount))
            alert("帐号只能使用小写字母或数字。");
        else if(userPass == "") 
            alert("密码不能为空。");
        else if(userPass.length < 6) 
            alert("密码太短，至少要6位。");
        else if(userPass.length > 18) 
            alert("密码太长，最多18位。");
        else if(!/^([a-z]|[0-9])+$/.test(userPass)) 
            alert("密码只能使用小写字母或数字。");
        else if(userPass2 == "")
            alert("密码确认不能为空。");
        else if(userPass != userPass2) 
            alert("两次输入的密码不一致。");
        else if(userNickName == "") 
            alert("昵称不能为空。");
        else if(/\s+/.test(userNickName)) 
            alert("昵称中不能出现空格或空白字符。");
        else if(userNickName.length > 12) 
            alert("昵称不能超过12位字符。");
        else if(userEmail == "")
            alert("电子邮箱不能为空");
        else if(!/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/.test(userEmail)) 
            alert("电子邮箱格式不正确。");
        else if(!agree) 
            alert("同意注册协议并打勾，才能继续注册喔~")
        else {
            /* 添加待验证用户，并返回结果 */
            $.post(
                "account/userRegister",
                {
                    "user.userAccount" : userAccount,
                    "user.userPass" : userPass,
                    "user.userNickName" : userNickName,
                    "user.userEmail" : userEmail,
                    "agree" : agree
                },
                function(xml) {
                    var success = $(xml).find("success").text();
                    if(success == "true") {
                        window.location.href="account/sendNewUserValidMailSuccess.jsp";
                    }
                    else {
                        var errorReason = $(xml).find("errorReason").text();
                        if(errorReason == 1) 
                            alert("同意注册协议并打勾，才能继续注册喔~");
                        else if(errorReason == 2)
                            alert("此帐号已存在，请换一个。");
                        else if(errorReason == 3)
                            alert("此昵称已存在，请换一个。");
                        else if(errorReason == 4)
                            alert("无法创建新帐号，原因未知，请联系网站管理员。");
                    }
                }
            );
        }
        return false;
    });

});