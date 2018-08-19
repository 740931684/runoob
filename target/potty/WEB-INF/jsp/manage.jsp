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
    <style type="text/css">
        .tt{
            position: fixed;
            top:0;
            left: 0;
            right:0;
            bottom: 0;
            background-color: #000;
            opacity: 0.7;
        }
        .ll{
            font-family: "Microsoft Yahei", 微软雅黑, Arial, Tahoma;
            font-size: 14px;
            width: 250px;
            height: 250px;
            background-color: rgb(255, 255, 255);
            position: fixed;
            left: 50%;
            top: 50%;
            margin-left: -125px;
            margin-top: -145px;
            z-index: 1001;
            border-radius: 8px
        }
    </style>
</head>
<body>
<div>
    <h1 style="text-align:center">音乐网站后台管理
        <span style="float:right;font-size:15px;cursor:pointer" id="exit">退出</span>
    </h1>
</div>
<div class="left">
    <a href="manage" style="margin-top:50px;text-decoration:none">用户信息管理</a>
    <a href="manage-music-list" style="margin-top:20px;text-decoration:none">歌单信息管理</a>
</div>
<div class="container">
    <div class="info" style="background-color:#999">
        <span>用户名</span>
        <span>账号</span>
        <span>密码</span>
        <span>管理</span>
    </div>
    <c:forEach var="u" items="${users}">
        <div class="info">
            <span class="name">${u.name}</span>
            <span class="user">${u.user}</span>
            <span class="password">${u.password}</span>
            <span class="manage">
                <button class="modify">修改</button>
                <button class="delete">删除</button>
            </span>
        </div>
    </c:forEach>
    <div style="text-align:center"><button class="addUser">增加用户</button></div>


    <div class="tt" style="display:none"></div>

    <div class="ll" style="display:none">
        <div style="margin:20px 25px"><input type="text" style="width:200px;height:auto;padding:10px" placeholder="用户名" id="lname"></div>
        <div style="margin:20px 25px"><input type="text" style="width:200px;height:auto;padding:10px" placeholder="账号" id="luser"></div>
        <div style="margin:20px 25px"><input type="text" style="width:200px;height:auto;padding:10px" placeholder="密码" id="lpassword"></div>
        <div style="text-align:center"><button id="newAdd">新增</button></div>
    </div>
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

        $('.addUser').click(function(){
            $('.tt').css('display','block');
            $('.ll').css('display','block');
        });
        $('.tt').click(function(){
            $(this).css('display','none');
            $('.ll').css('display','none');
        });
        $('#exit').click(function () {
            $.cookie("name", "", {expires: -1});
            $.cookie("user", "", {expires: -1});
            $.cookie("password", "", {expires: -1});
            window.location.href = "login";
        });

        $('#newAdd').click(function(){
            var params = {};
            params.name = $("#lname").val();
            params.user = $("#luser").val();
            params.password = $("#lpassword").val();
            if (params.name==""||params.user==""||params.password=="") {
                alert("用户名、账号、密码不得为空")
            }else{
                $.ajax({
                    async:false,
                    type:"post",
                    data:params,
                    dataType:"json",
                    success:function(data){
                        if (data!=0) {
                            alert("添加成功");
                            window.location.reload();
                        }else {
                            alert("用户已存在");
                        }
                    }
                });
            }
        });

        $('.modify').click(function(){
            var user = $(this).parent().parent().find('.user');
            var password = $(this).parent().parent().find('.password');
            if($(this).text()=="确定"){
                var params={};
                params.user = user.text();
                params.password = password.find('input').val();
                if (params.password=="") {
                    alert("密码不能为空")
                }else{
                    $.ajax({
                        async:false,
                        type: "post",
                        url: "manage",//注意路径
                        data:params,
                        dataType:"json",
                        success:function (data) {
                            if(data!=0){
                                alert("修改成功");
                                window.location.reload();
                            }
                        }
                    });
                }
            }else{
                password.text("");
                password.append("<input type='text' style='width:auto;height:auto'>");
                $(this).text("确定");
                $(this).parent().find(".delete").text("取消");
            }
        });
        $('.delete').click(function(){
            if ($(this).text()=="取消") {
                window.location.reload();
            }else{
                var params ={};
                params.user = $(this).parent().parent().find('.user').text();
                $.ajax({
                    async:false,
                    type:"post",
                    data:params,
                    dataType:"json",
                    success:function (data) {
                        if(data!=0){
                            alert("删除成功")
                            window.location.reload();
                        }
                    }
                });
            }
        });


    });
</script>
</body>
</html>
