<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="loginId" value="${pageContext.request.session.getAttribute('userId')}"/>
<link rel="stylesheet" href="<c:url value='/resources/css/main.css'/>">
<header>
    <!-- lnb -->
    <div class="lnb-outer">
        <div class="lnb">
            <div class="logo">
                <a href="<c:url value='/'/>">goods <span>shop</span></a>
            </div>
            <div class="lnb-nav">
                <c:choose>
                    <c:when test="${not empty loginId}">
                        <a href="#none"><span id="loginIdtxt"><c:out value="${loginId}" /></span> 님 환영합니다.</a>
                        <a href="<c:url value='/login/logout'/>">로그아웃</a>
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value='/login/login'/>">로그인</a>
                        <a href="<c:url value='/register/memberInsert'/>">회원가입</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
    <!-- gnb -->
    <div class="gnb-outer">
        <nav>
            <ul class="gnb">
                <li>
                    <a href="#none">introduce</a>
                    <div class="dropdown">
                    </div>
                </li>
                <li>
                    <a href="#none">product</a>
                    <div class="dropdown">
                        <a href="#none">item1</a>
                        <a href="#none">item2</a>
                        <a href="#none">item3</a>
                    </div>
                </li>
                <li>
                    <a href="#none">contents</a>
                    <div class="dropdown">
                        <a href="#none">media</a>
                        <a href="#none">news</a>
                        <a href="#none">video</a>
                        <a href="#none">magazine</a>
                    </div>
                </li>
                <li>
                    <a href="<c:url value='/notice/list'/>">공지사항</a>
                </li>
                <li>
                    <a href="#none">자유게시판</a>
                </li>
                <li>
                    <div class="trigger">
                        <span></span>
                        <span></span>
                        <span></span>
                    </div>
                </li>
            </ul>
            <div class="site-map">
                <div class="site">
                    <div>
                        <b>소개글</b>
                        <a href="#none">소개</a>
                        <a href="#none">찾아오시는길</a>
                    </div>
                    <div>
                        <b>상품</b>
                        <a href="#none">상품1</a>
                        <a href="#none">상품2</a>
                        <a href="#none">상품3</a>
                    </div>
                    <div>
                        <b>컨텐츠</b>
                        <a href="#none">준비중 입니다</a>
                    </div>
                    <div></div>
                    <div></div>
                    <div></div>
                </div>
            </div>
        </nav>
    </div>
</header>