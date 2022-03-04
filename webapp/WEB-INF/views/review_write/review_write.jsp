<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <script src="${pageContext.request.contextPath}/asset/js/jquery-1.12.4.js"></script>
    <script src="${pageContext.request.contextPath}/asset/bootstrap/js/bootstrap.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/write.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/modal.css">

    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    

</head>
<body>

    <div id="wrap">
		<div id="container">
			
			<!-- 헤더 -->
            <c:import url="/WEB-INF/views/include/header.jsp"></c:import>

			<!-- progress bar -->
			<div id="" class="clearfix">
                <div class="progressbar-wrapper">
                    <ul class="progressbar">
                        <li class="active">책 선택</li>
                        <li>감정 태그</li>
                        <li>스타일</li>
                        <li>서평 쓰기</li>
                        <li>플레이리스트</li>
                    </ul>
                </div>
            </div>
            <!-- /progress bar -->
           

			<!-- 책 선택하기 -->
			<div id="contents" class="clearfix">
				<div id="book_select">
					<h1>책 선택하기</h1>
				</div>
			</div>
			<div class="jumbotron" data-toggle="modal" data-target="#modal_searchbook">
				<div id="select_box">
					<div class="button">
						<button class="btn_circle">+</button>
					</div>
					<p>읽은 책을 검색해주세요</p>
				</div>
			</div>

            <!-- 책 선택 완료(selectBookOk) -->
            <!-- <div id="contents" class="clearfix">
				<div id="book_select">
					<h1>책 선택하기</h1>
				</div>
            </div>
            <div id="contents" class="clearfix">
				<div id="select_box">
					<div id="bookVo">
						<img id="book_img" src="../img/book/book2.jpeg" alt="..." class="img-thumbnail">
						<div id="book_detail">
							<h1>자유로부터의 도피</h1>
							<h3>저자 에리히 프롬(Erich Fromm)</h3>
							<div id="book_review">
								<span class="review_count">서평 수 </span><span class="review_num">163+</span>
							</div>
						</div>
						<button id="btn_delete" type="button" class="btn btn-light">삭제</button>
						<button id="btn_modify" type="button" class="btn btn-light">수정</button>
					</div>
				</div>
			</div> -->

			<!-- 감정 태그 선택하기 -->
			<div id="contents" class="clearfix">
				<div id="mood_tag">
					<h1>감정 태그</h1>
				</div>
			</div>

			<div id="btn_mood">
				<button type="button" class="btn btn-primary">감정 태그</button>
				<button type="button" class="btn btn-default">감정 태그</button>
				<button type="button" class="btn btn-default">감정 태그</button>
				<button type="button" class="btn btn-default">감정 태그</button>
				<button type="button" class="btn btn-default">감정 태그</button>
				<button type="button" class="btn btn-default">감정 태그</button>
				<button type="button" class="btn btn-default">감정 태그</button>
			</div>
            <!-- /감정 태그 선택하기 -->


			<!-- 스타일 선택하기 -->
			<div id="contents" class="clearfix">
				<div id="style">
					<h1>스타일</h1>
				</div>
			</div>

			<div id="select-style" class="clearfix">
				<div class="btn-group" role="group" aria-label="...">
					<button class="btn_style btn-outline-secondary"></button>
					<button class="btn_style"></button>
					<button class="btn_style"></button>
					<button class="btn_style"></button>
					<button class="btn_style"></button>
				</div>
			</div>
			<!-- /스타일 선택하기 -->
			

			<!-- 서평 쓰기 -->
			<div id="contents" class="clearfix">
				<div id="review_box">
                    <p>
                        “내 삶에서 불가피하게 직면해야 했던 시기가 있습니다.<br>바로 1958년의 여름, 나의 열일곱 살 무렵 말입니다. <br> 나는 그 시기를 사회·역사적으로 그려 내기를 바랐고,<br> 이를테면 오토픽션의 방법으로 『그들의 말 혹은 침묵』을 썼습니다.” <br> -아니 에르노					
                    </p>
				</div>
			</div>
            <p id="limit-text" >
                100/100
            </p>
            <!-- /서평 쓰기 -->


            <!-- 이미지 저장 & 공유하기 -->
			<div id="contents" class="clearfix">
				<div id="download_img">
					<h1>이미지 저장 / 공유하기 </h1>
				</div>
			</div>

            <div class="jumbotron2" data-toggle="modal" data-target="#modal_download_img">
                <p>저장하기</p>
            </div>
            <div class="jumbotron2" data-toggle="modal" data-target="#modal_share_img">
                <p>공유하기</p>
            </div>
            <!-- /이미지 저장 & 공유하기 -->


			<!-- 플레이리스트에 추가 -->
            <div id="contents" class="clearfix">
				<div id="add_playlist">
					<h1>플레이리스트에 추가</h1>
				</div>
			</div>
			<div class="jumbotron" data-toggle="modal" data-target="#modal_playlist">
				<div id="select_box">
					<div class="button">
						<button class="btn_circle">+</button>
					</div>
					<p>플레이리스트</p>
				</div>
			</div>

			<!-- 모달창 -->
			<c:import url="/WEB-INF/views/include/modal.jsp"></c:import>


		</div>
        <!-- /container -->
    

        <!-- 기록하기 버튼 -->
        <div class="btn">
            <button id="btn_admit" class="btn btn-primary btn-block" type="button">기록하기</button>
        </div>
        <!-- /기록하기 버튼 -->


        <!-- 취소 버튼 -->
        <div class="btn">
            <button id="btn_cancle" class="btn btn-light btn-block" type="button">취소</button>
        </div>
        <!-- /취소 버튼 -->   


		<!-- footer -->
            <c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
            
        <!-- /footer -->
        
        <!-- modal창 -->
        <c:import url="/WEB-INF/views/include/modal.jsp"></c:import>


	</div>
    <!-- /wrap -->

    
</body>
</html>