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
		background-color: #9DB81F;
		border-color: #9DB81F;
	}
</style>

<div class="container">
	<div class="row">
		<div class="col-md-3 ">
			<div class="list-group ">
              <a href="${ path }/member/myPage" class="list-group-item list-group-item-action">회원정보 수정</a>
              <a href="${ path }/member/updatePwd" class="list-group-item list-group-item-action">비밀번호 변경</a>
			  <a href="${ path }/member/ticket" class="list-group-item list-group-item-action">예매내역</a>
              <a href="${ path }/member/myPosts" class="list-group-item list-group-item-action">내가 쓴 글 조회</a>
              <a href="${ path }/member/myReviews" class="list-group-item list-group-item-action active">내가 쓴 리뷰 조회</a>
			</div>
		</div>
		<div class="col-md-9">
			<div class="card">
				<div class="card-body">
					<div class="row">
						<div class="col-md-12">
							<h4>내가 쓴 리뷰 조회</h4>
							<hr>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<table class="table table-hover">
							  <th>번호</th>
							  <th>작성일</th>
							  <th>별점</th>
							  <th>공연 이름</th>
							  <th>리뷰 내용</th>
							  <c:if test="${ review.size() < 1}">
							  	<tr>
							  		<td colspan="3">
							  			조회된 게시글이 없습니다.
							  		</td>
							  	</tr>
							  </c:if>
							   <c:if test="${ review.size() > 1}">
							  <c:forEach var="i" begin="0" end="${review.size()-1}">
							  	<tr>
							  		<td><c:out value="${i}"></c:out></td>
							  		<td>
										<c:out value="${review.get(i).reviewDate.substring(0,10)}"/>
									</td>
									<td>
										<c:forEach var="j" begin="1" end="${review.get(i).reviewRating}" >
										★
										</c:forEach>
									</td>
							  		<td><a href="${path}/show/restview?name=<c:out value="${review.get(i).mt20id}"/>">  <c:out value="${review.get(i).prfnm}"/> </a></td>  
							  		<td><c:out value="${review.get(i).reviewContent}"/> </td>     
							  	</tr>
							  </c:forEach>
							  </c:if>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<%@ include file="/WEB-INF/views/common/footer.jsp"%>