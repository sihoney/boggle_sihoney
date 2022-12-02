<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/asset/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/all_css.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/mybook_review.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/modal.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/source.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/write.css">
<script src="${pageContext.request.contextPath}/asset/js/jquery-1.12.4.js"></script>
<script src="${pageContext.request.contextPath}/asset/bootstrap/js/bootstrap.js"></script>
</head>
<body>
	<div id="wrap">
		<!-- 헤더 -->
		<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
		<!-- ------nav------ -->
		<div id="nav" class="clearfix">
			<c:choose>
				<c:when test="${result eq 'sameUser'}">
					<ul class="nav nav-tabs">
						<li role="presentation" class="active"><a href="${pageContext.request.contextPath}/${nickname}">내 서평</a></li>
						<li role="presentation"><a href="${pageContext.request.contextPath}/${nickname}/tastemain">취향저격</a></li>
						<li role="presentation"><a href="${pageContext.request.contextPath}/${nickname}/like_playlist">플레이리스트</a></li>
						<!--세션 아이디와 사이트아이디 같을때
						<li role="presentation"><a href="${pageContext.request.contextPath}/analyze">통계</a></li>
						-->
					</ul>
				</c:when>
				<c:otherwise>
					<!-- 세션아이디랑 다를때는 사이트주소의 아이디와 같은 유저의 데이터들 불러오기-->
					<ul class="nav nav-tabs">
						<li role="presentation" class="active"><a href="${pageContext.request.contextPath}/${nickname}">남 서평</a></li>
						<li role="presentation"><a href="${pageContext.request.contextPath}/${nickname}/tastemain">취향저격</a></li>
						<li role="presentation"><a href="${pageContext.request.contextPath}/${nickname}/like_playlist">플레이리스트</a></li>
					</ul>
				</c:otherwise>
			</c:choose>
		</div>
		<!-- ------nav------ -->
		<!--content-->
		<div class="container">
			<div class="row">
				<!-- col-xs-8 -->
				<div id="content" class="col-xs-8">
					<!--기록하기 박스-->
					<!-- 작성자아이디와 세션아이디가 동일할 시에만 보이게 -->
					<c:if test="${result eq 'sameUser'}">
						<div id="writebox" class="jumbotron">
							<h1>서평 기록하기</h1>
							<p>'${authUser.nickname}'님, 오늘은 어떤 책을 읽으셨나요?</p>
							<p>
								<a class="btn btn-primary btn-md" href="${pageContext.request.contextPath}/review/write" role="button">기록하기</a>
							</p>
						</div>
					</c:if>
					<!-- list -->
					<div id="list">
						<ul>
							<li><a><span id="latest-order">최신순</span></a></li>
							<li><a><span id="best-order">인기순</span></a></li>
						</ul>
						<span class="glyphicon glyphicon-filter" aria-hidden="true"></span>
						<div id="category" class="dropdown">
							<button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
								감정태그 <span class="caret"></span>
							</button>
							<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
								<li role="presentation"><a role="menuitem" tabindex="-1">외로운</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1">심심한</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1">슬픈</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1">충만한</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1">편안한</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1">즐거운</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1">희망찬</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1">황홀한</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1">용감한</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1">불안한</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1">무력한</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1">화난</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1">상처입은</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1">회의적인</a></li>
							</ul>
						</div>
					</div>
					<c:if test="${result eq 'sameUser'}">
						<!-- 서평 리스트 -->
						<div id="rvlist"></div>
					</c:if>
					<!-- paging -->
				</div>
				<!-- //col-xs-8 -->
				<!-- col-xs-4:프로필 -->
				<div id="aside" class="col-xs-4">
					<div id="profile-box" class="panel panel-default">
						<div class="panel-heading">
							<c:choose>
								<c:when test="${result eq 'sameUser'}">
									<h3 id="profile-title" class="panel-title">내 서재</h3>
								</c:when>
								<c:otherwise>
									<h3 id="profile-title" class="panel-title">${result}님의서재</h3>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="panel-body">
							<div id="profile">
								<img class="img-circle" id="profile-image" src="${Userinfo.userProfile }" onerror="this.src='${pageContext.request.contextPath}/asset/img/profile.png'">
							</div>
							<c:choose>
								<c:when test="${result eq 'sameUser'}">
									<p id="username">${authUser.nickname}</p>
								</c:when>
								<c:otherwise>
									<p id="username">${result}</p>
								</c:otherwise>
							</c:choose>
							<p id="level">Lv.0</p>
							<div id="info">
								<a href="${pageContext.request.contextPath}/user/user_modify">회원정보수정</a> <a href="${pageContext.request.contextPath}/user/logout">로그아웃</a>
							</div>
						</div>
					</div>
				</div>
				<!-- //col-xs-4 -->
			</div>
		</div>
		<!--content-->
		
		<!-- footer -->
		<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
		<!-- modal창 -->
		<c:import url="/WEB-INF/views/include/modal.jsp"></c:import>
				
	</div>
	
	<div class="msg_modal unstaged">
		<p>저장되었습니다</p>
	</div>
	
	<div class="modal_myply unstaged">
		<div class="modal_ply_header">
			<p>My 플레이리스트</p>
			<button class="modal_myply_btn">내 서평 보러가기</button>
		</div>
		<div class="modal_ply_content">
			<ul class="modal_ply_ul">
			</ul>
		</div>
	</div>
	
	<input id="sort_value" type="hidden" name="sort" value="${sort }"/>
	<input id="crtPage_value" type="hidden" name="crtPage" value="${crtPage }"/>
	<input id="emoName_value" type="hidden" name="emoName" value="${emoName }"/>
