<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<c:set var="path" value="${ pageContext.request.contextPath }" />

<section>

	<form class="loginForm" method="POST" action="${ path }/login">
	
		아이디 : <input type="text" name="userId" placeholder="아이디" /> <br/>
		비밀번호 : <input type="password" name="password" placeholder="비밀번호" /> <br/>
		<label>로그인 유지 : <input type="checkbox" name="remember-me" /></label>
		<input type="submit" value="로그인" />

		<security:csrfInput/>		
	</form>
</section>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>