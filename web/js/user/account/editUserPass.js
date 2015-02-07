$(document).ready(function(){
    
    $(".sure").click(function(){
        var userPass = $(".modifyUserPass .userPass input").val();
        var userPass2 = $(".modifyUserPass .userPass2 input").val();
        if(userPass == "") 
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
        else {
            $(".modifyUserPass").submit();
        }
        return false;
    });

});