<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="UTF-8">
<title>taste-main</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/asset/bootstrap/css/bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/asset/css/all_css.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/asset/css/playlist-like.css">
<link rel="stylesheet" href="/bookproject/asset/css/modal.css">

<script
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
			<ul class="nav nav-tabs">
				<li role="presentation"><a
					href="${pageContext.request.contextPath}/mybook">내 서평</a></li>
				<li role="presentation" class="active"><a
					href="${pageContext.request.contextPath}/taste_main">취향저격</a></li>
				<!--세션 아이디와 사이트아이디 같을때-->
				<li role="presentation"><a
					href="${pageContext.request.contextPath}/analyze">통계</a></li>
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
			<li role="presentation"><a
				href="${pageContext.request.contextPath}/taste_main">my 취향</a></li>
			<li role="presentation"><a
				href="${pageContext.request.contextPath}/review">좋아요한 서평</a></li>
			<li role="presentation"><a
				href="${pageContext.request.contextPath}/main_book">관심가는 책</a></li>
			<li role="presentation" class="active"><a
				href="${pageContext.request.contextPath}/like_playlist">플레이리스트</a></li>
		</ul>

		<div id="content">
			

			<!--content4-->
			<div id="content4">
				<div class="minicontent">
					<div class="left">
						<p>'황태형'님이 좋아하는 플레이리스트</p>
					</div>
					<div class="right" id="more">
						<p>
							<a href="${pageContext.request.contextPath}/like_playlist">더보기</a><span
								class="glyphicon glyphicon-menu-right" aria-hidden="true"></span>
						</p>
					</div>
				</div>
				<div>
					<p class="index">오늘의 플레이리스트를 확인해보세요!</p>
				</div>

				<div id="playlist">

					<div class="nail purple">
						<div class="nail-desc">
							<p>
								출근할 때 즐기는<br>에너제틱 플레이리스트
							</p>
						</div>
						<div>
							<div id="opac"></div>
						</div>
					</div>

					<div class="nail deeppurple">
						<div class="nail-desc">
							<p>
								그래 가보자고<br>의욕 뿜뿜 플레이리스트
							</p>
						</div>
						<div>
							<div id="opac"></div>
						</div>
					</div>

					<div class="nail green">
						<div class="nail-desc">
							<p>
								나만 이런 게 아니었어<br>공감 꾹꾹 플레이리스트
							</p>
						</div>
						<div id="opac"></div>
					</div>

					<div class="nail green">
						<div class="nail-desc">
							<p>
								나만 이런 게 아니었어<br>공감 꾹꾹 플레이리스트
							</p>
						</div>
						<div id="opac"></div>
					</div>

					<div class="nail green">
						<div class="nail-desc">
							<p>
								나만 이런 게 아니었어<br>공감 꾹꾹 플레이리스트
							</p>
						</div>
						<div id="opac"></div>
					</div>
				</div>

			</div>
			<!--content4-->
			
			<!--content4-->
			<div id="content4">
				<div class="minicontent">
					<div class="left">
						<p>오늘 이 플레이리스트 어때요? 보글이 엄선했어요</p>
					</div>
					<div class="right" id="more">
						<p>
							<a href="${pageContext.request.contextPath}/like_playlist">더보기</a><span
								class="glyphicon glyphicon-menu-right" aria-hidden="true"></span>
						</p>
					</div>
				</div>
				<div>
					<p class="index">매주 달라지는 오늘의 추천</p>
				</div>

				<div id="playlist">

					<div class="nail purple">
						<div class="nail-desc">
							<p>
								출근할 때 즐기는<br>에너제틱 플레이리스트
							</p>
						</div>
						<div>
							<div id="opac"></div>
						</div>
					</div>

					<div class="nail deeppurple">
						<div class="nail-desc">
							<p>
								그래 가보자고<br>의욕 뿜뿜 플레이리스트
							</p>
						</div>
						<div>
							<div id="opac"></div>
						</div>
					</div>

					<div class="nail green">
						<div class="nail-desc">
							<p>
								나만 이런 게 아니었어<br>공감 꾹꾹 플레이리스트
							</p>
						</div>
						<div id="opac"></div>
					</div>

					<div class="nail green">
						<div class="nail-desc">
							<p>
								나만 이런 게 아니었어<br>공감 꾹꾹 플레이리스트
							</p>
						</div>
						<div id="opac"></div>
					</div>

					<div class="nail green">
						<div class="nail-desc">
							<p>
								나만 이런 게 아니었어<br>공감 꾹꾹 플레이리스트
							</p>
						</div>
						<div id="opac"></div>
					</div>
				</div>

			</div>
			<!--content4-->
			
			<!--content4-->
			<div id="content4">
				<div class="minicontent">
					<div class="left">
						<p>인기순 플레이리스트</p>
					</div>
					<div class="right" id="more">
						<p>
							<a href="${pageContext.request.contextPath}/like_playlist">더보기</a><span
								class="glyphicon glyphicon-menu-right" aria-hidden="true"></span>
						</p>
					</div>
				</div>
				<div>
					<p class="index">오늘의 플레이리스트를 확인해보세요!</p>
				</div>

				<div id="playlist">

					<div class="nail purple">
						<div class="nail-desc">
							<p>
								출근할 때 즐기는<br>에너제틱 플레이리스트
							</p>
						</div>
						<div>
							<div id="opac"></div>
						</div>
					</div>

					<div class="nail deeppurple">
						<div class="nail-desc">
							<p>
								그래 가보자고<br>의욕 뿜뿜 플레이리스트
							</p>
						</div>
						<div>
							<div id="opac"></div>
						</div>
					</div>

					<div class="nail green">
						<div class="nail-desc">
							<p>
								나만 이런 게 아니었어<br>공감 꾹꾹 플레이리스트
							</p>
						</div>
						<div id="opac"></div>
					</div>

					<div class="nail green">
						<div class="nail-desc">
							<p>
								나만 이런 게 아니었어<br>공감 꾹꾹 플레이리스트
							</p>
						</div>
						<div id="opac"></div>
					</div>

					<div class="nail green">
						<div class="nail-desc">
							<p>
								나만 이런 게 아니었어<br>공감 꾹꾹 플레이리스트
							</p>
						</div>
						<div id="opac"></div>
					</div>
				</div>

			</div>
			<!--content4-->
			
			<!--content4-->
			<div id="content4">
				<div class="minicontent">
					<div class="left">
						<p>내가 작성한 서평 플레이리스트</p>
					</div>
					<div class="right" id="more">
						<p>
							<a href="${pageContext.request.contextPath}/like_playlist">더보기</a><span
								class="glyphicon glyphicon-menu-right" aria-hidden="true"></span>
						</p>
					</div>
				</div>
				<div>
					<p class="index">오늘의 플레이리스트를 확인해보세요!</p>
				</div>

				<div id="playlist">

					<div class="nail purple">
						<div class="nail-desc">
							<p>
								출근할 때 즐기는<br>에너제틱 플레이리스트
							</p>
						</div>
						<div>
							<div id="opac"></div>
						</div>
					</div>

					<div class="nail deeppurple">
						<div class="nail-desc">
							<p>
								그래 가보자고<br>의욕 뿜뿜 플레이리스트
							</p>
						</div>
						<div>
							<div id="opac"></div>
						</div>
					</div>

					<div class="nail green">
						<div class="nail-desc">
							<p>
								나만 이런 게 아니었어<br>공감 꾹꾹 플레이리스트
							</p>
						</div>
						<div id="opac"></div>
					</div>

					<div class="nail green">
						<div class="nail-desc">
							<p>
								나만 이런 게 아니었어<br>공감 꾹꾹 플레이리스트
							</p>
						</div>
						<div id="opac"></div>
					</div>

					<div class="nail green">
						<div class="nail-desc">
							<p>
								나만 이런 게 아니었어<br>공감 꾹꾹 플레이리스트
							</p>
						</div>
						<div id="opac"></div>
					</div>
				</div>

			</div>
			<!--content4-->

		</div>

		<!-- footer -->
		<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>

		<!-- modal창 -->
		<c:import url="/WEB-INF/views/include/modal.jsp"></c:import>

	</div>
	<!--wrap-->
</body>

<script src="${pageContext.request.contextPath}/asset/js/more.js"></script>

</html>