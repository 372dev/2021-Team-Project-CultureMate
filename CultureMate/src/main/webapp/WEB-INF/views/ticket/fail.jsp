<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<style>
	#fail{
		height: 560px;
	}

	#fail > .fail_container{
		width: 510px;
		margin-left: 345px;
		margin-top: 200px;
	}

	#fail > .fail_container > .text01{
		width: 510px;
		text-align: center;
		font-size: 40px;
		font-family: 'Noto Sans KR', sans-serif;
		font-weight: 400;
	}

	#fail > .fail_container > .text02{
		width: 510px;
		margin-top: 14px;
		font-size: 28px;
		font-family: 'Noto Sans KR', sans-serif;
		font-weight: 200;
	}

	#fail > .fail_container > .btn{
		margin-top: 40px;
		font-size: 18px;
		font-family: 'Noto Sans KR', sans-serif;
		font-weight: 300;
		height: 50px;
		text-align: center;
		line-height: 50px;
		padding: 0;
		box-sizing: content-box;
	}

	#fail > .fail_container > .btn01{
		width: 250px;
	}

	#fail > .fail_container > .btn02{
		width: 250px;
	}
</style>


<div id="fail">
	<div class="fail_container">
		<div class="text01">결제 실패</div>
		<div class="text02">결제가 정상적으로 이루어지지 않았습니다.</div>
		<a class="btn01 btn btn-secondary" href="${path}/show/restview?name=${mt20id}">상세페이지로 돌아가기</a>
		<a class="btn02 btn btn-secondary" href="${path}/">메인으로 돌아가기</a>
	</div>
</div>













<%@ include file="/WEB-INF/views/common/footer.jsp"%>


































