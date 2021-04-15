<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>


<section>
 <div class="wrapper">
	<form class="loginForm" method="post" action="${path}/member/login">
		<div class="col-md-5 col-md-offset-3">
			<input type="text" name="userId" class="form-control" placeholder="아이디" required autofocus>
		</div>
		
		<div class="col-md-5 col-md-offset-3">
			<input type="password" name="password" class="form-control" placeholder="비밀번호" required>
		</div>
		
		<div id="remember" class="checkbox">
			<label>
				<input type="checkbox" value="remember-me">로그인 유지
			</label>
		</div>
		
		<button class="btn btn-lg btn-success btn-block btn-login">로그인</button>
	</form>
	<a href="${ path }/member/findIdAndPwd">
		아이디 | 비밀번호 찾기
	</a>
 </div>
</section>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>