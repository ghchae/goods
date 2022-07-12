<%--
  Created by IntelliJ IDEA.
  User: cvxgi
  Date: 2022-07-08
  Time: 오후 1:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>최단 경로</title>
</head>
<body>
<section>
    <div>
        <h2 class="writing-header"></h2>
        <form action="/contents/searchPath" method="post">
            <input type="text" name="start" value="cookie_value1"/>
            <input type="text" name="middle" value="cookie_value3"/>
            <input type="text" name="end" value="cookie_value2"/>
            <input type="submit" value="길찾기"/>
        </form>
    </div>
</section>
</body>
</html>
