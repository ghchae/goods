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
<%--                    <a href="#none">--%>
<%--                        <img src="<c:url value='/resources/images/item-01.jpg'/>">--%>
<%--                    </a>--%>
<%--                    <a href="#none">--%>
<%--                        <img src="<c:url value='/resources/images/item-01-hover.jpg'/>">--%>
<%--                    </a>--%>
                </div>
                <div class="detail">
                    <%--<span class="price"><b>10<small>%</small></b>-</span>--%>
                    <span class="name">Java</span>
                    <span class="count"><b>조회</b>0</span>
                    <span class="like"></span>
                </div>
            </div>
            <div class="item">
                <div class="photo">
                </div>
                <div class="detail">
                    <%--<span class="price"><b>10<small>%</small></b>-</span>--%>
                    <span class="name">Spring</span>
                    <span class="count"><b>조회</b>0</span>
                    <span class="like"></span>
                </div>
            </div>
            <div class="item">
                <div class="photo">
                    <c:if test="${JS.file.id ne ''}">
                        <img class="mainPhotoImg" src="<c:url value='${"/image/" += JS.file.fileName}'/>">
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
                </div>
                <div class="detail">
                    <%--<span class="price"><b>10<small>%</small></b>-</span>--%>
                    <span class="name">DataBase</span>
                    <span class="count"><b>조회</b>0</span>
                    <span class="like"></span>
                </div>
            </div>
            <div class="item">
                <div class="photo">
                </div>
                <div class="detail">
                    <%--<span class="price"><b>0<small>%</small></b>-</span>--%>
                    <span class="name">Web</span>
                    <span class="count"><b>조회</b>0</span>
                    <span class="like"></span>
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
