<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>playlist-like</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/asset/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/all_css.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/main-review.css">
<link rel="stylesheet" href="/bookproject/asset/css/modal.css">
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
						<!--세션 아이디와 사이트아이디 같을때-->
						<li role="presentation"><a href="${pageContext.request.contextPath}/analyze">통계</a></li>
					</ul>
				</c:when>
				<c:otherwise>
					<ul class="nav nav-tabs">
						<li role="presentation" class="active"><a href="${pageContext.request.contextPath}/${nickname}">서평</a></li>
						<li role="presentation"><a href="${pageContext.request.contextPath}/taste_main">취향저격</a></li>
					</ul>
					<!-- ------nav2------ -->
					<ul id="nav2" class="nav nav-pills">
						<li role="presentation"><a href="${pageContext.request.contextPath}/${nickname}/taste_main">my 취향</a></li>
						<li role="presentation" class="active"><a href="${pageContext.request.contextPath}/${nickname}/tastereview">좋아요한 서평</a></li>
						<li role="presentation"><a href="${pageContext.request.contextPath}/${nickname}/main_book">관심가는 책</a></li>
						<li role="presentation"><a href="${pageContext.request.contextPath}/${nickname}/like_playlist">플레이리스트</a></li>
					</ul>
				</c:otherwise>
			</c:choose>
		</div>
		<div>
			<p id="thumb-text">'${authUser.nickname}'가 좋아요한 서평</p>
		</div>
		<!--tag nav-->
		<ul id="nav3" class="nav nav-pills">
			<li role="presentation" class="active"><a href="">두근두근하는</a></li>
			<li role="presentation"><a href="">스팩타클한</a></li>
			<li role="presentation"><a href="">감동적인</a></li>
			<li role="presentation"><a href="">섬뜩한</a></li>
			<li role="presentation"><a href="">잔잔한</a></li>
			<li role="presentation"><a href="">용기를 북돋는</a></li>
			<li role="presentation"><a href="">눈물나는</a></li>
			<li role="presentation"><a href="">환상적인</a></li>
		</ul>
		<!-- 서평 리스트 -->
		<c:forEach items="${lrList}" var="lrvo">
			<div id="reviews">
				<div id="reviews-header">
					<div class="left">
						<p>
							<a href="${pageContext.request.contextPath}/?bookNo=${vo.bookNo}">${lrvo.bookTitle }</a>
							<!--<a>스며드는 것</a>-->
						</p>
					</div>
					<!-- 작성자아이디와 세션아이디가 동일할 시에만 보이게 -->
					<c:if test="${result eq 'sameUser'}">
						<div class="right">
							<a>수정</a> <a>삭제</a>
						</div>
					</c:if>
				</div>
				<c:choose>
					<c:when test="${result eq 'sameUser'}">
						<!-- 작성자아이디와 세션아이디가 동일할 경우에는 안보이게 -->
					</c:when>
					<c:otherwise>
						<div id="reviewer">
							<a href="${pageContext.request.contextPath}/${lrvo.nickname }">${lrvo.nickname }</a>
						</div>
					</c:otherwise>
				</c:choose>
				<div id="reviews-content">
					<p>${lrvo.reviewContent }</p>
					<span class="label label-default">${lrvo.emoName }</span> <span class="label label-default">#mood</span>
				</div>
				<div id="reviews-footer">
					<div class="left">
						<span id="heart" class="glyphicon glyphicon-heart" aria-hidden="true" onclick="changeClassName()"></span> <span>${vo.likecnt }</span> <span>${vo.reviewDate }</span>
					</div>
					<div class="right">
						<div class="dropup">
							<a id="dLabel" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 더보기 <span class="caret"></span>
							</a>
							<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu2">
								<li role="presentation"><a id="add_pli" role="menuitem" tabindex="-1">플레이리스트에 추가<span id="plus">+</span></a></li>
								<li role="presentation" class="divider"></li>
								<li role="presentation"><a id="shr_review" role="menuitem" tabindex="-1">서평 공유하기<span class="glyphicon glyphicon-share" aria-hidden="true"></span></a></li>
								<li role="presentation" class="divider"></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" target="_blank" href="${pageContext.request.contextPath}/imgpreview">이미지 저장하기<span class="glyphicon glyphicon-save" aria-hidden="true"></span>
								</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<!-- footer -->
	<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
	<!-- modal창 -->
	<c:import url="/WEB-INF/views/include/modal.jsp"></c:import>
</body>
<script>
	$('#heart').on(
			'click',
			function() {
				//포함되어있으면 true
				let isExist = document.getElementById('heart').classList
						.contains('glyphicon-heart');

				if (isExist == true) {
					let like = document.getElementById('heart');
					like.classList.replace("glyphicon-heart",
							"glyphicon-heart-empty");
				} else {
					let like = document.getElementById('heart');
					like.classList
							.replace("glyphicon-heart", "glyphicon-heart");
				}
			});
</script>
<script src="${pageContext.request.contextPath}/asset/js/more.js"></script>
</html>