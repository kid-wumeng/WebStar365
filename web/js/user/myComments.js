$(document).ready(function(){
    
    var nowPageNo = parseInt($(".nowPageNo").attr("value"));  //当前页码
    var totalPageNum = parseInt($(".totalPageNum").attr("value"));  //总页数
    var userId = parseInt($(".editComment form input[name='comment.commentUser.userId']").val());
    var nowCommentId;
    var nowCommentStar;
    var nowCommentContent;
    var nowCommentContentRemainWordNum;
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
    
    
    /* 点击“修改”（显示编辑评论界面） */
    $(".edit a").click(function(){
        nowCommentId = parseInt($(this).parents(".comment").attr("commentId"));  //获取所选评论的编号
        nowCommentStar = parseInt($(this).parents(".comment").attr("commentStar"));  //获取所选评论的星数
        nowCommentContent = $(this).parents(".comment").find(".commentContent p").html();  //获取所选评论的内容
        nowCommentContent = nowCommentContent.replace(/<br>/g, "\n");
        nowCommentContent = nowCommentContent.replace(/<br\/>/g, "\n");
        nowCommentContent = nowCommentContent.replace(/<br \/>/g, "\n");
        nowCommentContentRemainWordNum = 5000 - $(this).parents(".comment").find(".commentContent p").text().length;  //计算所选评论的剩余字数
        $(".editComment form input[name='comment.commentStar']").attr("value", nowCommentStar);
        $(".editComment form .editCommentContent").attr("value", nowCommentContent);
        $(".editComment form .row2 .selectStar").css("background","url(images/icons/star/star" + nowCommentStar + ".png) no-repeat");  //改变星星颜色
        var width = $(window).width();  //获取浏览器宽度
        var height = $(window).height();  //获取浏览器高度
        var y = height / 4;  //评论界面的y值
        $(".editComment").css("width", width + "px");  //设置评论界面阴影的宽度          
        $(".editComment").css("height", height + "px");  //设置评论界面阴影的高度 
        $(".editComment form").css("margin", y + "px auto");  //设置评论界面的y值
        var hint;  //提示文本
        var hintColor;  //提示文本的颜色
        /* 根据星星，设置提示文本及其颜色 */
        switch(parseInt(nowCommentStar)) {
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
        $(".editComment form .row3 .remainWordNum").text(nowCommentContentRemainWordNum);  //设置剩余字数
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
            $(".editComment form .row2 .selectStar").css("background","url(images/icons/star/star" + nowCommentStar + ".png) no-repeat");  //改变星星颜色 
            var hint;  //提示文本
            var hintColor;  //提示文本的颜色
            /* 根据星星，设置提示文本及其颜色 */
            switch(parseInt(nowCommentStar)) {
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
        nowCommentStar = star;
        $(".editComment form input[name='comment.commentStar']").attr("value", nowCommentStar);
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
    
    /* 点击确定按钮（确定修改评论） */
    $(".editComment form .row4 .publish").click(function(){
        /* 获取必要参数 */
        var newCommentStar = parseInt($(".editComment form input[name='comment.commentStar']").attr("value"));
        var newCommentContent = $(".editComment form .editCommentContent").attr("value");
        /* 检查星数是否符合条件 */
        if(newCommentStar <= 0 || newCommentStar > 7) {
            alert("请选择您认为合适的星数~");
            return false;
        } 
        /* 检查字数是否符合条件 */
        var remainWordNum = 5000 - $(".editComment form .editCommentContent").val().length;
        if(remainWordNum < 0) {
            alert("字数太多，评论只能写5000字。");
            return false;
        }
        /* 使用Ajax修改评论 */
        $.post(
            "user/modifyComment",
            {
                "comment.commentStar" : newCommentStar,
                "comment.commentContent" : newCommentContent,
                "comment.commentId" : nowCommentId,
                "comment.commentUser.userId" : userId
            },
            function(xml) {
                var success = $(xml).find("success").text();
                if(success == "true") {
                    $(".comment[commentId=" + nowCommentId + "]").attr("commentStar", newCommentStar)
                    $(".comment[commentId=" + nowCommentId + "]").find(".commentStar img").attr("src", "images/icons/star/star" + newCommentStar + ".png");
                    newCommentContent = newCommentContent.replace(/\n/g, "<br>");
                    newCommentContent = newCommentContent.replace(/\n/g, "<br/>");
                    newCommentContent = newCommentContent.replace(/\n/g, "<br />");
                    $(".comment[commentId=" + nowCommentId + "]").find(".commentContent p").html(newCommentContent);
                    alert("修改评论成功！");
                }
                else {
                    alert("修改评论失败！");
                }
            }
        );
        $(".editComment").hide();  //隐藏评论界面
        return false;  //阻止表单的默认提交
    });
    
    /* 点击“删除”（删除评论） */
    $(".delete a").click(function(){
        var commentId = $(this).parents(".comment").attr("commentId");
        /* 删除评论，并返回结果 */
        $.post(
            "user/deleteComment",
            {
                "comment.commentId" : commentId
            },
            function(xml) {
                var success = $(xml).find("success").text();
                if(success == "true") {
                    alert("删除成功。")
                    $(".comment[commentId=" + commentId + "]").hide();
                }
                else {
                    alert("删除失败！")
                }
            }
        );
        return false;
    })
    
    /* 点击“首页” */
    $(".firstPage").click(function(){
        $(".searchPageNo").attr("value", 1);
        $(".searchComments").submit();
        return false;
    });
    /* 点击“上一页” */
    $(".prevPage").click(function(){
        $(".searchPageNo").attr("value", nowPageNo - 1);
        $(".searchComments").submit();
        return false;
    });
    /* 点击“下一页” */
    $(".nextPage").click(function(){
        $(".searchPageNo").attr("value", nowPageNo + 1);
        $(".searchComments").submit();
        return false;
    });
    /* 点击“末页” */
    $(".lastPage").click(function(){
        $(".searchPageNo").attr("value", totalPageNum);
        $(".searchComments").submit();
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
                $(".searchComments").submit();
            }
        }
        else {
            alert("输入的页码不是数字，请重新输入。");
        }
        return false;
    });
    
});

