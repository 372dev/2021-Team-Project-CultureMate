<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<section>
	<form class="findPasswordForm" action="${path}/member/findPassword">
		<div class="col-md-5 col-md-offset-3">
			<input type="text" name="userId" class="form-control" placeholder="아이디" required autofocus>
		</div>
		
		<div class="col-md-5 col-md-offset-3">
			<input type="text" name="userName" class="form-control" placeholder="이름" required>
		</div>
		
		<div class="col-md-5 col-md-offset-3">
			<input type="email" name="email" class="form-control" placeholder="이메일" required>
		</div>

		<button class="btn btn-lg btn-primary btn-block btn-findPassword">비밀번호 찾기</button>
	</form>
</section>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>