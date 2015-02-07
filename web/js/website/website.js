$(document).ready(function(){
    
    var nowStar = $(".editComment form input[name='comment.commentStar']").attr("value");  //当前选择的星数
    var hint1 = "极差";
    var hint2 = "很差";
    var hint3 = "较差";
    var hint4 = "一般";
    var hint5 = "较好";
    var hint6 = "很好";
    var hint7 = "极好";
    var hintColor1 = "#ff3333";
    var hintColor2 = "#ff9900";
    var hintColor3 = "#F5CF3B";
    var hintColor4 = "#7CBF49";
    var hintColor5 = "#71C7D5";
    var hintColor6 = "#0066ff";
    var hintColor7 = "#9900cc";
    
    
    /* 点击评论按钮（显示评论界面） */
    $(".remark").click(function(){
        $(".editComment form .row2 .selectStar").css("background","url(images/icons/star/star" + nowStar + ".png) no-repeat");  //改变星星颜色
        var width = $(window).width();  //获取浏览器宽度
        var height = $(window).height();  //获取浏览器高度
        $(".editComment").css("width", width + "px");  //设置评论界面阴影的宽度          
        $(".editComment").css("height", height + "px");  //设置评论界面阴影的高度 
        /* 如果星数不为0（既已评论过，则显示相应的提示文本和颜色） */
        if(nowStar != 0) {
            var hint;  //提示文本
            var hintColor;  //提示文本的颜色
            /* 根据星星，设置提示文本及其颜色 */
            switch(parseInt(nowStar)) {
                case 1:hint = hint1;hintColor = hintColor1;break;
                case 2:hint = hint2;hintColor = hintColor2;break;
                case 3:hint = hint3;hintColor = hintColor3;break;
                case 4:hint = hint4;hintColor = hintColor4;break;
                case 5:hint = hint5;hintColor = hintColor5;break;
                case 6:hint = hint6;hintColor = hintColor6;break;
                case 7:hint = hint7;hintColor = hintColor7;break;
            }
            $(".editComment form .row2 .hint").text(hint);  //改变提示文本
            $(".editComment form .row2 .hint").css("color", hintColor);  //改变提示文本颜色
        }
        var editCommentContent = $(".editComment form .editCommentContent").text();
        editCommentContent = editCommentContent.replace(/<br>/g, "\n");
        editCommentContent = editCommentContent.replace(/<br\/>/g, "\n");
        editCommentContent = editCommentContent.replace(/<br \/>/g, "\n");
        $(".editComment form .editCommentContent").val(editCommentContent);
        var remainWordNum = 5000 - $(".editComment form .editCommentContent").val().length;  //计算剩余字数
        $(".editComment form .row3 .remainWordNum").text(remainWordNum);  //设置剩余字数
        $(".editComment").show();  //显示评论界面
        return false;
    });
    
    
    /* 鼠标滑过评论界面的星星 */
    $(".editComment form .row2 .selectStar a").hover(
        function(){
            var star = parseInt($(this).attr("star"));  //获取星数
            $(".editComment form .row2 .selectStar").css("background","url(images/icons/star/star" + star + ".png) no-repeat");  //改变星星颜色
            var hint;  //提示文本
            var hintColor;  //提示文本的颜色
            /* 根据星星，设置提示文本及其颜色 */
            switch(star) {
                case 1:hint = hint1;hintColor = hintColor1;break;
                case 2:hint = hint2;hintColor = hintColor2;break;
                case 3:hint = hint3;hintColor = hintColor3;break;
                case 4:hint = hint4;hintColor = hintColor4;break;
                case 5:hint = hint5;hintColor = hintColor5;break;
                case 6:hint = hint6;hintColor = hintColor6;break;
                case 7:hint = hint7;hintColor = hintColor7;break;
            }
            $(".editComment form .row2 .hint").text(hint);  //改变提示文本
            $(".editComment form .row2 .hint").css("color", hintColor);  //改变提示文本颜色
        },
        function(){
            $(".editComment form .row2 .selectStar").css("background","url(images/icons/star/star" + nowStar + ".png) no-repeat");  //改变星星颜色 
            var hint;  //提示文本
            var hintColor;  //提示文本的颜色
            /* 根据星星，设置提示文本及其颜色 */
            switch(parseInt(nowStar)) {
                case 1:hint = hint1;hintColor = hintColor1;break;
                case 2:hint = hint2;hintColor = hintColor2;break;
                case 3:hint = hint3;hintColor = hintColor3;break;
                case 4:hint = hint4;hintColor = hintColor4;break;
                case 5:hint = hint5;hintColor = hintColor5;break;
                case 6:hint = hint6;hintColor = hintColor6;break;
                case 7:hint = hint7;hintColor = hintColor7;break;
                default:hint = "";
            }
            $(".editComment form .row2 .hint").text(hint);  //改变提示文本
            $(".editComment form .row2 .hint").css("color", hintColor);  //改变提示文本的颜色
        }
    );   
    
    
    /* 点击评论界面的星星（选中星星） */
    $(".editComment form .row2 .selectStar a").click(function(){
        var star = $(this).attr("star");
        nowStar = star;
        $(".editComment form input[name='comment.commentStar']").attr("value", nowStar);
        $(".editComment form .row2 .selectStar").css("background","url(images/icons/star/star" + star + ".png) no-repeat");
        return false;
    });
    
    
    /* 即时统计字数 */
    $(".editComment form .editCommentContent").keyup(function(){
        var remainWordNum = 5000 - $(".editComment form .editCommentContent").val().length;
        $(".editComment form .row3 .remainWordNum").text(remainWordNum);
    });
    $(".editComment form .editCommentContent").hover(
        function(){
            var remainWordNum = 5000 - $(".editComment form .editCommentContent").val().length;
            $(".editComment form .row3 .remainWordNum").text(remainWordNum);
        },
        function(){
            var remainWordNum = 5000 - $(".editComment form .editCommentContent").val().length;
            $(".editComment form .row3 .remainWordNum").text(remainWordNum);
        }
    );
    $(".editComment form .publish").hover(
        function(){
            var remainWordNum = 5000 - $(".editComment form .editCommentContent").val().length;
            $(".editComment form .row3 .remainWordNum").text(remainWordNum);
        },
        function(){
            var remainWordNum = 5000 - $(".editComment form .editCommentContent").val().length;
            $(".editComment form .row3 .remainWordNum").text(remainWordNum);
        }
    );
    
    
    /* 点击叉按钮（关闭评论界面） */
    $(".editComment form .row1 a").click(function(){
        $(".editComment").hide();
        return false;
    });
    
    
    /* 点击确定按钮（发表评论） */
    $(".editComment form .row4 .publish").click(function(){
        /* 获取必要参数 */
        var commentId = parseInt($(".editComment form input[name='comment.commentId']").attr("value"));
        var commentStar = parseInt($(".editComment form input[name='comment.commentStar']").attr("value"));
        var commentContent = $(".editComment form .editCommentContent").attr("value");
        var commentWebsiteId = parseInt($(".editComment form input[name='comment.commentWebsite.websiteId']").attr("value"));
        var commentUserId = parseInt($(".editComment form input[name='comment.commentUser.userId']").attr("value"));
        /* 检查星数是否符合条件 */
        if(commentStar <= 0 || commentStar > 7) {
            alert("请选择您认为合适的星数~");
            return false;
        } 
        /* 检查字数是否符合条件 */
        var remainWordNum = 5000 - $(".editComment form .editCommentContent").val().length;
        if(remainWordNum < 0) {
            alert("字数太多，评论只能写5000字。");
            return false;
        }
        if(commentId == 0) {
            /* 使用Ajax添加评论 */
            $.post(
                "user/addComment",
                {
                    "comment.commentStar" : commentStar,
                    "comment.commentContent" : commentContent,
                    "comment.commentWebsite.websiteId" : commentWebsiteId,
                    "comment.commentUser.userId" : commentUserId
                },
                function(xml) {
                    var newCommentId = $(xml).find("commentId").text();
                    if(newCommentId != 0) {
                        var editCommentContent = $(".editComment form .editCommentContent").val();
                        editCommentContent = editCommentContent.replace(/\n/g, "<br />");
                        $(".editComment form .editCommentContent").html(editCommentContent);
                        $(".wrapper .main .websiteOutline .starAndScore .remark").text("修改评论");  //变成修改评论
                        $(".editComment form .myCommentId").attr("value", newCommentId);
                        alert("发表评论成功！");
                    }
                    else {
                        alert("发表评论失败！");
                    }
                }
            );
        }
        else {
            /* 使用Ajax修改评论 */
            $.post(
                "user/modifyComment",
                {
                    "comment.commentId" : commentId,
                    "comment.commentStar" : commentStar,
                    "comment.commentContent" : commentContent,
                    "comment.commentUser.userId" : commentUserId
                },
                function(xml) {
                    var success = $(xml).find("success").text();
                    if(success == "true") {
                        var editCommentContent = $(".editComment form .editCommentContent").val();
                        editCommentContent = editCommentContent.replace(/\n/g, "<br />");
                        $(".editComment form .editCommentContent").html(editCommentContent);
                        alert("修改评论成功！");
                    }
                    else {
                        alert("修改评论失败！");
                    }
                }
            );
        }
        $(".editComment").hide();  //隐藏评论界面
        return false;  //阻止表单的默认提交
    });
    
});


