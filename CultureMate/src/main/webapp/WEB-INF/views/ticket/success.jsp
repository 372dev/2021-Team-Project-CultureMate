<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<style>
	#success{
		height: 560px;
	}

	#success > .success_container{
		margin-left: 100px;
		margin-top: 100px;
	}

	#success *{
		font-family: 'Noto Sans KR', sans-serif;
	}

	#success > .success_container > .text_container{
		margin-top: 40px;
	}

	#success > .success_container > .text_container > .list{
		height: 50px;
		font-size: 24px;
		font-weight: 300;
	}

	#success > .success_container > .text_container > .list > .in{
		margin-left: 20px;
		display: inline-block;
		font-size: 24px;
		font-weight: 200;
		color: rgb(101, 110, 117);
	}

	#success > .success_container > .title{
		width: 510px;
		font-size: 40px;
		font-weight: 400;
	}

	#success > .success_container > .btn{
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

	#success > .success_container > .btn01{
		width: 250px;
	}

	#success > .success_container > .btn02{
		width: 250px;
	}
	
	#success > .success_container > .text_email{
		margin-top : 10px;
		font-size: 24px;
		font-family: 'Noto Sans KR', sans-serif;
		font-weight: 400;
	}
	
	#success > .success_container > .text_email > span{
		font-size: 24px;
		font-family: 'Noto Sans KR', sans-serif;
		font-weight: 400;
		color : darkorange;
	}
</style>

<div id="success">
	<div class="success_container">
		<div class="text title">결제를 완료했습니다.</div>
		<div class="text_email">예매확인서가 <span>${loginMember.email}</span>로 발송되었습니다.</div>
		<div class="text_container">
			<div class="text01 text list">
				예매번호 :
				<div class="in">${ ticket_num }</div>
			</div>
			<div class="text02 text list">
				공연명 :
				<div class="in">${ prfnm }</div>
			</div>
			<div class="text03 text list">
				공연날짜 :
				<div class="in">${ ticket_date }</div>
			</div>
			<div class="text04 text list">
				인원수 :
				<div class="in">${ ticket_qty }</div>
			</div>
			<div class="text05 text list">
				티켓가격 :
				<div class="in">${ pcseguidance }</div>
			</div>
			<div class="text06 text list">
				좌석정보 :
				<div class="in">${ ticket_seat }</div>
			</div>
		</div>
		<a class="btn01 btn btn-secondary" href="${path}/">메인으로</a>
		<a class="btn02 btn btn-secondary" href="${ path }/member/ticket">예매내역 확인</a>
	</div>
</div>







<%@ include file="/WEB-INF/views/common/footer.jsp"%>


































