$(document).ready(function(){
  
    /* 搜索栏获得焦点 */    
    $(".searchBox").focus(function(){
        $(this).css("background-color", "#fff");
    })
    /* 搜索栏失去焦点 */    
    $(".searchBox").focusout(function(){
        $(this).css("background-color", "#fbfbfb");
    })
    
    /* 搜索网站 */
    $(".searchButton").click(function(){
        $(".search form").submit();
        return false;
    });
});


