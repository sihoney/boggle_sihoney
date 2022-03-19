<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">

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
						<li title="문의 등록">1:1 문의</li>
					</ol>
				</nav>
	
				<h1 id="form-title" class="new-request-form-title">문의 수정</h1>
	
	
				<div class="form">
					<form id="new_request" class="request-form" data-form="" data-form-type="request" action="/hc/ko/requests" accept-charset="UTF-8" method="post">
						<input name="utf8" type="hidden" value="&#x2713;" /><input type="hidden" name="authenticity_token" value="hc:requests:server:rWIC-2HjnvsKIeXieMgEoYrWsbrqO3aROVQnUkolVVdnJOdUqp8SVrTOt1_zROEYp94JK8F3ngP0g4xxagy9hg" />
	
						<!-- <div class="form-field string request_subject">
							<label id="request_subject_label" for="request_subject">작성자</label> <input type="text" name="request[subject]" id="request_subject" maxlength="150" size="150" aria-required="true" aria-labelledby="request_subject_label" />
						</div> -->
						
						<div class="form-field string  required  request_subject">
							<label id="request_subject_label" for="request_subject">제목</label> <input type="text" name="request[subject]" id="request_subject" maxlength="150" size="150" aria-required="true" aria-labelledby="request_subject_label" />
						</div>
	
	
						<div class="suggestion-list" data-hc-class="searchbox" data-hc-suggestion-list="true"></div>
	
	
						<div class="form-field text  required  request_description">
							<label id="request_description_label" for="request_description">상세 설명</label>
							<textarea name="request[description]" id="request_description" aria-required="true" aria-labelledby="request_description_label"></textarea>
							<input type="hidden" name="request[description_mimetype]" id="request_description_mimetype" value="text/plain" style="display: none;" />
						</div>
	
						<footer>
							<a id="btn_modify_modifyForm" href="${pageContext.request.contextPath}/help/modifyForm">수정</a>
							<a id="btn_delete_modifyForm" href="${pageContext.request.contextPath}/help/list">삭제</a>
						</footer>
					</form>
				</div>
	
				<div class="suggestion_info">
					<img src="${pageContext.request.contextPath}/asset/img/help/writeForm.png">
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

	
	
	
		<!-- / -->
	
	</body>

</html>
