<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="UTF-8">
<title>playlist</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/asset/bootstrap/css/bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/asset/css/all_css.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/asset/css/playlist.css">

<script type="text/javascript"
	src="${pageContext.request.contextPath}/asset/js/jquery-1.12.4.js"></script>
<script
	src="${pageContext.request.contextPath}/asset/bootstrap/js/bootstrap.js"></script>
</head>
<!--header-->

<body>
	<div id="wrap">
		<!-- 헤더 -->
		<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
		<!-- ------nav------ -->
		<div id="nav" class="clearfix">
			<c:choose>
				<c:when test="${result eq 'sameUser'}">
					<ul class="nav nav-tabs">
						<li role="presentation"><a
							href="${pageContext.request.contextPath}/${nickname}">내 서평</a></li>
						<li role="presentation"><a
							href="${pageContext.request.contextPath}/${nickname}/tastemain">취향저격</a></li>
						<li role="presentation" class="active"><a
							href="${pageContext.request.contextPath}/${nickname}/like_playlist">플레이리스트</a></li>
						<!--세션 아이디와 사이트아이디 같을때-->
						<li role="presentation"><a
							href="${pageContext.request.contextPath}/analyze">통계</a></li>
					</ul>
				</c:when>
				<c:otherwise>
					<!-- 세션아이디랑 다를때는 사이트주소의 아이디와 같은 유저의 데이터들 불러오기-->
					<ul class="nav nav-tabs">
						<li role="presentation"><a
							href="${pageContext.request.contextPath}/${nickname}">남 서평</a></li>
						<li role="presentation"><a
							href="${pageContext.request.contextPath}/${nickname}/tastemain">취향저격</a></li>
						<li role="presentation" class="active"><a
							href="${pageContext.request.contextPath}/${nickname}/like_playlist">플레이리스트</a></li>
					</ul>
				</c:otherwise>
			</c:choose>
		</div>
		<!-- ------nav-------->
		<div>
			<div class="contents">
				<div class="index">
					<c:choose>
						<c:when test="${result eq 'sameUser'}">
							<div><p id="lll">'${nickname}'님이 좋아하는<br>플레이리스트</p></div>
						</c:when>
						<c:otherwise>
							<p>'${otherUser.nickname}'님이 좋아하는<br> 플레이리스트</p>
						</c:otherwise>
					</c:choose>
				</div>

				<div class="columns">
					<c:forEach items="${likeplayclick}" var="vo">
						<div id="columns_first" class="clearfix">
							<div class="text-name">
								<p id="name"><!-- 플레이리스트 제목  -->
									${vo.playlistName}
								</p>
							</div>

							<%-- <div>
								<span class="glyphicon glyphicon-heart" id="desc"
									aria-hidden="true"></span> <span id="desc">${vo.likecnt}</span> <span
									class="glyphicon glyphicon-user" id="desc" aria-hidden="true"></span>
								<span id="desc">${vo.nickname}</span>
							</div> --%>

						</div>
					</c:forEach>
				</div>
			</div>
			</div>



			<!-- footer -->
			<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>

		</div>
</body>

</html>