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
    <div class="boardDetail">
        <h2 class="writing-header">study</h2>
        <form id="studyUpdateForm">
            <input type="hidden" name="id" value="${study.id}">
            <div>
                <select name="category" id="category">
                    <option value="JAVA">JAVA</option>
                    <option value="SPRING">SPRING</option>
                    <option value="JS">JS</option>
                    <option value="DB">DB</option>
                    <option value="WEB">WEB</option>
                    <option value="AWS">AWS</option>
                </select>
                <input type="text" name="title" value="${study.title}"
                       placeholder=" 제목을 입력해주세요.">
            </div>
            <textarea name="content" rows="20"
                      placeholder=" 내용을 입력해 주세요."><c:out value="${study.content}"/></textarea>
            <div>
                <c:choose>
                    <c:when test="${empty study}">
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
<script src=" <c:url value='/resources/js/common.js'/>"></script>
<script>
    let studyProceed = true;
    $(document).ready(function () {
        $("#listBtn").click(function () {
            location.href = "<c:url value='/study/list'/>?page=${page}&pageSize=${pageSize}";
        });

        $("#writeBtn").click(function () {
            let form = $('#studyUpdateForm');
            form.attr("action", "<c:url value='/study/write'/>")
            form.attr("method", "post");
            form.submit();
        });
        $("#modifyBtn").click(function () {
            studyProceed = false;
            if (!confirm("수정 하시겠습니까?")) {
                studyProceed = true;
                return;
            }
            $.ajax({
                type: 'POST',
                url: '/goods/study/modify',
                headers: {"content-type": "application/json"},
                dataType: 'text',
                data: JSON.stringify(toJson("#studyUpdateForm")),
                success: function (data) {
                    let result = JSON.parse(data);
                    if (result.result) {
                        /*success*/
                        alert("수정되었습니다.");
                        window.location.href = "<c:url value='/study/list'/>";
                        return;
                    }
                    alert("수정에 실패했습니다.");
                    studyProceed = true;
                    return;
                },
            });
        });
    });
</script>