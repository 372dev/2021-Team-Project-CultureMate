<%@ page import="com.kh.cm.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<style>
	table > thead > tr > th{
		font-size: 18px;
		font-family: 'Noto Sans KR', sans-serif;
		font-weight: 400;
		text-align: center;
	}
</style>

<div class="container">
	<div class="row">
		<div class="col-md-3 ">
		     <div class="list-group ">
              <a href="${ path }/myPage" class="list-group-item list-group-item-action">회원정보 수정</a>
              <a href="${ path }/myPage/ticket" class="list-group-item list-group-item-action active">예매내역</a>
              <a href="#" class="list-group-item list-group-item-action">활동관리</a>
            </div> 
		</div>


		<table>
			<thead>
				<tr>
					<th>예매번호</th>
					<th>공연명</th>
					<th>인원수</th>
					<th>티켓가격</th>
					<th>좌석번호</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
		</table>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>