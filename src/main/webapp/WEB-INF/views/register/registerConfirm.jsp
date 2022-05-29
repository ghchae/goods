<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/top.jsp" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/register.css'/>">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
</head>
<body>
<section id="registerConfirm-section">
    <div id="registerConfirmBlock">
        <div class="resultBlockTxt">
            <h3>회원 가입이 완료 되었습니다.</h3>
        </div>

        <div class="resultBlock-inner">
            <div class="resultBlock">
                <a href="<c:url value='/login/login'/>">로그인</a>
            </div>
            <div class="resultBlock">
                <a href="<c:url value='/'/>">메인페이지</a>
            </div>
        </div>
    </div>
</section>
</body>
</html>
<%@ include file="/WEB-INF/views/footer.jsp" %>
