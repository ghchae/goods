<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/top.jsp" %>

<html>
<head>
    <title>로그인</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/main.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/css/login.css'/>">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
</head>
<body>
<section id="loginSection">
    <form id="loginForm">
        <h3>Login</h3>
        <div id="msg"></div>
        <input type="text" name="userId" id="userId" value="${cookie.userId.value}" placeholder="아이디 입력">
        <input type="password" name="password" id="password" placeholder="비밀번호">
        <input type="hidden" name="toURL" value="${param.toURL}">
        <%--<button>로그인</button>--%>
        <a href="javascript:;" id="loginBtn">로그인</a>
        <div>
            <label><input type="checkbox" name="rememberId"  ${empty cookie.userId.value ? "" : "checked"}> 아이디
                기억</label> |
            <a href="#none">비밀번호 찾기</a> |
            <a href="<c:url value='/register/memberInsert'/>">회원가입</a>
        </div>
    </form>
</section>
</body>
</html>
<%@ include file="/WEB-INF/views/footer.jsp" %>
<script>
    let loginProceed = true;
    $(document).ready(function () {
        $("#loginBtn").click(function () {
            if (!loginProceed) {
                alert("로그인 진행중입니다.");
                return;
            }

            loginProceed = false;
            if ($("#userId").val().trim().length == 0) {
                $("#msg").html("<i class='fa fa-exclamation-circle'> 아이디를 입력해주세요.");
                loginProceed = true;
                return;
            }

            if ($("#password").val().trim().length == 0) {
                $("#msg").html("<i class='fa fa-exclamation-circle'> 비밀번호를 입력해주세요.");
                loginProceed = true;
                return;
            }
            $.ajax({
                type: 'POST',
                url: "/goods/login/login",
                headers: {"content-type": "application/json"},
                dataType: 'text',
                data: JSON.stringify(
                {
                    'userId': $("#userId").val(),
                    'password': $("#password").val(),
                    'rememberId' : $('input[name=rememberId]')[0].checked
                }),
                success: function (data) {
                    let result = JSON.parse(data);
                    if (result.result) {
                        window.location.href = "/goods";
                        return;
                    }
                    $("#msg").html('<i class="fa fa-exclamation-circle"> ' + result.message);
                    loginProceed = true;
                    return;
                },
                error: function () {
                    alert("error");
                }
            });
        });
    });
</script>