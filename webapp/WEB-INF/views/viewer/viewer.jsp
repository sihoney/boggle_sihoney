<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>view page</title>
    
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-pen.css" rel="stylesheet">
	<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-pen.css" rel="stylesheet">
	<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-gothic-eco.css" rel="stylesheet">
	<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-myeongjo.css" rel="stylesheet">
	
	<style>
		* {
			padding: 0;
			margin: 0;
			box-sizing: border-box;
		}
		
		.container {
			height: 100vh;
		    width: 100vw;
		    display: flex;
		    flex-direction: column;
		    justify-content: center;
		    align-items: center;
		}
		
		.reviewContent {
			width: 70%;
		    text-align: center;
		    font-size: 25px;
		    line-height: 3rem;
		    color: #fff;
		}
		
		.nickname {
			padding: 1.5rem 0;
			color: #fff;
		}
	</style>
</head>
<body>
	<div class="container" style="background-color: ${fn:split(info.styleName, ',')[0]}">
		<p class="reviewContent" style="font-family: ${fn:split(info.styleName, ',')[1]}">
			${info.reviewContent }
		<p>
		<p class="nickname">${info.nickname }</p>
	</div>
</body>
<script>
	
</script>
</html>