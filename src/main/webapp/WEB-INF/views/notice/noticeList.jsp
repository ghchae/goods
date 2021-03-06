<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/top.jsp" %>
<html>
<head>
    <title>공지사항</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/board.css'/>">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
</head>
<body>
<section>
    <div id="noticeBoard">
        <div class="board-container">
            <div class="search-container">
                <div class="main-title">공지사항</div>
                <form action="<c:url value="/notice/list"/>" class="search-form" method="get">
                    <select class="search-option" name="option">
                        <option value="ALL" ${pageHandler.sc.option=='ALL' || pageHandler.sc.option=='' ? "selected" : ""}>
                            제목+내용
                        </option>
                        <option value="TITLE" ${pageHandler.sc.option=='TITLE' ? "selected" : ""}>제목만</option>
                        <option value="WRITER" ${pageHandler.sc.option=='WRITER' ? "selected" : ""}>작성자</option>
                        <input type="text" name="keyword" class="search-input" type="text"
                               value="${pageHandler.sc.keyword}"
                               placeholder="검색어를 입력해주세요">
                        <input type="submit" class="search-button" value="검색">
                    </select>
                </form>
            </div>
            <table class="board-table">
                <colgroup>
                    <col style="width: 15%"/>
                    <col />
                    <col style="width: 10%"/>
                </colgroup>
<%--                <tr>--%>
<%--                    <th class="no">번호</th>--%>
<%--                    <th class="title">제목</th>--%>
<%--&lt;%&ndash;                    <th class="writer">이름</th>&ndash;%&gt;--%>
<%--                    <th class="regdate">등록일</th>--%>
<%--&lt;%&ndash;                    <th class="viewcnt">조회수</th>&ndash;%&gt;--%>
<%--                </tr>--%>
                <c:forEach var="notice" items="${list}">
                    <tr>
                        <td class="no"><c:out value="${notice.bno}"/></td>
                        <td class="title">
                            <a href="<c:url value='/notice/read?bno=${notice.bno}&page=${pageHandler.sc.page}&pageSize=${pageHandler.sc.pageSize}'/>"><c:out
                                    value="${notice.title}"/></a>
                        </td>
<%--                        <td class="writer"><c:out value="${notice.writer}"/></td>--%>
                        <td class="regdate"><fmt:formatDate value="${notice.reg_date}" pattern="MM/dd"/></td>
<%--                        <td class="viewcnt"><c:out value="${notice.view_cnt}"/></td>--%>
                    </tr>
                </c:forEach>
            </table>
            <c:if test="${admin eq 'Y'}">
                <div id="write-inner">
                    <button id="writeBtn" class="btn-write"
                            onclick="location.href='<c:url
                                    value="/notice/write?page=${pageHandler.sc.page}&pageSize=${pageHandler.sc.pageSize}&bno=${detail.bno}"/>'">
                        <i class="fa fa-pencil"></i> 글쓰기
                    </button>
                </div>
            </c:if>
            <br>
            <div class="paging-container">
                <div class="paging">
                    <c:choose>
                        <c:when test="${empty list}">
                            <div> 게시물이 없습니다.</div>
                        </c:when>
                        <c:otherwise>
                            <c:if test="${pageHandler.showPrev}">
                                <a class="page"
                                   href="<c:url value='/board/list${pageHandler.sc.getQueryString(pageHandler.beginPage-1)}'/> ">&lt;</a>
                            </c:if>
                            <c:forEach var="i" begin="${pageHandler.beginPage}" end="${pageHandler.endPage}">
                                <a class="page ${i==pageHandler.sc.page ? 'paging-active' : ''}"
                                   href="<c:url value='/notice/list${pageHandler.sc.getQueryString(i)}'/> ">${i}</a>
                            </c:forEach>
                            <c:if test="${pageHandler.showNext}">
                                <a class="page"
                                   href="<c:url value='/notice/list?${pageHandler.sc.getQueryString(pageHandler.endPage+1)}'/> ">&gt;</a>
                            </c:if>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>
<%@ include file="/WEB-INF/views/footer.jsp" %>