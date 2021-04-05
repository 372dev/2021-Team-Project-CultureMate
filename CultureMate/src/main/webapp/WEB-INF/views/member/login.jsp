<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<c:set var="path" value="${ pageContext.request.contextPath }" />

<section>

		<form class="loginForm" method="POST" action="${ path }/member/login">
		  <div class="form-group">
		    <label for="inputId" class="col-sm-2 control-label">아이디</label>
		    <div class="col-sm-3">
		      <input type="text" class="form-control" name="userId" placeholder="아이디">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputPassword" class="col-sm-2 control-label">비밀번호</label>
		    <div class="col-sm-3">
		      <input type="password" class="form-control" name="password" placeholder="비밀번호">
		    </div>
		  </div>
		  <div class="form-group">
		    <div class="col-sm-offset-2 col-sm-10">
		      <div class="checkbox">
		        <label>
		          <input type="checkbox" name="remember-me"> 로그인 유지
		        </label>
		      </div>
		    </div>
		  </div>
		  <div class="form-group">
		    <div class="col-sm-offset-2 col-sm-10">
		      <input type="submit" value="로그인" />
		    </div>
		  </div>
		</form>
		
</section>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>