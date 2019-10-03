<%--
  Created by IntelliJ IDEA.
  User: aBoy
  Date: 2019/7/9
  Time: 11:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>实时温度可视化演示</title>
    <!--引入bootstrap  css样式-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!--引入bootstrap js和jquery插件-->
    <script src="http://libs.baidu.com/jquery/2.1.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>

    <script type="text/javascript">

        //个人中心
        function openPersonInfo(){
            var url = "../personInfo.jsp?username=${username}&password=${password}";                            //转向网页的地址;
            var name = "个人中心";                           //网页名称，可为空;
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
        //退出按钮
        function exit(){
            //alert("退出");
            if(confirm("您确定要退出吗?")){
                window.location.href = "../login.jsp";
            }else{}
        }
    </script>
    <style type="text/css">
        /*整体页面自定义样式*/
        body{
            background-color:rgba(252,246,225,0.8);
            background-size: 75% 50%;
        }
        /*行高*/
        .row1-height-width{
            height: 5%;
            padding-top: 1%;

        }
        .row2-height-width{
            height: 50%;
        }
        .row3-height-width{
            height: 5%;
            text-align: center;
        }
        /*导航条文字样式*/
        .nav-text{
            font-size: 13pt;
        }
    </style>

</head>
<body>
<%--container为固定宽度并支持响应式布局的容器--%>
<div class = "container" >
    <%--input用来获取ajax实时传入的值，设置为隐藏--%>
    <br><input type="text" id="temperatureData" name="temperatureData" style="display: none;/*visibility: hidden*/"/>
    <h3 style="text-align: center;font-family: 隶书;font-size: 35pt;">实时温度可视化演示</h3>
    <div class="row row1-height-width">
        <div class="col-md-2"></div>
        <div class="col-md-8" style="text-align: right;">
            <%--导航条--%>
            <ul class="nav nav-tabs navbar-right nav-text">
                <li role="presentation"><a href="../user/login?username=${username}">Home</a></li>
                <li role="presentation" class="disabled" ><a href="javascript:void(0);" style="color: rgb(51,122,183);">refresh</a></li>
                <li role="presentation"  class="active"><a href="#">chartDisplay</a></li>
                <li role="presentation" class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                        ${username} <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="javascript:openPersonInfo();">个人中心</a></li>
                        <li><a href="javaScript:openwin('../about.jsp','about',400,200);">系统关于</a></li>
                        <li>
                            <a href="javascript:exit();">退出</a>
                    </ul>
                </li>
            </ul>
            <br>
            <hr style="height:2px;border-top: 1px solid lightgray;margin-top: 25px;">
        </div>
        <div class="col-md-2"></div>
    </div>

    <!-- 第二行 -->
    <div class="row row2-height-width">
        <div class="col-md-1"></div>
        <div class="col-md-10" id="container" style="width: 800px;height:500px;margin-left: 8%;">
            <%--图表容器 DOM , id="container" --%>
        </div>
        <div class="col-md-1"></div>
    </div>

    <%--第三行--%>
    <div class="row row3-height-width">
        <div class="col-md-2"></div>
        <div class="col-lg-8" ><hr><font style="color: gray;">©2019 by 毕家钦</font></div>
        <div class="col-md-2"></div>
    </div>
</div>

<!-- 引入 highcharts.js -->
<script src="http://cdn.highcharts.com.cn/highcharts/highcharts.js"></script>
<script src="http://cdn.highcharts.com.cn/highcharts/modules/exporting.js"></script>
<script src="http://cdn.highcharts.com.cn/highcharts/highcharts-more.js" type="text/javascript"></script>
<script src="https://img.hcharts.cn/highcharts-plugins/highcharts-zh_CN.js"></script>
<script>
    //每隔1秒刷新数据
    window.setInterval('autorefresh()',1000);
    function autorefresh(){
        $.ajax({
            url:"../data/updateData",
            contentType:"application/json;chart-set=UTF-8",
            data:'{"username":"${username}"}',
            dataType:"json",
            type:"post",
            //async:false,
            success:function(data){
                $("#temperatureData").val(data[0].temperature);
            }
        });
    }
    Highcharts.setOptions({
        global: {
            useUTC: false
        }
    });
    function activeLastPointToolip(chart) {
        var points = chart.series[0].points;
        chart.tooltip.refresh(points[points.length -1]);
    }
    var chart = Highcharts.chart('container', {
        chart: {
            type: 'spline',
            marginRight: 10,
            events: {
                load: function () {
                    var series = this.series[0],
                        chart = this;
                    activeLastPointToolip(chart);
                    setInterval(function () {
                        var x = (new Date()).getTime(), // 当前时间
                            y = parseInt($("#temperatureData").val());          // 随机值
                        series.addPoint([x, y], true, true);
                        activeLastPointToolip(chart);
                    }, 1000);
                }
            }
        },
        title: {
            text: '动态模拟实时温度数据'
        },
        xAxis: {
            type: 'datetime',
            tickPixelInterval: 150
        },
        yAxis: {
            title: {
                text: null
            }
        },
        tooltip: {
            formatter: function () {
                return '<b>' + this.series.name + '</b><br/>' +
                    Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) + '<br/>' +
                    Highcharts.numberFormat(this.y, 2);
            }
        },
        legend: {
            enabled: false
        },
        series: [{
            name: '当前温度值',
            data: (function () {
                var data = [],
                    // 获取当前时间
                    time = (new Date()).getTime(),
                    i;
                for (i = -19; i <= 0; i += 1) {
                    data.push({
                        x: time + i * 1000,
                        y: parseInt($("#temperatureData").val())
                    });
                }
                return data;
            }())
        }]
    });
</script>
</body>
</html>
