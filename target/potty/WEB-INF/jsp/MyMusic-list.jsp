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
        <div>
            <p style="padding-top: 100px;padding-bottom: 10px;padding-left: 10px;font-size: 22px;">收藏的歌单</p>
            <div style="border-bottom: 1px solid #777;width: 100%"></div>
        </div>

        <c:forEach var="list" items="${lists}">
            <div class="right-music-list">
                <img src="img/white.png" title="${list.musicFlag}" class="delete" style="width: 30px;height: auto;float: right;">
                <img class="picture" src="${list.picture}">
                <p class="topic">${list.topic}</p>
                <p class="introduced">${list.introduced}</p>
                <span class="musicFlag" style="display: none">${list.musicFlag}</span>
                <span class="musicType" style="display: none;">${list.musicType}</span>
            </div>
        </c:forEach>
    </div>
</div>


<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="http://cdn.bootcss.com/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<script type="text/javascript" src="js/nav.js"></script>
<script type="text/javascript" src="js/music.js"></script>
<script type="text/javascript">
    $(document).ready(function(){

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

        $(".delete").mouseenter(function () {
            $(this).attr("src","img/delete.png");
        });
        $('.delete').mouseleave(function () {
            $(this).attr('src',"img/white.png");
        });
        $('.delete').click(function (event) {
            event.stopPropagation()
            var params={};
            params.musicFlag=$(this).attr('title');
            params.user=$.cookie("user");
            $.ajax({
                type:"post",
                url:"MyMusic-list",
                data:params,
                dataType:"json",
                success:function (data) {
                    if (data!=null){
                        window.location.reload();
                    }
                }
            });
        });

        $('.right-music-list').click(function(){
            window.location.href="music-list/"+$(this).find('.musicType').text()+"/"+$(this).find('.musicFlag').text();
        });
    });
</script>

</body>
</html>