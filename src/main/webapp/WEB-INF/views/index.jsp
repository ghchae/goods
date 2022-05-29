<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/top.jsp" %>
<html>
<head>
    <title>메인페이지</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
</head>
<body>
<!-- section -->
<section id="item-section">
    <!-- goods list -->
    <div class="items-inner">
        <h2>Goods</h2>
        <div class="items">
            <div class="item">
                <div class="photo">
                    <a href="#none">
                        <img src="<c:url value='/resources/images/item-01.jpg'/>">
                    </a>
                    <a href="#none">
                        <img src="<c:url value='/resources/images/item-01-hover.jpg'/>">
                    </a>
                </div>
                <div class="detail">
                    <span class="price"><b>10<small>%</small></b>-</span>
                    <span class="name">상품1</span>
                    <span class="count"><b>조회</b>0</span>
                    <span class="like"></span>
                </div>
            </div>
            <div class="item">
                <div class="photo">
                    <a href="#none">
                        <img src="<c:url value='/resources/images/item-02.jpg'/>">
                    </a>
                    <a href="#none">
                        <img src="<c:url value='/resources/images/item-02-hover.jpg'/>">
                    </a>
                </div>
                <div class="detail">
                    <span class="price"><b>10<small>%</small></b>-</span>
                    <span class="name">상품2</span>
                    <span class="count"><b>조회</b>0</span>
                    <span class="like"></span>
                </div>
            </div>
            <div class="item">
                <div class="photo">
                    <a href="#none">
                        <img src="<c:url value='/resources/images/item-03.jpg'/>">
                    </a>
                    <a href="#none">
                        <img src="<c:url value='/resources/images/item-03-hover.jpg'/>">
                    </a>
                </div>
                <div class="detail">
                    <span class="price"><b>10<small>%</small></b>-</span>
                    <span class="name">상품3</span>
                    <span class="count"><b>조회</b>0</span>
                    <span class="like"></span>
                </div>
            </div>
            <div class="item">
                <div class="photo">
                    <a href="#none">
                        <img src="<c:url value='/resources/images/item-04.jpg'/>">
                    </a>
                    <a href="#none">
                        <img src="<c:url value='/resources/images/item-04-hover.jpg'/>">
                    </a>
                </div>
                <div class="detail">
                    <span class="price"><b>10<small>%</small></b>-</span>
                    <span class="name">상품4</span>
                    <span class="count"><b>조회</b>0</span>
                    <span class="like"></span>
                </div>
            </div>
            <div class="item">
                <div class="photo">
                    <a href="#none">
                        <img src="<c:url value='/resources/images/item-05.jpg'/>">
                    </a>
                    <a href="#none">
                        <img src="<c:url value='/resources/images/item-05-hover.jpg'/>">
                    </a>
                </div>
                <div class="detail">
                    <span class="price"><b>0<small>%</small></b>-</span>
                    <span class="name">상품5</span>
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
                    <h4>상품1<br>준비중 입니다.</h4>
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
                    <h4>상품2<br>준비중 입니다.</h4>
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
                    <h4>상품3<br>준비중 입니다.</h4>
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
                <a href="#event">더보기</a>
            </div>
            <table>
                <tr>
                    <td>[공지] 테스트입니다.</td>
                    <td>2022.05.12</td>
                </tr>
                <tr>
                    <td>[공지] 테스트입니다.</td>
                    <td>2022.05.12</td>
                </tr>
                <tr>
                    <td>[공지] 테스트입니다.</td>
                    <td>2022.05.12</td>
                </tr>
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
