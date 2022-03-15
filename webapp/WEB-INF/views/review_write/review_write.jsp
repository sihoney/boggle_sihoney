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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/all_css.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/write.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/modal.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/source.css">
	
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
			
			<div id="contents" class="clearfix selectbook-header">
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
            <!-- 
            <div id="contents" class="clearfix selectedbook">
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
			</div>
			-->		
	
			<!-- 감정 태그 선택하기 -->
			<div id="contents" class="clearfix">
				<div id="mood_tag">
					<h1>감정 태그</h1>
				</div>
			</div>

			<div id="btn_mood">
				<!-- <button type="button" class="btn btn-primary">감정 태그</button> -->
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
            <!-- 
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
            -->
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
<script> 
	/* 
		- 책 선택 모달에서 마지막 버튼 비활성화 안했음
	*/
	var query
	var pageNo = 1

	/* 화면 로드되기 전, 감정태그 출력 */
	$("document").ready(function(){
		
		var url = location.href.substring(0, 34) + "/main/getemotion"
		
		$.ajax({
			url: url,
			type: "get",
			
			contentType: "json",
			success: function(data){
				
				/* 화면 출력 */
				for(let item of data) {
					renderEmotionBtn(item)
				}
				
				/* 이벤트 핸들러 넣기 */
				var btnlist = $("#btn_mood").children()
				
				for(var btn of btnlist) {
					btn.onclick = function(){

						/* 하나만 선택 가능 */
						for(var tag of btnlist) {
							tag.classList.remove("active")
						}
						
						$(this).addClass("active")
						
						/* 스타일 옵션 출력 */
					}
				}
						
				
			},
			error:  function(XHR, status, error){
				console.log(status + " : " + error);
			}
			
		})
	})
	
	/* 책 검색 API */
	$("#query-form").on("submit", function(e){
		e.preventDefault()

		let arr = $("#query-form").serializeArray()
		query = arr[0].value
		
		let obj = {
			query : query
		}

		sendRequest(obj)
	})
	
	/* 모달 > 페이징 링크 클릭시 */
	$(".pagination").on("click", ".page-item", function(e){
		e.preventDefault()
		var $this = $(this)
		var target = $this[0].innerText

		pageNo = parseInt(pageNo)
		
		if(target === '«') {
			console.log("previous or next btn")
			pageNo -= 1
			
		} 
		else if(target === '»') {
			console.log("previous or next btn")
			pageNo += 1
			
		} 
		else {
			pageNo = target
		}
		
		console.log(pageNo)
		
		var obj = {
			query: query,
			crtPage: pageNo
		}

		sendRequest(obj)
	})
	
	/* 모달 > 책 선택시 */
	$("#modal-playlist").on("click", ".list", function() {
		var $this = $(this)

		console.log($this)
		
		/* isbn, title, author, imgURL, link, category */
		var isbn = $this.data("isbn")
		var imgURL = $this[0].children[0].children[0].currentSrc
		var title = $this[0].children[1].children[0].innerText
		var author = $this[0].children[1].children[1].innerText
		var totalCnt = $this[0].children[1].children[2].innerText
		var bookUrl = $this.data("url")								/* db에 저장할 때 필요한 책 정보 (!) */
		var category = $this.data("category")
		
		totalCnt = totalCnt.split(" ")[1]
		
		/* 선택 섹션 화면에서 안보이게 & modal 닫기 */
		$(".jumbotron").css("display", "none")
		$("#modal_searchbook").modal("hide")
		
		/* 출력 전 선택된 책 삭제 (처음 책 선택하는 건데도 출력된다...?) */
		if($(".selected-book") !== null) {
			$(".selected-book").remove()			
		}
		
		/* 선택된 책 정보 섹션 출력 */
		renderSelectedBook(isbn, imgURL, title, author, totalCnt)
	})
	
	function renderEmotionBtn(item) {
		var str = '<button type="button" class="btn btn-primary" id="'+ item.emoNo +'">'+ item.emoName +'</button>'
		
		$("#btn_mood").append(str)
	}
	
	function renderSelectedBook(isbn, imgURL, title, author, totalCnt) { // isbn 넘겨줘야 할 것 같다...?
		
		var str = ''
		str += '<div id="contents" class="clearfix selected-book" data-isbn="'+ isbn +'">'
		str += '	<div id="select_box">'
		str += '		<div id="bookVo">'
		str += '			<img id="book_img" src="'+ imgURL +'" alt="..." class="img-thumbnail">'
		str += '			<div id="book_detail">'
		str += '				<h1>'+ title +'</h1>'
		str += '				<h3>저자 '+ author +'</h3>'
		str += '				<div id="book_review">'
		str += '					<span class="review_count">서평 수 </span><span class="review_num">'+ totalCnt +'</span>'
		str += '				</div>'
		str += '			</div>'
		str += '			<button id="btn_delete" type="button" class="btn btn-light">삭제</button>'
		str += '			<button id="btn_modify" type="button" class="btn btn-light">수정</button>'
		str += '		</div>'	
		str += '	</div>'
		str += '</div>'
		
		$(".selectbook-header").after(str)
		
		/* 취소, 수정 버튼 이벤트 핸들러 넣기 */
		$("#btn_delete").on("click", function(){ // 삭제
			$(".selected-book").remove()
			$(".jumbotron").css("display", "block")
		})
		
		$("#btn_modify").on("click", function(){
			$("#modal_searchbook").modal("show")
		})
	}
	
	function sendRequest(obj) {
		$.ajax({
			url: "${pageContext.request.contextPath}/write/searchbook",
			type: "post",
			data: obj,
			
			dataType: "json",
			success: function(data){
				
				var startBtnNo = data.startBtnNo
				var endBtnNo = data.endBtnNo
				var array = data.list
				
				/* 응답 정보 출력 전, 현재 리스트 & 페이징 삭제 */
				$("#modal-playlist").children().remove()
				$(".pagination").children().remove()
				
				/* response 출력 */
				for(let item of array) {
					renderBook(item)
				}
				
				/* 페이징 출력 */
				renderPaging(startBtnNo, endBtnNo)
			},
			error:  function(XHR, status, error){
				console.log(status + " : " + error);
			}
		})
	}
	
	function renderPaging(startNo, endNo) {
		
		var str = ''
		if(pageNo == 1) {
			str += '<li class="page-item" style="pointer-events: none"><a class="page-link" href="" aria-label="Previous"> <span aria-hidden="true">&laquo;</span></a></li>'	
		}
		else {
			str += '<li class="page-item"><a class="page-link" href="" aria-label="Previous"> <span aria-hidden="true">&laquo;</span></a></li>'
		}
		
		for(var i = startNo; i <= endNo; i++) {
			if(i == pageNo) {
				str += '<li class="page-item active"><a class="page-link" href="">' + i + '</a></li>'
			}
			else {
				str += '<li class="page-item"><a class="page-link" href="">' + i + '</a></li>'	
			}
		}
		
		str += '<li class="page-item"><a class="page-link" href="" aria-label="Next"> <span aria-hidden="true">&raquo;</span></a></li>'
		
		$(".pagination").append(str)
	}
	
	function renderBook(item) {
		
		var str = ""
		str += '<li class="list" data-dismiss="modal" data-isbn="'+ item.isbn13 +'" data-url="'+ item.link +'" data-category="'+ item.categoryName +'">'
		str += '	<div class="book-img-container">'
		str += '		<img src="'+ item.cover +'" alt="" class="img-thumbnail">'
		str += '	</div>'
		str += '	<div class="info-container">'
		str += '		<button class="book-title">'+ item.title +'</button>'
		str += '		<div class="book-author">'+ item.author +'</div>'
		str += '		<div class="review-count">서평수 '+ item.totalCnt +'</div>'
		str += '	</div>'
		str += '</li>'

		$("#modal-playlist").append(str)
	}
</script>
</html>