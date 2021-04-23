<%@ page import="com.kh.cm.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<style>
	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap');
	
	.list-group-item.active{
		background-color: #9DB81F;
		border-color: #9DB81F;
	}

	#ticket_list > thead > tr > th{
		font-size: 18px;
		font-family: 'Noto Sans KR', sans-serif;
		font-weight: 400;
		text-align: center;
	}

	#ticket_list td{
		text-align: center;
		padding: 10px;
	}

	#ticket_list th{
		text-align: center;
		padding: 10px;
	}
	
	#ticket_list{
		border-collapse: collapse;
		width: 800px;
		position: relative;
	}

	#ticket_list .list{
		height: 40px;
		line-height: 40px;
	}

	#ticket_list .top{
		height: 40px;
		line-height: 40px;
	}

	#ticket_list .top01{
		width: 90px;
	}

	#ticket_list .list01{
		width: 90px;
	}

	#ticket_list .top02{
		width: 150px;
	}

	#ticket_list .list02{
		width: 150px;
	}

	#ticket_list .top03{
		width: 110px;
	}

	#ticket_list .list03{
		width: 110px;
	}

	#ticket_list .top04{
		width: 75px;
	}

	#ticket_list .list04{
		width: 75px;
	}

	#ticket_list .list05{
		width: 105px;
	}
	
	#ticket_list .top05{
		width: 105px;
	}

	#ticket_list .list06{
		width: 95px;
	}
	
	#ticket_list .top06{
		width: 95px;
	}

	#ticket_list .list07{
		width: 95px;
	}
	
	#ticket_list .top07{
		width: 95px;
	}

	#ticket_list form{
		width: 100%;
		height: 100%;
	}

	#ticket_list form input{
		display: none;
	}
	
	#title{
		font-family: 'Noto Sans KR', sans-serif;
	}
	
	.pagination{
		justify-content: center;
	}
</style>

<div class="container">
	<div class="row">
		<div class="col-md-3">
		     <div class="list-group ">
              <a href="${ path }/member/myPage" class="list-group-item list-group-item-action">회원정보 수정</a>
              <a href="${ path }/member/updatePwd" class="list-group-item list-group-item-action">비밀번호 변경</a>
			  <a href="${ path }/member/ticket" class="list-group-item list-group-item-action active">예매내역</a>
              <a href="${ path }/member/myPosts" class="list-group-item list-group-item-action">내가 쓴 글 조회</a>
              <a href="${ path }/member/myReviews" class="list-group-item list-group-item-action">내가 쓴 리뷰 조회</a>
			</div> 
		</div>
		<div class="col-md-9">
			<div class="card">
				<div class="card-body">
					<div class="row">
						<div class="col-md-12">
							<h4 id="title">예매내역</h4>
							<hr>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<table id="ticket_list" class="table">
								<thead>
									<tr>
										<th class="top01 top" scope="col">예매번호</th>
										<th class="top02 top" scope="col">공연명</th>
										<th class="top03 top" scope="col">공연날짜</th>
										<th class="top04 top" scope="col">인원수</th>
										<th class="top05 top" scope="col">티켓가격</th>
										<th class="top06 top" scope="col">좌석번호</th>
										<th class="top07 top"></th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${list == '[]'}">
										<tr>
											<td colspan="7">
												예매한 티켓이 없습니다.
											</td>
										</tr>	
									</c:if>
									<c:if test="${list != null}">
										<c:forEach var="ticket" items="${ list }">
											<tr>
												<td class="list01 list"><c:out value="${ ticket.ticket_num }"/></td>
												<td class="list02 list"><c:out value="${ ticket.prfnm }"/></td>
												<td class="list03 list"><c:out value="${ ticket.ticket_date }"/></td>
												<td class="list04 list"><c:out value="${ ticket.ticket_qty }"/></td>
												<td class="list05 list"><c:out value="${ ticket.pcseguidance }"/></td>
												<td class="list06 list"><c:out value="${ ticket.ticket_seat }"/></td>
												<td class="list07 list">
													<form action="${path}/member/ticket/cancel" method="post" onsubmit="return confirm('정말 취소하시겠습니까?');">
														<input type="text" name="ticket_num" value="${ ticket.ticket_num }">
														<input type="hidden" name="ticket_mt20id" value="${ ticket.mt20id }">
														<input type="hidden" name="ticket_id" value="${ ticket.id }">
														<button type="submit" class="btn btn-light">취소하기</button>
													</form>
												</td>
											</tr>
										</c:forEach>
									</c:if>
								</tbody>
							</table>
						</div>
					</div>
					<nav aria-label="Page navigation example">
					  <ul class="pagination">
					    <li class="page-item">
					      <a class="page-link" href="${path}/member/ticket?page=1" aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span>
					      </a>
					    </li>
					    <c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}" step="1" varStatus="status">
								<c:if test="${status.current == pageInfo.currentPage}">
									<li class="page-item"><a class="page-link" href='${path}/member/ticket?page=${status.current}'><c:out value="${status.current}"/></a></li>
				   				</c:if>
								<c:if test="${status.current != pageInfo.currentPage}">
									<li class="page-item"><a class="page-link" href='${path}/member/ticket?page=${status.current}'><c:out value="${status.current}"/></a></li>
				   				</c:if>
						</c:forEach>
					    <li class="page-item">
					      <a class="page-link" href="${path}/member/ticket?page=${pageInfo.nextPage}" aria-label="Next">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
					    </li>
					  </ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
</div>

<script>

	function before() {
		if(confirm("정말 취소하시겠습니까?") == true){
			this.submit();
		} else{
			return false;
		}
	}


</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>








































