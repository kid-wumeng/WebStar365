$(document).ready(function(){
    
    var checkStatusOfPage = parseInt($(".selectCheckStatus form .checkStatusOfPage").val());  //页面显示的是什么审核状态
    var websiteId;
    
    var nowPageNo = parseInt($(".nowPageNo").attr("value"));  //当前页码
    var totalPageNum = parseInt($(".totalPageNum").attr("value"));  //总页数
    
    $(".websiteDetails .checkInfo").hide();
    
    /* 打开详情界面 */
    $(".showWebsiteDetails").click(function(){
        websiteId = parseInt($(this).parent("td").parent("tr").attr("websiteId"));  //网站编号
        var websiteCheckStatus = parseInt($(this).parent("td").parent("tr").attr("websiteCheckStatus"));  //网站审核状态
        var adminName = $(this).parent("td").siblings(".adminName").text();  //审核者
        var websiteCheckFailReason = $(this).parent("td").siblings(".websiteCheckFailReason").text();  //网站审核失败的理由
        var userNickName = $(this).parent("td").siblings(".userNickName").text();  //提交者
        var websiteName = $(this).parent("td").siblings(".websiteName").text();  //站名
        var websiteDomain = $(this).parent("td").siblings(".websiteDomain").text();  //网址
        var websiteIntro = $(this).parent("td").siblings(".websiteIntro").text();  //介绍
        $(".websiteDetails .checkInfo .adminName").text("审核者：" + adminName);
        $(".websiteDetails .checkInfo .websiteCheckFailReason").text("审核失败的理由：" + websiteCheckFailReason);
        switch(websiteCheckStatus) {
            case 0:
                $(".websiteDetails .websiteInfo .websiteCheckStatus").text("状态：待审核"); break;
            case 1:
                $(".websiteDetails .websiteInfo .websiteCheckStatus").text("状态：已通过审核"); break;
            case 2:
                $(".websiteDetails .websiteInfo .websiteCheckStatus").text("状态：审核失败"); break;
        }
        if(websiteCheckStatus == 2) {
            $(".websiteDetails .checkInfo").show();
        }
        $(".websiteDetails .websiteInfo .userNickName").text("提交者：" + userNickName); 
        $(".websiteDetails .websiteInfo .websiteName").text("站名：" + websiteName); 
        $(".websiteDetails .websiteInfo .websiteDomain").text("网址：" + websiteDomain); 
        $(".websiteDetails .websiteInfo .websiteIntro").text(websiteIntro); 
        var width = $(window).width();  //获取浏览器宽度
        var height = $(window).height();  //获取浏览器高度
        var y = height / 6;  //评论界面的y值
        $(".websiteDetails").css("width", width + "px");  //设置评论界面阴影的宽度          
        $(".websiteDetails").css("height", height + "px");  //设置评论界面阴影的高度 
        if(websiteCheckStatus == 2) {
            $(".websiteDetails .checkInfo").css("margin", y + "px auto 0");  //设置评论界面的y值
        }
        else {
            $(".websiteDetails .websiteInfo").css("margin", y + "px auto 0");  //设置评论界面的y值
        }
        $(".websiteDetails").show();
        return false;
    });
    
    /* 关闭详情界面 */
    $(".websiteDetails .close button").click(function(){
        $(".websiteDetails .checkInfo").hide();
        $(".websiteDetails").hide();
    });
    
    /* 打开选择审核状态的界面 */
    $(".editCheckStatus").click(function(){
        websiteId = parseInt($(this).parent("td").parent("tr").attr("websiteId"));
        var websiteCheckStatus = $(this).parent("td").parent("tr").attr("websiteCheckStatus");
        var width = $(window).width();  //获取浏览器宽度
        var height = $(window).height();  //获取浏览器高度
        var y = height / 4;  //评论界面的y值
        $(".selectCheckStatus").css("width", width + "px");  //设置评论界面阴影的宽度          
        $(".selectCheckStatus").css("height", height + "px");  //设置评论界面阴影的高度 
        $(".selectCheckStatus form").css("margin", y + "px auto");  //设置评论界面的y值
        $(".selectCheckStatus form input[type='radio'][value='" + websiteCheckStatus + "']").attr("checked", "checked");
        $(".selectCheckStatus").show();
        return false;
    });

    /* 修改审核状态s */
    $(".selectCheckStatus form input[type=submit]").click(function(){
        var adminId = parseInt($(".header .adminId").val());
        var websiteCheckStatus = parseInt($(".selectCheckStatus form :radio[checked]").attr("value"));
        var websiteCheckFailReason = null;
        if(websiteCheckStatus == 2) {
            websiteCheckFailReason = prompt("不能通过审核的理由：", "");  //输入新属性名
        }
        /* 使用Ajax修改审核状态 */
        $.post(
            "admin/modifyWebsiteRecommendCheckStatus",
            {
                "websiteRecommend.websiteId" : websiteId,
                "websiteRecommend.adminId" : adminId,
                "websiteRecommend.websiteCheckStatus" : websiteCheckStatus,
                "websiteRecommend.websiteCheckFailReason" : websiteCheckFailReason
            },
            function(xml) {
                var success = $(xml).find("success").text();
                if(success == "true") {
                    if(websiteCheckStatus != checkStatusOfPage) {
                        $("tr[websiteId=" + websiteId + "]").hide();
                    }
                    alert("修改状态成功。");
                }
                else {
                    alert("修改状态失败！");
                }
            }
        );
        $(".selectCheckStatus").hide();
        return false;
    });
    
    /* 点击“首页” */
    $(".firstPage").click(function(){
        $(".searchPageNo").attr("value", 1);
        $(".page .searchWebsiteRecommends").submit();
    });
    /* 点击“上一页” */
    $(".prevPage").click(function(){
        $(".searchPageNo").attr("value", nowPageNo - 1);
        $(".page .searchWebsiteRecommends").submit();
    });
    /* 点击“下一页” */
    $(".nextPage").click(function(){
        $(".searchPageNo").attr("value", nowPageNo + 1);
        $(".page .searchWebsiteRecommends").submit();
    });
    /* 点击“末页” */
    $(".lastPage").click(function(){
        $(".searchPageNo").attr("value", totalPageNum);
        $(".page .searchWebsiteRecommends").submit();
    });
    /* 点击“跳转” */
    $(".goto").click(function(){
        var targetPageNo = $(".targetPageNo input[type=text]").attr("value");
        if(!isNaN(targetPageNo)){
            targetPageNo = parseInt(targetPageNo);
            if(targetPageNo < 1 || targetPageNo > totalPageNum) {
                alert("输入的页码超出范围，请重新输入。");
            }
            else if(targetPageNo == nowPageNo) {
                return false;
            }
            else {
                $(".searchPageNo").attr("value", targetPageNo);
                $(".page .searchWebsiteRecommends").submit();
            }
        }
        else {
            alert("输入的页码不是数字，请重新输入。");
        }
    });

});
