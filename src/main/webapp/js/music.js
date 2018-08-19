if($.cookie("user")){
    $('#login').text($.cookie('name'));
    $('#login').attr('href','MyMusic');
    $("#register").text("退出");
    $("#register").attr("href","index");
    $("#register").click(function () {
        $.cookie("user","");
        $.cookie("password","");
        $.cookie("name","");
        $('#login').text("登录");
        $('#login').attr('href','index');
        $('#register').text("注册");

    });
}else {
    $('#register').attr('href','register');
}