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
            <input type="hidden" name="bno" value="${board.bno}">
            <input type="text" name="title" value="${board.title}"
                   placeholder=" 제목을 입력해주세요." ${mode eq "new" ? "" : 'readonly="readonly"'}>
            <textarea name="content" rows="20"
                      placeholder=" 내용을 입력해 주세요." ${mode eq "new" ? "" : 'readonly="readonly"'}><c:out
                    value="${board.content}"/></textarea>
            <div>
            <c:if test='${mode eq "new"}'>
                <button type="button" id="writeBtn" class="btn"><i class="fa fa-pencil"></i> 등록</button>
            </c:if>
            <c:if test='${(board.writer eq loginId) && mode ne "new"}'>
                <button type="button" id="modifyBtn" class="btn"><i class="fa fa-edit"></i> 수정</button>
                <button type="button" id="removeBtn" class="btn"><i class="fa fa-trash"></i> 삭제</button>
            </c:if>
            <button type="button" id="listBtn" class="btn"><i class="fa fa-bars"></i> 목록</button>
            </div>
        </form>
    </div>
</section>
</body>
</html>