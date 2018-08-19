<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>登录</title>
    <link rel="stylesheet" type="text/css" href="css/style.css"/>
</head>

<body>
<div>
    <div class="logo wap">
        <img src="img/logo.png" style="width: 80px;height: auto;">
    </div>
    <div class="lo_ct">
        <div class="lo_bg wap">
            <ul class="lo_list">
                <li>
                    账号：<input type="text" name="user" id="user" style="width: 200px;height: auto;margin-left: 5px">
                </li>
                <li>
                    密码：<input type="password" name="password" id="password" style="width: 200px;height: auto;margin-left: 5px">
                </li>
                <p style="display:none;color: red;margin-left: 30px" id="err">账号或密码错误</p>
                <li>
                    <a class="lo_bnt lt" href="#" id="logi">登录</a>
                    <a class="free_join rt" href="register" title="注册">注册</a>
                </li>
                <li class="lo_copt"><span class="lt">合作账号登录</span>
                    <a class="renren rt" href="" title="人人网">人人网</a>
                    <a class="weibo rt" href="" title="新浪微博">新浪微博</a>
                    <a class="qq rt" href="" title="QQ">QQ</a>
                    <a class="kugou rt" href="" title="酷狗">酷狗</a>
                </li>
            </ul>
        </div>
    </div>
    <p class="lo_bt">
        <a href="index">返回首页</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="javascript:;">帮助中心</a>&nbsp;&nbsp;|&nbsp;&nbsp;客服Q号:740931684
    </p>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="http://cdn.bootcss.com/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {

        $("body").keydown(function() {
            if (event.keyCode == "13") {//keyCode=13是回车键
                $('#logi').click();
            }
        });

        $("#logi").click(function(){
            var params={};
            params.user=$("#user").val();
            params.password=$("#password").val()
            if ($("#user").val()==null||$("#password").val()==null) {
                $("#err").css("display","block");
                $("#err").text("账号或密码为空");
            }else{
                $.ajax({
                    type:"post",
                    url:"login",
                    data:params,
                    dataType:"json",
                    success:function(data){
                        $.cookie("user",data.user);
                        $.cookie("password",data.password);
                        $.cookie("name",data.name);
                        if (data.user==1&&data.password==1) {
                            window.location.href="manage"
                        }else{
                            window.location.href="index";
                        }
                    },
                    error:function(){
                        $("#err").css("display","block");
                        $("#err").text("账号或密码错误");
                    }

                });
            }
        });
    });
</script>

</body>
</html>




