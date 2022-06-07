<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/top.jsp" %>
<html>
<head>
    <title>소개페이지</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <link rel="stylesheet" href="<c:url value='/resources/css/profileCard.css'/>">
</head>
<body>
<section>
    <div class="frame">
        <div class="profile">
            <div class="face">
                <img src="<c:url value='/resources/images/face.jpg'/>" alt="">
                <i class="xi-check-min"></i>
            </div>
            <h1>채기현<span>1992.01.18</span></h1>
            <p>
                <span>cvxgihyun@gmail.com</span>
            </p>
<%--            <a href="#none" class="view-portfolio">view my portfolio</a>--%>
            <div class="sns">
                <div>
                    <i class="xi-instagram"></i>
<%--                    <span><big>15.6k</big>follwers</span>--%>
                </div>
                <div>
                    <i class="xi-kakaostory"></i>
<%--                    <span><big>12.9k</big>follwers</span>--%>
                </div>
                <div>
                    <i class="xi-twitter"></i>
<%--                    <span><big>10.2k</big>follwers</span>--%>
                </div>
            </div>
            <div class="btn-mode"></div>
            <div class="like-more">
                <span class="btn-like"></span>
                <span class="btn-more"><i class="xi-ellipsis-v"></i></span>
            </div>
        </div>
    </div>
</section>
</body>
</html>
<%@ include file="/WEB-INF/views/footer.jsp" %>