<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="common/tag.jsp"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@page isELIgnored="false"%>
<base href="<%=basePath %>">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>歌曲检索</title>
    <link rel="stylesheet" href="http://www.kugou.com/yy/static/css/search.css">
    <link rel="stylesheet" type="text/css" href="css/demo.css">
    <link rel="stylesheet" type="text/css" href="css/nav.css">
    <link rel="stylesheet" type="text/css" href="css/audio.css">
</head>
<body>
<header class="header-navigation" id="header">
    <nav> <a class="link" href="index">发现音乐</a> <a class="link" href="music-list/recommend">歌单</a> <a class="link" href="MyMusic">我的音乐</a> <a class="link" href="search">歌曲检索</a>  <a class="link" href="register" id="register" style="float: right;">注册</a><a class="link" href="login" id="login" style="float: right">登录</a></nav>
</header>

<div class="search_header" style="margin-top: 100px">
    <div class="search_wrapper content_search">
        <div class="search_input"><input id="musicName" type="text" style="height: 100%;width: 86%;"><div class="searh_btn"><i class="search_icon"></i><span>搜索</span></div></div>
    </div>
</div>
<div class="search_content" id="st">
    <ul class="search_tab clearfix" >
        <li style="width: 15%;height: auto;font-size: 18px;color: #999">序号</li>
        <li style="width: 60%;height: auto;font-size: 18px;color: #999">歌手 - 歌曲名</li>
    </ul>
    <ul class="search_tab clearfix" >

    </ul>
</div>

<div class="myaudio">
    <div class="myaudio-center">
        <audio id="aud">
            <source src='' type='audio/ogg' width='300px' >
            <source src='' type='audio/mpeg' width='300px' >
            <source src='' type='audio/wav' width='300px' >
            浏览器不支持此格式
        </audio>
        <div class="aud-btn">
            <img src="img/play.png" id="play" />
        </div>
        <div class="aud-show">
            <div id="Progress-time" style="color:#fff">00:00</div>
            <div id="Progress" style="width:300px!important;">
                <span id="jin"></span><span id="yuan"></span>
            </div>
            <div id="Progress-end" style="color:#777">00:00</div>
        </div>
        <div class="volume" style="margin-left:500px;margin-top:20px;">
            <input id="volume" type="range" min="0" max="1" step="0.1" onchange="Volume(this)">
        </div>
        <div style="height:50px;width:50px;position: absolute;left:680px;top: 15px">
            <img id="loop" src="img/unloop.png" style="width: 30px;height: auto;">
        </div>
    </div>
</div>
<div id='flag' style="width:100%;height:10px;background-color:#555;position:fixed;bottom:0;left:0;right:0"></div>


<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="http://cdn.bootcss.com/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<script type="text/javascript" src="js/nav.js"></script>
<script type="text/javascript" src="js/carousel.js"></script>
<script type="text/javascript" src="js/audio.js"></script>
<script type="text/javascript" src="js/music.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $('.myaudio').hide();
        $('#flag').show();
        $('#flag').mouseenter(function(){
            $('.myaudio').show(100);
            $(this).hide();
        });
        $('.myaudio').mouseleave(function(){
            $(this).hide();
            $('#flag').show();
        });

        $('#loop').click(function () {
            if ($(this).attr('src')=="img/unloop.png"){
                $(this).attr('src','img/loop.png');
                $('#aud').attr('loop','loop');
            }else{
                $(this).attr('src',"img/unloop.png");
                document.getElementById("aud").loop=false;
            }
        });

        $("body").keydown(function() {
            if (event.keyCode == "13") {//keyCode=13是回车键
                $('.searh_btn').click();
            }
        });

        $('.searh_btn').click(function () {
            var musicName = $('#musicName').val();
            $.ajax({
                async:false,
                type: "post",
                url: "search",//注意路径
                data:{"musicName":musicName},
                dataType:"json",
                success: function(data) {
                    var str = "<ul class='search_tab clearfix'><li style='width: 15%;height: auto;font-size: 18px;color: #999'>序号</li><li style='width: 60%;height: auto;font-size: 18px;color: #999'>歌手 - 歌曲名</li></ul>";
                    if (data.length==0){
                        str+="<p style='color: #000;text-align: center;margin-top: 50px;'>搜索不到歌曲信息</p>";
                    } else {
                        for (var i=0;i<data.length;i++){
                            str+="<ul class='search_tab clearfix'><li style='width: 15%;height: auto;font-size: 18px;color: #999'>"+(i+1)+"</li><li style='width: 60%;height: auto;font-size: 18px;color: #999'>" +
                                data[i].musicName+"</li><span style='display: none'>" +
                                data[i].musicAddresss+"</span></ul>";
                        }
                    }
                    $("#st").html(str);
                }
            });
        });
    });
</script>

</body>
</html>
