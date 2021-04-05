<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<c:set var="path" value="${pageContext.request.contextPath }"/>

<html>
<head>
	<meta charset="UTF-8">
	<title>CultureMate</title>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> 
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="${path}/resources/css/main.css">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>

	<div id="header">
		<div id="header-container">
			<img class="cm_logo" src="${path}/resources/images/logo.png" alt="">
			<div class="sidebtn">
				<a class="logout btn-secondary" href="">로그인</a>
				<a class="mypage btn-secondary" href="">마이페이지</a>
			</div>
			<div id="topmenu">
				<div class="list list01">
					<a href="">공연</a>
					<div class="list01_under under">
						<a href="">뮤지컬</a>
						<a href="">콘서트</a>
						<a href="">연극</a>
					</div>
				</div>
				<div class="list list02">
					<a href="">메이트</a>
					<div class="list02_under under">
						<a href="">같이가요</a>
						<a href="">티켓나눔</a>
					</div>
				</div>
				<div class="list list03">
					<a href="">이벤트</a>
				</div>
				<div class="list list04">
					<a href="">고객센터</a>
				</div>
			</div>
		</div>
		<div class="line"></div>
	</div>






























