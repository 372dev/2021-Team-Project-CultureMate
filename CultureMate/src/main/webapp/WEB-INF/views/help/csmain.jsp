<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<link rel="stylesheet" href="${path}/resources/css/cscenter.css">

<div class="col">
	<p>고객센터</p>
	<form>
	<ul class="nav nav-pills">
		<li class="nav-item"><a class="nav-link active" 
			href="${path}/help/csmain">자주묻는질문(FAQ)</a></li>
		<li class="nav-item"><a class="nav-link"
			href="${path}/help/notice ">공지사항</a></li>
		<li class="nav-item"><a class="nav-link"
			href="${path}/help/qnalist">1:1문의</a></li>
	</ul>


	<div class="notice">

		<strong>궁금한 내용은 1:1문의를 이용해 주세요.<br> 매주평일오전 9시~ 6시 (공휴일
			제외)<br> 02-1111-2222
		</strong>

	</div>

	<div class="search">
		<input type="text" class="text_ser">
		<button type="submit">검색</button>
	</div>

	<hr>

	<h5>
		<strong>자주 묻는 질문(FAQ)</strong>  
		<button type="button" onclick="location.href ='${path}/help/cswrite'">글쓰기</button>
	</h5>
	<div class="row">
		<div class="col">
			<ul class="nav nav-tabs">
				<li class="nav-item1">
				<a class="nav-link active" data-toggle="tab" href="#qwe">전체보기</a>
				</li>
				<li class="nav-item1">
				<a class="nav-link" data-toggle="tab" href="#asd" >환불</a>
				</li>
				<li class="nav-item1">
				<a class="nav-link" data-toggle="tab" href="#zxc">구매/결제</a>
				</li>
				<li class="nav-item1">
				<a class="nav-link" data-toggle="tab" href="#dfg">메이트/소모임</a>
				</li>
				<li class="nav-item1">
				<a class="nav-link" data-toggle="tab" href="#hjk">기타</a>
				</li>
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
							      <c:forEach var="csboard" items="${csmain} ">
                                <tr>
								   <td><c:out value="${csboard.csboardType}"/></td>
								   <td>
								   <a href="${path}/help/faqview?csboardId=${csboard.csboardId}">
								   <c:out value="${csboard.csboardTitle}"/>
								   </a>
								   </td>
                                </tr>
							</c:forEach>
							</c:if>
						</table>
						
						<div id="pageBar">
						<!-- 맨 처음으로 -->
						<button onclick="location.href='${path}/help/csmain?page=1'">&lt;&lt;</button>
						
						<!-- 이전 페이지로 -->
						<button onclick="location.href='${path}/help/csmain?page=${pageInfo.prvePage}'">&lt;</button>
			
						<!--  10개 페이지 목록 -->
						<c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}" step="1" varStatus="status">
							<c:if test="${status.current == pageInfo.currentPage}">
								<button disabled><c:out value="${status.current}"/></button>
			   				</c:if>
							<c:if test="${status.current != pageInfo.currentPage}">
								<button onclick="location.href='${path}/help/csmain?page=${status.current}'"><c:out value="${status.current}"/></button>
			   				</c:if>
						</c:forEach>
						
						<!-- 다음 페이지로 -->
						<button onclick="location.href='${path}/help/csmain?page=${pageInfo.nextPage}'">&gt;</button>
						
						<!-- 맨 끝으로 -->
						<button onclick="location.href='${path}/help/csmain?page=${pageInfo.maxPage}'">&gt;&gt;</button>
					</div>
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
								<td>내용</td>
								<td><a href="#">내용</a></td>
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
								<td>내용</td>
								<td><a href="#">내용</a></td>
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
								<td>내용</td>
								<td><a href="#">내용</a></td>
							   </tr>	
							</thead>
							<tbody>
							   <tr>
								<td>내용</td>
								<td><a href="#">내용</a></td>
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
								<td>내용</td>
								<td><a href="#">내용</a></td>
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