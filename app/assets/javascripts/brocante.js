/*ヘッダー部分*/
var _window = $(window),
    _header = $('.site-header'),
    heroBottom;

_window.on('scroll',function(){
    heroBottom = $('.hero').height();
    if(_window.scrollTop() > heroBottom){
        _header.addClass('transform');
    }
    else{
        _header.removeClass('transform');
    }
});

_window.trigger('scroll');

// HTMLの要素が全て準備できれば処理を行う
var setBoxId = '#float-sns-box';      // スクロールさせる要素
var initOffsetTop = null;   // 要素の初期位置
$(document).ready(function() {
    // 初期位置取得
    initOffsetTop = $(setBoxId).offset().top;

});
