<%--
  Created by IntelliJ IDEA.
  User: aBoy
  Date: 2019/6/27
  Time: 10:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>

    <!--引入bootstrap  css样式-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!--引入bootstrap js和jquery插件-->
    <script src="http://libs.baidu.com/jquery/2.1.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
    <style>
        body{
            background: url("images/1.jpg") no-repeat center;
            background-size:100% 100%;
            animation-name:myfirst;
            animation-duration:12s;
            /*变换时间*/
            animation-delay:2s;
            /*动画开始时间*/
            animation-iteration-count:infinite;
            /*下一周期循环播放*/
            animation-play-state:running;
            /*动画开始运行*/
        }
        @keyframes myfirst
        {
            0%   {background:url("images/1.jpg") no-repeat center; background-size:100% 100%;}
            34%  {background:url("images/2.jpg") no-repeat center; background-size:100% 100%;}
        }
        .form{background: rgba(255,255,255,0.2);width:400px;margin:120px auto;}
        /*阴影*/
        .fa{display: inline-block;top: 27px;left: 6px;position: relative;color: #ccc;}
        input[type="text"],input[type="password"]{padding-left:26px;}
        .checkbox{padding-left:21px;}
    </style>
    <script type="text/javascript">
        $(function(){

            $("#loginbtn").click(function(){
                var username = $("#username").val();
                var password = $("#password").val();
              // alert("jq按钮测试" + "-----用户名：" + username + "-----密码：" + password);
               if($.isEmptyObject(username)){
                   alert("用户名不能为空!");
               }else if($.isEmptyObject(password)){
                   alert("密码不能为空！");
               }else{
                   $.ajax({
                       url:"user/testAjax",
                       contentType:"application/json;charset=UTF-8",
                       /*动态获取数据时需要严格指定json格式*/
                       data:'{"username":'+JSON.stringify(username)+', "password":'+JSON.stringify(password)+',"temperature":"30",' +
                       '"humidity":"40","air_pressure":"50","wind_direction":"60","wind_speed":"70"}',
                       dataType:"json",
                       type:"post",
                       success:function(data){
                           alert(data.username+"登陆成功");
                           window.location.href="user/login?username="+data.username+"&password="+data.password;
                           //data服务器端响应的json数据，进行解析
                           // alert(data);
                           // alert(data.username);
                           // alert(data.password);
                         //  console.log(data.username);
                           // alert(data.age);   //显示age没有定义，不知道什么原因
                       }
                   });
               }

            });
        });

    </script>
    <title>系统登陆</title>
</head>
<body>

    <%--登陆表单--%>
   <%--此为bootstrap提供的官方例子
      <div class="container">
        <form class="form-horizontal">
            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
                <div class="col-sm-10">
                    <input type="email" class="form-control" id="inputEmail3" placeholder="Email">
                </div>
            </div>
            <div class="form-group">
                <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
                <div class="col-sm-10">
                    <input type="password" class="form-control" id="inputPassword3" placeholder="Password">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <div class="checkbox">
                        <label>
                            <input type="checkbox"> Remember me
                        </label>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-default">Sign in</button>
                </div>
            </div>
        </form>
    </div>--%>


    <div class="container">
        <div class="form row">
            <div class="form-horizontal col-md-offset-3" id="login_form">
                <h3 class="form-title" style="align-content: center">Login</h3>
                   <%-- <form action="user/loginContro" method="post">--%>
                        <div class="col-md-9">
                        <div class="form-group">
                            <i class="fa fa-user fa-lg"></i>
                            <input class="form-control required" type="text" placeholder="Username" id="username" name="username" autofocus="autofocus" maxlength="20"/>
                        </div>
                        <div class="form-group">
                            <i class="fa fa-lock fa-lg"></i>
                            <input class="form-control required" type="password" placeholder="Password" id="password" name="password" maxlength="8"/>
                        </div>
                        <div class="form-group">
                            <label class="checkbox">
                                <input type="checkbox" name="remember" value="1"/>记住我
                            </label>
                        </div>
                        <div class="form-group col-md-offset-9">
                            <button type="submit" class="btn btn-success pull-right" name="submit" id="loginbtn">登录</button>
                        </div>
                    </div>
                <%--    </form>--%>
            </div>
        </div>
    </div>

</body>
</html>
