<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html dir="ltr" lang="ko">

<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Boggle 고객센터</title>

<script src="${pageContext.request.contextPath}/asset/js/jquery-1.12.4.js"></script>

<link rel="stylesheet" type="text/css" media="all" href="${pageContext.request.contextPath}/asset/css/help.css">

</head>
<body class="">

	<main role="main">
		<div class="container">
			<nav class="sub-nav">
				<ol class="breadcrumbs">

					<li title="보글 고객센터"><a href="${pageContext.request.contextPath}/help">보글 고객센터</a></li>
					<li title="문의 등록"><a href="${pageContext.request.contextPath}/help/list">문의 내역 목록</a></li>
				</ol>
			</nav>

			<div class="article-container" id="article-container">
				

				<article class="article">
					<header class="article-header">
						<h1 title="터치가 동작하지 않아요." class="article-title">터치가 동작하지 않아요.</h1>
					</header>

					<section class="article-info">
						<div class="article-content">
							<div class="article-body">
								<p>페이퍼 제품의 화면을 터치하여도 동작되지 않는 증상은 크게 화면의 일부만 터치가 되지 않는 증상과, 화면 전체가 터치되지 않는 증상으로 나눌 수 있습니다.</p>
								<p>화면의 일부만 터치되지 않는 증상 화면 전체가 터치되지 않는 증상 먼저 전원 버튼을 짧게 눌러 슬립모드(슬립화면)로 변경되는지 확인해 주세요.</p>
								<p>슬립모드로 변경되는 경우 전원을 껐다가 켜도 동일한 경우 터치 고장으로 인한 증상일 수 있으므로 저희 리디북스 고객센터를 통해 A/S를 신청해 주세요.</p>
								<p>슬립모드로 변경되지 않는 경우 페이퍼 동작이 멈추었거나 배터리가 부족한 상황일 수 있으므로 아래 방법으로 페이퍼 전원을 껐다가 켠 후 정상적으로 동작하는지 여부를 확인해 주세요.</p>
							</div>
						</div>
					</section> 
				</article>
			</div>
		</div>


		<div class="article-votes">
			<div class="article-votes-controls" role='radiogroup'>
				<a id="btn_modify_read" href="${pageContext.request.contextPath}/help/modifyForm">수정</a>
				<a id="btn_delete_read" href="${pageContext.request.contextPath}/help/list">삭제</a>
			</div>
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