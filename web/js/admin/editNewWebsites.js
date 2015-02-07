$(document).ready(function(){
    
    /* 声明变量 */
    var websiteIndex;  //正在选择属性的网站的索引号
    var selectedAttrIds = new Array();  //选中的属性编号的集合
    var selectedAttrNames = new Array();  //选中的属性名的集合
    var oldSelectedAttrIds = new Array();  //之前已选中属性编号的集合
    
    
    var width = $(window).width() ;  //获取浏览器宽度
    var height = $(window).height();  //获取浏览器高度
    $(".attrOption").css("width", width + "px");  //设置评论界面阴影的宽度          
    $(".attrOption").css("height", height + "px");  //设置评论界面阴影的高度 
 
 
//    /* 添加新网站前，判断是不是选择了分类 */
//    $("input[type=submit]").click(function(){
//        var noCatWebsites = new Array();  //未选择分类的网站的集合
//        $(".websiteCat").each(function(){
//            var catId = $(this).children("select").attr("value");  //当前网站选择的分类
//            var websiteName = $(this).parent().siblings(".row1").children(".websiteName").children("input").attr("value");  //当前网站名
//            var websiteDomain = $(this).parent().siblings(".row1").children(".websiteDomain").children("input").attr("value");  //当前网站域名
//            if(websiteDomain != null && (/^\s*$/.test(websiteDomain) == false) && catId == 0) {  //如果填写了网站域名但没选择分类（分类编号为0代表没选择），则将提示信息加入noCatWebsites
//                noCatWebsites.push(websiteName + "（"+websiteDomain + "） 尚未选择分类！");
//            }
//        });
//        if(noCatWebsites.length > 0) {
//            alert(noCatWebsites.join("\n"));
//            return false;
//        }
//    });
    
    
    /* 点击“选择属性” */
    $(".selectAttrs").click(function(){
        websiteIndex = $(this).parents(".website").attr("websiteIndex");  //网站序号（从0开始）
        selectedAttrIds = [];  //选中属性编号数组清零
        selectedAttrNames = [];  //选中属性名数组清零
        oldSelectedAttrIds = [];  //之前已选中属性编号数组清零
        /* 获取当前网站之前选择的属性编号 */
        $(".website[websiteIndex=" + websiteIndex + "] .row3 .websiteAttrs .selectedAttrIds input").each(function(){
            oldSelectedAttrIds.push($(this).attr("value"));
        });
        /*  */
        $(".attrOption ul li").each(function(){  
            var attrId = $(this).attr("attrId");  //属性编号
            var selectedFlag = existElementInArray(oldSelectedAttrIds, attrId) ? "yes" : "no";  //当前属性是否已被选中
            $(this).attr("selectedFlag", selectedFlag);  //设置选中标志位
            /* 选中项的样式 */
            if( selectedFlag == "yes") {
                $(this).children("a").css("color", "#fff");
                $(this).css("background-color", "#9999ff");
                $(this).css("border", "1px solid #555");
            }
            /* 未选中项的样式 */
            else if(selectedFlag == "no") {
                $(this).children("a").css("color", "#000");
                $(this).css("background-color", "#fff");
                $(this).css("border", "1px solid #ccc");
            }
        });
        $(this).siblings("selectedAttrIds").text("");  //当前行的选中属性编号的隐藏行清空
        $(".attrOption").show();  //显示属性选择界面
    });
    
    
    /* 选择属性（可多选） */
    $(".attrOption ul li").click(function(){
        var selectedFlag = $(this).attr("selectedFlag");  //当前属性是否已被选中
        selectedFlag = selectedFlag=="no" ? "yes" : "no";  //选中则改成未选中，未选中则改成选中
        $(this).attr("selectedFlag", selectedFlag);  
        /* 选中项的样式 */
        if( selectedFlag == "yes") {
            $(this).children("a").css("color", "#fff");
            $(this).css("background-color", "#9999ff");
            $(this).css("border", "1px solid #555");
        }
        /* 未选中项的样式 */
        else if(selectedFlag == "no") {
            $(this).children("a").css("color", "#000");
            $(this).css("background-color", "#fff");
            $(this).css("border", "1px solid #ccc");
        }
        return false;
    });
    
    
    /* 点击“选择以上属性” */
    $(".attrOption button").click(function(){
        $(".attrOption ul li").each(function(){  //如果属性被选中，则添加属性编号和属性名到相应的数组中
            if($(this).attr("selectedFlag") == "yes") {
                selectedAttrIds.push($(this).attr("attrId"));
                selectedAttrNames.push($(this).text());
            }    
        });
        var selectedAttrIdHiddens = "";  //选中的属性编号组成的隐藏行的集合
        for(id in selectedAttrIds) {  //将全部选中的属性编号隐藏行组合到一起
            selectedAttrIdHiddens += "<input type='hidden' name='websites[" + websiteIndex + "].websiteAttrs.attrId' value='" + selectedAttrIds[id] + "' />";
        }
        $("div[websiteIndex=" + websiteIndex + "] .websiteAttrs .selectedAttrIds").html(selectedAttrIdHiddens);  //添加选中的属性编号隐藏行
        selectedAttrNames = selectedAttrNames.join(" ");  //将全部选中的属性名组合到一起，之间以空格分隔
        $("div[websiteIndex=" + websiteIndex + "] .websiteAttrs .selectedAttrNames").attr("value", selectedAttrNames);  //将全部选中的属性名添加到属性名文本框
        $(".attrOption").hide();  //隐藏属性选择界面
        $(".attrOption ul li").attr("selectedFlag", no);
        $(".attrOption ul li").children("a").css("color", "#000");
        $(".attrOption ul li").css("background-color", "#fff");
        $(".attrOption ul li").css("border", "1px solid #ccc");
    });
    
    
    /* 点击重置条件按钮时，已选属性条件也清空 */
    $(".reset").click(function(){
        $(".selectedAttrIds").html("");
        $(".selectedAttrNames").attr("value", "");
    });
    
    /* 函数：判断数组中是否有某元素 */
    function existElementInArray(arr, e) {
        for(i=0; i<arr.length; i++) {
            if(arr[i] == e)
                return true;
        }        
        return false;
    }
    
});
