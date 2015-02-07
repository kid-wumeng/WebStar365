$(document).ready(function(){
    /* 修改属性名 */
    $("td.attrName a").click(function(){
        var attrId = $(this).parents("tr").attr("attrId");  //获取属性编号
        var oldAttrName = $(this).prev("span").text();  //获取旧属性名
        var newAttrName = prompt("新属性名：", oldAttrName);  //输入新属性名
        if(newAttrName != null && /^\s*$/.test(newAttrName) == false) {  //属性名不能为null或纯空白
            /* 修改属性名，并返回结果 */
            $.post(
                "admin/modifyAttrName",
                {
                    "attr.attrId" : attrId,
                    "attr.attrName" : newAttrName
                },
                function(xml) {
                    var attrName = $(xml).find("attrName").text();
                    $("tr[attrId=" + attrId + "] td.attrName span").text(attrName);
                }
            );
        }
        return false;  //阻止链接默认行为
    });
    
    /* 修改属性介绍 */
    $("td.attrIntro a").click(function(){
        var attrId = $(this).parents("tr").attr("attrId");  //获取属性编号
        var oldAttrIntro = $(this).prev("span").text();  //获取旧属性介绍
        var newAttrIntro = prompt("新属性介绍：", oldAttrIntro);  //输入新属性介绍
        if(newAttrIntro != null) {  //属性介绍不能为null
            /* 修改属性介绍，并返回结果 */
            $.post(
                "admin/modifyAttrIntro",
                {
                    "attr.attrId" : attrId,
                    "attr.attrIntro" : newAttrIntro
                },
                function(xml) {
                    var attrIntro = $(xml).find("attrIntro").text();
                    $("tr[attrId=" + attrId + "] td.attrIntro span").text(attrIntro);
                }
            );
        }
        return false;  //阻止链接默认行为
    });
});


