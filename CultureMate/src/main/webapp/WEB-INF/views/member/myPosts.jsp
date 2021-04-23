<%@ page import="com.kh.cm.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<style>
	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap');
	
	.list-group-item.active{
		background-color: #9DB81F;
		border-color: #9DB81F;
	}
    #postList-tbl{           
        border-collapse: collapse;	   
	    text-align: center;       
        margin: 0 auto;
        width: 800px;
    }
    #postList-tr{
    	height: 30px;
   		border-bottom: 1px solid lightgray;
     	border-top: 1px solid lightgray;
    }
    #postList-tr>td:nth-child(8){
    	width: 300px;
    }
    #postList-tr>td:nth-child(3){
    	width: 130px;
    }
    #postList-tr>td:nth-child(4){
    	width: 150px;
    }
    #postList-tr>td:nth-child(6){
    	width: 130px;
    }
    #postList-tr>td:nth-child(10){
    	width: 200px;
    }
    #postList-tr>td{
    	padding: 6px;
    	width:80px;
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
		<div class="col-md-3 ">
			<div class="list-group ">
              <a href="${ path }/member/myPage" class="list-group-item list-group-item-action">회원정보 수정</a>
              <a href="${ path }/member/updatePwd" class="list-group-item list-group-item-action">비밀번호 변경</a>
			  <a href="${ path }/member/ticket" class="list-group-item list-group-item-action">예매내역</a>
              <a href="${ path }/member/myPosts" class="list-group-item list-group-item-action active">내가 쓴 글 조회</a>
              <a href="${ path }/member/myReviews" class="list-group-item list-group-item-action">내가 쓴 리뷰 조회</a>
			</div>
		</div>
		<div class="col-md-9">
			<div class="card">
				<div class="card-body">
					<div class="row">
						<div class="col-md-12">
							<h4 id="title">내가 쓴 글 조회</h4>
							<hr>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<table id="postList-tbl">
								<tr id="postList-tr">
									<th>모집상태</th>			
									<th>제목</th>
									<th>작성일</th>
								</tr>
					            <c:if test="${postList == null}">
									<tr id="postList-tr">
										<td colspan="5">
											조회된 게시글이 없습니다.
										</td>
									</tr>	
								</c:if>
								<c:if test="${postList != null}">
									<c:forEach var="post" items="${postList}">
										<tr id="postList-tr">
					                        <td><c:out value="${post.mateOpen}"/></td>
											<td>
												<c:if test="${fn:contains(post.mateOpen, '모집')}">
													<a href="${path}/mate/view?mateId=${post.mateId}">
														<c:out value="${post.mateTitle}"/>
													</a>
												</c:if>
												<c:if test="${fn:contains(post.mateOpen, '나눔')}">
													<a href="${path}/share/view?shareId=${post.mateId}">
														<c:out value="${post.mateTitle}"/>
													</a>
												</c:if>
											</td>
											<td><fmt:formatDate value="${post.mateCreateDate}" pattern="yy/MM/dd HH:mm:ss"></fmt:formatDate></td>                     
				                       	</tr>
			                        </c:forEach>
		                    	</c:if>  
		                	 </table>
							<br>
						</div>
					</div>
					<nav aria-label="Page navigation example">
					  <ul class="pagination">
					    <li class="page-item">
					      <a class="page-link" href="${path}/member/myPosts?page=1" aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span>
					      </a>
					    </li>
					    <c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}" step="1" varStatus="status">
								<c:if test="${status.current == pageInfo.currentPage}">
									<li class="page-item"><a class="page-link" href='${path}/member/myPosts?page=${status.current}'><c:out value="${status.current}"/></a></li>
				   				</c:if>
								<c:if test="${status.current != pageInfo.currentPage}">
									<li class="page-item"><a class="page-link" href='${path}/member/myPosts?page=${status.current}'><c:out value="${status.current}"/></a></li>
				   				</c:if>
						</c:forEach>
					    <li class="page-item">
					      <a class="page-link" href="${path}/member/myPosts?page=${pageInfo.nextPage}" aria-label="Next">
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
		

<%@ include file="/WEB-INF/views/common/footer.jsp"%>