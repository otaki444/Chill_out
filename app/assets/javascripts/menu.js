$(document).on('turbolinks:load', function(){
    $(".btn-gnavi").on("click", function(){
        // ハンバーガーメニューの位置を設定
        var rightVal = 0;
        if($(this).hasClass("open")) {
            // 位置を移動させメニューを開いた状態にする
            rightVal = -300;
            // メニューを閉じる
            $(this).removeClass("open");
        } else {
            // メニューを開く
            $(this).addClass("open");
        }

        $("#global-navi").stop().animate({
            right: rightVal
        }, 400);
    });
});