$(document).ready(function(){
    
    var nowPageNo = parseInt($(".nowPageNo").attr("value"));  //当前页码
    var totalPageNum = parseInt($(".totalPageNum").attr("value"));  //总页数

/* 点击“首页” */
    $(".firstPage").click(function(){
        $(".searchPageNo").attr("value", 1);
        $(".searchComments").submit();
        return false;
    });
    /* 点击“上一页” */
    $(".prevPage").click(function(){
        $(".searchPageNo").attr("value", nowPageNo - 1);
        $(".searchComments").submit();
        return false;
    });
    /* 点击“下一页” */
    $(".nextPage").click(function(){
        $(".searchPageNo").attr("value", nowPageNo + 1);
        $(".searchComments").submit();
        return false;
    });
    /* 点击“末页” */
    $(".lastPage").click(function(){
        $(".searchPageNo").attr("value", totalPageNum);
        $(".searchComments").submit();
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
                $(".searchComments").submit();
            }
        }
        else {
            alert("输入的页码不是数字，请重新输入。");
        }
        return false;
    });
    
});

