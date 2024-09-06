<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
<style type="text/css">
.main-content {
    flex: 1;
}
body {
    font-family: 'Noto Sans', Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #ffffff;
    color: #333333;
    padding-top: 80px;
}

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

/* 영화 카드 레이아웃 */
.movie-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 20px;
    padding: 10px;
}

.movie-card {
    background-color: #ffffff;
    border: 1px solid #e0e0e0;
    border-radius: 5px;
    overflow: hidden;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    transition: transform 0.2s, box-shadow 0.2s;
    position: relative; /* 부모 요소를 relative로 설정 */
    display: flex;
    flex-direction: column; /* 세로 정렬 */
}

.movie-card img {
    width: 100%;
    height: auto;
}

.movie-card .content {
    padding: 15px;
    position: absolute; /* 하단 고정을 위해 absolute 사용 */
    bottom: 0; /* 부모 요소의 하단에 고정 */
    width: 100%; /* 전체 너비 사용 */
    background: rgba(255, 255, 255, 0.9); /* 배경색을 약간 투명하게 설정 */
    box-sizing: border-box; /* 패딩을 포함한 크기 조정 */
}

.movie-card h3 {
    margin: 0;
    font-size: 1.2em;
    color: #333333;
}

.movie-card p {
    margin: 5px 0;
    font-size: 0.9em;
    color: #777777;
}

.movie-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);

}

/* 버튼 스타일 */
.button {
    display: inline-block;
    padding: 10px 20px;
    background-color: #e71a0f;
    color: #ffffff;
    text-align: center;
    border-radius: 5px;
    text-decoration: none;
    font-weight: bold;
    transition: background-color 0.2s;
}

