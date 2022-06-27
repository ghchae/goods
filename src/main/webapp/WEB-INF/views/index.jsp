<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/top.jsp" %>
<html>
<head>
    <title>메인페이지</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <style>
        .mainPhotoImg {
            width: 150px;
            height: 150px;
            position: absolute;
            top: 55%;
            left: 50%;
            transform: translate(-50%, -50%);
        }
    </style>
</head>
<body>
<!-- section -->
<section id="item-section">
    <!-- goods list -->
    <div class="items-inner">
        <h2>Study</h2>
        <div class="items">
            <div class="item">
                <div class="photo">
                    <c:if test="${JAVA.file ne null}">
                        <a href="<c:url value='/study/read?id=${JAVA.id}'/>">
                            <img class="mainPhotoImg" src="<c:url value='${"/image/" += JAVA.file.fileName}'/>">
                        </a>
                    </c:if>
                </div>
                <div class="detail">
                    <%--<span class="price"><b>10<small>%</small></b>-</span>--%>
                    <c:choose>
                        <c:when test="${JAVA ne null}">
                            <span class="name"><c:out value="${'[' += JAVA.category += ']' += JAVA.title}"/></span>
                            <span class="count"><b>조회</b>0</span>
                            <span class="like"></span>
                        </c:when>
                        <c:otherwise>
                            <span>게시물이 없습니다.</span>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <div class="item">
                <div class="photo">
                    <c:if test="${JS.file ne null}">
                        <a href="<c:url value='/study/read?id=${JS.id}'/>">
                        <img class="mainPhotoImg" src="<c:url value='${"/image/" += JS.file.fileName}'/>">
                        </a>
                    </c:if>
                </div>
                <div class="detail">
                    <%--<span class="price"><b>10<small>%</small></b>-</span>--%>
                    <c:choose>
                        <c:when test="${JS ne null}">
                            <span class="name"><c:out value="${'[' += JS.category += ']' += JS.title}"/></span>
                            <span class="count"><b>조회</b>0</span>
                            <span class="like"></span>
                        </c:when>
                        <c:otherwise>
                            <span>게시물이 없습니다.</span>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <div class="item">
                <div class="photo">
                    <c:if test="${SPRING.file ne null}">
                        <a href="<c:url value='/study/read?id=${SPRING.id}'/>">
                        <img class="mainPhotoImg" src="<c:url value='${"/image/" += SPRING.file.fileName}'/>">
                        </a>
                    </c:if>
                </div>
                <div class="detail">
                    <%--<span class="price"><b>10<small>%</small></b>-</span>--%>
                    <c:choose>
                        <c:when test="${SPRING ne null}">
                            <span class="name"><c:out value="${'[' += SPRING.category += ']' += SPRING.title}"/></span>
                            <span class="count"><b>조회</b>0</span>
                            <span class="like"></span>
                        </c:when>
                        <c:otherwise>
                            <span>게시물이 없습니다.</span>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <div class="item">
                <div class="photo">
                    <c:if test="${WEB.file ne null}">
                        <a href="<c:url value='/study/read?id=${WEB.id}'/>">
                        <img class="mainPhotoImg" src="<c:url value='${"/image/" += WEB.file.fileName}'/>">
                        </a>
                    </c:if>
                </div>
                <div class="detail">
                    <%--<span class="price"><b>10<small>%</small></b>-</span>--%>
                    <c:choose>
                        <c:when test="${WEB ne null}">
                            <span class="name"><c:out value="${'[' += WEB.category += ']' += WEB.title}"/></span>
                            <span class="count"><b>조회</b>0</span>
                            <span class="like"></span>
                        </c:when>
                        <c:otherwise>
                            <span>게시물이 없습니다.</span>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <div class="item">
                <div class="photo">
                    <c:if test="${DB.file ne null}">
                        <a href="<c:url value='/study/read?id=${DB.id}'/>">
                        <img class="mainPhotoImg" src="<c:url value='${"/image/" += DB.file.fileName}'/>">
                        </a>
                    </c:if>
                </div>
                <div class="detail">
                    <%--<span class="price"><b>10<small>%</small></b>-</span>--%>
                    <c:choose>
                        <c:when test="${DB ne null}">
                            <span class="name"><c:out value="${'[' += DB.category += ']' += DB.title}"/></span>
                            <span class="count"><b>조회</b>0</span>
                            <span class="like"></span>
                        </c:when>
                        <c:otherwise>
                            <span>게시물이 없습니다.</span>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>
</section>
<section id="section2">
    <div class="section2-inner">
        <h1 class="heading">
            Goods selection
        </h1>
        <div class="goods">
            <div class="good">
                <div class="good-list">
                    <h4>컨텐츠<br>준비중 입니다.</h4>
                    <div>
                        <a href="#none" class="btn">더보기</a>
                    </div>
                </div>
                <div class="good-desc">
                    <p>
                        준비중입니다.
                    </p>
                    <ul>
                        <li>준비중입니다.</li>
                        <li>준비중입니다.</li>
                        <li>준비중입니다.</li>
                        <li>준비중입니다.</li>
                    </ul>
                </div>
            </div>
            <div class="good">
                <div class="good-list">
                    <h4>컨텐츠<br>준비중 입니다.</h4>
                    <div>
                        <a href="#none" class="btn">더보기</a>
                    </div>
                </div>
                <div class="good-desc">
                    <p>
                        준비중입니다.
                    </p>
                    <ul>
                        <li>준비중입니다.</li>
                        <li>준비중입니다.</li>
                        <li>준비중입니다.</li>
                        <li>준비중입니다.</li>
                    </ul>
                </div>
            </div>
            <div class="good">
                <div class="good-list">
                    <h4>컨텐츠<br>준비중 입니다.</h4>
                    <div>
                        <a href="#none" class="btn">더보기</a>
                    </div>
                </div>
                <div class="good-desc">
                    <p>
                        준비중입니다.
                    </p>
                    <ul>
                        <li>준비중입니다.</li>
                        <li>준비중입니다.</li>
                        <li>준비중입니다.</li>
                        <li>준비중입니다.</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>
<section id="section3">
    <div class="board-inner">
        <div class="notice">
            <div class="title">
                <h2>공지사항</h2>
                <a href="<c:url value='/notice/list'/>">더보기</a>
            </div>
            <table>
                <c:forEach items="${noticeList}" var="notice">
                   <tr>
                       <td>
                           <a href="<c:url value='/notice/read?bno=${notice.bno}'/>"><c:out value="${notice.title}"/></a>
                       </td>
                       <td>
                           <fmt:formatDate value="${notice.reg_date}" pattern="yy-MM-dd"/>
                       </td>
                   </tr>
                </c:forEach>
                <c:if test="${empty noticeList}">
                    <td>
                        공지가 없습니다.
                    </td>
                </c:if>
            </table>
        </div>
        <div class="event">
            <div class="title">
                <h2>이벤트</h2>
                <a href="#event">더보기</a>
            </div>
            <table>
                <tr>
                    <td>이벤트가 없습니다.</td>
                </tr>
            </table>
        </div>
    </div>
</section>
</body>
</html>
<%@ include file="/WEB-INF/views/footer.jsp" %>
