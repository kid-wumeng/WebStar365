$(document).ready(function(){
    
    $("table tr").hover(
        function(){
            if($(this).attr("class") == "odd_true" || $(this).attr("class") == "odd_false") {
                $(this).css("background-color", "#f6f5ec");
            }
        },
        function(){
            if($(this).attr("class") == "odd_true") {
                $(this).css("background-color", "#fbfbfb");
            }
            else if($(this).attr("class") == "odd_false") {
                $(this).css("background-color", "#f5f5f5");
            }
        }
    );
        
        
   $(".websiteName").hover(
       function(){
           $(this).children("a").css("text-shadow", "0px 0px 1px #4a4a4a");
       },
       function(){
           $(this).children("a").css("text-shadow", "none");
       }
   );
       
       
   $(".websiteDomain").hover(
       function(){
           $(this).children("a").css("text-shadow", "0px 0px 1px #4a4a4a");
       },
       function(){
           $(this).children("a").css("text-shadow", "none");
       }
   );
       
       
   $(".websiteDetailedIntro").hover(
       function(){
           $(this).children("a").css("text-shadow", "0px 0px 1px #4a4a4a");
       },
       function(){
           $(this).children("a").css("text-shadow", "none");
       }
   );
       
   $(".enter").hover(
       function(){
           $(this).children("a").css("text-shadow", "0px 0px 1px #4a4a4a");
       },
       function(){
           $(this).children("a").css("text-shadow", "none");
       }
   );
    
});



