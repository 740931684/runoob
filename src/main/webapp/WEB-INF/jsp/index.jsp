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
    <title>music</title>
    <link rel="stylesheet" type="text/css" href="css/normalize.css" />
    <link rel="stylesheet" type="text/css" href="css/demo.css">
    <link rel="stylesheet" type="text/css" href="css/nav.css">
    <link rel="stylesheet" type="text/css" href="css/carousel.css">
    <link rel="stylesheet" type="text/css" href="css/containter.css">
    <link rel="stylesheet" type="text/css" href="css/audio.css">

</head>
<body>

<header class="header-navigation" id="header">
    <nav> <a class="link" href="index">发现音乐</a> <a class="link" href="music-list/recommend">歌单</a> <a class="link" href="MyMusic">我的音乐</a> <a class="link" href="search">歌曲检索</a>  <a class="link" href="register" id="register" style="float: right;">注册</a><a class="link" href="login" id="login" style="float: right">登录</a></nav>
</header>

<div class="box" style="margin-top:65px">

    <div class="list">
        <ul>
            <li class="p7"><a href="music-list/recommend/1"><img src="img/1.png" alt="" /></a></li>
            <li class="p6"><a href="music-list/recommend/2"><img src="img/2.png" alt="" /></a></li>
            <li class="p5"><a href="music-list/recommend/3"><img src="img/3.png" alt="" /></a></li>
            <li class="p4"><a href="music-list/recommend/4"><img src="img/44.jpg" alt="" /></a></li>
            <li class="p3"><a href="music-list/recommend/5"><img src="img/55.jpg" alt="" /></a></li>
            <li class="p2"><a href="music-list/recommend/6"><img src="img/66.jpg" alt="" /></a></li>
            <li class="p1"><a href="music-list/recommend/7"><img src="img/77.jpg" alt="" /></a></li>
        </ul>
    </div>

    <a href="javascript:;" class="prev btn"><</a>
    <a href="javascript:;" class="next btn">></a>

    <div class="buttons">
        <a href="javascript:;"><span class="blue"></span></a>
        <a href="javascript:;"><span></span></a>
        <a href="javascript:;"><span></span></a>
        <a href="javascript:;"><span></span></a>
        <a href="javascript:;"><span></span></a>
        <a href="javascript:;"><span></span></a>
        <a href="javascript:;"><span></span></a>
    </div>
</div>

<div class="containter">
    <div class="tmusic" style="float:left;width:70%;height:auto">
        <h2 style="background-color:#fff;color:#555;margin-left:20px"><span style="display:inline;background-color:#fff;color:#009af3">精品</span>歌单</h2>
        <span style="margin-left: 20px;margin-top: 10px;width: 700px;height:2px;"></span>

        <div class="tbody">
            <c:forEach var="musiclist" items="${flushMusic}">
                <div class="tbody-div" title="music-list/${musiclist.musicType}/${musiclist.musicFlag}" style="margin-top:0px;">
                    <div class="info">
                        <img src="${musiclist.picture}" style="width:auto;height:auto;margin-top:10px;padding:1px;border:1px solid #999">
                    </div>
                    <p style="height:44px;display: -webkit-box;-webkit-box-orient: vertical;-webkit-line-clamp: 2;overflow: hidden;">${musiclist.detail}</p>
                </div>
            </c:forEach>
        </div>


        <div><img src="img/40.png" style="width:auto;height:auto;margin:20px"></div>

        <div style="float:left;margin-top:50px;" id="music-hot" >

            <h2 style="background-color:#fff;color:#555;margin-left:20px"><span style="display:inline;background-color:#fff;color:#009af3">新歌</span>首发</h2>

            <span style="margin-left: 20px;margin-top: 10px;width: 700px;height:2px;"></span>
            <div style="float:left;width:90%" id="music-hot-list">
                <p title='01' style="color:#333;margin:20px;">谭维维 - 你呀
                    <span class="address" style="display: none;">
http://fs.w.kugou.com/201805131800/dee4f18c9d38468645ab3363faf7c4ce/G133/M09/01/11/ZZQEAFr2fEeAMWpuAFN4z11YKjQ170.mp3                    </span>
                </p>
                <p title='02' style="color:#333;margin:20px;">张碧晨 - 在你爱的牵挂里
                    <span class="address" style="display: none;">
http://fs.w.kugou.com/201805131659/1844c48d8a2807c5259b30b0fe6bf885/G127/M01/06/07/H4cBAFr1dbuAXI9rAEeFNanL9Jc063.mp3                   </span>
                <p title='03' style="color:#333;margin:20px;">大张伟 - 嘻唰唰 (Live)
                    <span class="address" style="display: none;">
http://fs.w.kugou.com/201805131750/ca97437005ccb5c403400c718a2dc7c2/G127/M02/0D/13/H4cBAFr0GFSAY57wACzjUn16kfs182.mp3                    </span>
                </p>
                <p title='04' style="color:#333;margin:20px;">陈学冬 - 叶塞尼亚 (Live)
                    <span class="address" style="display: none;">
