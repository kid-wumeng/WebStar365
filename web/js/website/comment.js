$(document).ready(function(){
    
    var nowPageNo = parseInt($(".nowPageNo").attr("value"));  //当前页码
    var totalPageNum = parseInt($(".totalPageNum").attr("value"));  //总页数
    
    /* 发表回应 */
    $(".publish").click(function(){
        var echoContent = $(".addEcho form .echoContent").val();
        var echoContentWordNum = echoContent.length;
        if(echoContent == "") {
            alert("回应不能为空。")
        }
        else if(echoContentWordNum > 1000) {
            alert("回应字数太多，最多只能写1000字。当前字数：" + echoContentWordNum);
        }
        else {
            $(".addEcho form").submit();
        } 
        return false;
    });
    
    /* 点击“首页” */
    $(".firstPage").click(function(){
        $(".searchPageNo").attr("value", 1);
        $(".searchEchos").submit();
        return false;
    });
    /* 点击“上一页” */
    $(".prevPage").click(function(){
        $(".searchPageNo").attr("value", nowPageNo - 1);
        $(".searchEchos").submit();
        return false;
    });
    /* 点击“下一页” */
    $(".nextPage").click(function(){
        $(".searchPageNo").attr("value", nowPageNo + 1);
        $(".searchEchos").submit();
        return false;
    });
    /* 点击“末页” */
    $(".lastPage").click(function(){
        $(".searchPageNo").attr("value", totalPageNum);
        $(".searchEchos").submit();
        return false;
    });
    /* 点击“跳转” */
    $(".goto").click(function(){
        var targetPageNo = $(".targetPageNo input[type=text]").attr("value");
        if(targetPageNo == "") {
            alert("请输入页码。");
        }
        else if(!isNaN(targetPageNo)){
            targetPageNo = parseInt(targetPageNo);
            if(targetPageNo < 1 || targetPageNo > totalPageNum) {
                alert("输入的页码超出范围，请重新输入。");
            }
            else if(targetPageNo == nowPageNo) {
                return false;
            }
            else {
                $(".searchPageNo").attr("value", targetPageNo);
                $(".searchEchos").submit();
            }
        }
        else {
            alert("输入的页码不是数字，请重新输入。");
        }
        return false;
    });

});