<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/top.jsp" %>
<html lang="ko">
<head>
    <title>회원가입</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/main.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/css/register.css'/>">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
</head>
<body>
<section id="register-section">
    <form id="joinForm">
        <div id="msg" class="msg"></div>

        <label for="userName">이름</label>
        <input type="text" name="name" id="userName" placeholder="ex) 홍길동">

        <label for="birthDate">생년월일</label>
        <input type="text" name="birth" id="birthDate" placeholder="990101">

        <label for="userId">아이디</label>
        <input type="text" name="userId" id="userId" placeholder="아이디">

        <label for="pwd">비밀번호</label>
        <input type="password" name="password" id="pwd" placeholder="8~12자리의 영대소문자와 숫자 조합">

        <label for="pwdCheck">비밀번호 확인</label>
        <input type="password" id="pwdCheck" placeholder="8~12자리의 영대소문자와 숫자 조합">

        <label for="email">이메일</label>
        <input type="text" name="email" id="email" placeholder="example@gmail.com">

        <label for="phoneNum">휴대폰 번호</label>
        <input type="text" name="phoneNum" id="phoneNum" placeholder="01012341234">

        <label for="address">주소</label>
        <input type="text" name="address" id="address">

        <label for="addressDetail">상세주소</label>
        <input type="text" name="addressDetail" id="addressDetail">

        <%--<button id="userJoin">회원 가입</button> 버튼으로하면 form action으로 되서 요청이되어버림 --%>
        <a href="javascript:;" id="userJoin">회원가입</a>
    </form>
</section>
</body>
</html>
<%@ include file="/WEB-INF/views/footer.jsp" %>
<script src=" <c:url value='/resources/js/common.js'/>"></script>
<script src=" <c:url value='/resources/js/validation.js'/>"></script>
<script src=" <c:url value='/resources/js/register.js'/>"></script>