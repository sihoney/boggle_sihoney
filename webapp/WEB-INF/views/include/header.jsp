<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
	<!-- ------헤더------ -->
    <div id="header">
        <a href="${pageContext.request.contextPath}/">
            <img src="${pageContext.request.contextPath}/asset/img/logo/1_logo.png">
        </a>
        
        <c:choose>
			<c:when test="${sessionScope.authUser eq null}">
				<!-- 로그인전 -->
				<ul class="list-unstyled">
					<li><a class="btn btn-link" role="button" href="${pageContext.request.contextPath}/review_write">회원가입</a></li>
					<li><a class="btn btn-link" role="button" href="${pageContext.request.contextPath}/user/loginForm">로그인</a></li>
				</ul>
			</c:when>
			
			<c:otherwise>
				<!-- 로그인후 -->
				<ul class="list-unstyled">
					<li><a class="btn btn-link" role="button" href="">기록하기</a></li>
					<li> 
						<label for="user-img"></label>
						<a class="btn btn-link" role="button" href="${pageContext.request.contextPath}/book/review">
							<img id="user-img" src="${pageContext.request.contextPath}/asset/img/profile.png" class="img-circle"> 
							<span>${sessionScope.authUser.nickname}</span>
						</a>
					</li>
				</ul>
			</c:otherwise>
		</c:choose>

        
    </div>
    <!-- ------헤더------ -->