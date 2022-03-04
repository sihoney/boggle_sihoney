<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">

<!-- 서평: 더보기 모달창 -->
<!-- 서평 공유 모달창 -->
<div id="myModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">공유하기</h4>
			</div>
			<div class="modal-body">
				<p>playbook의 서평을 SNS에 공유해 보세요 :)</p>
				<a id="kakao-link-btn" href="javascript:kakaoShare()"> <img src="${pageContext.request.contextPath}/asset/img/share/kakao.jpg" />
				</a> <a id="facebook-link-btn" href=""> <img src="${pageContext.request.contextPath}/asset/img/share/facebook.jpg" />
				</a> <a id="twitter-link-btn" href=""> <img src="${pageContext.request.contextPath}/asset/img/share/twitter.png" />
				</a> <a id="kakaostory-link-btn" href=""> <img src="${pageContext.request.contextPath}/asset/img/share/kakaostory.png" />
				</a>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<!-- Modal -->

<!-- 플레이리스트 모달창 -->
<div class="modal fade" id="modal_playlist" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-container">
				<div class="modalHeader">
					<div class="title">내 플레이리스트</div>
					<button type="button" class="closeBtn" data-dismiss="modal" aria-label="Close">닫기</button>
				</div>
				<div class="modal-search">
					<input type="text" class="search_box" id="query" placeholder=" ex) 갓생살게 도와주는">
				</div>
				<div class="modal-playlist">
					<ul>
						<li class="list">
							<div class="img-container">
								<img src="" alt="">
							</div>
							<div class="info-container">
								<button class="tagBtn">힘이 되는</button>
								<div class="playlist-title">별밤에 볼륨을 높이고 싶은가요</div>
								<div class="username">김지연</div>
							</div>
						</li>
						<li class="list">
							<div class="img-container">
								<img src="" alt="">
							</div>
							<div class="info-container">
								<button class="tagBtn">동기부여해주는</button>
								<div class="playlist-title">차분하게 공부할 때 듣는</div>
								<div class="username">이영림</div>
							</div>
						</li>
						<li class="list">
							<div class="img-container">
								<img src="" alt="">
							</div>
							<div class="info-container">
								<button class="tagBtn">차분해지게 해주는</button>
								<div class="playlist-title">비오는 날 보고 듣는</div>
								<div class="username">장서윤</div>
							</div>
						</li>
						<li class="list">
							<div class="img-container">
								<img src="" alt="">
							</div>
							<div class="info-container">
								<button class="tagBtn">힘이 되는</button>
								<div class="playlist-title">은은하고 상큼한</div>
								<div class="username">황희원</div>
							</div>
						</li>
					</ul>
				</div>
				<nav class="paging" aria-label="Page navigation example">
					<ul class="pagination">
						<li class="page-item"><a class="page-link" href="" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
						<li class="page-item"><a class="page-link" href="">1</a></li>
						<li class="page-item"><a class="page-link" href="">2</a></li>
						<li class="page-item"><a class="page-link" href="">3</a></li>
						<li class="page-item"><a class="page-link" href="">4</a></li>
						<li class="page-item"><a class="page-link" href="">5</a></li>
						<li class="page-item"><a class="page-link" href="" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
</div>
<!-- /플레이리스트에 추가 -->
<!-- /이미지 저장 모달창 -->
<div class="modal" id="modal_download_img" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">이미지 저장하기</h5>
			</div>
			<div class="modal-body">
				<p>저장되었습니다.</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal" aria-label="Close">Close</button>
			</div>
		</div>
	</div>
</div>
<!-- /공유하기 모달창 -->
<div class="modal" id="modal_share_img" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">공유하기</h5>
			</div>
			<div class="modal-body">
				<p>공유되었습니다.</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal" aria-label="Close">Close</button>
			</div>
		</div>
	</div>
</div>
<!-- /공유하기 모달창 -->
<!-- 책 선택하기 모달창 -->
<div class="modal" id="modal_searchbook" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-container">
				<div class="modalHeader">
					<div class="title">책 선택하기</div>
					<button type="button" class="closeBtn" data-dismiss="modal" aria-label="Close">닫기</button>
				</div>
				<div class="modal-search">
					<input type="text" class="search_box" id="query" placeholder=" ex) 책 제목, 저자명, 출판사를 검색해보세요">
				</div>
				<div class="modal-playlist">
					<ul>
						<li class="list">
							<div class="book-img-container">
								<img src="${pageContext.request.contextPath}/asset/img/book/book2.jpeg" alt="" class="img-thumbnail">
							</div>
							<div class="info-container">
								<button class="book-title">자유로부터의 도피</button>
								<div class="book-author">에리히 프롬(Erich Fromm)</div>
								<div class="review-count">서평수 163+</div>
							</div>
						</li>
						<li class="list">
							<div class="book-img-container">
								<img src="${pageContext.request.contextPath}/asset/img/book/book2-2.jpeg" alt="" class="img-thumbnail">
							</div>
							<div class="info-container">
								<button class="book-title">다섯 번째 감각</button>
								<div class="book-author">김보영</div>
								<div class="review-count">서평수 200+</div>
							</div>
						</li>
						<li class="list">
							<div class="book-img-container">
								<img src="${pageContext.request.contextPath}/asset/img/book/book3-3.jpeg" alt="" class="img-thumbnail">
							</div>
							<div class="info-container">
								<button class="book-title">물고기는 존재하지 않는다</button>
								<div class="book-author">룰루 밀러(Lulu Miller)</div>
								<div class="review-count">서평수 199+</div>
							</div>
						</li>
						<li class="list">
							<div class="book-img-container">
								<img src="${pageContext.request.contextPath}/asset/img/book/book4.jpeg" alt="" class="img-thumbnail">
							</div>
							<div class="info-container">
								<button class="book-title">백의 그림자</button>
								<div class="book-author">황정은</div>
								<div class="review-count">서평수 75+</div>
							</div>
						</li>
					</ul>
				</div>
				<nav class="paging" aria-label="Page navigation example">
					<ul class="pagination">
						<li class="page-item"><a class="page-link" href="" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
						<li class="page-item"><a class="page-link" href="">1</a></li>
						<li class="page-item"><a class="page-link" href="">2</a></li>
						<li class="page-item"><a class="page-link" href="">3</a></li>
						<li class="page-item"><a class="page-link" href="">4</a></li>
						<li class="page-item"><a class="page-link" href="">5</a></li>
						<li class="page-item"><a class="page-link" href="" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
</div>
<!-- /책 선택하기 -->