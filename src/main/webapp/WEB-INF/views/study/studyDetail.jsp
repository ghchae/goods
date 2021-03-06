<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/top.jsp" %>
<html>
<head>
    <link rel="stylesheet" href="<c:url value='/resources/css/board.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/css/boardDetail.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/css/studyDetail.css'/>">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
</head>
<body>
<section>
    <div class="boardDetail" id="studyDetail">
        <h2 class="writing-header"><c:out value="${'[' += study.category += ']'}"/><span><c:out value="${study.title}"/></span></h2>
        <form>
            <input type="hidden" name="id" value="${study.id}">
            <c:if test="${study.file ne null}">
                <div class="image center pt50">
                        <img src="<c:url value='${"/image/" += study.file.fileName}'/>">
                </div>
            </c:if>
            <div class="content" contenteditable="true">
                <pre><c:out value='${study.content}' /></pre>
            </div>
            <c:if test='${study.writer eq userId}'>
                <a href="<c:url value='/study/modify'/>?id=${study.id}&page=${page}&pageSize=${pageSize}" class="btn"><i
                        class="fa fa-edit"></i> 수정</a>
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
            location.href = "<c:url value='/study/list'/>?page=${page}&pageSize=${pageSize}";
        });
    });
</script>