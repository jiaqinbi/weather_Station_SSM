<%--
  Created by IntelliJ IDEA.
  User: aBoy
  Date: 2019/7/3
  Time: 11:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>个人中心</title>

    <style type="text/css">
        /*整体页面自定义样式*/
        body{
            background-color:rgba(252,246,225,0.8);
            background-size: 75% 50%;
        }
    </style>
</head>
<body>
    <%
        String username = request.getParameter("username");
        String password = request.getParameter("password");
    %>
    <h2 style="text-align: center">
        个人中心
    </h2>
    <hr>
    <h3 style="text-align: center">
        用户名:<%= username %><br>
        等  级:超级管理员
    </h3>
    <hr>


</body>
</html>
