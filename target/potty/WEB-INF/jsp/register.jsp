<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>注册</title>
    <%@include file="common/head.jsp"%>
    <link rel="stylesheet" type="text/css" href="css/style.css"/>
</head>
<body>
<div>
    <div class="logo wap">
        <a><img src="img/logo.png" style="width: 80px;height: auto;" alt=""></a>
    </div>
    <div class="lo_ct">
        <div class="lo_bg wap">
            <ul class="lo_list">
                <li>
                    用户名：<input type="text" name="name" id="name" style="width: 100px;height: auto;margin-left: 28px">
                </li>

                <li>
                    账号：<input type="text" name="user" id="user" style="width: 100px;height: auto;margin-left: 40px">
                </li>
                <li>
                    密码：<input type="password" name="password" id="password" style="width: 100px;height: auto;margin-left: 40px">
                </li>
                <li>
                    确认密码：<input type="password" name="repassword" id="repassword" style="width: 100px;height: auto;margin-left: 16px">
                    <p style="margin-left: 90px;color:red;display: none" class="err">前后密码不一致</p>
                </li>


                <li>
                    <button type="submit" id="register" style="margin-left: 110px">注册</button>
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
    $(document).ready(function(){
        $("#register").click(function(){
            if ($("#password").val()!=$("#repassword").val()) {
                $(".err").css('display','block');
            }else{
                $(".err").css('display','none');
            }

            var params={};
            params.name=$("#name").val();
            params.user=$("#user").val();
            params.password=$("#password").val();

            $.ajax({
                type:"post",
                url:"register",
                data:params,
                dataType:"json",
                success:function (data) {
                    if (data.length!=0){
                        $('.err').css('display','block');
                        $('.err').text("用户名或密码已存在");
                    }
                },
                error:function () {
                    alert("注册成功");
                    window.location.href="login";
                }
            });
        });
    });
</script>
</body>
</html>




