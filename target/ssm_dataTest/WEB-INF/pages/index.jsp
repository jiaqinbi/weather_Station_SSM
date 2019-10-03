<%--
  Created by IntelliJ IDEA.
  User: aBoy
  Date: 2019/6/29
  Time: 13:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <!--引入bootstrap  css样式-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!--引入bootstrap js和jquery插件-->
    <script src="http://libs.baidu.com/jquery/2.1.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>

    <style type="text/css">
        /*整体页面自定义样式*/
        body{
            background-color:rgba(252,246,225,0.8);
            background-size: 75% 50%;
        }
        /*边框设置*/
        .inner{
            border: 1px #eea236 solid;
        }
        /*行高*/
        .row1-height-width{
            height: 5%;
            padding-top: 1%;

        }
        .row2-height-width{
            height: 50%;
            padding-top: 5%;
        }
        .row3-height-width{
            height: 5%;
            text-align: center;
        }

        /*数据显示行列设置*/
        .data-height-width{
            border-radius: 5px 5px 5px 5px;
            border-color: #c1e2b3;
            box-shadow: darkgrey 10px 10px 30px 5px ;
            background-color: rgba(252,246,225,1);
            width:100%;
        }
        .data-align{
            text-align: right;
        }

        table tr{
            font-family: 幼圆;
            text-align: center;
            font-size: 18pt;
        }
        .btn-size{
            font-size: 16pt;
        }

        /*显示数据的样式*/
        .dataStyle{
            color: red;
        }
        /*导航条文字样式*/
        .nav-text{
            font-size: 12pt;
        }
    </style>
    <script type="text/javascript">
        //每隔1秒刷新数据，方便单个刷新测试则先进行注释
        window.setInterval('autorefresh()',1000);
        function autorefresh(){
            $("#mytable").each(function(){
                var temperature = $(this).find('#temperature').text().toString();
                var humidity = $(this).find('#humidity').text().toString();
                var air_pressure = $(this).find('#air_pressure').text().toString();
                var wind_direction = $(this).find('#wind_direction').text().toString();
                var wind_speed = $(this).find('#wind_speed').text().toString();
                $.ajax({
                    url:"../data/updateData",
                    contentType:"application/json;chart-set=UTF-8",
                    data:'{"username":"${username}","temperature":"'+temperature+'","humidity":"'+humidity+'",' +
                    '"air_pressure":"'+air_pressure+'","wind_direction":"'+wind_direction+'",' +
                    '"wind_speed":"'+wind_speed+'"}',
                    dataType:"json",
                    type:"post",
                    success:function(data){
                        //alert(data);
                       /* $("#temperature").text(data.temperature);
                        $("#humidity").text(data.humidity);
                        $("#air_pressure").text(data.air_pressure);
                        $("#wind_direction").text(data.wind_direction);
                        $("#wind_speed").text(data.wind_speed);*/

                        $("#temperature").text(data[0].temperature);
                        $("#humidity").text(data[0].humidity);
                        $("#air_pressure").text(data[0].air_pressure);
                        $("#wind_direction").text(data[0].wind_direction);
                        $("#wind_speed").text(data[0].wind_speed);

                        //  alert(data[0]);

                    }
                });
            });
        }
        //jquery
        $(function(){
            //全局刷新
            $("#refresh").click(function(){
               $("#mytable").each(function(){
                   var temperature = $(this).find('#temperature').text().toString();
                   var humidity = $(this).find('#humidity').text().toString();
                   var air_pressure = $(this).find('#air_pressure').text().toString();
                   var wind_direction = $(this).find('#wind_direction').text().toString();
                   var wind_speed = $(this).find('#wind_speed').text().toString();
                  // alert(temperature+"--"+humidity+"--"+air_pressure+"--"+wind_direction+"--"+wind_speed);
                  // var jsonStr = {"username":"${username}","temperature":temperature,"humidity":humidity,"air_pressure":air_pressure,"wind_direction":wind_direction,"wind_speed":wind_speed};
                   $.ajax({
                       url:"../data/updateData",
                       contentType:"application/json;chart-set=UTF-8",
                       data:'{"username":"${username}","temperature":"'+temperature+'","humidity":"'+humidity+'",' +
                             '"air_pressure":"'+air_pressure+'","wind_direction":"'+wind_direction+'",' +
                              '"wind_speed":"'+wind_speed+'"}',
                       dataType:"json",
                       type:"post",
                       success:function(data){
                            $("#temperature").text(data.temperature);
                            $("#humidity").text(data.humidity);
                            $("#air_pressure").text(data.air_pressure);
                            $("#wind_direction").text(data.wind_direction);
                            $("#wind_speed").text(data.wind_speed);
                       }
                   });
               });
            });
            //温度刷新按钮
            $("#refresh-btn-1").click(function () {
                $("#mytable").each(function(){
                    alert("温度值即将刷新...");
                    var temperature = $(this).find('#temperature').text().toString();
                    $.ajax({
                        url:"../data/updateTemperature",
                        contentType:"application/json;chart-set=UTF-8",
                        data:'{"username":"${username}","temperature":"'+temperature+'"}',
                        dataType:"json",
                        type:"post",
                        success:function(data){
                            $("#temperature").text(data.temperature);
                        }
                    });
                });
            });
            //湿度刷新按钮
            $("#refresh-btn-2").click(function () {
                $("#mytable").each(function(){
                    alert("湿度值即将刷新...");
                    var humidity = $(this).find('#humidity').text().toString();
                    $.ajax({
                        url:"../data/updateHumidity",
                        contentType:"application/json;chart-set=UTF-8",
                        data:'{"username":"${username}","humidity":"'+humidity+'"}',
                        dataType:"json",
                        type:"post",
                        success:function(data){
                            $("#humidity").text(data.humidity);
                        }
                    });
                });
            });
            //风速刷新按钮
            $("#refresh-btn-3").click(function () {
                $("#mytable").each(function(){
                    alert("风速值即将刷新...");
                    var wind_speed = $(this).find('#wind_speed').text().toString();
                    $.ajax({
                        url:"../data/updateWind_speed",
                        contentType:"application/json;chart-set=UTF-8",
                        data:'{"username":"${username}","wind_speed":"'+wind_speed+'"}',
                        dataType:"json",
                        type:"post",
                        success:function(data){
                            $("#wind_speed").text(data.wind_speed);
                        }
                    });
                });
            });
            //风向刷新按钮
            $("#refresh-btn-4").click(function () {
                $("#mytable").each(function(){
                    alert("风向值即将刷新...");
                    var wind_direction = $(this).find('#wind_direction').text().toString();
                    $.ajax({
                        url:"../data/updateWind_direction",
                        contentType:"application/json;chart-set=UTF-8",
                        data:'{"username":"${username}","wind_direction":"'+wind_direction+'"}',
                        dataType:"json",
                        type:"post",
                        success:function(data){
                            $("#wind_direction").text(data.wind_direction);
                        }
                    });
                });
            });
            //气压刷新按钮
            $("#refresh-btn-5").click(function () {
                $("#mytable").each(function(){
                    alert("气压值即将刷新...");
                    var air_pressure = $(this).find('#air_pressure').text().toString();
                    $.ajax({
                        url:"../data/updateAir_pressure",
                        contentType:"application/json;chart-set=UTF-8",
                        data:'{"username":"${username}","air_pressure":"'+air_pressure+'"}',
                        dataType:"json",
                        type:"post",
                        success:function(data){
                            $("#air_pressure").text(data.air_pressure);
                        }
                    });
                });
            });
            /*温度动态折线图表显示按钮*/
            $("#chart-btn-1").click(function(){
               $.ajax({
                   url:"../highchart/data_line_collection",
                   contentType:"application/json;chart-set=UTF-8",
                   data:'{}',
                   dataType:"json",
                   type:"post",
                   success:function(data){
                       window.location.href = "../highchart/dynamic_chart_temperature?username=${username}";
                   }
               }) ;
            });
            /*湿度动态折线图表显示按钮*/
            $("#chart-btn-2").click(function(){
                $.ajax({
                    url:"../highchart/data_line_collection",
                    contentType:"application/json;chart-set=UTF-8",
                    data:'{}',
                    dataType:"json",
                    type:"post",
                    success:function(data){
                        window.location.href = "../highchart/dynamic_chart_humidity?username=${username}";
                    }
                }) ;
            });
            /*气压动态折线图表显示按钮*/
            $("#chart-btn-5").click(function(){
                $.ajax({
                    url:"../highchart/data_line_collection",
                    contentType:"application/json;chart-set=UTF-8",
                    data:'{"temperature":"温度","humidity":"湿度","air_pressure":"气压","wind_direction":"风向","wind_speed":"风速"}',
                    dataType:"json",
                    type:"post",
                    success:function(data){
                        window.location.href = "../highchart/dynamic_chart_airpressure?username=${username}";
                    }
                }) ;
            });
            /*风速风向速度仪显示按钮*/
            $("#chart-btn-3,#chart-btn-4").click(function(){
                $.ajax({
                    url:"../highchart/data_speedmeter_collection",
                    contentType:"application/json;chart-set=UTF-8",
                    data:'{"temperature":"温度","humidity":"湿度","air_pressure":"气压","wind_direction":"风向","wind_speed":"风速"}',
                    dataType:"json",
                    type:"post",
                    success:function(data){
                        window.location.href = "../highchart/chartSpeedmeter?username=${username}";
                    }
                }) ;
            });
        });

        //退出按钮
        function exit(){
            if(confirm("您确定要退出吗?")){
                window.location.href = "../login.jsp";
            }else{
                //alert("点击了否");
            }
        }
        //个人中心
        function openPersonInfo(){
            //window.open("../about.jsp","about","height=400, width=600, toolbar =no, menubar=no, scrollbars=no, resizable=no, location=no, status=no"); //写成一行
            var url = "../personInfo.jsp?username=${username}&password=${password}";                            //转向网页的地址;
            var name = "个人中心";                      //网页名称，可为空;
            var iWidth = 400;                         //弹出窗口的宽度;
            var iHeight = 200;                        //弹出窗口的高度;
            //window.screen.height获得屏幕的高，window.screen.width获得屏幕的宽
            var iTop = (window.screen.availHeight-30-iHeight)/2;       //获得窗口的垂直位置;
            var iLeft = (window.screen.availWidth-10-iWidth)/2;        //获得窗口的水平位置;
            window.open(url,name,'height='+iHeight+',,innerHeight='+iHeight+',width='+iWidth+',innerWidth='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=auto,resizeable=no,location=no,status=no');
        }
        //系统关于
        function openwin(url,name,iWidth,iHeight){
            alert("        本系统是基于ssm框架以及bootstrap开发的(C)UR(D)系统，主要用于接收esp8266无线模块发送的数据！");
        }

    </script>
    <title>首页</title>
</head>
<body>
    欢迎超级管理员:<font color="red"> ${username}</font>进入,测试密码为：${password}   |下面开始web板块的开发，开发框架为ssm,前端引入了bootstrap<br>
    测试期间，页面每隔五秒钟自动刷新数据，暂时测试的是数据库中的动态数据，后期会对wifi模块发送的数据进行解析存入数据库进行读取。
    <hr>

    <%--container为固定宽度并支持响应式布局的容器--%>
    <div class = "container" >
        <h3 style="text-align: center;font-family: 隶书;font-size: 35pt;">wifi数据传送测试</h3>
        <%--栅格系统--%>
        <%--设计三行--%>
        <%--第一行--%>
        <div class="row row1-height-width">
            <div class="col-md-1"></div>
            <div class="col-md-10" style="text-align: right;">
                <%--导航条--%>
                <ul class="nav nav-tabs navbar-right nav-text">
                    <li role="presentation" class="active"><a href="#">Home</a></li>
                    <li role="presentation"><a href="javascript:void(0);" id="refresh">refresh</a></li>
                    <li role="presentation"><a href="../data/chartDisplay?username=${username}">chartDisplay</a></li>
                    <li role="presentation" class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                            ${username} <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="javascript:openPersonInfo();">个人中心</a></li>
                            <li><a href="javaScript:openwin('../about.jsp','about',400,200);">系统关于</a></li>
                            <li>
                                <a href="javascript:exit();">退出</a>
                                <%--<input type="button" onclick="exit()" value="退出"  style="border: none;"/>--%>
                        </ul>
                    </li>
                </ul>
                <br>
                <hr style="height:2px;border-top: 1px solid lightgray;">
            </div>
            <div class="col-md-1"></div>
        </div>



        <%--第二行--%>
        <div class="row row2-height-width">
            <%--第二行又分小列--%>
            <div class="col-md-1"></div>
            <div class="col-md-10">
                <%--分两列，第一列显示数据，第二列编写刷新按钮--%>
                <div class="container data-height-width">
                    <%--表格显示数据--%>
                    <c:forEach items="${datalists}" var="dataMap">
                        <table class="table table-hover" id="mytable">
                        <tr>
                            <td><b>序号</b></td>
                            <td><b>名称</b></td>
                            <td><b>数值</b></td>
                            <td><b>单位</b></td>
                            <td><b>操作</b></td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>温度</td>
                            <td class="dataStyle" id="temperature">${dataMap.temperature}</td>
                            <td>℃</td>
                            <td>
                                <input type="button" class="btn btn-success btn-size" value="刷新" id="refresh-btn-1">
                                <input type="button" class="btn btn-success btn-size" value="图表显示" id="chart-btn-1">
                            </td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>湿度</td>
                            <td class="dataStyle" id="humidity">${dataMap.humidity}</td>
                            <td>%</td>
                            <td>
                                <input type="button" class="btn btn-success btn-size" value="刷新" id="refresh-btn-2">
                                <input type="button" class="btn btn-success btn-size" value="图表显示" id="chart-btn-2">
                            </td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>风速</td>
                            <td class="dataStyle" id = "wind_speed">${dataMap.wind_speed}</td>
                            <td>m/s</td>
                            <td>
                                <input type="button" class="btn btn-success btn-size" value="刷新" id="refresh-btn-3">
                                <input type="button" class="btn btn-success btn-size" value="图表显示" id="chart-btn-3">
                            </td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td>风向</td>
                            <td class="dataStyle" id = "wind_direction">${dataMap.wind_direction}</td>
                            <td>/</td>
                            <td>
                                <input type="button" class="btn btn-success btn-size" value="刷新" id="refresh-btn-4">
                                <input type="button" class="btn btn-success btn-size" value="图表显示" id="chart-btn-4">
                            </td>
                        </tr>
                        <tr>
                            <td>5</td>
                            <td>气压</td>
                            <td class="dataStyle" id="air_pressure">${dataMap.air_pressure}</td>
                            <td>Pa</td>
                            <td>
                                <input type="button" class="btn btn-success btn-size" value="刷新" id="refresh-btn-5">
                                <input type="button" class="btn btn-success btn-size" value="图表显示" id="chart-btn-5">
                            </td>
                        </tr>
                    </table>
                    </c:forEach>
                    <%--div栅格系统显示数据--%>
                    <%--<div class="row">
                        <div class="col-md-8">
                            <div class="row" style="text-align: center">显示数据，继续分裂</div>
                            <div class="row">

                                <div class="col-md-4 data-align" >数据一</div>
                                <div class="col-md-8">
                                    <input type="text" class="form-control" readonly>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4 data-align">数据二</div>
                                <div class="col-md-8">
                                    <input type="text" class="form-control" readonly>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4 data-align">数据三</div>
                                <div class="col-md-8">
                                    <input type="text" class="form-control" readonly>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4 data-align">数据四</div>
                                <div class="col-md-8">
                                    <input type="text" class="form-control" readonly>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4 data-align">数据五</div>
                                <div class="col-md-8">
                                    <input type="text" class="form-control" readonly>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4" style="padding-top: 8%;padding-left: 5%;">
                            <input type="button" class="btn btn-success" value="刷新" id="refresh-btn">
                            <input type="button" class="btn btn-success" value="图表显示" id="chart-btn">
                        </div>
                    </div>--%>
                </div>
            </div>
            <div class="col-md-1"></div>
        </div>
        <%--第三行--%>
        <div class="row row3-height-width">
            <%--第三行直接一列，内容居中--%>
            <div class="col-md-1"></div>
            <div class="col-lg-10" ><hr><font style="color: gray;">©2019 by 毕家钦</font></div>
             <div class="col-md-1"></div>
        </div>
    </div>
</body>
</html>
