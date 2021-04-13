<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/help/csmain.jsp"%>
<link rel="stylesheet" href="${path}/resources/css/cscenter.css">





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
	<strong>자주 묻는 질문 TOP5</strong>
</h5>
<div class="table-responsive">
	<table class="table table-hover">
		<thead>
			<tr>
				<th>번호</th>
				<th>분류</th>
				<th>제목</th>
			</tr>
		</thead>
		<tbody>
			<td>내용</td>
			<td>내용</td>
			<td>내용</td>
		</tbody>
	</table>
</div>

<h5>
	<strong>FAQ</strong>
</h5>
	<div class="row">
		<div class="col">
			<ul class="nav nav-tabs">
				<li class="nav-item1"><a class="nav-link active"
					data-toggle="tab" href="#qwe">전체보기</a></li>
				<li class="nav-item1"><a class="nav-link" data-toggle="tab"
					href="#asd">환불</a></li>
				<li class="nav-item1"><a class="nav-link" data-toggle="tab"
					href="#zxc">구매/결제</a></li>
				<li class="nav-item1"><a class="nav-link" data-toggle="tab"
					href="#dfg">메이트/소모임</a></li>
				<li class="nav-item1"><a class="nav-link" data-toggle="tab"
					href="#hjk">기타</a></li>
			</ul>

			<div class="tab-content">
				<div class="tab-pane fade show active" id="qwe">
					<div class="table-responsive">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>번호</th>
									<th>분류</th>
									<th>제목</th>
								</tr>
							</thead>
							<tbody>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
							</tbody>
						</table>
					</div>
				</div>

				<div class="tab-pane fade" id="asd">
					<div class="table-responsive">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>번호</th>
									<th>분류</th>
									<th>제목</th>
								</tr>
							</thead>
							<tbody>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
							</tbody>
						</table>
					</div>
				</div>

				<div class="tab-pane fade" id="zxc">
					<div class="table-responsive">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>번호</th>
									<th>분류</th>
									<th>제목</th>
								</tr>
							</thead>
							<tbody>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
							</tbody>
						</table>
					</div>
				</div>

				<div class="tab-pane fade" id="dfg">
					<div class="table-responsive">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>번호</th>
									<th>분류</th>
									<th>제목</th>
								</tr>
							</thead>
							<tbody>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
							</tbody>
						</table>
					</div>
				</div>

				<div class="tab-pane fade" id="hjk">
					<div class="table-responsive">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>번호</th>
									<th>분류</th>
									<th>제목</th>
								</tr>
							</thead>
							<tbody>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
							</tbody>
						</table>
					</div>
				</div>

			</div>

		</div>
	</div>
</div>
</div>
    </div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>


