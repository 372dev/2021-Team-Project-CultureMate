<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<link rel="stylesheet" href="${path}/resources/css/cscenter.css">
<script src="https://kit.fontawesome.com/4d8c9a2b0b.js" crossorigin="anonymous"></script>
<style>
 .page_wrap {
	text-align:center;
	font-size:0;
 }
.page_nation {
	display:inline-block;
}
.page_nation .none {
	display:none;
}
.page_nation a {
	display:block;
	margin:0 3px;
	float:left;
	border:1px solid #e6e6e6;
	width:28px;
	height:28px;
	line-height:28px;
	text-align:center;
	background-color:#fff;
	font-size:13px;
	color:#999999;
	text-decoration:none;
}
.page_nation .arrow {
	border:1px solid #ccc;
}
.page_nation .pprev {
	background:#f8f8f8 url('img/page_pprev.png') no-repeat center center;
	margin-left:0;
}
.page_nation .prev {
	background:#f8f8f8 url('img/page_prev.png') no-repeat center center;
	margin-right:7px;
}
.page_nation .next {
	background:#f8f8f8 url('img/page_next.png') no-repeat center center;
	margin-left:7px;
}
.page_nation .nnext {
	background:#f8f8f8 url('img/page_nnext.png') no-repeat center center;
	margin-right:0;
}
.page_nation a.active {
	background-color:#42454c;
	color:#fff;
	border:1px solid #42454c;
}
</style>
<div class="col">
	<p>고객센터</p>
	
	
	<ul class="nav nav-pills nav-fill">
      <li class="nav-item">
       <a class="nav-link active"  style="background-color: #6C757D; href="${path}/help/csmain" id="poster">자주묻는질문(FAQ)</a>
      </li>
      <li class="nav-item">
       <a class="nav-link" href="${path}/help/notice" id="perf">공지사항</a>
      </li>
      <li class="nav-item">
       <a class="nav-link" href="${path}/help/qnalist" >Q&A</a>
      </li>
    </ul>
    


	<div class="notice">

		<strong>궁금한 내용은 <span style = color:red;>Q&A문의</span>를 이용해 주세요.<br> 
		        매주평일오전 9시~ 6시 (공휴일제외)<br> 
		        <i class="fas fa-phone-alt"></i> 1577-1234
		</strong>

	</div>
    
    <hr>

	<h5>
		<strong>자주 묻는 질문(FAQ)</strong>  
		<c:if test="${ !empty loginMember && (loginMember.userId == qnaboard.userId || loginMember.userRole == 'ROLE_ADMIN')}">
	    </c:if>
	</h5>
	

<div class="row">
		<div class="col">
			<ul class="nav nav-tabs">
				<!--  <li class="nav-item1"><a class="nav-link active"
					data-toggle="tab" href="#qwe">전체보기</a></li>-->
				<li class="nav-item1"><a class="nav-link active" data-toggle="tab" 
					href="#asd">예매/취소</a></li>
				<li class="nav-item1"><a class="nav-link" data-toggle="tab"
					href="#zxc">결제</a></li>
				<li class="nav-item1"><a class="nav-link" data-toggle="tab"
					href="#dfg">회원</a></li>
				<li class="nav-item1"><a class="nav-link" data-toggle="tab"
					href="#hjk">메이트/소모임</a></li>
			</ul>

  
			<div class="tab-content">
<!--					<div class="tab-pane fade show active" id="qwe">
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
-->

				<div class="tab-pane fade show active" id="asd">
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
									<td><a href="#" style = color:black;>티켓환불은 어떻게 받나요?</a></td>
								</tr>
								<tr>
									<td>예매/취소</td>
									<td><a href="#" style = color:black;>예매 취소 하고 싶어요!</a></td>
								</tr>
								<tr>
									<td>예매/취소</td>
									<td><a href="#" style = color:black;>취소 수수료는 얼마인가요?</a></td>
								</tr>
								<tr>
									<td>예매/취소</td>
									<td><a href="#" style = color:black;>예매 수수료는 얼마인가요?</a></td>
								</tr>
								<tr>
									<td>예매/취소</td>
									<td><a href="#" style = color:black;>예매 티켓은 어떻게 받나요?</a></td>
								</tr>
								<tr>
									<td>예매/취소</td>
									<td><a href="#" style = color:black;>예매 후 부분 취소가 가능한가요?</a></td>
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
									<td><a href="#" style = color:black;>신용카드 결제 시 공인인증서가 꼭 필요한가요?</a></td>
								</tr>
								<tr>
									<td>결제</td>
									<td><a href="#" style = color:black;>공연 예매 시 할인 받을 수 있는 신용카드는 무엇이있나요?</a></td>
								</tr>
								<tr>
									<td>결제</td>
									<td><a href="#" style = color:black;>예매 시 결제 수단에는 어떤 것들이 있나요?</a></td>
								</tr>
								<tr>
									<td>결제</td>
									<td><a href="#" style = color:black;>다른 사람 명의의 신용카드나 휴대폰을 이용하고 있는데 등록가능한가요?</a></td>
								</tr>
								<tr>
									<td>결제</td>
									<td><a href="#" style = color:black;>등급에 따른 예매 할인에 대해 알려주세요!</a></td>
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
									<td><a href="#" style = color:black;>회원가입 후 로그인이 안되는데 어떻게 하나요?</a></td>
								</tr>
								<tr>
									<td>회원</td>
									<td><a href="#" style = color:black;>이메일 인증은 어떻게 하나요?</a></td>
								</tr>
								<tr>
									<td>회원</td>
									<td><a href="#" style = color:black;>회원 탈퇴는 어떻게 하나요?</a></td>
								</tr>
								<tr>
									<td>회원</td>
									<td><a href="#" style = color:black;>아이디, 비밀번호 찾기는 어떻게 하나요?</a></td>
								</tr>
								<tr>
									<td>회원</td>
									<td><a href="#" style = color:black;>회원 등급 조회를 하고 싶어요!</a></td>
								</tr>
								<tr>
									<td>회원</td>
									<td><a href="#" style = color:black;>이메일 주소를 잘못 입력했어요!</a></td>
								</tr>
								<tr>
									<td>회원</td>
									<td><a href="#" style = color:black;>외국인도 회원 가입이 가능한가요?</a></td>
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
									<td><a href="#" style = color:black;>메이트/소모임에 글을 올리고 싶은데 어떻게 하나요?</a></td>
								</tr>
								<tr>
									<td>메이트/소모임</td>
									<td><a href="#" style = color:black;>티켓 나눔글을 올리고 싶어요!!</a></td>
								</tr>
								<tr>
									<td>메이트/소모임</td>
									<td><a href="#" style = color:black;>메이트 게시판에는 어떤 글을 올려야 하나요?</a></td>
								</tr>
								<tr>
									<td>메이트/소모임</td>
									<td><a href="#" style = color:black;>메이트/소모임은 어떤 게시판인가요?</a></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				
		  <div  class="page_wrap">
		    <div  class="page_nation">
		    
                <!-- 맨 처음으로 -->
			<a class="arrow pprev">&lt;&lt;</a>
			
			<!-- 이전 페이지로 -->
			<a class="arrow prev" >&lt;</a>

			<!--  10개 페이지 목록 -->
					<a class="active">1</a>

			<a class="arrow next">&gt;</a>
			
			<!-- 맨 끝으로 -->
			<a class="arrow nnext">&gt;&gt;</a>
			</div>
		  </div>
		  
		  
			</div>
			

		</div>

	</div>
</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>