<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<c:set var="path" value="${ pageContext.request.contextPath }" />


<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>

<p> 환경설정 끝~ 만세~ </p>

<security:authorize access="isAnonymous()">
	<a href="login">로그인</a>
</security:authorize>

<security:authorize access="isAuthenticated()">
	<c:url var="logoutUrl" value="/logout" />
	
	<form action="${ logoutUrl }" method="POST">
		<input type="submit" value="로그아웃" />
		
		<security:csrfInput/>
	</form>
</security:authorize>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
