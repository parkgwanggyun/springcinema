<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 상세</title>
<style type="text/css">
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
.navbar .logo a {
    font-size: 1.5em;
    font-weight: bold;
    color: #333333;
    text-decoration: none;
}

.navbar .menu {
    display: flex;
    gap: 20px;
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
/* 버튼 스타일 */
.footer {
    background-color: #333333;
    color: #ffffff;
    text-align: center;
    padding: 20px 0;
    /* position: fixed; */ /* 고정 위치 속성 삭제 */
    bottom: 0; /* 고정 위치 관련 속성 삭제 */
    width: 100%;
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
    font-weight: normal;
}

/* 기본적인 레이아웃 */
#contents_new23 {
    width: 100%;
    max-width: 1200px;
    margin: 100px auto; /* 네비게이션 바 아래 공간 추가 */
    padding: 20px;
    font-family: Arial, sans-serif;
    color: #333;
}

#contents {
    display: flex;
    flex-direction: row;
    background-color: #fff;
    border: 1px solid #ddd;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    padding: 20px;
}

.poster_info {
    flex: 1;
    margin-right: 20px; /* 이미지와 오른쪽 내용 사이에 공간 추가 */
}

.poster_info img {
    width: 100%;
    max-width: 300px;
    display: block;
    border-radius: 8px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2);
}

.detail_top_wrap {
    flex: 2;
}

.tit_info strong {
    font-size: 24px;
    font-weight: bold;
    color: #000;
    margin-bottom: 10px;
    display: block;
}

.mov_info1 {
    display: flex;
    gap: 10px; /* 항목 사이에 간격 추가 */
    align-items: center;
    font-size: 16px;
    margin-bottom: 20px;
    list-style-type: none; /* 기본 점 제거 */
}
.mov_info1 li span {
    margin-right: 10px; /* 각 span 요소 사이에 간격 추가 */
}
.mov_info1 li:last-child::after {
    content: ''; /* 마지막 항목에는 구분 기호 없앰 */
}
.mov_info1 li {
    display: flex;
    align-items: center;
}
.txtarea_box {
    margin-top: 20px;
}

.txtarea span {
    font-size: 16px;
    line-height: 1.6;
    color: #444;
}

.button {
    display: inline-block;
    padding: 10px 20px;
    background-color: #ff5500;
    color: #fff;
    text-decoration: none;
    border-radius: 5px;
    transition: background-color 0.3s;
    margin-top: 20px;
	text-align : right;
}

.button:hover {
    background-color: #ff3300;
}

/* 탭 스타일 */
.tab_con {
    margin-top: 40px;
}

.innerfull.gray {
    background-color: #f9f9f9;
}

.inner980 {
    max-width: 980px;
    margin: 0 auto;
}

.movi_tab_info1 h4 {
    font-size: 20px;
    font-weight: bold;
    margin-bottom: 20px;
}

.detail_info2 {
    list-style: none;
    padding: 0;
    margin: 0;
    background-color: #fff;
    border: 1px solid #ddd; /* 테두리 추가 */
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 추가 */
    padding: 20px;
}

.detail_info2 li {
    display: flex;
    justify-content: space-between;
    font-size: 16px;
    padding: 10px 0;
    border-bottom: 1px solid #ddd;
}

.detail_info2 li em {
    font-weight: bold;
    color: #333;
}

