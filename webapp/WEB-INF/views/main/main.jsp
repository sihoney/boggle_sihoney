<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="${pageContext.request.contextPath}/asset/js/app3.js" defer></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/style3.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/asset/js/jquery-1.12.4.js"></script>
    
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-pen.css" rel="stylesheet">
	<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-pen.css" rel="stylesheet">
	<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-gothic-eco.css" rel="stylesheet">
	<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-myeongjo.css" rel="stylesheet">
</head>
<body>
<!-- Header -->
    <header>
        <!-- nav -->
        <nav>
            <div class="nav-header">
                <h1 class="logo">BOGGLE</h1>
            </div>
            
            <div class="links-container">
                <ul class="links">
                
                	<c:choose>
                		<c:when test="${sessionScope.authUser eq null}">
                			<li>
                				<a href="${pageContext.request.contextPath}/user/joinForm">회원가입</a>
                			</li>
                   			<li class="login" data-logStatus="logout">
		                        <div class="userImg">
		                            <img src="${pageContext.request.contextPath}/asset/img/profile.png" alt="">
		                        </div>
		                        <a href="${pageContext.request.contextPath}/user/loginForm">로그인</a>
		                    </li>
                		</c:when>
                		<c:otherwise>
                			<!-- 로그인 됐을때 화면 -->
		                    <li><a href="${pageContext.request.contextPath}/review/write">기록하기</a></li>
		                    <li class="login" data-logStatus="login" data-userNo="${sessionScope.authUser.userNo }">
		                    	<a href="${pageContext.request.contextPath}/${authUser.nickname}">
		                    		<div class="userImg">
			                            <img src="${pageContext.request.contextPath}/asset/img/profile.png" alt="">
			                        </div>
			                        <a href="${pageContext.request.contextPath}/${sessionScope.authUser.nickname }">${sessionScope.authUser.nickname }</a>
		                    	</a>
		                    </li>
                		</c:otherwise>
                	</c:choose>

                </ul>
            </div>
        
        </nav>
        
        <button class="sidebarBtn">
            <i class="fa-solid fa-bars"></i>
        </button>
    </header>   

    <!-- Container -->
    <div class="container">

        <div class="upDown-container">
            <button class="downBtn">
                <i class="fa-solid fa-chevron-down"></i>
            </button>
            <button class="upBtn">
                <i class="fa-solid fa-chevron-up"></i>
            </button>
            <button class="autoModeBtn">
                <i class="fa-solid fa-expand"></i>
            </button>
        </div>

        <div class="messageModal unstaged">
            <p>슬라이드 전환 방식을 변경하고 싶으면 '엔터'를 눌러주세요</p>
        </div>

        <div class="slide-container"></div>
        
    </div>

    <!-- side-bar dim -->
    <div class="dim unstaged"></div>

    <!-- Side bar -->
    <aside class="sidebar">
        <div class="sidebar-header">
            <div class="nav-header">
                <h1 class="sidebar-logo">BOGGLE</h1>
            </div>
            <button type="button" class="close-btn">
                <i class="fa-solid fa-xmark"></i>
            </button>
        </div>
        <div class="tags">
            <h2 class="subheading">감정 태그</h2>
            <div class="tag-box">
                <!-- <button class="emoTag">행복</button> -->
            </div>
        </div>
        <div class="randomBtn">
            <button class="random-btn">
            	<i class="fa-solid fa-shuffle"></i>
            </button>
            <p class="random-text">랜덤 서평 재생하기</p>
        </div>
        <div class="bgm">
            <h2 class="subheading">BGM</h2>
            <div class="bgm-container">
                <div class="bgm-info-box">
                    <h3 class="song-title">노래 제목</h3>
                    <p class="singer">가수 이름</p>
                </div>
                <div class="btnBoxes">
                    <button class="bgmBtn arrow prevArrow">
                        <i class="fa-solid fa-chevron-left"></i>
                    </button>
                    <!-- <audio src="${pageContext.request.contextPath}/asset/img/whale.mp3" autoplay loop controls id="myAudio">오디오 지원되지 않는 브라우저</audio> -->
                    <button class="bgmBtn playBtn">
                        <i class="fa-solid fa-play"></i>
                    </button>
                    <button class="bgmBtn arrow nextArrow">
                        <i class="fa-solid fa-chevron-right"></i>
                    </button>
                </div>
                <div class="bgm-pagination"></div>
                <audio preload="auto" src="" class="audioEle"></audio>
            </div>
            
        </div>
        <div class="playlist">
            <div class="playlist-header">
                <h2 class="subheading">
                    My 플레이리스트
                </h2>
                <button class="playlistBtn">
                    <i class="fa-solid fa-arrow-right-long"></i>
                </button>
            </div>
            <div class="playlist-container">
            	<!-- 
                <div class="static">
                    <p>새 플레이리스트 추가</p>
                    <button class="playlistAddBtn"><i class="fa-solid fa-plus"></i></button>
                </div>
                -->
                <ul class="playlist-list">
                	<c:choose>
                		<c:when test="${sessionScope.authUser eq null}">
                			<p>로그인 후 이용해주세요</p>
                		</c:when>
                		<c:otherwise>
		                    <!-- 
		                    <li>퇴근길에 보면 힘이 나는 플리</li>
		                    <li>우울할 때 정신차리고 갓생살기</li>
		                    <li>남친이 빡치게 하면 보기</li>
		                    <li>용기뿜뿜 명언 한구절</li> 
		                    -->         		
                		</c:otherwise>
                	</c:choose>

                </ul>
            </div>
        </div>
    </aside>

    <!--  모달 (새 플레이리스트 추가) -->
    <!-- 
    <div class="modal-background">
        <div class="playlistAddModal">
            <div class="modal-header">
                <p>새 플레이리스트 추가</p>
                <button class="modal-closeBtn">
                    <i class="fa-solid fa-xmark"></i>
                </button>
            </div>
            <form>
                <input type="text">
                <button type="submit">추가</button>
            </form>
        </div>
    </div>
	-->
    <!--  모달 (서평 플레이리스트에 추가) -->
    <div class="review-modal-background modal-background">
        <div class="addReviewModal">
        
            <div class="input-box">
                <p>My 플레이리스트</p>
                <button class="modal-closeBtn">
                    <i class="fa-solid fa-xmark"></i>
                </button>
            </div>
            
            <div class="playlist-box">
                <ul>
                	<!-- 
                    <li class="playlist-li" data-playlist-no="">
                        <p>플레이리스트 1</p>
                        <button class="reviewAddBtn"><i class="fa-solid fa-plus"></i></button>
                    </li>
                    -->
                </ul>
            </div>
            <form class="addPlaylist">
            	<input class="addPly-input" type="text" placeholder="새 플레이리스트 추가" name="playlistTitle" required>
            </form>
        </div>
    </div>
</body>
</body>
<script>

</script>
</html>