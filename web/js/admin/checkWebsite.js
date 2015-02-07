$(document).ready(function(){
    
    /* 核对网站 */
    $(".check").click(function(){
        var websiteDomain = $(".websiteDomain input").attr("value");
        if(websiteDomain == "") {
            alert("请输入要核对的网址");
            return false;
        }
        $.post(
            "admin/checkWebsite",
            {
                "website.websiteDomain" : websiteDomain
            },
            function(xml) {
                var success = $(xml).find("success").text();
                if(success == "true") {
                    $(".result").css("color", "red");
                    $(".result").text(websiteDomain + " 已存在！");
                }
                else if(success == "false") {
                    $(".result").css("color", "green");
                    $(".result").text(websiteDomain + " 尚未收录。");
                }
                else {
                    $(".result").css("color", "gray");
                    $(".result").text("核对出现问题，请联系技术人员。");
                }
            }
        );
        return false;
    });

});