<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
/* 네비게이션 바 */
.navbar {
    background-color: #ffffff;
    border-bottom: 1px solid #e0e0e0;
    position: fixed;
    width: 100%;
    top: 0;
    left: 0;
    z-index: 1000;
    display: flex;
    justify-content: space-between; /* 로고와 메뉴를 양쪽 끝에 배치 */
    align-items : center;
    padding: 20px 30px;
    box-sizing: border-box;
    height: 80px;
}
.navbar .logo a {
    font-size: 1.5em;
    font-weight: bold;
    color: #333333;
    text-decoration: none;
}

.navbar .menu {
    display: flex;
    gap: 20px; /* 메뉴 아이템 사이의 간격 */
}

.navbar .menu a {
    color: #333333;
    text-decoration: none;
    padding: 10px;
    font-weight: bold;
}

.navbar .menu a:hover {
    color: #e71a0f;
}
.navbar a {
    color: #333333;
    text-decoration: none;
    padding: 10px;
    font-weight: bold;
}

.navbar a:hover {
    color: #e71a0f;
}
/* 반응형 디자인 */
@media (max-width: 768px) {
    .navbar {
        flex-direction: column;
        align-items: flex-start;
    }

    .movie-grid {
        grid-template-columns: 1fr;
    }
}
</style>
</head>
<body>
	 <!-- 네비게이션 바 -->
    <nav class="navbar">
        <div class="logo">
           <a href="<c:url value="/main/home"/>">KH CINEMA</a>
        </div>
		<div class="menu">
    		<!-- 비로그인 상태에서 회원가입과 로그인 버튼 표시 -->
    			<c:if test="${!isLoggedIn}">
        			<a href="#">회원가입</a>
        			<a href="#">로그인</a>
    			</c:if>    
   		 	<!-- 로그인 상태에서 로그아웃 버튼 표시 -->
    			<c:if test="${isLoggedIn}">
        			<a href="#">로그아웃</a>
    			</c:if>    
    		<!-- 관리자 로그인 시 영화 등록 버튼 표시 -->
    			<c:if test="${isAdmin}">
        			<a href="#">영화 등록</a>
    			</c:if>
		</div>
    </nav>
</body>
</html>
