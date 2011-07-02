$(function(){
    $('input#play').click(post_play);
});

var post_play = function(){
    var post_data = {url: $('input#url').val()};
    $.post(api, post_data, function(res){
        console.log(res);
    }, 'text');
};
