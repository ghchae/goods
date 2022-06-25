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
<script src=" <c:url value='/resources/js/common.js'/>"></script>
<script>
    let bno = ${notice.bno eq null ? '0' : notice.bno};
    let noticeProceed = true;
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
        $("#modifyBtn").click(function () {
            if (!noticeProceed) {
                alert("수정중입니다.");
                return;
            }
            noticeProceed = false;
            if (!confirm("수정 하시겠습니까?")) {
                noticeProceed = true;
                return;
            }
            $.ajax({
                type: 'POST',
                url: '/goods/notice/modify',
                headers: {"content-type": "application/json"},
                dataType: 'text',
                data: JSON.stringify(toJson("#noticeUpdateform")),
                success: function (data) {
                    let result = JSON.parse(data);
                    if (result.result) {
                        /*success*/
                        alert("수정되었습니다.");
                        window.location.href = "<c:url value='/notice/list'/>";
                        return;
                    }
                    alert("수정에 실패했습니다.");
                    noticeProceed = true;
                    return;
                },
            });
        });
        $("#removeBtn").click(function () {
            if (!noticeProceed) {
                alert("수정중입니다.");
                return;
            }
            noticeProceed = false;
            if (!confirm("삭제 하시겠습니까?")) {
                noticeProceed = true;
                return;
            }
            $.ajax({
                type: 'POST',
                url: '/goods/notice/remove',
                headers: {"content-type": "application/json"},
                dataType: 'text',
                data: JSON.stringify({"bno": bno}),
                success: function (data) {
                    let result = JSON.parse(data);
                    if (result.result) {
                        /*success*/
                        alert("삭제되었습니다.");
                        window.location.href = "<c:url value='/notice/list'/>";
                        return;
                    }
                    alert("삭제에 실패했습니다.");
                    noticeProceed = true;
                    return;
                },
            });
        });
    });
</script>