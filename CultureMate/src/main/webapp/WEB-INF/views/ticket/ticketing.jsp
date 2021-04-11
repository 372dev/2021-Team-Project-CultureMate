<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<style>
	#form_ticketing{
		display: none;
	}
</style>

<form id="form_ticketing" action='${path}/ticket/ticketing/success' method="post">
	<input type="text" id="form_mt20id" name="mt20id" value="${mt20id}">
	<input type="text" id="form_prfnm" name="prfnm" value="${prfnm}">
	<input type="text" id="form_id" name="id" value="${ id }">
	<input type="text" id="form_userId" name="user_id" value="${ user_id }">
	<input type="text" id="form_ticket_qty" name="ticket_qty" value="${ ticket_qty }">
	<input type="text" id="form_pcseguidance" name="pcseguidance" value="${ pcseguidance }">
	<input type="text" id="form_ticket_seat" name="ticket_seat" value="${ ticket_seat }">
</form>

<script>
	// 테스트, 나중에 지울것
	var form_mt20id = document.getElementById("form_mt20id");
	var form_prfnm = document.getElementById("form_prfnm");
	var form_id = document.getElementById("form_id");
	var form_userId = document.getElementById("form_userId");
	var form_ticket_qty = document.getElementById("form_ticket_qty");
	var form_pcseguidance = document.getElementById("form_pcseguidance");
	var form_ticket_seat = document.getElementById("form_ticket_seat");

	console.log("form_mt20id : " + form_mt20id.value);
	console.log("form_prfnm : " + form_prfnm.value);
	console.log("form_id : " + form_id.value);
	console.log("form_userId : " + form_userId.value);
	console.log("form_ticket_qty.value : " + form_ticket_qty.value);
	console.log("form_pcseguidance.value : " + form_pcseguidance.value);
	console.log("form_ticket_seat.value : " + form_ticket_seat.value);
</script>

<script>
	IMP.init('imp48086653');

	IMP.request_pay({
		pg : 'inicis', // version 1.1.0부터 지원.
		pay_method : 'card',
		merchant_uid : 'merchant_' + new Date().getTime(),
		name : '주문명:결제테스트',
		amount : 1000, //판매 가격
		buyer_email : 'iamport@siot.do',
		buyer_name : '구매자이름',
		buyer_tel : '010-1234-5678',
		buyer_addr : '서울특별시 강남구 삼성동',
		buyer_postcode : '123-456',
		m_redirect_url : '${path}/ticket/ticketing/success'
	}, function(rsp) {
		if ( rsp.success ) {
			$('#form_ticketing').submit();
		} else {
			msg = '결제에 실패하였습니다.';
			msg += '에러내용 : ' + rsp.error_msg;
			location.href="${path}/ticket/ticketing/fail";
			alert(msg);
		}
	});
</script>















<%@ include file="/WEB-INF/views/common/footer.jsp"%>







































