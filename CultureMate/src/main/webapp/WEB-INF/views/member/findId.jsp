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
		
		<div class="col-md-5 col-md-offset-3">
			<input type="text" name="phone" class="form-control" placeholder="핸드폰 번호" required>
		</div>

		<button class="btn btn-lg btn-primary btn-block btn-login" id="findId">아이디 찾기</button>
	</form>
</section>
<script>
/* 	$(document).on('click', '#findId', function(){
		var name = $('#userName').val();
		var email = $('#email').val();
		var phone = $('#phone').val();
		
		var postData = {'userName' : name, 'email' : email, 'phone' : phone};
		
		$.ajax({
			url:'/member/findId',
			type:'POST',
			data: postData,
			dataType: "json",
			success: function(data){
				var userId = data.userId;
				alert('${name} 님의 아이디는 ' + userId + ' 입니다.');
			},
			error: function(){
				alert('일치하는 아이디가 존재하지 않습니다.');
			}
		});
	}); */
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>