$(document).ready(function(){
    
    var nowPageNo = parseInt($(".nowPageNo").attr("value"));  //当前页码
    var totalPageNum = parseInt($(".totalPageNum").attr("value"));  //总页数
    
    /* 点亮当前展现风格的图标 */
    var nowDisplayStyle = $(".displayStyle").attr("value");
    switch(nowDisplayStyle) {
        case "list":
            $(".list").css("background", "url(images/icons/common/searchResult_list_yes.png) center no-repeat")
            break; 
        case "grid":
            $(".grid").css("background", "url(images/icons/common/searchResult_grid_yes.png) center no-repeat")
            break;
        case "table":
            $(".table").css("background", "url(images/icons/common/searchResult_table_yes.png) center no-repeat")
            break;
    }
    
    /* 选择列表风格 */
    $(".list").click(function(){
        if(nowDisplayStyle != "list") {
            $(".displayStyle").attr("value","list");
            $(".search form").submit();
        }
        return false;
    });
    /* 选择格子风格 */
    $(".grid").click(function(){
        if(nowDisplayStyle != "grid") {
            $(".displayStyle").attr("value","grid");
            $(".search form").submit();
        }
        return false;
    });
    /* 选择表格风格 */
    $(".table").click(function(){
        if(nowDisplayStyle != "table") {
            $(".displayStyle").attr("value","table");
            $(".search form").submit();
        }
        return false;
    });
    
    /* 点击“首页” */
    $(".firstPage").click(function(){
        $(".searchPageNo").attr("value", 1);
        $(".search form").submit();
        return false;
    });
    /* 点击“上一页” */
    $(".prevPage").click(function(){
        $(".searchPageNo").attr("value", nowPageNo - 1);
        $(".search form").submit();
        return false;
    });
    /* 点击“下一页” */
    $(".nextPage").click(function(){
        $(".searchPageNo").attr("value", nowPageNo + 1);
        $(".search form").submit();
        return false;
    });
    /* 点击“末页” */
    $(".lastPage").click(function(){
        $(".searchPageNo").attr("value", totalPageNum);
        $(".search form").submit();
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
                $(".search form").submit();
            }
        }
        else {
            alert("输入的页码不是数字，请重新输入。");
        }
        return false;
    });
    
});


