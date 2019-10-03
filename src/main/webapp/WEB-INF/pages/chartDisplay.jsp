<%--
  Created by IntelliJ IDEA.
  User: aBoy
  Date: 2019/7/1
  Time: 14:22
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
    <style type="text/css">
        /*整体页面自定义样式*/
        body{
            background-color: #c1e2b3;
            background-size: 90% 60%;
        }
        /*边框设置*/
        .inner{
            margin-top: 5%;
            border: 1px #eea236 solid;
        }
        /*行高*/
        .row1-height-width{
            height: 5%;
            padding-top: 1%;

        }

        .row2-height-width{
            height: 5%;
            text-align: center;
        }


        /*可视化图形自定义样式*/
        .chart-height-width{
            text-align: center;
            height:20%;
        }
    </style>


    <title>首页</title>
</head>
<body>

<%--container为固定宽度并支持响应式布局的容器--%>
<div class = "container inner" >
    <%--栅格系统--%>
    <%--设计三行--%>
    <%--第一行--%>
    <div class="row row1-height-width">
        <%--第一行设计三列--%>
        <div class="col-md-1"></div>
        <div class="col-md-10" style="text-align: right;">
            欢迎超级管理员:<font color="red"> ${username}</font>|<a href="" style="text-decoration: none;color: red">退出</a>
        </div>
        <div class="col-md-1"></div>
    </div>
    <%--第二行，图表显示--%>
    <div class="col-md-1"></div>
    <div class="col-md-10 inner chart-height-width">
        可视化图形，首选动态折线图
    </div>
    <div class="col-md-1"></div>
    <%--第三行--%>
    <div class="row row2-height-width">
        <%--第三行直接一列，内容居中--%>
        <div class="col-lg-12" >系统声明</div>

    </div>
</div>
</body>
</html>
