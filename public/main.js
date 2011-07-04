$(function(){
    $('input#play').click(post_play);
    $('input#stop').click(post_stop);
});

var post_play = function(){
    var post_data = {url: $('input#url').val()};
    $.post(api+'/play', post_data, function(res){
        console.log(res);
    }, 'text');
};

var post_stop = function(){
    $.post(api+'/stop', {}, function(res){
        console.log(res);
    }, 'text');
};