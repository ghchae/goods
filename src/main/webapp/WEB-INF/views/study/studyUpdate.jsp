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
            <span id="photoUploadBtn"><i class="xi-camera"></i> 사진 첨부하기</span>
            <div id="imgs_wrap"></div>
            <textarea name="content" rows="20"
                      placeholder=" 내용을 입력해 주세요."><c:out value="${study.content}"/></textarea>
        </form>
        <div>
            <%--파일을 전송하기위해 form 태그필요--%>
            <form id="fileForm" name="fileForm" enctype="multipart/form-data">
                <%--파일을 선택하는 태그 , 파일선택 UI (type=file) --%>
                <input multiple="multiple" type="file" name="filename[]" class="hidden" id="fileName" accept="image/*"/>
            </form>
        </div>
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
    </div>
</section>
</body>
</html>
<%@ include file="/WEB-INF/views/footer.jsp" %>
<script src=" <c:url value='/resources/js/common.js'/>"></script>
<script>
    let studyProceed = true;
    let newFileList = [];
    let fileUpload = function(data) {
        let file = $("#fileName")[0].files[0];
        if (file.size < 10) {
            alert("정상적인 파일을 업로드 해주세요.");
            $("#fileName").val("");
            return;
        }
        if (!file.type.startsWith("image/") && file.type !== "application/pdf") {
            alert("이미지 파일 혹은 PDF 파일로 업로드 해주세요.");
            $("#fileName").val("");
            return;
        }
        let formData = new FormData();
        formData.append('file', file);
        formData.append('id', data);
        $.ajax({
            type: 'POST',
            data: formData,
            url: '/goods/study/fileUpload',
            enctype:'multipart/form-data',
            contentType: false,
            processData: false,
            success: function (data) {
                window.location.href = "<c:url value='/study/list'/>";
                return;
            },
        });
    };
    $(document).ready(function () {
        $("#listBtn").click(function () {
            location.href = "<c:url value='/study/list'/>?page=${page}&pageSize=${pageSize}";
        });
        $("#writeBtn").click(function () {
            // let form = $('#studyUpdateForm');
            <%--form.attr("action", "<c:url value='/study/write'/>")--%>
            // form.attr("method", "post");
            // form.submit();
            $.ajax({
                type: 'POST',
                url: '/goods/study/write',
                headers: {"content-type": "application/json"},
                dataType: 'text',
                data: JSON.stringify(toJson("#studyUpdateForm")),
                success: function (data) {
                    let result = JSON.parse(data);
                    if (result.result) {
                        /*success*/
                        if ($("#fileName").val() != "") {
                            fileUpload(result.message);
                            return;
                        }
                        window.location.href = "<c:url value='/study/list'/>";
                        return;
                    }
                    alert("등록에 실패했습니다.");
                    studyProceed = true;
                    return;
                },
            });
        });

        $("#photoUploadBtn").click(function() {
            $("#fileName").click();
        });

        $("#fileName").change(function() {
            $(".newPhoto").remove();
            newFileList = [];
            for (let i = 0; i < this.files.length; i++) {
                let image = this.files[i];
                newFileList.push(image);
                showThumbnail(image, i);
            }
        });

        let showThumbnail = function(image, i) {
            let reader = new FileReader();
            reader.onload = function(event) {
                let img = $('<div class="photo newPhoto"></div>');
                img.data("index", i);
                let deleteButton = $('<div></div>');
                deleteButton.addClass("photoDelete").click(function() {
                    newFileList.splice($(this).parent().data("index"), 1);
                    $(this).parent().remove();
                });
                img.append(deleteButton);
                img.append('<img src="' + event.target.result + '" width="80" height="80" alt="사진">');
                $("#imgs_wrap").append(img);
            };
            reader.readAsDataURL(image);
        };

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