</body>
<script type="text/javascript">
	
	let projectName
	let nickname
	
	let reviewNo
	
	let sort
	let crtPage
	let emoName
	
	/**************** 
	EVENT LISTENER 
	*******************/
	
	//리스트(로딩되기전에 요청)
	$(document).ready(function() {
		
		let urlObj = new URL(location.href)
		projectName = "/" + urlObj.pathname.split("/")[1]
		nickname = decodeURI(urlObj.pathname.split("/")[2])
		
		console.log("리스트요청");
		
		//색깔변화
		$('#latest-order').attr('class','txt-b');
    	$('#best-order').attr('class','');
    	
		//리스트그리기
		sort = $('#sort_value').val()
		crtPage = $('#crtPage_value').val()
		emoName = $('#emoName_value').val()

		if(sort == 'latest' || sort == 'popular') {
			reviewList(sort, crtPage)
		} 
		else {
			reviewListByEmotion(emoName, crtPage)
			//emotionList(crtPage, emoName)
		}
		
		// 최신순 / 인기순 마크 색변화
		if(sort == 'latest') {
			$('#latest-order').attr('class','txt-b');
	    	$('#best-order').attr('class','');
		} 
		else if(sort == 'popular'){
			$('#best-order').attr('class','txt-b');
	    	$('#latest-order').attr('class','');
		}
	});
	
	// 최신순 인기순 버튼 클릭
	// 최신순
	$('#latest-order').on('click', function() {
		console.log('최신순');
		
		sort = 'latest'
		
		//색깔변화
		$('#latest-order').attr('class','txt-b');
    	$('#best-order').attr('class','');
		
    	reviewList(sort, 1)
		//fetchRender(1);
	});

	// 인기순
	$('#best-order').on('click', function() {
		console.log('인기순');
		
		sort = 'popular'
		
		//색깔변화
		$('#best-order').attr('class','txt-b');
    	$('#latest-order').attr('class','');
		
    	reviewList(sort, 1)
		//fetchRender(1);
	});
	
	// 감정태그
	$(".dropdown-menu").on("click", "li", function() {

		sort = 'emotion'
		
		//데이터수집
		emoName = $(this).text();
						
		//출력
		console.log("선택한 감정태그 : "+ emoName);

		reviewListByEmotion(emoName, 1)
		//emotionList(1, emoName)
	});
	
	
	/* modal_add_playlist - closeBtn */
	$(".modal_myply_btn").on("click", function(){
		
		$(".modal_myply").removeClass("opaque")
		
		$(".modal_myply").one("transitionend", function(){

			$(".modal_myply").addClass("unstaged")
		})

	})
	
	//좋아요 버튼을 클릭했을때(이벤트)
	$("#rvlist").on("click", ".like", function() {
		
		//데이터수집
		var $this = $(this);
		
		var no = $this.data("reviewno");
		//var likecnt = parseInt($(this).next().data("likecnt"));
		var likecnt = $this.next().data("likecnt");
		
		//출력(리뷰넘버찍어보기), json 으로 보내주기
		console.log("서평넘버 : "+no+", 좋아요 수 : "+likecnt);
		
		// 서평 좋아요
		likeReview(no).then(likeok => {
			
			//포함되어있으면 true      
		    let isExist = document.getElementById('latest-order').classList.contains('txt-b');  
		    console.log(isExist);				
		    console.log(no);			 
		   
		  	//좋아요인경우
		   	if (likeok.likecheck == 0) {	
		   		
			    console.log("좋아요");
			    console.log(likeok.likecnt);
				
			  	//하트모양변경
		      	$this.attr('class', 'like glyphicon glyphicon-heart');
			  	
			    //카운트 +1
			    $this.next().html(likeok.likecnt+1);	
			  	
		   } else {
			   
		       console.log("좋아요취소");
		      
		       $this.attr('class','like glyphicon glyphicon-heart-empty');
		       
		       $this.next().html(likeok.likecnt-1);
		   }			
		})
	});
	
	//삭제 버튼을 눌렀을때
	$("#rvlist").on("click", ".delete", function() {

		//데이터수집
		var $this = $(this);
		var no = $this.data("reviewno");
		
		//출력
		console.log("삭제하려는서평 : "+no);
		
		// 서평 삭제
		deleteReview(no).then(checkuser => {
			if(checkuser == 1){
				//해당 서평 삭제(화면변화)
				$("#r"+no).remove();	
				//삭제알림  
				console.log("리뷰삭제")
				alert('서평이 삭제되었습니다! :-)');
			}else{
				//삭제실패알림  
				console.log("리뷰삭제실패")
				alert('잘못된 접근입니다! :-/');
			}			
		})
	});	
	
	/**************** 
	UTIL 
	*******************/
	
	async function reviewList(sort, crtPage) {
		
		const data = await fetchReviewList(sort, crtPage)
		
		/*성공시 처리해야될 코드 작성*/
		let mbList = data.mybookList
		let prev = data.prev
		let next = data.next
		let startPageBtnNo = data.startPageBtnNo
		let endPageBtnNo = data.endPageBtnNo
		
		//초기화 후 그리기
		$("#rvlist").empty();
		$(".mybook_paging").remove();
		
		//객체 리스트 돌리기(화면 출력)
		renderList(mbList, "down");
		
		// 페이징 렌더
		renderPaging(prev, next, startPageBtnNo, endPageBtnNo)
						
		/* 더보기 플리추가 클릭했을 때 이벤트 */
		$(".add_pli").on("click", function(){
			reviewNo = $(this).data("reviewno")
			let userNo = $(this).data("userno")

			// 내 플리 불러오기 
			getMyPly(userNo).then(data => {
				renderMyPly(data)
			})
			
			// 모달 보임 
			$(".modal_myply").removeClass("unstaged")
			$(".modal_myply").addClass("opaque")
		})		
	}
	
	async function reviewListByEmotion(emoName, crtPage) {
		
		const data = await fetchReviewListEmotion(emoName, crtPage)
		
		/*성공시 처리해야될 코드 작성*/
		let emoList = data.mybookList
		let prev = data.prev
		let next = data.next
		let startPageBtnNo = data.startPageBtnNo
		let endPageBtnNo = data.endPageBtnNo
		
		//초기화
		$("#rvlist").empty();
		$(".mybook_paging").remove();
		
		//객체 리스트 돌리기(화면 출력)
		renderList(emoList, "down")
		
		//페이징
		renderPaging(prev, next, startPageBtnNo, endPageBtnNo)
		
		/* 더보기 플리추가 클릭했을 때 이벤트 */
		$(".add_pli").on("click", function(){
			reviewNo = $(this).data("reviewno")
			let userNo = $(this).data("userno")

			// 내 플리 불러오기 
			getMyPly(userNo).then(data => {
				renderMyPly(data)
			})
			// 모달 보임 
			$(".modal_myply").removeClass("unstaged")
			$(".modal_myply").addClass("opaque")
		})		
	}
	
	/**************** 
	FETCH 
	*******************/
	
	// 최신순, 인기순
	async function fetchReviewList(sort, crtPage) {
		try {
			const response = await fetch(projectName + "/" + nickname +  "/list?sort=" + sort + "&crtPage=" + crtPage)
			
			return response.json()			
		} catch(error) {
			console.log("Faild to fetch: " + error)
			
			return "error"
		}
	}
	// 감정
	async function fetchReviewListEmotion(emoName, crtPage){
		try {
			const response = await fetch(projectName + "/" + nickname + "/list?sort=emotion&crtPage=" + crtPage + "&emoName=" + emoName)
			
			return response.json()			
		} catch(error) {
			console.log("Failed to fetch: " + error)
			
			return "error"
		}
	}
	// 서평 삭제
	async function deleteReview(reviewNo) {
		try {
			var clickReviewVo = {
					reviewNo : reviewNo
				};
			
			const response = await fetch(projectName +"/delete", {
					method: "POST",
					headers : {
						'Content-Type': 'application/json'
					},
					body: JSON.stringify(clickReviewVo)
				})
			
			return response.json()			
		} catch(error) {
			console.log("Failded to fetch: " + error)
			
			return "error"
		}
	}	
	
	// 서평 좋아요
	async function likeReview(reviewNo){
		try {
			var clickReviewVo = {
					reviewNo : reviewNo
				};
			
			const response = await fetch(projectName +"/like", {
					method: "POST",
					headers : {
						'Content-Type': 'application/json'
					},
					body: JSON.stringify(clickReviewVo)
				})
			
			return response.json()			
		} catch(error) {
			console.log("Failed to fetch: " + error)
			
			return "error"
		}
	}

	// 플리 목록 불러오기
	async function getMyPly(userNo) {
		try {
			const response = await fetch(projectName + "/review/getMyPlaylist?userNo=" + userNo)
			
			return response.json()			
		} catch(error) {
			console.log("Failed to fetch: " + error)
			
			return "error"
		}

	}

	function addReviewToPly(playlistNo, reviewNo) {
		$.ajax({
			url: "${pageContext.request.contextPath}/review/addReviewToPly?playlistNo=" + playlistNo + "&reviewNo=" + reviewNo,
			method: "post",
			dataType: "json",
			success: function(){
				console.log("플리에 저장했습니다.")

				$(".msg_modal").removeClass("unstaged")
				$(".msg_modal").addClass("opaque")
				
				setTimeout(function(){
					$(".msg_modal").removeClass("opaque")
					
					$(".msg_modal").one("transitionend", function(){
						$(".msg_modal").addClass("unstaged")
					})
				}, 2000)
				

			},
			error:  function(XHR, status, error){
				console.log(status + " : " + error);
			}
		})
	}	
	
	/**************** 
	RENDER 
	*******************/	
	
	//페이징 렌더
	function renderPaging(prev, next, startPageBtnNo, endPageBtnNo) {
		
		let str = '<div class="mybook_paging">'
			str += '<ul>'
			
			if(prev == true) {
				str += '<li><a href="/' + projectName + '/' + nickname + '?crtPage=' + (startPageBtnNo - 1) + '&sort=' + sort + '&emoName=' + emoName + '">◀</a></li>'
			}

			for(var i = startPageBtnNo; i <= endPageBtnNo; i++) {
				str += '<li><a  href="/'+ projectName + '/' + nickname + '?crtPage=' + i + '&sort=' + sort + '&emoName=' + emoName + '">'+ i +'</a></li>'
			}
						
			if(next == true) {
				str += '<li><a href="/' + prjectName + '/' + nickname + '?crtPage=' + (endPageBtnNo + 1) + '&sort=' + sort + '&emoName=' + emoName + '">▶</a></li>'
			}

			str += '</ul>'
			str += '</div>'		 	
		
		$("#content").append(str)
	}	
				
	 
	function renderList(list, updown) {
		
		list.forEach(mybookVo => {
			var str = '';
			str += '	<div class="reviews" id=r'+mybookVo.reviewNo+'> ';
			str += '		<div class="reviews-header"> ';
			str += ' 		<div class="left"> ';
			str += ' 			<p><a href="${pageContext.request.contextPath}/bookdetail?bookNo='+ mybookVo.bookNo + '&userNo='+mybookVo.userNo+'">' + mybookVo.bookTitle + '</a></p> ';
			str += ' 		</div> ';
			str += ' 		<div class="right"> ';
			str += ' 			<a href="${pageContext.request.contextPath}/review/write?reviewNo='+mybookVo.reviewNo+'">수정</a> <a class="delete" data-reviewno="'+mybookVo.reviewNo+'">삭제</a> ';
			str += ' 		</div> ';
			str += ' 	</div> ';
			str += ' 	<div class="reviews-content"> ';
			str += ' 		<p>' + mybookVo.reviewContent + '</p> ';
			str += ' 		<span class="label label-default">'+mybookVo.emoName+'</span> ';
			str += ' 	</div> ';
			str += ' 	<div class="reviews-footer"> ';
			str += ' 		<div class="left likecontrol"> ';
			
			if(mybookVo.likecheck == 0){
		         str += ' <span id="heart" data-reviewno="' +mybookVo.reviewNo+'" class="like glyphicon glyphicon-heart-empty" aria-hidden="true"></span> <span class="likecnt" data-likecnt="'+mybookVo.likecnt+'">'+ mybookVo.likecnt+ '</span> <span>'+ mybookVo.reviewDate+ '</span> ';
		    }else{
		         str += ' <span id="heart" data-reviewno="'+mybookVo.reviewNo+'" class="like glyphicon glyphicon-heart" aria-hidden="true"></span> <span class="likecnt" data-likecnt="'+mybookVo.likecnt+'">'+ mybookVo.likecnt+ '</span> <span>'+ mybookVo.reviewDate+ '</span> ';
		    }	
			
			str += ' 		</div> ';
			str += ' 		<div class="right"> ';
			str += ' 			<div class="dropup"> ';
			str += ' 				<a id="dLabel" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 더보기 <span class="caret"></span></a> ';
			str += ' 				<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu2"> ';
			str += ' 					<li role="presentation"><a class="add_pli" data-userno="'+ mybookVo.userNo +'" data-reviewno="'+ mybookVo.reviewNo +'" id="add_pli" role="menuitem" tabindex="-1">플레이리스트에 추가<span id="plus">+</span></a></li> ';
			str += ' 					<li role="presentation" class="divider"></li> ';
			str += ' 					<li role="presentation"><a id="shr_review" role="menuitem" tabindex="-1">서평 공유하기<span class="glyphicon glyphicon-share" aria-hidden="true"></span></a></li> ';
			str += ' 					<li role="presentation" class="divider"></li> ';
			str += ' 					<li role="presentation"><a role="menuitem" tabindex="-1" target="_blank" href="${pageContext.request.contextPath}/view/'+mybookVo.reviewNo+'">이미지 미리보기<span class="glyphicon glyphicon-save" aria-hidden="true"></span></a></li> ';
			str += ' 				</ul> ';
			str += ' 			</div> ';
			str += ' 		</div> ';
			str += ' 	</div> ';
			str += ' </div> ';
			
			if (updown == 'down') {
				$("#rvlist").append(str);
			} else if (updown == 'up') {
				$("#rvlist").append(str);
			} else {
				console.log("방향오류");
			}			
		})

	}
	
	function renderMyPly(list) {

		for(let item of list) {
			str = ""
			str += '<li class="list" data-playlistNo="'+ item.playlistNo +'">'
			str += '	<div class="info-container">'
			str += '		<button class="tagBtn">'+ item.emoName +'</button>'
			str += '		<div class="playlist-title">' + item.playlistName + '</div>'
			str += '		<div class="username">' + item.nickname + '</div>'
			str += '	</div>'
			str += '</li>'
			
			$(".modal_ply_ul").append(str)
		}
		
		$(".modal_ply_ul").on("click", ".list", function(){
			let playlistno = $(this).data("playlistno")

			addReviewToPly(playlistno, reviewNo)
		})		
	}		
	
</script>
<script src="${pageContext.request.contextPath}/asset/js/more.js"></script>
</html>