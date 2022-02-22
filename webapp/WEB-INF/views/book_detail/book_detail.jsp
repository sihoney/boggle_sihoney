<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 메타데이터 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>randombook header</title>
<script src="/bookproject/asset/js/jquery-1.12.4.js"></script>
<link rel="stylesheet" href="/bookproject/asset/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/bookproject/asset/css/book_detail.css">
</head>
<body>
	<div id="wrap">
		<!-- ------헤더------ -->
		<div id="header" class="clearfix">
			<a href=""> <img src="/bookproject/asset/img/logo/1_logo.png">
			</a>
			<!-- 로그인전 -->
			<ul class="list-unstyled">
				<a class="btn btn-link" role="button" href="#">기록하기</a>
				<a class="btn btn-link" role="button" href="#">로그인</a>
			</ul>
			<!-- 로그인후 -->
			<!-- <ul class="list-unstyled">
                    <a class="btn btn-link" role="button" href="#">기록하기</a>
                    <span onclick="location.href='http://'">
                        <img src="../img/login/user.jpg" class="img-circle">
                        <a class="btn btn-link" role="button" href="#">황태형</a>
                    </span>
                </ul> -->
		</div>
		<!-- ------헤더------ -->
		<div id="contents" class="clearfix">
			<div id="bookVo">
				<img id="book_img" src="/bookproject/asset/img/book/book.jpg" alt="..." class="img-thumbnail">
				<div id="book_detail">
					<h1>작은 별이지만 빛나고 있어</h1>
					<h3>저자 소윤</h3>
					<div id="book_review">
						<span class="review_count">서평 수 </span><span class="review_num">350+</span>
					</div>
					<div id="btn_review">
						<button type="button" class="btn btn-success">네이버 북스</button>
						<button type="button" class="btn btn-default">관심가는 책+</button>
					</div>
				</div>
				<button id="btn_write" type="button" class="btn btn-primary">이 책 서평 쓰기</button>
			</div>
		</div>
		<div class="reviewVo" class="clearfix">
			<div id="contents_review" class="clearfix">
				<ul class="review_list">
					<li><a href="">최신순</a></li>
					<li><a href="">인기순</a></li>
				</ul>
			</div>
			<!-- 서평 리스트 -->
			<div class="jumbotron">
				<div id="review_first">
					<h3>
						<a href="">아기상어상어</a>
					</h3>
					<p>
						나의 노력으로 얻어진 것이 아니라면 내 것이 아니니까 부러워하지 말기<br> 나의 잘못으로 만들어진 결과가 아니라면 내 탓이 아니니까 낙담하지 말기<br> - P104
					</p>
					<span>교훈 있는</span> <span>귀여운</span> <span>교훈 있는</span>
				</div>
				<div id="review_second">
					<span class="glyphicon glyphicon-heart" aria-hidden="true"></span> <span class="review_like">16.2k</span><span class="review_like">2022/02/21</span>
					<!-- 더보기 클릭시 모달창 오픈 -->
					<button type="button" class="btn btn-default btn-sm">+더보기</button>
				</div>
			</div>
			<div class="jumbotron">
				<div id="review_first">
					<h3>
						<a href="">금붕어두마리</a>
					</h3>
					<p>
						나의 노력으로 얻어진 것이 아니라면 내 것이 아니니까 부러워하지 말기<br> 나의 잘못으로 만들어진 결과가 아니라면 내 탓이 아니니까 낙담하지 말기<br> - P104
					</p>
					<span>교훈 있는</span> <span>교훈 있는</span> <span>교훈 있는</span>
				</div>
				<div id="review_second">
					<span class="glyphicon glyphicon-heart-empty" aria-hidden="true"></span> <span class="review_like">16.2k</span><span class="review_like">2022/02/21</span>
					<!-- 더보기 클릭시 모달창 오픈 -->
					<button type="button" class="btn btn-default btn-sm">+더보기</button>
				</div>
			</div>
			<div class="jumbotron">
				<div id="review_first">
					<h3>
						<a href="">돈까스먹는오리</a>
					</h3>
					<p>
						나의 노력으로 얻어진 것이 아니라면 내 것이 아니니까 부러워하지 말기<br> 나의 잘못으로 만들어진 결과가 아니라면 내 탓이 아니니까 낙담하지 말기<br> - P104
					</p>
					<span>교훈 있는</span> <span>교훈 있는</span> <span>교훈 있는</span>
				</div>
				<div id="review_second">
					<span class="glyphicon glyphicon-heart" aria-hidden="true"></span> <span class="review_like">16.2k</span><span class="review_like">2022/02/21</span>
					<!-- 더보기 클릭시 모달창 오픈 -->
					<button type="button" class="btn btn-default btn-sm">+더보기</button>
				</div>
			</div>
			<!-- 서평 리스트 -->
		</div>
		<!-- 페이지네이션 -->
		<nav>
			<ul class="pagination">
				<li><a href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>
				<li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li><a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</ul>
		</nav>
	</div>
</body>
</html>