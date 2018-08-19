<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/9
  Time: 12:10
  To change this template use File | Settings | File Templates.
--%>
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
<html lang="zh">
<head>
    <title>music-list-detail</title>
    <link rel="stylesheet" href="http://www.kugou.com/yy/static/css/pc_temp_v2.css?201308081746" type="text/css">
    <link rel="stylesheet" href="http://www.kugou.com/yy/static/css/main.css?201505211743>" type="text/css" />
    <link href="http://www.kugou.com/yy/static/images/favicon.ico" rel="shortcut icon" />
    <link rel="stylesheet" type="text/css" href="css/test.css">
    <link rel="stylesheet" type="text/css" href="css/audio.css">

</head>

<body>
<link rel="stylesheet" type="text/css" href="css/nav.css">
<header class="header-navigation" id="header">
    <nav> <a class="link" href="index">发现音乐</a> <a class="link" href="music-list/recommend">歌单</a> <a class="link" href="MyMusic">我的音乐</a> <a class="link" href="search">歌曲检索</a>  <a class="link" href="register" id="register" style="float: right;">注册</a><a class="link" href="login" id="login" style="float: right">登录</a></nav>
</header>
<script type="text/javascript" src="js/nav.js"></script>



<script type="text/javascript" src="http://www.kugou.com/common/js/jquery.min.js"></script>
<script type="text/javascript" src="http://www.kugou.com/common/js/lib.js"></script>
<script src="http://login-user.kugou.com/v1/kguser_min.js?20180305"></script>
<script type="text/javascript" src="http://www.kugou.com/common/js/common_header.min.js"> </script>

<!--精选集内页-->

<div class="wrap alm2 clear_fix specialPage" style="margin-top:100px;">

    <div class="l">
        <div class="pic">
            <img src="${musicList.picture}" height="148" width="148" />
        </div>
        <p class="detail">
            <span>名称：</span>${musicList.topic}<br />
            <span>创建人：</span>${musicList.author}<br />
        </p>
        <div class="intro" style="height: 150px;width:160px;"><p style="display: -webkit-box;-webkit-box-orient: vertical;-webkit-line-clamp: 3;overflow: hidden;"><span>简介：</span>${musicList.detail}</p></div>
        <div class="collect" style="width: 80px;height: auto;border-radius:5px;border: 1px solid #555;margin: 0 auto;background-color:#DEDEDE">
            <img src="img/collect.png" style="width: 20px;height: auto;padding-top: 4px;padding-left: 7px;padding-bottom: 4px">
            <span style="padding: 2px;font-family: 微软雅黑">收藏</span>
        </div>
    </div>

    <div class="r" style="min-height:640px;">
        <div id="songs" class="list1">
            <strong>&lt;${musicDetail.musicListName}&gt; - 歌曲列表</strong>
            <h4 class="dq"></h4>
            <ul>
                <c:forEach var="list" items="${lists}" varStatus="status">
                    <li>
                        <span class="listen" title="播放"></span>
                        <span class="num1">${status.index+1}</span>
                        <span class="text"><i>${list.musicName}</i></span>
                        <span class="music-address" style="display:none;">${list.musicAddress}</span>
                    </li>
                </c:forEach>
            </ul>
        </div>
        <div class="clear"></div>
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
        <div class="volume" style="margin-left:500px;margin-top:20px;">
            <input id="volume" type="range" min="0" max="1" step="0.1" onchange="Volume(this)">
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="http://cdn.bootcss.com/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<script type="text/javascript" src="js/audio.js"></script>
<script type="text/javascript" src="js/music.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        $('ul li').click(function(){
            $('#aud').attr('src',$(this).find('.music-address').text());
            $('#play').attr('src', 'img/pause.png');
            if ($.cookie("user")!=null && $.cookie("password")!=null){
                var params={};
                params.musicName=$(this).find('.text i').text();
                params.address=$(this).find('.music-address').text();
                params.user=$.cookie("user");
                $.ajax({
                    async:false,
                    type: "post",
                    url: "index",//注意路径
                    data:params,
                    dataType:"json"
                });
            }
            aud_play();
        });

        $('.collect').click(function () {
            if ("${topic}"==""){
                if ($.cookie("user")!="" && $.cookie("password")!=""){
                    var params={};
                    params.user=$.cookie("user");
                    params.musicType="${musicType}";
                    params.picture="${musicDetail.picture}";
                    params.topic="${musicDetail.musicListName}";
                    params.introduced="${musicDetail.musicListIntroduce}";
                    params.musicFlag="${musicDetail.musicFlag}";
                    $.ajax({
                        async:false,
                        type: "post",
                        url: "music-list/"+"${musicType}/"+"${musicDetail.musicFlag}",//注意路径
                        data:params,
                        dataType:"json",
                        success:function () {
                            window.location.reload();
                        },
                        error:function () {
                            window.location.reload();
                        }
                    });
                }
            }
        });

        if ("${topic}"!="" && "${topic}"=="${musicDetail.musicListName}"){
            $(".collect").css("background-color","#EE3B3B");
            $(".collect").find('span').text("已收藏");
        }

        $("ul li").mouseenter(function(){
            $(this).css("color","#009af3");
        });
        $("ul li").mouseleave(function(){
            $(this).css("color","#333");
        });
    });
</script>


<script type="text/javascript" src="http://www.kugou.com/yy/static/js/base-min.js?201505211743"></script>
<script type="text/javascript" src="http://www.kugou.com/yy/static/js/special.lib.min.js?201505211743"></script>
</body>
</html>
