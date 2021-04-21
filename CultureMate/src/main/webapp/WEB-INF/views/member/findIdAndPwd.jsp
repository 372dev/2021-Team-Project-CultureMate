<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<style>
	section{
		padding: 10 300 0 300;
		width: 100%;
	}
	
	#background_modal {
		display : none;
		background-color : #FFFFFF;
		position : absolute;
		top:200px;
		left:600px;
		width: 300px;
		padding:10px;
		border:2px solid #E2E2E2;
		z-Index:9999;
	}
	
	#findIdBtn{
		background-color: #9DB81F;
	}	
	
	#findPwdBtn{
		background-color: #9DB81F;
	}
	
	#gobackBtn{
		background-color: #FF8C00;
	}
	
	.btn:hover{
		color: white;
	}
</style>
<section>
<div>
	<!-- 모달창 -->
	<div id="background_modal" class="background_modal">
		<div class="modal_contents">
			<h4>
				<b>회원님의 아이디는</b><span class="close">&times;</span>
			</h4>
			<br>
				<h2 id="id_value"></h2>
			<br>
		</div>
	</div>
	
	<div style="margin-bottom: 10px;" class="custom-control custom-radio custom-control-inline">
		<input type="radio" class="custom-control-input" id="find_1" name="find_total" onclick="find_check(1);" checked>
		<label class="custom-control-label font-weight-bold" for="find_1">아이디 찾기</label>
	</div>
	<div style="margin-bottom: 10px;" class="custom-control custom-radio custom-control-inline">
		<input type="radio" class="custom-control-input" id="find_2" name="find_total" onclick="find_check(2);">
		<label class="custom-control-label font-weight-bold" for="find_2">비밀번호 찾기</label>
	</div>
	
	<br><br>
	
	<!-- 아이디 찾기 -->
	<div id="findI">
		<div class="form-group">
			<label class="font-weight-bold" for="inputName_1">이름</label>
			<div>
				<input type="text" class="form-control" id="inputName_1" name="inputName_1" />
			</div>
		</div>
		<div class="form-group">
			<label class="font-weight-bold" for="inputEmail_1">이메일</label>
			<div>
				<input type="email" class="form-control" id="inputEmail_1" name="inputEmail_1" placeholder="가입 시 입력하신 이메일을 입력하세요"/>
			</div>
		</div>
		<div class="form-group">
			<label class="font-weight-bold" for="inputPhone_1">핸드폰 번호</label>
			<div>
				<input type="text" class="form-control" id="inputPhone_1" name="inputPhone_1" placeholder="(-없이)" />
			</div>
		</div>
		<div class="form-group">
			<button id="findIdBtn" type="submit" class="btn btn-block">확인</button>
			<button id="gobackBtn" class="btn btn-default btn-block" onclick="history.go(-1)">취소</button>
		</div>
	</div>
	
	<form class="form-horizontal" action="${ path }/member/findPassword" method="POST">
	<!-- 비밀번호 찾기 -->
	<div id="findP" style="display: none;">
		<div class="form-group">
			<label class="font-weight-bold" for="inputId_1">아이디</label>
			<div>
				<input type="text" class="form-control" id="inputId_1" name="inputId_1" />
			</div>
		</div>
		<div class="form-group">
			<label class="font-weight-bold" for="inputEmail_2">이메일</label>
			<div>
				<input type="email" class="form-control" id="inputEmail_2" name="inputEmail_2" placeholder="가입 시 입력하신 이메일을 입력하세요"/>
			</div>
		</div>
		<div class="form-group">
			<label class="font-weight-bold" for="inputPhone_2">핸드폰 번호</label>
			<div>
				<input type="text" class="form-control" id="inputPhone_2" name="inputPhone_2" placeholder="(-없이)" />
			</div>
		</div>
		<div class="form-group">
			<button id="findPwdBtn" type="submit" class="btn btn-block">확인</button>
			<button id="gobackBtn" class="btn btn-block" onclick="history.go(-1)">취소</button>
		</div>
	</div>
	</form>
</div>
</section>
<script>
	function find_check(num){
		if(num == 1){
			document.getElementById("findP").style.display = "none";
			document.getElementById("findI").style.display = "";
		} else {
			document.getElementById("findI").style.display = "none";
			document.getElementById("findP").style.display = "";
		}
	}
	
	// 모달창 불러오기
	$(document).ready(function(){
		// 모달창 hidden 불러오기
		$('#findIdBtn').click(function(){
			$('#background_modal').show();
		});
		
		// 모달창 닫기 버튼
		$('.close').on('click', function(){
			$('#background_modal').hide();
		});
		
		// 모달창 위도우 클릭 시 닫기
		$(window).on('click', function(){
			if(event.target == $('#background_modal').get(0)){
				$('#background_modal').hide();
			}
		});
	});
	
	// 아이디 찾기 버튼 클릭
	$(function(){
		$("#findIdBtn").on("click", function(){
			var inputName = $("#inputName_1").val().trim();
			var inputEmail = $("#inputEmail_1").val().trim();
			var inputPhone = $("#inputPhone_1").val().trim();
			
			$.ajax({
				type: "post",
				url: "${path}/member/findId",
				data: {
					"inputName_1": inputName,
					"inputEmail_1": inputEmail,
					"inputPhone_1": inputPhone
				},
				contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
				success:function(data){
					console.log(data);
					
					if(data == 0){
						$('#id_value').text("회원 정보를 확인해주세요!");	
					} else {
						$('#id_value').text(data);
					}
				},
				error: function(e){
					console.log(e);
				}
			});
		});
	});

	// 비밀번호 찾기 버튼 클릭
	$(function(){
		$("#findPwdBtn").on("click", function(){
			var inputId = $("#inputId_1").val().trim();
			var inputEmail = $("#inputEmail_2").val().trim();
			var inputPhone = $("#inputPhone_2").val().trim();
		});
	});
	
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>