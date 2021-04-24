<%@ page import="com.kh.cm.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<style>
	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap');

	.list-group-item.active{
		background-color: #9DB81F;
		border-color: #9DB81F;
	}
	
	#update_pwd{
		background-color: #9DB81F;
	}
	
	#revert{
		background-color: #ff8c00;
	}
	
	.btn:hover{
		color: white;
	}
	
	#title{
		font-family: 'Noto Sans KR', sans-serif;
	}
</style>
<div class="container">
	<div class="row">
		<div class="col-md-3 ">
			<div class="list-group ">
              <a href="${ path }/member/myPage" class="list-group-item list-group-item-action">회원정보 수정</a>
              <a href="${ path }/member/updatePwd" class="list-group-item list-group-item-action active">비밀번호 변경</a>
			  <a href="${ path }//member/ticket" class="list-group-item list-group-item-action">예매내역</a>
              <a href="${ path }/member/myPosts" class="list-group-item list-group-item-action">내가 쓴 글 조회</a>
              <a href="${ path }/member/myReviews" class="list-group-item list-group-item-action">내가 쓴 리뷰 조회</a>
			</div>
		</div>
		<div class="col-md-9">
			<div class="card">
				<div class="card-body">
					<div class="row">
						<div class="col-md-12">
							<h4 id="title">비밀번호 변경</h4>
							<hr>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<form action="${path}/member/updatePwd" method="POST">
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
									<div class="check_font" id="pwd_check1"></div>
								</div>
								<div class="form-group row">
									<label for="inputNewPwdChk" class="col-4 col-form-label">새 비밀번호 확인</label>
									<div class="col-8">
										<input id="newpwd2" name="newpwd2" class="form-control here" required="required" type="password">
									</div>
									 <div class="check_font" id="pwd_check2"></div>
								</div>
                              	<div class="form-group" align="center">
                              		<button type="submit" class="btn" id="update_pwd">수정</button>
                              		<button type="reset" class="btn" id="revert">취소</button>
                              	</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
		// 비밀번호 정규식
		var pwJ = /^[A-Za-z0-9]{8,15}$/;
		
		// 비밀번호 유효성 검사
		// 1. 정규식 체크
		$("#newpwd1").blur(function(){
			if(pwJ.test($("#newpwd1").val()) && ($("#newpwd1").val().trim() !== $("#password").val().trim())){
				console.log('true');
				$("#pwd_check1").text('');
			} else if(pwJ.test($("#newpwd1").val()) && ($("#newpwd1").val().trim() === $("#password").val().trim())){
				console.log('same');
				$("#pwd_check1").text("현재 비밀번호와 동일합니다.");
				$("#pwd_check1").css("color", "red");
			} else {
				console.log('false');
				$("#pwd_check1").text("숫자 또는 문자로만 8~15자리 입력해주세요.");
				$("#pwd_check1").css("color", "red");
			} 
		});
		
		// 2. 비밀번호 일치 확인
		$("#newpwd2").blur(function(){
			if($("#newpwd1").val().trim() === ($("#newpwd2").val().trim())){
				console.log('비밀번호 일치');
				$("#pwd_check2").text('');
			} else {
				console.log('비밀번호 불일치');
				$("#pwd_check2").text("비밀번호가 일치하지 않습니다.");
				$("#pwd_check2").css("color", "red");
			}
		});
		
		$("#update_pwd").click(function(){
			if($("#newpwd1").val().trim() === ($("#newpwd2").val().trim()) 
					&& $('#password').val().trim() !== $('#newpwd1').val().trim()){
				console.log('비밀번호 수정');
			} else {
				console.log('수정 불가');
				event.preventDefault();
			}
		});
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>