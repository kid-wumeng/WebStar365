$(document).ready(function(){
    
    $(".submit").click(function(){
        var websiteName = $(".websiteName input").val();
        var websiteDomain = $(".websiteDomain input").val();
        var websiteIntro = $(".websiteIntro textarea").val();
        var websiteRecommendUserId = $(".websiteRecommendUserId").val();
        if(websiteName == "") {
            alert("站名不能为空");
            return false;
        }
        if(websiteDomain == "") {
            alert("地址不能为空");
            return false;
        }
        /* 检查是否已存在此域名的网站推荐 */
        $.post(
            "user/checkWebsiteRecommendDomain",
            {
                "websiteRecommend.websiteDomain" : websiteDomain,
                "websiteRecommend.userId" : websiteRecommendUserId
            },
            function(xml) {
                var success = $(xml).find("success").text();
                if(success != "true") {
                    alert("您已推荐过本地址的网站，请勿重复提交。");
                    return false;
                }
            }
        );
        /* 添加网站推荐 */
        $.post(
            "user/recommendWebsite",
            {
                "websiteRecommend.websiteName" : websiteName,
                "websiteRecommend.websiteDomain" : websiteDomain,
                "websiteRecommend.websiteIntro" : websiteIntro,
                "websiteRecommend.userId" : websiteRecommendUserId
            },
            function(xml) {
                var success = $(xml).find("success").text();
                if(success == "true") {
                    alert("提交成功！");
                    window.location.href="user/recommendWebsite.jsp";
                }
                else {
                    alert("提交失败，原因未知。请联系网站管理员。");
                }
            }
        );
        return false;
    });

});