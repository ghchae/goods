<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value='/resources/css/main.css'/>">
<header>
    <!-- lnb -->
    <div class="lnb-outer">
        <div class="lnb">
            <div class="logo">
                <a href="<c:url value='/'/>">study<span>portFolio</span></a>
            </div>
            <div class="lnb-nav">
                <c:choose>
                    <c:when test="${not empty userId}">
                        <a href="#none"><span id="loginIdtxt"><c:out value="${userId}" /></span> 님 환영합니다.</a>
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
                    <a href="#none">소개</a>
                    <div class="dropdown">
                    </div>
                </li>
                <li>
                    <a href="#none">공부</a>
                    <div class="dropdown">
                        <a href="#none">Java</a>
                        <a href="#none">Spring</a>
                        <a href="#none">JavaScript</a>
                        <a href="#none">DataBase</a>
                        <a href="#none">마이바티스</a>
                        <a href="#none">Web</a>
                    </div>
                </li>
                <li>
                    <a href="#none">프로젝트</a>
                    <div class="dropdown">
                        <a href="#none">쇼핑몰</a>
                        <a href="#none">길찾기</a>
                        <a href="#none">홈페이지</a>
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
                        <b>0</b>
                        <a href="#none">0-1</a>
                        <a href="#none">0-2</a>
                    </div>
                    <div>
                        <b>1</b>
                        <a href="#none">1-1</a>
                    </div>
                    <div>
                        <b>2</b>
                        <a href="#none">2-1</a>
                    </div>
                    <div></div>
                    <div></div>
                    <div></div>
                </div>
            </div>
        </nav>
    </div>
</header>