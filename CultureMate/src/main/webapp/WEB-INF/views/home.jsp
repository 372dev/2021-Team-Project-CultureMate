<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<c:set var="path" value="${ pageContext.request.contextPath }" />

<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>

- 예매하기 테스트 버튼

<style>
	#form_ticketing_main{
		display: none;
	}
</style>

<form id="form_ticketing_main" action='${path}/ticket/ticketing' method="post">
	<input type="text" name="ticket_num" value="1"> <br>
	<input type="text" name="mt20id" value="test_01"> <br>
	<input type="text" name="id" value="1"> <br>
	<input type="text" name="user_id" value="kje0101"> <br>
	<input type="text" name="pi_num" value="1"> <br>
	<input type="text" name="ticket_qty" value="2"> <br>
	<input type="text" name="pcseguidance" value="480000"> <br>
	<input type="text" name="ticket_seat" value="A01"> <br>
</form>

<button id="form_ticketing_main_submit">예매하기</button>

<script >
	$('#form_ticketing_main_submit').click(function () {
		$('#form_ticketing_main').submit();
	});
</script>


<%@ include file="/WEB-INF/views/common/footer.jsp"%>