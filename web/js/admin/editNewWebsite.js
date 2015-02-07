$(document).ready(function(){
    
    /* 声明变量 */
    var selectedAttrIds = new Array();  //存放选中的属性编号的数组
    var selectedAttrNames = new Array();  //存放选中的属性名的数组
    
    
    var width = $(window).width() ;  //获取浏览器宽度
    var height = $(window).height();  //获取浏览器高度
    $(".attrOption").css("width", width + "px");  //设置评论界面阴影的宽度          
    $(".attrOption").css("height", height + "px");  //设置评论界面阴影的高度 
    
    
//    /* 添加新网站前，判断是不是选择了分类 */
//    $("input[type=submit]").click(function(){
//        var catId = $(".catId").attr("value");  //选择的分类编号
//        if(catId == 0) {  //如果没选择分类（分类编号为0代表没选择），则提示选择分类，并阻止本次表单提交
//            alert("请选择分类！");
//            return false;
//        }
//    });
    
    
    /* 点击选择属性按钮 */
    $(".selectAttrs").click(function(){
        selectedAttrIds = [];  //选中属性编号数组清零
        selectedAttrNames = [];  //选中属性名数组清零
        $(".selectedAttrIds").text("");  //选中属性编号的隐藏行清空
        $(".attrOption ul li").each(function(){  //将每一个属性的选中标志位设为no
            var selectedFlag = $(this).attr("selectedFlag");  //当前属性是否已被选中
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
    $(".attrOption ul button").click(function(){
        $(".attrOption ul li").each(function(){  //如果属性被选中，则添加属性编号和属性名到相应的数组中
            if($(this).attr("selectedFlag") == "yes") {
                selectedAttrIds.push($(this).attr("attrId"));
                selectedAttrNames.push($(this).text());
            }    
        });
        var selectedAttrIdHiddens = "";  //选中的属性编号组成的隐藏行的集合
        for(id in selectedAttrIds) {  //将全部选中的属性编号隐藏行组合到一起
            selectedAttrIdHiddens += "<input type='hidden' name='website.websiteAttrs.attrId' value='" + selectedAttrIds[id] + "' />";
        }
        $(".selectedAttrIds").html(selectedAttrIdHiddens);  //添加选中的属性编号隐藏行
        selectedAttrNames = selectedAttrNames.join(" ");  //将全部选中的属性名组合到一起，之间以空格分隔
        $(".selectedAttrNames").attr("value", selectedAttrNames);  //将全部选中的属性名添加到属性名文本框
        $(".attrOption").hide();  //隐藏属性选择界面
    });
    
    
    /* 点击重置条件按钮时，已选属性条件也清空 */
    $(".reset").click(function(){
        $(".selectedAttrIds").html("");
        $(".selectedAttrNames").attr("value", "");
    });
});
