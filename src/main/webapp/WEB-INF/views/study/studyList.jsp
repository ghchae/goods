<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/top.jsp" %>
<html>
<head>
    <title>study 리스트</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/board.css'/>">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
</head>
<body>
<section>
    <div id="noticeBoard">
        <div class="board-container">
            <div class="search-container">
                <div class="main-title">study</div>
                <form action="<c:url value="/study/list"/>" class="search-form" method="get">
                    <select class="search-option" name="category">
                        <option value="" ${pageHandler.sc.category == '' ? "selected" : ""}>전체</option>
                        <option value="JAVA" ${pageHandler.sc.category == 'JAVA' ? "selected" : ""}>JAVA</option>
                        <option value="SPRING" ${pageHandler.sc.category == 'SPRING' ? "selected" : ""}>SPRING</option>
                        <option value="JS" ${pageHandler.sc.category == 'JS' ? "selected" : ""}>JS</option>
                        <option value="WEB" ${pageHandler.sc.category == 'WEB' ? "selected" : ""}>WEB</option>
                        <option value="DB" ${pageHandler.sc.category == 'DB' ? "selected" : ""}>DB</option>
                    </select>
                    <input type="text" name="keyword" class="search-input" type="text"
                           value="${pageHandler.sc.keyword}"
                           placeholder="검색어를 입력해주세요">
                    <input type="submit" class="search-button" value="검색">
                </form>
            </div>
            <table class="board-table">
                <colgroup>
                    <col style="width: 15%"/>
                    <col />
                    <col style="width: 10%"/>
                </colgroup>
                <c:forEach var="study" items="${list}">
                    <tr>
                        <td class="no"><c:out value="${study.id}"/></td>
                        <td class="title">
                            <a href="<c:url value='/study/read?id=${study.id}&page=${pageHandler.sc.page}&pageSize=${pageHandler.sc.pageSize}'/>"><c:out
                                    value="${'[' += study.category +=']' += study.title}"/></a>
                        </td>
                        <td class="regdate"><fmt:formatDate value="${study.reg_date}" pattern="yy-MM-dd"/></td>
                    </tr>
                </c:forEach>
            </table>
            <c:if test="${admin eq 'Y'}">
                <div id="write-inner">
                    <button id="writeBtn" class="btn-write"
                            onclick="location.href='<c:url
                                    value="/study/write?page=${pageHandler.sc.page}&pageSize=${pageHandler.sc.pageSize}&id=${detail.id}"/>'">
                        <i class="fa fa-pencil"></i> 글쓰기
                    </button>
                </div>
            </c:if>
            <br>
            <div class="paging-container">
                <div class="paging">
                    <c:choose>
                        <c:when test="${empty list}">
                            <div style="border-top: 1px solid; padding-top: 20px"> 게시물이 없습니다.</div>
                        </c:when>
                        <c:otherwise>
                            <c:if test="${pageHandler.showPrev}">
                                <a class="page"
                                   href="<c:url value='/study/list${pageHandler.sc.getQueryString(pageHandler.beginPage-1)}'/> ">&lt;</a>
                            </c:if>
                            <c:forEach var="i" begin="${pageHandler.beginPage}" end="${pageHandler.endPage}">
                                <a class="page ${i==pageHandler.sc.page ? 'paging-active' : ''}"
                                   href="<c:url value='/study/list${pageHandler.sc.getQueryString(i)}'/> ">${i}</a>
                            </c:forEach>
                            <c:if test="${pageHandler.showNext}">
                                <a class="page"
                                   href="<c:url value='/study/list?${pageHandler.sc.getQueryString(pageHandler.endPage+1)}'/> ">&gt;</a>
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