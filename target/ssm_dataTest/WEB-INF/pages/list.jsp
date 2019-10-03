<%--
  Created by IntelliJ IDEA.
  User: aBoy
  Date: 2019/6/28
  Time: 15:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

    <h2>查询所有用户</h2>
    <c:forEach items="${list}" var="users">
        用户名：${users.username}
        密  码：${users.password}
    </c:forEach>
    <c:forEach items="${dadatalists}" var="dadatalists">
        温  度:${dadatalists.temperature}
    </c:forEach>

</body>
</html>
