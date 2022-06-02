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
        <form id="noticeUpdateform">
            <input type="hidden" name="bno" value="${notice.bno}">
            <input type="text" name="title" value="${notice.title}"
                   placeholder=" 제목을 입력해주세요.">
            <textarea name="content" rows="20"
                      placeholder=" 내용을 입력해 주세요."><c:out value="${notice.content}"/></textarea>
            <div>
                <c:choose>
                    <c:when test="${empty notice}">
                        <button type="button" id="writeBtn" class="btn"><i class="fa fa-pencil"></i> 등록</button>
                    </c:when>
                    <c:otherwise>
                        <button type="button" id="modifyBtn" class="btn"><i class="fa fa-edit"></i> 수정</button>
                        <button type="button" id="removeBtn" class="btn"><i class="fa fa-trash"></i> 삭제</button>
                    </c:otherwise>
                </c:choose>
            <button type="button" id="listBtn" class="btn"><i class="fa fa-bars"></i> 목록</button>
            </div>
        </form>
    </div>
</section>
</body>
</html>
<%@ include file="/WEB-INF/views/footer.jsp" %>
<script>
    $(document).ready(function () {
        $("#listBtn").click(function () {
            location.href = "<c:url value='/notice/list'/>?page=${page}&pageSize=${pageSize}";
        });

        $("#writeBtn").click(function () {
            let form = $('#noticeUpdateform');
            form.attr("action", "<c:url value='/notice/write'/>")
            form.attr("method", "post");
            form.submit();
        });
    });
</script>