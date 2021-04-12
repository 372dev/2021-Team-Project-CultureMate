<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<h1>결제를 완료했습니다.</h1>

예매번호 : ${ ticket_num } <br>
공연명 : ${ prfnm } <br>
회원아이디 : ${ user_id } <br>
인원수 : ${ ticket_qty } <br>
티켓가격 : ${ pcseguidance } <br>
좌석번호 : ${ ticket_seat } <br>


<a class="mypage btn-secondary" href="${path}/">메인으로</a>
<a class="mypage btn-secondary" href="">예매내역 확인</a>







<%@ include file="/WEB-INF/views/common/footer.jsp"%>


