.detail_info2 li span {
    color: #666;
}
    /* 수정 버튼과 입력 필드 스타일 */
    .edit-input {
        width: 100%;
        padding: 10px;
        margin: 10px 0;
        font-size: 16px;
        border: 1px solid #ddd;
        border-radius: 4px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    /* 저장 버튼 스타일 */
    .button {
        display: inline-block;
        padding: 10px 20px;
        background-color: #ff5500;
        color: #fff;
        text-decoration: none;
        border-radius: 5px;
        transition: background-color 0.3s;
        margin-top: 20px;
        text-align: right;
        cursor: pointer;
        border: none;
        font-size: 16px;
    }

    .button:hover {
        background-color: #ff3300;
    }

    .button[disabled] {
        background-color: #ddd;
        cursor: not-allowed;
    }

    /* 입력 필드 및 버튼 컨테이너 */
    .form-container {
        margin-top: 20px;
        padding: 20px;
        background-color: #f9f9f9;
        border: 1px solid #ddd;
        border-radius: 8px;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    }

    .form-group {
        margin-bottom: 20px;
    }

    .form-group label {
        display: block;
        font-size: 16px;
        font-weight: bold;
        margin-bottom: 5px;
    }

    .form-group input {
        width: 100%;
        padding: 10px;
        font-size: 16px;
        border: 1px solid #ddd;
        border-radius: 4px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }
</style>
</head>
<body>
    <nav class="navbar">
        <div class="logo">
           <a href="<c:url value='/khcinema/'/>">KH CINEMA</a>
        </div>
		<div class="menu">
    		<!-- 로그인 상태에 따라 회원가입, 로그인, 로그아웃 버튼 표시 -->
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
    <div id="contents_new23">
    	<div id="contents" class="contents_movie_detail">
    		<div class="poster_info">
    			<img alt="영화상세" src="https://cf.lottecinema.co.kr//Media/MovieFile/MovieImg/202409/21394_103_1.jpg">
    		</div>
    		<div class="detail_top_wrap new22">
    			<div class="tit_info">
    				<strong id="movieTitle">영화제목</strong>
    			</div>
    			<ul class="mov_info1">
    				<li><span id="releaseDate">xxxx-xx-xx</span> <!-- 개봉일 --></li>
    				<li><span id="duration">200</span> 분 <!-- 상영시간 --></li>
    				<li><span id="ageRating">15</span> 세 <!-- 시청 가능 연령 --></li>
    			</ul>
    			<div class="txtarea_box movdetailtxt">
    				<div class="txtarea">
    					<span id="movieDescription">가족들도 못 챙기고 밤낮없이 범죄들과 싸우는 베테랑 형사 '서도철'(황정민)과 강력범죄수사대 형사들...</span>
    				</div>
    			</div>
    			<!-- 영화상세 관리자 로그인 시에만 보이는 수정 버튼 -->
  				<div style="text-align: right;">
    				<c:if test="${isAdmin}">
    					<!-- 수정 기능 추가 -->
       					<button id="editBtn" class="button">수정하기</button>
       					<button id="saveBtn" class="button" style="display:none;">저장하기</button>
    				</c:if>
    				<a href="#" class="button">예매하기</a>
				</div>
    		</div>
    	</div>
  		<div class="tab_con">
  			<div class="innerfull gray">
  				<div class="inner980">
  					<div class="movi_tab_info1">
  						<h4 class="tit_info_type1">영화정보</h4>
  						<ul class="detail_info2">
  							<li><em>장르</em><span id="genre">액션</span></li>
  							<li><em>감독</em><span id="director">감독이름</span></li>
  							<li><em>출연</em><span id="actors">배우이름</span></li>
  						</ul>
	  				<!-- 영화정보 관리자 로그인 시에만 보이는 수정 버튼 -->
  						 <div style="text-align: right;">
    						<c:if test="${isAdmin}">
       							<button id="editInfoBtn" class="button">정보 수정</button>
       							<button id="saveInfoBtn" class="button" style="display:none;">저장하기</button>
    						</c:if>
    					</div>
  					</div>
  				</div>
  			</div>
  		</div>
   </div>
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

    <!-- JavaScript 코드 -->
    <script>
    const editBtn = document.getElementById('editBtn');
    const saveBtn = document.getElementById('saveBtn');
    const fieldsToEdit = ['movieTitle', 'releaseDate', 'duration', 'ageRating', 'movieDescription'];

    // 수정 버튼 클릭 시
    editBtn.addEventListener('click', () => {
        fieldsToEdit.forEach(id => {
            const element = document.getElementById(id);
            const currentValue = element.textContent;
            element.innerHTML = `<input class="edit-input" type='text' value='${currentValue}' />`;
        });
        editBtn.style.display = 'none';
        saveBtn.style.display = 'inline-block';
    });

    // 저장 버튼 클릭 시
    saveBtn.addEventListener('click', () => {
        fieldsToEdit.forEach(id => {
            const element = document.getElementById(id);
            const inputField = element.querySelector('input');
            if (inputField) {
                element.textContent = inputField.value;
            }
        });
        editBtn.style.display = 'inline-block';
        saveBtn.style.display = 'none';
    });

    // 영화 정보 수정
    const editInfoBtn = document.getElementById('editInfoBtn');
    const saveInfoBtn = document.getElementById('saveInfoBtn');
    const infoFieldsToEdit = ['genre', 'director', 'actors'];

    editInfoBtn.addEventListener('click', () => {
        infoFieldsToEdit.forEach(id => {
            const element = document.getElementById(id);
            const currentValue = element.textContent;
            element.innerHTML = `<input class="edit-input" type='text' value='${currentValue}' />`;
        });
        editInfoBtn.style.display = 'none';
        saveInfoBtn.style.display = 'inline-block';
    });

    saveInfoBtn.addEventListener('click', () => {
        infoFieldsToEdit.forEach(id => {
            const element = document.getElementById(id);
            const inputField = element.querySelector('input');
            if (inputField) {
                element.textContent = inputField.value;
            }
        });
        editInfoBtn.style.display = 'inline-block';
        saveInfoBtn.style.display = 'none';
    });
    </script>
</body>
</html>
