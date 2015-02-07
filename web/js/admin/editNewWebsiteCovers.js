$(document).ready(function(){
    /* 上传网站封面前，判断为哪些新网站添加了封面 */
    $("input[type=submit]").click(function(){
        $(".websiteCover").each(function(){
            var uploadWebsiteCover = $(this).find("input[type=file]").attr("value");
            if(uploadWebsiteCover != "") {
                $(this).find("input.uploadCoverFlag").attr("value", "true");
            }
        });
    });
});
