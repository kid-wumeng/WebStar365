$(document).ready(function(){
    
    /* 修改属性近义词名 */
    $("td.attrSynonymName a").click(function(){
        var attrSynonymId = $(this).parents("tr").attr("attrSynonymId");  //获取属性近义词编号
        var oldAttrSynonymName = $(this).prev("span").text();  //获取旧属性近义词名
        var newAttrSynonymName = prompt("新属性名：", oldAttrSynonymName);  //输入新属性近义词名
        if(newAttrSynonymName != null && /^\s*$/.test(newAttrSynonymName) == false) {  //属性近义词名不能为null或纯空白
            /* 修改属性近义词名，并返回结果 */
            $.post(
                "admin/modifyAttrSynonym",
                {
                    "attrSynonym.attrSynonymId" : attrSynonymId,
                    "attrSynonym.attrSynonymName" : newAttrSynonymName
                },
                function(xml) {
                    var attrSynonymName = $(xml).find("attrSynonymName").text();
                    $("tr[attrSynonymId=" + attrSynonymId + "] td.attrSynonymName span").text(attrSynonymName);
                }
            );
        }
        return false;  //阻止链接默认行为
    });

});


