//スクロールしたらこの処理が走る
$(window).scroll(function() {
    scrollbox();
});

// スクロール処理
function scrollbox(){
    // 初期位置が取れていなければ処理を抜ける
    if(initOffsetTop == null) return;

    // 現在のスクロール位置を取得
    var scrollTop = $(document).scrollTop();

    // スクロールさせる要素の初期位置と現在のスクロールの位置を比較
    //初期位置より下にスクロールした時
    if(initOffsetTop < scrollTop) {
        // positionを設定
        $(setBoxId).css('position', 'fixed');
        // topの位置を設定
        $(setBoxId).animate({top: '10'}, {duration: 0});
    } else {
        // 設定したスタイルを持とに戻す
        $(setBoxId).css('position', 'absolute');
        $(setBoxId).animate({top: initOffsetTop}, {duration: 0});
    }
}