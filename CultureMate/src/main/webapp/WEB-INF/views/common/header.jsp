<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<c:set var="path" value="${pageContext.request.contextPath }" />

<html>
  <head>
    <meta charset="UTF-8" />
    <title>CultureMate</title>
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
    />
    <link rel="stylesheet" href="${path}/resources/css/main.css" />
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js" ></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
  </head>
  <body>
  	<div class="bodyContainer">
    <div id="header">
      <div id="header-container">
        <a class="cm_logo" href="${path}/">
          <img src="${path}/resources/images/logo.png" alt=""/>
        </a>
        <div class="sidebtn">
				<c:if test="${loginMember == null}">
					<a class="enroll btn-secondary" href="${path}/enroll">회원가입</a>
					<a class="login btn-secondary" href="${path}/login">로그인</a>
					<a class="mypage btn-secondary" href="${path}/member/myPage">마이페이지</a>
				</c:if>
				<c:if test="${loginMember != null}">
					<a class="login btn-secondary" href="">로그아웃</a>
					<c:choose>
						<c:when test="${loginMember.userRole == 'ROLE_ADMIN'}">
							<a class="mypage btn-secondary" href="${path}/admin/adminpage">관리자페이지</a>
						</c:when>
						<c:when test="${loginMember.userRole == 'ROLE_USER'}">
							<a class="mypage btn-secondary" href="${path}/member/myPage">마이페이지</a>
						</c:when>
					</c:choose>
				</c:if>
        </div>
        <div id="topmenu">
	          <div class="list list01">
	            <a href="${ path }/show/showList">공연</a>
	            <div class="list01_under under">
	              <a href="${ path }/show/boList?genre=musical">뮤지컬</a>
	              <a href="${ path }/show/boList?genre=play">연극</a>
	              <a href="${ path }/show/boList?genre=classic">클래식</a>
	            </div>
	          </div>
          <div class="list list02">
            <a href="">메이트</a>
            <div class="list02_under under">
              <a href="${path}/mate/list">같이가요</a>
              <a href="${path}/share/list">티켓나눔</a>
            </div>
          </div>
          <div class="list list03">
            <a href="">이벤트</a>
          </div>
          <div class="list list04">
            <a href="${path}/help/csmain">고객센터</a>
          </div>
        </div>
      </div>
      <div class="line"></div>
    </div>
