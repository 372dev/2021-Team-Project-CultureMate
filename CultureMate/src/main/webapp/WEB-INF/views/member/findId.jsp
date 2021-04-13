<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<section>
	<form class="findIdForm" action="${path}/member/findId">
		<div class="col-md-5 col-md-offset-3">
			<input type="text" name="userName" class="form-control" placeholder="이름" required autofocus>
		</div>
		
		<div class="col-md-5 col-md-offset-3">
			<input type="email" name="email" class="form-control" placeholder="이메일" required>
		</div>

		<button class="btn btn-lg btn-primary btn-block btn-login">아이디 찾기</button>
	</form>
</section>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>