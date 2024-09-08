<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
    <style type="text/css">
        html, body {
            height: 100%;
            margin: 0;
            display: flex;
            flex-direction: column;
            font-family: 'Noto Sans', Arial, sans-serif;
            background-color: #ffffff;
            color: #333333;
        }
        .main-content {
            flex: 1;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        body {
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
            justify-content: space-between;
            align-items: center;
            padding: 20px 30px;
            box-sizing: border-box;
            height: 80px;
        }
        .navbar .logo a,
        .navbar .menu a {
            color: #333333;
            text-decoration: none;
            font-weight: bold;
        }
        .navbar .menu a {
            margin-left: 20px;
        }
        .navbar .menu a:hover,
        .navbar a:hover {
            color: #e71a0f;
        }
        /* 영화 카드 레이아웃 */
        .movie-carousel {
            width: 100%;
            overflow: hidden;
            position: relative;
        }
        .carousel-wrapper {
            display: flex;
            transition: transform 0.5s ease-in-out;
            padding: 0 50px; /* 여백을 넓혀서 버튼과 카드가 겹치지 않도록 설정 */
            box-sizing: border-box;
        }
        .carousel-controls {
            position: absolute;
            top: 50%;
            width: 100%;
            display: flex;
            justify-content: space-between;
            transform: translateY(-50%);
            pointer-events: none; /* 컨트롤이 무비 카드 위에 있어도 클릭 가능하게 함 */
        }
        .carousel-control {
            background-color: rgba(0, 0, 0, 0.5);
            color: #ffffff;
            border: none;
            padding: 10px;
            cursor: pointer;
            z-index: 10;
            pointer-events: all; /* 버튼 클릭 가능하게 함 */
        }
        .carousel-control.prev {
            position: absolute;
            left: 0;
            transform: translateX(-50%);
        }

        .carousel-control.next {
            position: absolute;
            right: 0;
            transform: translateX(50%);
        }  
        .movie-card {
            flex: 0 0 calc(33.33% - 20px); /* 카드 너비를 33.33%로 조정 */
            margin-right: 20px; /* 카드 사이의 간격을 설정 */
            box-sizing: border-box;
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
        }
        .movie-card img {
            width: 100%; /* 이미지 너비를 100%로 설정 */
            height: auto; /* 비율에 맞게 높이 조정 */
            max-height: 400px; /* 최대 높이 제한 */
        }
        .movie-card .content {
            padding: 15px;
            background: rgba(255, 255, 255, 0.9);
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
            border-radius: 5px;
            text-decoration: none;
            font-weight: bold;
            transition: background-color 0.2s;
        }
        .button:hover {
            background-color: #d0170c;
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
        /* 반응형 디자인 */
        @media (max-width: 768px) {
            .navbar {
                flex-direction: column;
                align-items: flex-start;
            }
            .movie-card {
                flex: 0 0 calc(100% - 20px); /* 화면이 작을 때 카드 너비 조정 */
                margin-right: 0; /* 카드 사이의 간격 제거 */
            }

            .movie-card img {
                width: 100%; /* 이미지 너비를 100%로 설정 */
                margin: 0; /* 마진 제거 */
            }
        }
        /* 푸터 */
        .footer {
            background-color: #333333;
            color: #ffffff;
            text-align: center;
            padding: 20px 0;
            border-top: 1px solid #e0e0e0;
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
        }
        .BOXOFFICE {
            text-align: center;
            font-size: 3em;
            font-weight: bold;
            margin-bottom: 20px;
            color: #000000;
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
            <c:if test="${!isLoggedIn}">
                <a href="#">회원가입</a>
                <a href="#">로그인</a>
            </c:if>    
            <c:if test="${isLoggedIn}">
                <a href="#">로그아웃</a>
            </c:if>    
            <c:if test="${isAdmin}">
                <a href="#">영화 등록</a>
            </c:if>
        </div>
    </nav>

    <!-- 메인 콘텐츠 -->
    <div class="main-content">
        <div class="BOXOFFICE">
            <p>BOX OFFICE</p>
        </div>
        <!-- 영화 목록 -->
        <section class="movie-carousel">
            <div class="carousel-wrapper">
                <div class="movie-card">
                    <img src="https://upload.wikimedia.org/wikipedia/ko/a/a9/%ED%83%80%EC%A7%9C_%28%EC%98%81%ED%99%94%29.jpg" alt="영화 포스터 2">
                    <div class="content">
                        <h3>영화 제목 2</h3>
                        <p>해당영화장르| 해당영화개봉일</p>
                        <a href="#" class="button">예매하기</a>
                    </div>
                </div>
                <div class="movie-card">
                    <img src="https://upload.wikimedia.org/wikipedia/ko/a/a9/%ED%83%80%EC%A7%9C_%28%EC%98%81%ED%99%94%29.jpg" alt="영화 포스터 2">
                    <div class="content">
                        <h3>영화 제목 2</h3>
                        <p>해당영화장르| 해당영화개봉일</p>
                        <a href="#" class="button">예매하기</a>
                    </div>
                </div>
                <div class="movie-card">
                    <img src="https://upload.wikimedia.org/wikipedia/ko/a/a9/%ED%83%80%EC%A7%9C_%28%EC%98%81%ED%99%94%29.jpg" alt="영화 포스터 2">
                    <div class="content">
                        <h3>영화 제목 2</h3>
                        <p>해당영화장르| 해당영화개봉일</p>
                        <a href="#" class="button">예매하기</a>
                    </div>
                </div>
                <div class="movie-card">
                    <img src="https://upload.wikimedia.org/wikipedia/ko/4/43/%EB%8D%B0%EB%93%9C%ED%92%80%EA%B3%BC_%EC%9A%B8%EB%B2%84%EB%A6%B0_%ED%8F%AC%EC%8A%A4%ED%84%B0.jpg" alt="영화 포스터 3">
                    <div class="content">
                        <h3>영화 제목 3</h3>
                        <p>해당영화장르| 해당영화개봉일</p>
                        <a href="#" class="button">예매하기</a>
                    </div>
                </div>
                <div class="movie-card">
                    <img src="https://upload.wikimedia.org/wikipedia/ko/4/43/%EB%8D%B0%EB%93%9C%ED%92%80%EA%B3%BC_%EC%9A%B8%EB%B2%84%EB%A6%B0_%ED%8F%AC%EC%8A%A4%ED%84%B0.jpg" alt="영화 포스터 3">
                    <div class="content">
                        <h3>영화 제목 3</h3>
                        <p>해당영화장르| 해당영화개봉일</p>
                        <a href="#" class="button">예매하기</a>
                    </div>
                </div>
                <div class="movie-card">
                    <img src="https://upload.wikimedia.org/wikipedia/ko/4/43/%EB%8D%B0%EB%93%9C%ED%92%80%EA%B3%BC_%EC%9A%B8%EB%B2%84%EB%A6%B0_%ED%8F%AC%EC%8A%A4%ED%84%B0.jpg" alt="영화 포스터 3">
                    <div class="content">
                        <h3>영화 제목 3</h3>
                        <p>해당영화장르| 해당영화개봉일</p>
                        <a href="#" class="button">예매하기</a>
                    </div>
                </div>
                <!-- 더 많은 영화 카드 추가 가능 -->
            </div>
            <div class="carousel-controls">
                <button class="carousel-control prev">‹</button>
                <button class="carousel-control next">›</button>
            </div>
        </section>
    </div>

    <!-- 푸터 -->
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
        document.addEventListener('DOMContentLoaded', () => {
            const carouselWrapper = document.querySelector('.carousel-wrapper');
            const prevButton = document.querySelector('.carousel-control.prev');
            const nextButton = document.querySelector('.carousel-control.next');

            // 카드 너비 계산 시 마진 포함
            const card = document.querySelector('.movie-card');
            const cardStyles = getComputedStyle(card);
            const cardWidth = card.offsetWidth + parseInt(cardStyles.marginRight, 10); // 마진을 포함한 너비 계산
            const visibleCards = 3; // 화면에 3개 카드가 보이도록 설정
            let currentIndex = 0;

            function updateCarousel() {
                const translateXValue = -currentIndex * cardWidth;
                carouselWrapper.style.transform = `translateX(${translateXValue}px)`;
            }

            prevButton.addEventListener('click', () => {
                if (currentIndex > 0) {
                    currentIndex--;
                    updateCarousel();
                }
            });

            nextButton.addEventListener('click', () => {
                if (currentIndex < carouselWrapper.children.length - visibleCards) {
                    currentIndex++;
                    updateCarousel();
                }
            });

            // 캐러셀 초기화
            updateCarousel();
        });
    </script>
</body>
</html>