.button:hover {
    background-color: #d0170c;
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
.footer {
    background-color: #333333;
    color: #ffffff;
    text-align: center;
    padding: 20px 0;
    position: fixed;
    bottom: 0;
    width: 100%;
    border-top: 1px solid #e0e0e0;
    z-index: 1000;
}

.footer-content {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 20px;
}

.footer p {
    margin: 0;
    font-size: 1.2em;
    font-weight: bold;
}

.team-list {
    list-style: none;
    padding: 0;
    margin: 10px 0 0 0;
}

.team-list li {
    display: inline;
    margin: 0 10px;
    font-size: 1em;
    font-weight: normal;
}
.movie-carousel {
   position: relative;
    width: 100%;
    display: flex;
    justify-content: center; /* 가로 중앙 정렬 */
    align-items: center; /* 세로 중앙 정렬 */
    overflow: hidden;
}

.carousel-wrapper {
    overflow: hidden;
    width: 80%; /* 캐러셀이 화면의 70% 너비를 차지하도록 설정 */
}

.carousel {
      display: flex;
    transition: transform 0.5s ease-in-out;
}

.movie-card {
    flex: 0 0 33.3333%; /* 3개씩 표시하기 위해 각 카드의 너비를 33.3333%로 설정 */
    box-sizing: border-box;
    margin: 0 10px; /* 카드 간의 간격을 위해 좌우 마진 추가 */
}

/* 캐러셀 컨트롤 버튼 */
.carousel-control {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    background-color: rgba(0, 0, 0, 0.5);
    color: #ffffff;
    border: none;
    padding: 10px;
    cursor: pointer;
    z-index: 10;
}

.carousel-control.prev {
    left: 10px;
}

.carousel-control.next {
    right: 10px;
}

.carousel-control:hover {
    background-color: rgba(0, 0, 0, 0.8);
}
.BOXOFFICE {
	text-align: center; /* 텍스트 중앙 정렬 */
    font-size: 3em; /* 텍스트 크기 크게 */
    font-weight: bold; /* 텍스트 굵게 */
    margin: 20px 0px; /* 위아래로 공간 확보 */
    color: #000000; /* 텍스트 색상 (필요에 따라 변경 가능) */
}
</style>
</head>
<body>
  <!-- 네비게이션 바 -->
    <nav class="navbar">
        <div class="logo">
            <a href="<c:url value='/khcinema/'/>">KH CINEMA</a>
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
	<div class="BOXOFFICE">
		<p>BOX OFFICE</p>
	</div>
    <!-- 영화 목록 -->
    <section class="movie-carousel">
    <div class="carousel-wrapper">
        <div class="carousel">
        	<!-- 영화 카드들이 여기에 들어갑니다. -->
            <div class="movie-card">
           		 <a href="<c:url value="/main/moviedetail?mo_num=${mo.mo_num}"/>">
                <img src="data:image/jpeg;base64,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" alt="영화 포스터 1">
                </a>
                <div class="content">
                    <h3>영화 제목 1</h3>
                    <p>해당영화장르| 해당영화개봉일</p>
                    <a href="해당영화예매 링크" class="button">예매하기</a>
                </div>
            </div>
            <div class="movie-card">
            	<a href="<c:url value="/main/moviedetail?mo_num=${mo.mo_num}"/>">
                <img src="https://upload.wikimedia.org/wikipedia/ko/a/a9/%ED%83%80%EC%A7%9C_%28%EC%98%81%ED%99%94%29.jpg" alt="영화 포스터 2">
                </a>
                <div class="content">
                    <h3>영화 제목 2</h3>
                    <p>해당영화장르| 해당영화개봉일</p>
                    <a href="해당영화예매 링크" class="button">예매하기</a>
                </div>
            </div>
            <div class="movie-card">
            	<a href="<c:url value="/main/moviedetail?mo_num=${mo.mo_num}"/>">
                <img src="https://upload.wikimedia.org/wikipedia/ko/4/43/%EB%8D%B0%EB%93%9C%ED%92%80%EA%B3%BC_%EC%9A%B8%EB%B2%84%EB%A6%B0_%ED%8F%AC%EC%8A%A4%ED%84%B0.jpg" alt="영화 포스터 3">
                </a>
                <div class="content">
                    <h3>영화 제목 3</h3>
                    <p>해당영화장르| 해당영화개봉일</p>
                    <a href="해당영화예매 링크" class="button">예매하기</a>
                </div>
            </div>
            <div class="movie-card">
            	<a href="<c:url value="/main/moviedetail?mo_num=${mo.mo_num}"/>">
                <img src="https://i.namu.wiki/i/usx6eksAOUgWAnzvUZNwHyFeIV39SkORkCjBRTm4nh-bxFZ4pnY7x_arMjVDPV7i3s71_DuYVla0Zfr7CqfSZw.webp" alt="영화 포스터 4">
                </a>
                <div class="content">
                    <h3>영화 제목 4</h3>
                    <p>해당영화장르| 해당영화개봉일</p>
                    <a href="해당영화예매 링크" class="button">예매하기</a>
                </div>
            </div>
            <!-- 더 많은 영화 카드 추가 가능 -->
        </div>
    </div>
    <button class="carousel-control prev">‹</button>
    <button class="carousel-control next">›</button>
</section>
    <footer class="footer">
    <div class="footer-content">
        <p>Team Members:</p>
        <ul class="team-list">
            <li>성재경</li>
            <li>이현호</li>
            <li>장경민</li>
            <li>박광균</li>
        </ul>
    </div>
</footer>
<script>
const carousel = document.querySelector('.carousel');
const prevButton = document.querySelector('.carousel-control.prev');
const nextButton = document.querySelector('.carousel-control.next');
const cardWidth = document.querySelector('.movie-card').offsetWidth + 20; // 카드 너비 + 간격
const visibleCards = 3; // 화면에 보이는 카드 개수
let currentIndex = 0;

function updateCarousel() {
    const translateXValue = -currentIndex * cardWidth; // 카드 너비에 맞게 슬라이드
    carousel.style.transform = `translateX(${translateXValue}px)`;
}

prevButton.addEventListener('click', () => {
    if (currentIndex > 0) {
        currentIndex--;
        updateCarousel();
    }
});

nextButton.addEventListener('click', () => {
    if (currentIndex < carousel.children.length - visibleCards) { // 카드가 3개씩 보일 때
        currentIndex++;
        updateCarousel();
    }
});

// 초기화 시 캐러셀 위치 설정
updateCarousel();
</script>
</body>
</html>