http://fs.w.kugou.com/201805131716/1b1e92e7aed48d6f06cc336cb6c78405/G124/M0A/00/1B/vA0DAFr1ZUaAZzwgADsotK2gfwI535.mp3                    </span>
                </p>
                <p title='05' style="color:#333;margin:20px;">谭维维、陈亦飞 - 门【莽荒纪电视剧片尾曲】
                    <span class="address" style="display: none;">
http://fs.w.kugou.com/201805131720/32947eeb704bb8bc5d0f346ba9cf212d/G123/M01/0A/03/G4cBAFr0JaaAD6F7AEwLq8n7mr0417.mp3                    </span>
                </p>
                <p title='06' style="color:#333;margin:20px;">韩红、王力宏 - 心中的日月 (Live)
                    <span class="address" style="display: none;">
http://fs.w.kugou.com/201805131756/f43dc628b6702a0d83720771a92deb53/G128/M0A/01/01/wA0DAFr1hheACWb4AFA0swpiXZQ798.mp3                    </span>
                </p>
                <p title='07' style="color:#333;margin:20px;">张杰 - 给女儿的一封信
                    <span class="address" style="display: none;">
http://fs.w.kugou.com/201805131734/dbe798bf1b47abedd04521ceee8e53b5/G133/M03/14/09/ZZQEAFr1MWuAJDKRAED_DbD5GYQ238.mp3                    </span>
                </p>
                <p title='08' style="color:#333;margin:20px;">弦子、老光 - 我是一个妈妈
                    <span class="address" style="display: none;">
http://fs.w.kugou.com/201805131759/10d189270e385d915fdf61cfee090f91/G126/M06/17/09/XpQEAFrz6CGATIpVAEa-EnR9aM0276.mp3                    </span>
                </p>
            </div>

            <div style="float:left;width:10%">
                <p style="color:#333;margin-top:20px">05:41</p>
                <p style="color:#333;margin-top:20px">04:52</p>
                <p style="color:#333;margin-top:20px">03:03</p>
                <p style="color:#333;margin-top:20px">04:02</p>
                <p style="color:#333;margin-top:20px">05:11</p>
                <p style="color:#333;margin-top:20px">05:28</p>
                <p style="color:#333;margin-top:20px">04.26</p>
                <p style="color:#333;margin-top:20px">04:49</p>
            </div>
        </div>
    </div>
    <div class="thot" style="float:left;width:30%;height:auto">

        <h2 style="color:#4A4A4A"><span style="display:inline;background-color:#fff;color:red">熱歌</span>排行榜</h2>
        <div class="thot-board">
            <c:forEach var="hot" items="${hottest}" varStatus="status">
                <p style="white-space:nowrap;overflow:hidden;text-overflow:ellipsis;">
                        ${status.index+1}、&nbsp&nbsp&nbsp${hot.musicName}
                    <span class="hot-address" style="display: none">${hot.address}</span>
                </p>
            </c:forEach>

        </div>
    </div>
</div>

<!-- <div class="footer" style="background-color:#333;height:250px;width:100%;margin-top:100px;">
    <div class="link" style="margin-left:120px;padding-top:20px;">
        <a href="#">关于我们</a>
        <a href="#">监督举报</a>
        <a href="#">广告服务</a>
        <a href="#">版权指引</a>
        <a href="#">隐私政策</a>
        <a href="#">用户服务协议</a>
        <a href="#">推广合作</a>
        <a href="#">招聘信息</a>
        <a href="#">客服中心</a>
    </div>
    <div class="explain" style="margin-top:50px;">
        <span>本网站为毕业设计</span>
        <span>如发现有人拿去盈利，必追究其版权问题</span>
        <span>联系QQ邮箱：740931684@qq.com</span>
    </div>
</div> -->

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
    $(document).ready(function(){
        $('.myaudio').hide();
        $('#flag').show();

        $("#music-hot-list p").mouseenter(function(){
            $(this).css("color","#009af3");
        });
        $("#music-hot-list p").mouseleave(function(){
            $(this).css("color","#333");
        });

        $(".thot-board p").click(function () {
            $('#aud').attr('src',$(this).find('span').text());
            $('#play').attr('src', 'img/pause.png');
            aud_play();
        });

        $("#music-hot-list p").click(function(){
            $('#aud').attr('src',$(this).find('span').text());
            $('#play').attr('src', 'img/pause.png');
            if ($.cookie("user")!=null && $.cookie("password")!=null){
                var params={};
                params.musicName=$(this)[0].childNodes[0].data;
                params.address=$(this).find('span').text();
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
        $('.tbody-div').click(function(){
            window.open($(this).attr('title'));
        });
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
    });
</script>
</body>
</html>
