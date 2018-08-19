<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="common/tag.jsp"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@page isELIgnored="false"%>
<base href="<%=basePath %>">
<html lang="zh">
<head>
    <title>MyMusic</title>
    <link rel="stylesheet" type="text/css" href="css/nav.css">
    <link rel="stylesheet" type="text/css" href="css/test.css">
    <link rel="stylesheet" type="text/css" href="css/MyMusic.css">
    <link rel="stylesheet" type="text/css" href="css/audio.css">

</head>
<body>

<header class="header-navigation" id="header">
    <nav> <a class="link" href="index">发现音乐</a> <a class="link" href="music-list/recommend">歌单</a> <a class="link" href="MyMusic">我的音乐</a> <a class="link" href="search">歌曲检索</a>  <a class="link" href="register" id="register" style="float: right;">注册</a><a class="link" href="login" id="login" style="float: right">登录</a></nav>
</header>

<div class="container">
    <div class="left">
        <img src="http://imge.kugou.com/soft/collection/150/20180430/20180430142430994017.jpg">
        <p id="username"></p>
        <div style="text-align:center;margin-top:40px">
            <strong title="listen" style="color:#777;font-size:28px;display:block">试听音乐</strong>
            <strong title="list" style="color:#777;font-size:28px;margin-top:10px;display:block">收藏歌单</strong>
        </div>
    </div>
    <div class="right">
        <div class="music" style="margin-top:100px;font-size:15px;float:left;background-color:#999">
            <p class="music-id" style="border-right:1px solid #666;"></p>
            <p class="music-name" style="border-right:1px solid #666;">歌名</p>
        </div>

        <c:forEach var="data" items="${list}" varStatus="status">
            <div class="music" style="margin-top:20px;font-size:15px;float:left">
                <p class="music-id">${status.index+1}</p>
                <p class="music-name">${data.musicName}</p>
                <p class="address" style="display: none">${data.address}</p>
            </div>
        </c:forEach>

        <div class="music" style="margin-top:20px;font-size:15px;float:left">
            <p class="music-name" style="text-align: center;"><button id="clear-music">清空列表</button></p>
        </div>
    </div>
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
    </div>
</div>
<div id='flag' style="width:100%;height:10px;background-color:#555;position:fixed;bottom:0;left:0;right:0"></div>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="http://cdn.bootcss.com/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<script type="text/javascript" src="js/audio.js"></script>
<script type="text/javascript" src="js/nav.js"></script>
<script type="text/javascript" src="js/music.js"></script>
<script type="text/javascript">
    $(document).ready(function(){

        if ($.cookie("user")==""||$.cookie("user")==null){
            alert("您还未登录");
            window.location.href="login";
        }

        $('.myaudio').hide();
        $('#flag').show();
        $('#username').text($.cookie('name'));

        $('strong').mouseenter(function(){
            $(this).css('background-color','#999');
            $(this).css('color','#fff');
        });
        $('strong').mouseleave(function(){
            $(this).css('background-color','#f7f7f7');
            $(this).css('color','#777');
        });

        $('strong').click(function(){
            var flag=$(this).attr('title');
            switch(flag){
                case 'list':
                    window.location.href="MyMusic-list";
                    break;
                case 'listen':
                    window.location.href="MyMusic";
                    break;
            }
        });

        $('.music').click(function () {
            $('#aud').attr('src',$(this).find(".address").text());
            $('#play').attr('src', 'img/pause.png');
            aud_play();
        });

        $('#flag').mouseenter(function(){
            $('.myaudio').show(100);
            $(this).hide();
        });
        $('.myaudio').mouseleave(function(){
            $(this).hide();
            $('#flag').show();
        });

        $('#clear-music').click(function (event) {
            event.stopPropagation();
            var params={};
            params.user=$.cookie("user");
            $.ajax({
                type:"post",
                url:"MyMusic",
                data:params,
                dataType:"json",
                success:function (data) {
                    if (data!=null){
                        window.location.href="MyMusic";
                    }
                }
            });
        });

    });
</script>
</body>
</html>
