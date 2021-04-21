<%@ page import="com.kh.cm.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<style>
	.list-group-item.active{
		background-color: #b7ba41;
		border-color: #b7ba41;
	}
    #postList-tbl{           
        border-collapse: collapse;	   
	    text-align: center;       
        margin: 0 auto;
        width: 800px;
    }
    #postList-tr{
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
</style>
<div class="container">
	<div class="row">
		<div class="col-md-3 ">
			<div class="list-group ">
              <a href="${ path }/member/myPage" class="list-group-item list-group-item-action">회원정보 수정</a>
              <a href="${ path }/member/updatePwd" class="list-group-item list-group-item-action">비밀번호 변경</a>
			  <a href="${ path }/myPage/ticket" class="list-group-item list-group-item-action">예매내역</a>
              <a href="${ path }/member/myPosts" class="list-group-item list-group-item-action active">내가 쓴 글 조회</a>
              <a href="${ path }/member/myReviews" class="list-group-item list-group-item-action">내가 쓴 리뷰 조회</a>
			</div>
		</div>
		<div class="col-md-9">
			<div class="card">
				<div class="card-body">
					<div class="row">
						<div class="col-md-12">
							<h4>내가 쓴 글 조회</h4>
							<hr>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<table id="postList-tbl">
								<tr id="postList-tr">
									<td>모집상태</td>			
									<td>제목</td>
									<td>작성일</td>
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
						<div id="pageBar">
							<!-- 맨 처음으로 -->
							<button onclick="location.href='${path}/member/myPosts?page=1'">&lt;&lt;</button>
							
							<!-- 이전 페이지로 -->
							<button onclick="location.href='${path}/member/myPosts?page=${pageInfo.prvePage}'">&lt;</button>
				
							<!--  10개 페이지 목록 -->
							<c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}" step="1" varStatus="status">
								<c:if test="${status.current == pageInfo.currentPage}">
									<button disabled><c:out value="${status.current}"/></button>
				   				</c:if>
								<c:if test="${status.current != pageInfo.currentPage}">
									<button onclick="location.href='${path}/member/myPosts?page=${status.current}'"><c:out value="${status.current}"/></button>
				   				</c:if>
							</c:forEach>
							
							<!-- 다음 페이지로 -->
							<button onclick="location.href='${path}/member/myPosts?page=${pageInfo.nextPage}'">&gt;</button>
							
							<!-- 맨 끝으로 -->
							<button onclick="location.href='${path}/member/myPosts?page=${pageInfo.maxPage}'">&gt;&gt;</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
		

<%@ include file="/WEB-INF/views/common/footer.jsp"%>