<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/top.jsp" %>
<html>
<head>
    <link rel="stylesheet" href="<c:url value='/resources/css/board.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/css/boardDetail.css'/>">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
</head>
<body>
<section>
    <div id="noticeDetail">
        <h2 class="writing-header">공지사항</h2>
        <form>
            <input type="hidden" name="bno" value="${notice.bno}">
            <input type="text" name="title" value="${notice.title}"
                   placeholder=" 제목을 입력해주세요." readonly>
            <textarea name="content" rows="20" placeholder=" 내용을 입력해 주세요." readonly>
                <c:out value="${notice.content}"/></textarea>
            <c:if test='${notice.writer eq userId}'>
                <a href="<c:url value='/notice/modify'/>?bno=${notice.bno}&page=${page}&pageSize=${pageSize}" class="btn"><i class="fa fa-edit"></i> 수정</a>
            </c:if>
            <button type="button" id="listBtn" class="btn"><i class="fa fa-bars"></i> 목록</button>
        </form>
    </div>
</section>
</body>
</html>
<%@ include file="/WEB-INF/views/footer.jsp" %>
<script>
    $(document).ready(function () {
        $("#listBtn").click(function () {
            location.href="<c:url value='/notice/list'/>?page=${page}&pageSize=${pageSize}";
        });
    });
</script>