<%@ page import="com.kh.cm.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<div class="container">
	<div class="row">
		<div class="col-md-3 ">
			<div class="list-group ">
              <a href="${ path }/member/myPage" class="list-group-item list-group-item-action">회원정보 수정</a>
              <a href="${ path }/member/updatePwd" class="list-group-item list-group-item-action">비밀번호 변경</a>
			  <a href="${ path }/myPage/ticket" class="list-group-item list-group-item-action">예매내역</a>
              <a href="${ path }/member/myPosts" class="list-group-item list-group-item-action active">내가 쓴 글 조회</a>
              <a href="${ path }/member/myReviews" class="list-group-item list-group-item-action">내가 쓴 리뷰 조회</a>
			</div>
		</div>
		<div class="col-md-9">
			<div class="card">
				<div class="card-body">
					<div class="row">
						<div class="col-md-12">
							<h4>내가 쓴 글 조회</h4>
							<hr>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<form action="${path}/member/update" method="POST">
								<div class="form-group row">
									<label for="inputPwd" class="col-4 col-form-label">현재 비밀번호</label>
									<div class="col-8">
										<input id="password" name="password" class="form-control here" required="required" type="password">
									</div>
								</div>
								<div class="form-group row">
									<label for="inputNewPwd" class="col-4 col-form-label">새로운 비밀번호</label>
									<div class="col-8">
										<input id="newpwd1" name="newpwd1" class="form-control here" required="required" type="password">
									</div>
								</div>
								<div class="form-group row">
									<label for="inputNewPwdChk" class="col-4 col-form-label">새 비밀번호 확인</label>
									<div class="col-8">
										<input id="newpwd2" name="newpwd2" class="form-control here" required="required" type="password">
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
		

<%@ include file="/WEB-INF/views/common/footer.jsp"%>