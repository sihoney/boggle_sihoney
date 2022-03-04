<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!-- ------헤더------ -->
    <div id="header" class="clearfix">
        <a href="${pageContext.request.contextPath}/">
            <img src="${pageContext.request.contextPath}/asset/img/logo/1_logo.png">
        </a>
        <!-- 로그인전 -->
        <ul class="list-unstyled">
            <a class="btn btn-link" role="button" href="${pageContext.request.contextPath}/review_write">기록하기</a>
            <a class="btn btn-link" role="button" href="${pageContext.request.contextPath}/loginForm">로그인</a>
        </ul> 

        <!-- 로그인후 -->
        <!-- <ul class="list-unstyled">
            <a class="btn btn-link" role="button" href="">기록하기</a>
            <span onclick="location.href='http://'">
                <img src="../img/login/user.jpg" class="img-circle">
                <a class="btn btn-link" role="button" href="">황태형</a>
            </span>
        </ul> -->
    </div>
    <!-- ------헤더------ -->