<%--
  Created by IntelliJ IDEA.
  User: aBoy
  Date: 2019/7/4
  Time: 19:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>可视化演示</title>
    <!--引入bootstrap  css样式-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!--引入bootstrap js和jquery插件-->
    <script src="http://libs.baidu.com/jquery/2.1.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        //个人中心
        function openPersonInfo(){
            //window.open("../about.jsp","about","height=400, width=600, toolbar =no, menubar=no, scrollbars=no, resizable=no, location=no, status=no"); //写成一行
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
欢迎超级管理员:<font color="red"> ${username}</font>进入,测试密码为：${password}   |下面开始web板块的开发，开发框架为ssm,前端引入了bootstrap<br>
测试期间，页面每隔五秒钟自动刷新数据，暂时测试的是数据库中的动态数据，后期会对wifi模块发送的数据进行解析存入数据库进行读取。
<hr>
<%--container为固定宽度并支持响应式布局的容器--%>
<div class = "container" >
    <input type="text" id="winspeedData" style="display: none"/>
    <h3 style="text-align: center;font-family: 隶书;font-size: 35pt;">风速可视化演示</h3>
    <%--栅格系统--%>
    <%--设计三行--%>
    <%--第一行--%>
    <div class="row row1-height-width">
        <div class="col-md-2"></div>
        <div class="col-md-8" style="text-align: right;">
            <%--导航条--%>
            <ul class="nav nav-tabs navbar-right nav-text">
                <li role="presentation"><a href="../user/login?username=${username}">Home</a></li>
                <li role="presentation" class="disabled"><a href="javascript:void(0);" style="color: rgb(51,122,183);">refresh</a></li>
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
                            <%--<input type="button" onclick="exit()" value="退出"  style="border: none;"/>--%>
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
            <%--图表容器 DOM--%>
        </div>
        <div class="col-md-1"></div>
    </div>

    <%--第三行--%>
    <div class="row row3-height-width">
        <%--第三行直接一列，内容居中--%>
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

    window.setInterval('autorefresh()',1000);
    function autorefresh(){
        $.ajax({
           url:"../data/updateData",
           contentType:"application/json;chart-set=UTF-8",
           data:'{}',
           dataType:"json",
           type:"post",
           success:function(data){
                $("#winspeedData").val(data[0].wind_speed);
           }
        });
    }

    var chart = Highcharts.chart('container',{
        chart: {
            type: 'gauge',  //仪表盘
            plotBackgroundColor: null,
            plotBackgroundImage: null,
            plotBorderWidth: 0,
            plotShadow: false
        },
        title: {
            text: '动态模拟实时风速数据'
        },
        pane: {
            startAngle: -150,    //起始角度
            endAngle: 150,       //终止角度
            background: [{
                backgroundColor: {
                    linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
                    stops: [
                        [0, '#FFF'],
                        [1, '#333']
                    ]
                },
                borderWidth: 0,
                outerRadius: '109%'  //外半径
            }, {
                backgroundColor: {
                    linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
                    stops: [
                        [0, '#333'],
                        [1, '#FFF']
                    ]
                },
                borderWidth: 1,
                outerRadius: '107%'
            }, {
                // default background
            }, {
                backgroundColor: '#DDD',
                borderWidth: 0,
                outerRadius: '105%',
                innerRadius: '103%'
            }]
        },
        // the value axis
        yAxis: {
            min: 0,
            max: 200,
            minorTickInterval: 'auto',
            minorTickWidth: 1,
            minorTickLength: 10,
            minorTickPosition: 'inside',
            minorTickColor: '#666',
            tickPixelInterval: 30,
            tickWidth: 2,
            tickPosition: 'inside',
            tickLength: 10,
            tickColor: '#666',
            labels: {
                step: 2,
                rotation: 'auto'
            },
            title: {
                text: 'km/h'
            },
            plotBands: [{
                from: 0,
                to: 120,
                color: '#55BF3B' // green
            }, {
                from: 120,
                to: 160,
                color: '#DDDF0D' // yellow
            }, {
                from: 160,
                to: 200,
                color: '#DF5353' // red
            }]
        },
        series: [{
            name: 'Speed',
            data: [0],   //起始速度
            tooltip: {
                valueSuffix: ' km/h'
            }
        }]
    }, function (chart) {
        if (!chart.renderer.forExport) {
            setInterval(function () {
                var point = chart.series[0].points[0],
                    newVal,
                    //inc = Math.round((Math.random() - 0.5) * 20);
                newVal = parseInt($("#winspeedData").val());   //显示风速值

                if (newVal < 0 || newVal > 200) {
                    //newVal = point.y - parseInt($("#winspeedData").val());   //point.y为上一风速值
                    alert("警告：风速超出限定范围，请重新设置！");
                }
                //console.log(point.y+"-----"+$("#winspeedData").val());
                point.update(newVal);
            }, 3000);
        }
    });
</script>
</body>
</html>
