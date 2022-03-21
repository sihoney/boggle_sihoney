<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="UTF-8">
	<title>플레이리스트 폴더</title>
	
    <script src="${pageContext.request.contextPath}/asset/js/jquery-1.12.4.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/bootstrap/css/bootstrap.css">
    <script src="${pageContext.request.contextPath}/asset/bootstrap/js/bootstrap.js"></script>
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/all_css.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/playlist-click.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/style.css">
</head>

<!--header-->
<body>
	<div id="wrap">
		
		<!-- ------header------ -->
		<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
		<!-- ------header------ -->
		
		<!-- ------nav------ -->
        <div id="nav" class="clearfix">
		      <ul class="nav nav-tabs">
		          <li role="presentation"><a href="${pageContext.request.contextPath}/mybook">내 서평</a></li>
		          <li role="presentation" class="active"><a href="${pageContext.request.contextPath}/taste_main">취향저격</a></li>
		          <!--세션 아이디와 사이트아이디 같을때-->
		          <li role="presentation"><a href="${pageContext.request.contextPath}/analyze">통계</a></li>
		      </ul>
		      <!-- 세션아이디랑 다를때는
		      <ul class="nav nav-tabs">
		          <li role="presentation"><a href="">'유저이름'님의 서평</a></li>
		          <li role="presentation" class="active"><a href="${pageContext.request.contextPath}/taste_main">취향저격</a></li>
		      </ul>	       
		       -->
 		</div>
        <!-- ------nav------ -->

        <!-- ------nav2------ -->
		<ul id="nav2" class="nav nav-pills">
			<!-- 세션아이디와 비교, 다를경우 '이름님의 취향' -->
			<!-- <li role="presentation" class="active"><a href="">'유저이름'님의 취향</a></li> -->
			<li role="presentation" class="active"><a href="${pageContext.request.contextPath}/taste_main">my 취향</a></li>
			<li role="presentation"><a href="${pageContext.request.contextPath}/review">좋아요한 서평</a></li>
			<li role="presentation"><a href="${pageContext.request.contextPath}/main_book">관심가는 책</a></li>
			<li role="presentation"><a href="${pageContext.request.contextPath}/like_playlist">플레이리스트</a></li>
		</ul>

		<!--cover-->
		<div id="playlist-cover" class="clearfix">
			<div class="float-l">
				<p>${requestScope.foldermainMap.playlistCover.nickname}님의 플레이리스트</p>
				<h1 id="playlist-title">${requestScope.foldermainMap.playlistCover.playlistName}</h1>
			</div>
			
			<div id="btn-cover" class="float-r">
				<button id="platlistLike" type="button" class="btn btn-default float-r" data-playlistno="${param.playlistNo}" data-userno="${authUser.userNo}">좋아요<span id="likeview" class="" aria-hidden="true"></span></button>	
				<button type="button" class="btn btn-default float-r" onclick="location.href = '${pageContext.request.contextPath}/main/playlist?playlistNo=${requestScope.foldermainMap.playlistCover.playlistNo}';">전체재생</button>
			</div>
		</div>
		<!--cover-->
		
		<div id="middle-content">
			<c:if test="${authUser.userNo == param.userNo}">
				<div id="playlist-add" data-keyboard="false" data-backdrop="static">
					<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
					<span>플레이리스트 서평 추가</span>
				</div>
	
				<div id="btnwrap-delete">
					<button type="button" class="btn btn-default">전체선택</button>
					<button type="button" class="btn btn-default">선택삭제</button>
				</div>
			</c:if>
		</div>

		<!--review List-->
		<div id="review-wrap">
			
			<c:forEach items="${requestScope.foldermainMap.playList}" var="playlistVo">
				<!-- 서평 리스트 vo-->
				<div class="jumbotron">
					<div id="reviewVo-wrap">
						<div id="review_first">
							<h3><a href="${pageContext.request.contextPath}/bookdetail?bookNo=${playlistVo.bookNo}&userNo=${playlistVo.userNo}">${playlistVo.bookTitle}</a></h3>
		
							<!-- 자기글에만 수정 삭제 노출 -->
							<c:if test="${authUser.userNo == playlistVo.userNo}">
								<a href="" class="review_modify">삭제</a><a href="" class="review_modify">수정</a>
							</c:if>
		
							<a href="${pageContext.request.contextPath}/${playlistVo.nickname}" class="review_nick">${playlistVo.nickname}<span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span></a>
		
							<div class="multiline-ellipsis">${playlistVo.reviewContent}</div>
						</div>
		
						<div id="review_second">
							<!-- 좋아요 활성화 -->
							<span id="btn_like" class="glyphicon glyphicon-heart icon-success" aria-hidden="true"></span>
							<!-- 좋아요 활성화 -->
		
							<!-- 좋아요 비활성화
							<span id="btn_like" class="glyphicon glyphicon-heart-empty icon-success" aria-hidden="true"></span> -->
		
							<span class="review_like">16.2k</span><span class="review_like">${playlistVo.reviewDate}</span>
							<span id="tag_btn">#${playlistVo.emoName}</span>
							<!-- 더보기 클릭시 모달창 오픈 -->
							<!-- <button type="button" class="btn btn-default btn-sm">+더보기</button> -->
							
							<div class="dropup float-r">
								<a id="dLabel" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									+ 더보기
									<!-- <span class="caret"></span> -->
								</a>
								<ul class="dropdown-menu radius-15" role="menu" aria-labelledby="dropdownMenu2">
									<li role="presentation"><a role="menuitem" tabindex="-1" href="#">플레이리스트에 추가<span id="plus">+</span></a></li>
									<li role="presentation" class="divider"></li>
									<li role="presentation" ><a id="shr_review" role="menuitem" tabindex="-1" href="#">서평 공유하기<span class="glyphicon glyphicon-share" aria-hidden="true"></span></a></li>
									<li role="presentation" class="divider"></li>
									<li role="presentation"><a role="menuitem" tabindex="-1" href="#">이미지 미리보기<span class="glyphicon glyphicon-save" aria-hidden="true"></span></a></li>
								</ul>
							</div>
		
						</div>
					</div>
				</div>
				<!-- 서평 리스트 vo-->
			
			</c:forEach>
			

			<!-- 페이징 -->
			<nav id="page">
				<ul class="pagination">

					<c:if test="${foldermainMap.prev == true}">
					  <li>
						<a href="${pageContext.request.contextPath}/playlist/folder?playlistNo=${foldermainMap.playlistCover.playlistNo}&userNo=${foldermainMap.playlistCover.userNo}&crtPage=${foldermainMap.startPageBtnNo-1}" aria-label="Previous">
						  <span aria-hidden="true">&laquo;</span>
						</a>
					  </li>
					</c:if>
			
					<c:forEach begin="${requestScope.foldermainMap.startPageBtnNo}" end="${requestScope.foldermainMap.endPageBtnNo}" step="1" var="i">
						<c:choose>
							<c:when test="${param.crtPage == i}">
								<li class="active">
									<a href="${pageContext.request.contextPath}/playlist/folder?playlistNo=${foldermainMap.playlistCover.playlistNo}&userNo=${foldermainMap.playlistCover.userNo}&crtPage=${i}">${i}</a>
								</li>
							</c:when>
							<c:otherwise>
								<li>
									<a href="${pageContext.request.contextPath}/playlist/folder?playlistNo=${foldermainMap.playlistCover.playlistNo}&userNo=${foldermainMap.playlistCover.userNo}&crtPage=${i}">${i}</a>
								</li>
							</c:otherwise>
						</c:choose>
				  	</c:forEach>
		  	
					<c:if test="${foldermainMap.next == true}">
						<li>
							<a href="${pageContext.request.contextPath}/playlist/folder?playlistNo=${foldermainMap.playlistCover.playlistNo}&userNo=${foldermainMap.playlistCover.userNo}&crtPage=${foldermainMap.endPageBtnNo+1}" aria-label="Next">
								<span aria-hidden="true">&raquo;</span>
							</a>
						</li>
					</c:if>

				</ul>
			</nav>
			<!-- 페이징 -->

			<!-- footer -->
			<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>     
			<!-- footer -->
		</div>
		<!-- playlist-wrap -->
	</div>
	<!--wrap-->

	<!-- 서평 추가 모달 ------------------------------------------------------->
	<div id="review-add" class="modal fade" role="dialog" style="z-index: 1600;" >
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-body">
					<div class="modal-container">
						<div class="modal-header">
							<a class="modal-close">뒤로가기</a>
							<div class="input-box">
								<!-- <form action="reviewSearch" method="get"> -->
									<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
									<input id="reviewSearch" type="text" placeholder="키워드를 검색해 주세요(Enter)" name="SearchTxt" value=""> <i class="fa-solid fa-magnifying-glass"></i>
								<!-- </form> -->
							</div>
						</div>
						<div class="modal-options">
							<button class="optionBtn">서재안의 모든 서평</button>
						</div>
						<div class="modal-list">
							<ul id="reviewAll" data-playlistno="${requestScope.foldermainMap.playlistCover.playlistNo}" data-userno="${param.userNo}">
								<!-- 서평 vo 반복 -->
								<!-- 리스트 출력될 곳 -->
							</ul>
						</div>
						
						<!-- paging -->
						<nav class="paging" aria-label="Page navigation example">
							<ul id="addModal-pagination" class="pagination">
								<!-- 페이징 번호 -->
							</ul>
						</nav>
						<!-- paging -->
						
						<button class="addReviewBtn">선택한 서평 담기</button>
					</div>

				</div>
			</div>
		</div>
	</div>
	<!-- 서평 추가 모달 -->
</body>

<script src="${pageContext.request.contextPath}/asset/js/more.js"></script>
<script src="${pageContext.request.contextPath}/asset/js/playlistFolder.js"></script>

</html>