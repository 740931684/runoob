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
<html>
<head>
    <title>manage</title>
    <link rel="stylesheet" type="text/css" href="css/manage.css">
</head>
<body>
<div>
    <h1 style="text-align:center">音乐网站后台管理
        <span style="float:right;font-size:15px;cursor:pointer" id="exit">退出</span>
    </h1>
</div>
<div class="left">
    <a href="manage" class="manage-user" style="margin-top:50px;text-decoration:none">用户信息管理</a>
    <a href="manage-music-list" class="manage-music-list" style="margin-top:20px;text-decoration:none">歌单信息管理</a>
</div>
<div class="container">
    <div class="info" style="background-color:#999">
        <span style="width:10%">序号</span>
        <span style="width:25%">歌单名</span>
        <span style="width:25%">制作者</span>
        <span style="width:25%"></span>
    </div>

    <c:forEach var="musicList" items="${musicLists}" varStatus="status">
        <div class="info">
            <span style="width:10%"><em>${status.index+1}</em></span>
            <span class="topic" style="width:25%;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;">${musicList.topic}</span>
            <span style="width:25%;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;">${musicList.author}</span>
            <span style="width:25%">
            <button class="delete">删除</button>
            </span>
        </div>
    </c:forEach>

</div>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="http://cdn.bootcss.com/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        if ($.cookie("user")==null||$.cookie("user")==""){
            alert("您还未登录");
            window.location.href="login";
        }
        $('.left a').mouseenter(function(){
            $(this).addClass('addborder');
        });
        $('.left a').mouseleave(function(){
            $(this).removeClass('addborder');
        });
        $('.left a').click(function(){
            $('.left a').css('background-color','f9f9f9');
            $(this).css('background-color','#fff');
        });

        $('#exit').click(function () {
            $.cookie("name", "", {expires: -1});
            $.cookie("user", "", {expires: -1});
            $.cookie("password", "", {expires: -1});
            window.location.href = "login";
        });

        $('.delete').click(function () {
            $.ajax({
                async:false,
                type:"POST",
                data:{"topic":$(this).parent().parent().find(".topic").text()},
                dataType:"json",
                success:function (data) {
                    window.location.reload();
                }
            });
        });


    });
</script>
</body>
</html>
