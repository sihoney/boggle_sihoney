<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>playlist-like</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/asset/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/all_css.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/main-book.css">

<script type="text/javascript" src="${pageContext.request.contextPath}/asset/js/jquery-1.12.4.js"></script>
<script src="${pageContext.request.contextPath}/asset/bootstrap/js/bootstrap.js"></script>
<body>
	<div id="wrap">
		<!-- 헤더 -->
		<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
		<!-- ------nav------ -->
		<div id="nav" class="clearfix">
			<c:choose>
				<c:when test="${result eq 'sameUser'}">
					<ul class="nav nav-tabs">
						<li role="presentation" class="active"><a
							href="${pageContext.request.contextPath}/${nickname}">내 서평</a></li>
						<li role="presentation"><a
							href="${pageContext.request.contextPath}/${nickname}/tastemain">취향저격</a></li>
						<!--세션 아이디와 사이트아이디 같을때-->
						<li role="presentation"><a
							href="${pageContext.request.contextPath}/analyze">통계</a></li>
					</ul>
				</c:when>
				<c:otherwise>

					<ul class="nav nav-tabs">
						<li role="presentation" class="active"><a
							href="${pageContext.request.contextPath}/${nickname}">서평</a></li>
						<li role="presentation"><a
							href="${pageContext.request.contextPath}/taste_main">취향저격</a></li>
					</ul>

					<!-- ------nav2------ -->
					<ul id="nav2" class="nav nav-pills">
						<li role="presentation"><a
							href="${pageContext.request.contextPath}/${nickname}/taste_main">my
								취향</a></li>
						<li role="presentation"><a
							href="${pageContext.request.contextPath}/${nickname}/tastereview">좋아요한
								서평</a></li>
						<li role="presentation"  class="active"><a
							href="${pageContext.request.contextPath}/${nickname}/main_book">관심가는
								책</a></li>
						<li role="presentation"><a
							href="${pageContext.request.contextPath}/${nickname}/like_playlist">플레이리스트</a></li>
					</ul>
				</c:otherwise>
			</c:choose>
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
		<!--/tag nav-->
		<div id="likebook">
			<div>
				<p id="thumb-text">내가 관심가는 책</p>
			</div>
			<div class="gradient">
				<div class="gallery">
					<article>
						<div class="img">
							<img class="cover" src="https://image.aladin.co.kr/product/26/0/cover500/s742633278_1.jpg" alt="image" />
						</div>
						<div class="book-detail">
							<p>데미안</p>
							<p class="sub">헤르만 헤세</p>
						</div>
					</article>
					<article>
						<div class="img">
							<img class="cover" src="https://image.aladin.co.kr/product/26/0/cover500/s742633278_1.jpg" alt="image" />
						</div>
						<div class="book-detail">
							<p>데미안</p>
							<p class="sub">헤르만 헤세</p>
						</div>
					</article>
					<article>
						<div class="img">
							<img class="cover" src="https://image.aladin.co.kr/product/26/0/cover500/s742633278_1.jpg" alt="image" />
						</div>
						<div class="book-detail">
							<p>데미안</p>
							<p class="sub">헤르만 헤세</p>
						</div>
					</article>
					<article>
						<div class="img">
							<img class="cover" src="https://image.aladin.co.kr/product/26/0/cover500/s742633278_1.jpg" alt="image" />
						</div>
						<div class="book-detail">
							<p>데미안</p>
							<p class="sub">헤르만 헤세</p>
						</div>
					</article>
				</div>
			</div>
			<!--gallery-->
			<div class="gradient">
				<div class="gallery">
					<article>
						<div class="img">
							<img class="cover" src="https://image.aladin.co.kr/product/26/0/cover500/s742633278_1.jpg" alt="image" />
						</div>
						<div class="book-detail">
							<p>데미안</p>
							<p class="sub">헤르만 헤세</p>
						</div>
					</article>
					<article>
						<div class="img">
							<img class="cover" src="https://image.aladin.co.kr/product/26/0/cover500/s742633278_1.jpg" alt="image" />
						</div>
						<div class="book-detail">
							<p>데미안</p>
							<p class="sub">헤르만 헤세</p>
						</div>
					</article>
					<article>
						<div class="img">
							<img class="cover" src="https://image.aladin.co.kr/product/26/0/cover500/s742633278_1.jpg" alt="image" />
						</div>
						<div class="book-detail">
							<p>데미안</p>
							<p class="sub">헤르만 헤세</p>
						</div>
					</article>
					<article>
						<div class="img">
							<img class="cover" src="https://image.aladin.co.kr/product/26/0/cover500/s742633278_1.jpg" alt="image" />
						</div>
						<div class="book-detail">
							<p>데미안</p>
							<p class="sub">헤르만 헤세</p>
						</div>
					</article>
				</div>				
			</div>
            <!--gallery-->
		</div>
		<!-- footer -->
		<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
	</div>
</body>
</html>
</DOCTYPE>