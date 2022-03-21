<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">

	<head>
		<meta charset="UTF-8">
		        
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<title>Boggle 고객센터</title>
		
		<link rel="stylesheet" type="text/css" media="all" href="${pageContext.request.contextPath}/asset/css/help.css">
	
	</head>

	<body class="">
		
		
			<header class="header">
				<nav class="nav-wrapper">
				<div class="left_nav">
					<a class="boggle" title="main" href="${pageContext.request.contextPath}/main">BOGGLE</a>
					<a class="home" title="홈" href="${pageContext.request.contextPath}/help">고객센터</a>
				</div>
			</nav>
		</header>
		
		
		<main role="main">
			<section class="section hero">
				<div class="hero-inner">
					<p class="hero-text">
						궁금한 점이 있다면<br> 검색으로 문제를 빠르게 해결하세요!
					</p>
					<form role="search" class="search search-full" data-search="" data-instant="true" autocomplete="off" action="/hc/ko/search" accept-charset="UTF-8" method="get">
						<input name="utf8" type="hidden" value="&#x2713;" /><input type="search" name="query" id="query" placeholder="검색" autocomplete="off" aria-label="검색" />
					</form>
				</div>
			</section>
		
			<div class="container">
				<section class="section categories blocks">
		
					<section class="section app-guide">
						<h3>보글 이용 방법</h3>
						<ul class="app-list">
						
							<li class="app-item"><a class="app-item-link" href="">
									<div class="app-item-link-innerwrapper">
										<img class="img_paper" src="${pageContext.request.contextPath}/asset/img/help/projecter.png">
										<h4 class="app-title">Projecter</h4>
									</div>
							</a></li>
							
							<li class="app-item">
							<a class="app-item-link" href="">
									<div class="app-item-link-innerwrapper">
										<img class="img_pc" src="${pageContext.request.contextPath}/asset/img/help/pc.png">
										<h4 class="app-title">PC</h4>
									</div>
							</a></li>
							
							<li class="app-item">
							<a class="app-item-link" href="">
									<div class="app-item-link-innerwrapper">
										<img class="img_android" src="${pageContext.request.contextPath}/asset/img/help/android.png">
										<h4 class="app-title">Android</h4>
									</div>
							</a></li>
							
							<li class="app-item">
							<a class="app-item-link" href="">
									<div class="app-item-link-innerwrapper">
										<img class="img_ios" src="${pageContext.request.contextPath}/asset/img/help/iOS.png">
										<h4 class="app-title">iOS</h4>
									</div>
							</a></li>
							
				
						</ul>
					</section>
		
		
					<h3 class="board-title">
						<a href="${pageContext.request.contextPath}/help/list">고객 문의</a>
					</h3>
		
				
					
						<ul class="article-list">
							<c:forEach items="${helpList}" var="helpVo">
								<li class="article-list-item "><a href="${pageContext.request.contextPath}/help/read?&no=${helpVo.no}" class="article-list-link">${helpVo.title}</a></li>
							</c:forEach>
						</ul>
				
					

		
				
		
		
				<section class="section contact">
					<section class="section contact-guide">
						<h3>고객 </h3>
						<ul class="contact-list">
							<li class="contact-item">
								
								
						
									<a class="contact-item-link" href="${pageContext.request.contextPath }/help/writeForm?no=${authUser.userNo}">
										<div class="contact-item-link-innerwrapper">
											<img class="img_contact" src="${pageContext.request.contextPath}/asset/img/help/pencil.png">
											<h4 class="contact-title">1:1 문의</h4>
										</div>
									</a> 
								
									<a class="contact-item-link" href="mailto:help@bogglebooks.com">
										<div class="contact-item-link-innerwrapper">
											<img class="img_contact" src="${pageContext.request.contextPath}/asset/img/help/email.png">
											<h4 class="contact-title">이메일 문의</h4>
										</div>
									</a> 
									<a class="contact-item-link" href="">
										<div class="contact-item-link-innerwrapper">
											<img class="img_contact" src="${pageContext.request.contextPath}/asset/img/help/chat.png">
											<h4 class="contact-title">채팅 상담</h4>
										</div>
									</a>
							</li>
						</ul>
					</section>
					<section class="section contact-guide">
						<h3>제휴 문의</h3>
						<ul class="contact-list">
							<li class="contact-item"><a class="contact-item-link" href="">
									<div class="contact-item-link-innerwrapper">
										<img class="img_contact" src="${pageContext.request.contextPath}/asset/img/help/partnership.png">
										<h4 class="contact-title">콘텐츠 제휴</h4>
									</div>
							</a> <a class="contact-item-link" href="">
									<div class="contact-item-link-innerwrapper">
										<img class="img_contact" src="${pageContext.request.contextPath}/asset/img/help/corporation.png">
										<h4 class="contact-title">
											BOGGLE <br>법인/단체
										</h4>
									</div>
							</a>
							</li>
						</ul>
					</section>
				</section>
		
		
			</div>
		
		</main>
		
		<footer class="footer">
			<div class="footer_wrapper">
				<div class="footer-left">
					<div class="footer-ridi-header">
						<ul class="info_contact">
							 <li class="request"><a href="${pageContext.request.contextPath}/help/writeForm">1:1 문의</a></li>
							 <li class="request"><a href="">로그아웃</a></li>
		
						</ul>
					</div>
					<div class="footer-ridi-info-contents">
						<div class="descripition-header">
							<div class="toggle">
								<h4>Boggle 만든 사람 |</h4><br>
								<small id="usName"> 김지연 이영림 장서윤 황인경 황희원</small>>
								
							</div>
						</div>
						<div class="corp_info">
							<ul class="info_link">
								<li><a class="link_prov" href="${pageContext.request.contextPath}/help/legal" target="_blank">이용약관</a></li>
								<li><a class="link_personal" href="${pageContext.request.contextPath}/help/privacy" target="_blank">개인정보처리방침</a></li>
								<li><a class="link_youth" href="${pageContext.request.contextPath}/help/youth" target="_blank">청소년보호정책</a></li>
							</ul>
							<p class="info_copyright">
								<a href="">&copy;2022 BOGGLE</a>
							</p>
						</div>
					</div>
				</div>
			</div>	
		</footer>

		
		
	</body>

</html>