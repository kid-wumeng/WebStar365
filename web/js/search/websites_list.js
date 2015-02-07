$(document).ready(function(){
    
    $(".website").hover(
        function(){
            $(this).css("background", "#f6f5ec");
        },
        function(){
            $(this).css("background", "url(images/icons/common/bg_list_website.jpg) left bottom repeat-x #F2F2F2");
        }
    );
    
    
    $(".website .row1 a").hover(
        function(){
            $(this).parent(".row1").css("text-shadow", "0px 0px 1px #843900");
        },
        function(){
            $(this).parent(".row1").css("text-shadow", "none");
        }
    );
    
});



