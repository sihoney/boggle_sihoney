<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
	<!-- ------헤더------ -->
    <div id="header" class="clearfix">
        <a href="${pageContext.request.contextPath}/">
            <img src="${pageContext.request.contextPath}/asset/img/logo/1_logo.png">
        </a>
        
        <c:choose>
        	<c:when test="${sessionScope.authUser eq null}">
        		<!-- 로그인전 -->
        		<ul class="list-unstyled">
	            	<a class="btn btn-link" role="button" href="${pageContext.request.contextPath}/review_write">기록하기</a>
	            	<a class="btn btn-link" role="button" href="${pageContext.request.contextPath}/user/loginForm">로그인</a>
        		</ul> 
        	</c:when>
        	<c:otherwise>
        		<!-- 로그인후 -->
        		<ul class="list-unstyled">
	            	<a class="btn btn-link" role="button" href="">기록하기</a>
	            	<span onclick="location.href='http://'">
	                <img src="../img/login/user.jpg" class="img-circle">
	                <a class="btn btn-link" role="button" href="">${sessionScope.authUser.userName}</a>
                </ul>
            </span>
     
        	</c:otherwise>
        </c:choose>
        
        

        
    </div>
    <!-- ------헤더------ -->