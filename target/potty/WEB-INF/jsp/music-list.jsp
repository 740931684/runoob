<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 引入 Bootstrap -->

<!-- HTML5 Shim 和 Respond.js 用于让 IE8 支持 HTML5元素和媒体查询 -->
<!-- 注意： 如果通过 file://  引入 Respond.js 文件，则该文件无法起效果 -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@page isELIgnored="false"%>
<base href="<%=basePath %>">

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="common/tag.jsp"%>
<html lang="zh">
<head>
    <title>music-list</title>
    <link rel="stylesheet" href="http://www.kugou.com/yy/static/css/special.homepage.min.css?201505211743>" type="text/css" />
    <link href="http://www.kugou.com/yy/static/images/favicon.ico" rel="shortcut icon" />
    <link rel="stylesheet" type="text/css" href="css/nav.css">
    <link rel="stylesheet" type="text/css" href="css/test.css">

</head>
<body>
<header class="header-navigation" id="header">
    <nav> <a class="link" href="index">发现音乐</a> <a class="link" href="music-list/recommend">歌单</a> <a class="link" href="MyMusic">我的音乐</a> <a class="link" href="search">歌曲检索</a>  <a class="link" href="register" id="register" style="float: right;">注册</a><a class="link" href="login" id="login" style="float: right">登录</a></nav>
</header>



<script type="text/javascript" src="http://www.kugou.com/common/js/jquery.min.js"></script>
<script type="text/javascript" src="js/nav.js"></script>
<script type="text/javascript" src="http://www.kugou.com/common/js/lib.js"></script>
<script src="http://login-user.kugou.com/v1/kguser_min.js?20180305"></script>
<script type="text/javascript" src="http://www.kugou.com/common/js/common_header.min.js"> </script>
<!--精选集-->
<div class="wrap album spe clear_fix" id="spe" style="margin-top:100px;">
    <div class="l">
        <dl id="dl">
            <dt><a title="recommend" href="music-list/recommend">推荐</a></dt>
            <dt><a title="hottest" href="music-list/hottest">最热</a></dt>
            <dt><a title="Heat-reservoir" href="music-list/Heat-reservoir">热藏</a></dt>
            <dt><a title="rise" href="music-list/rise">飙升</a></dt>
        </dl>
    </div>
    <div class="r">
        <ul id="ulAlbums">

            <c:forEach var="list" items="${musicLists}">
                <li class="s_398001">
                    <div class="pic">
                        <a hidefocus="ture" href="music-list/${list.musicType}/${list.musicFlag}"><img src="${list.picture}" width='100' height='100' /></a>
                    </div>
                    <div class="detail">
                        <div class="top"><em>${list.author}</em><strong><a href="music-list/${list.musicType}/${list.musicFlag}">${list.topic}</a>
                            <!--<span>()</span>-->
                        </strong></div>
                        <div class="text">${list.detail}</div>
                    </div>
                </li>
            </c:forEach>


        </ul>
    </div>
</div>


<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="http://www.kugou.com/yy/static/js/base-min.js?201505211743"></script>
<script type="text/javascript" src="http://www.kugou.com/yy/static/js/special.home.lib.min.js?201505211743"></script>
<script src="http://cdn.bootcss.com/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<script type="text/javascript" src="js/music.js"></script>
</body>
</html>

