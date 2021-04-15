<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<link rel="stylesheet" href="${path}/resources/css/cscenter.css">

<div class="col" style="border:1px solid black;" >
	<p>고객센터</p>
	
	<div class="list" style="border:1px solid black;" >
	    <ul class="bls_tbls c3">
		    <li class="active"><a href="${path}/help/csmain" id="poster">자주묻는질문(FAQ)</a></li>
			<li><a href="${path}/help/notice" id="perf">공지사항</a></li>
			<li><a href="${path}/help/qnalist" id="refund">1:1문의</a></li>
		</ul>
	</div>

	<div class="notice" style="border:1px solid black;">

		<strong>궁금한 내용은 1:1문의를 이용해 주세요.<br> 
		        매주평일오전 9시~ 6시 (공휴일제외)<br> 
		        02-1111-2222
		</strong>

	</div>

	<div class="search" style="border:1px solid black;">
		<input type="text" class="text_ser">
		<button type="submit">검색</button>
	</div>

	<hr>

	<h5>
		<strong>자주 묻는 질문(FAQ)</strong>  
		<c:if test="${ !empty loginMember && (loginMember.userId == qnaboard.userId || loginMember.userRole == 'ROLE_ADMIN')}">
		<button type="button" onclick="location.href ='${path}/help/cswrite'">글쓰기</button>
	    </c:if>
	</h5>
	

<div class="row" style="border:1px solid black;">
		<div class="col">
			<ul class="nav nav-tabs">
				<li class="nav-item1"><a class="nav-link active"
					data-toggle="tab" href="#qwe">전체보기</a></li>
				<li class="nav-item1"><a class="nav-link" data-toggle="tab"
					href="#asd">예매/취소</a></li>
				<li class="nav-item1"><a class="nav-link" data-toggle="tab"
					href="#zxc">결제</a></li>
				<li class="nav-item1"><a class="nav-link" data-toggle="tab"
					href="#dfg">회원</a></li>
				<li class="nav-item1"><a class="nav-link" data-toggle="tab"
					href="#hjk">메이트/소모임</a></li>
			</ul>


			<div class="tab-content">
				<div class="tab-pane fade show active" id="qwe">
					<div class="table-responsive">
						<table class="table table-hover">
							<tr>
								<th>분류</th>
								<th>제목</th>
							</tr>

							<c:if test="${csmain != null}">
								<c:forEach var="csboard" items="${csmain}">
									<tr>
										<td><c:out value="${csboard.csboardType}" /></td>
										<td><a
											href="${path}/help/csfaqview?csboardId=${csboard.csboardId}">
												<c:out value="${csboard.csboardTitle}" />
										</a></td>
									</tr>
								</c:forEach>
							</c:if>
						</table>
					</div>
				</div>


				<div class="tab-pane fade" id="asd">
					<div class="table-responsive">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>분류</th>
									<th>제목</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>예매/취소</td>
									<td><a href="#">티켓환불은 어떻게 받나요?</a></td>
								</tr>
								<tr>
									<td>예매/취소</td>
									<td><a href="#">예매 취소 하고 싶어요!</a></td>
								</tr>
								<tr>
									<td>예매/취소</td>
									<td><a href="#">취소 수수료는 얼마인가요?</a></td>
								</tr>
								<tr>
									<td>예매/취소</td>
									<td><a href="#">예매 수수료는 얼마인가요?</a></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>

				<div class="tab-pane fade" id="zxc">
					<div class="table-responsive">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>분류</th>
									<th>제목</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>결제</td>
									<td><a href="#">신용카드 결제 시 공인인증서가 꼭 필요한가요?</a></td>
								</tr>
								<tr>
									<td>결제</td>
									<td><a href="#">공연 예매 시 할인 받을 수 있는 신용카드는 무엇이있나요?</a></td>
								</tr>
								<tr>
									<td>결제</td>
									<td><a href="#">예매 시 결제 수단에는 어떤 것들이 있나요?</a></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>

				<div class="tab-pane fade" id="dfg">
					<div class="table-responsive">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>분류</th>
									<th>제목</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>회원</td>
									<td><a href="#">회원가입 후 로그인이 안되는데 어떻게 하나요?</a></td>
								</tr>
								<tr>
									<td>회원</td>
									<td><a href="#">이메일 인증은 어떻게 하나요?</a></td>
								</tr>
								<tr>
									<td>회원</td>
									<td><a href="#">회원 탈퇴는 어떻게 하나요?</a></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>

				<div class="tab-pane fade" id="hjk">
					<div class="table-responsive">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>분류</th>
									<th>제목</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>메이트/소모임</td>
									<td><a href="#">메이트/소모임에 글을 올리고 싶은데 어떻게 하나요?</a></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>

			</div>

		</div>

	</div>
</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>