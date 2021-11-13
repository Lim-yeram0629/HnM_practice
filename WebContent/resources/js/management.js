$(function(){
    $('.nav_downside a').hover(function(){
        $(this).prev().addClass('expended');
    }, function(){
        $(this).prev().removeClass('expended');
    });
})
