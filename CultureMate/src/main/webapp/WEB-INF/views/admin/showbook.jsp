<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ include file="/WEB-INF/views/common/header.jsp"%>
<style>
  .box{
          margin-top: 30px;
        }
</style> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

       <h1>관리자페이지</h1>

   
    <ul class="nav nav-pills nav-fill">
      <li class="nav-item">
      <a class="nav-link" href="${path}/admin/adminpage">회원조회</a>
      </li>
      <li class="nav-item">
      <a class="nav-link active" href="${path}/admin/showbook">공연예약관리</a>
      </li>
      <li class="nav-item">
      <a class="nav-link" href="${path}/admin/adminpage2">통계관리</a>
      </li>
      </ul>

      <div class="box"> 
        <table   class = "membertable" border="1" > 
            <tr> 
           <div id="memberSearch">
	        <form name="form1" method="post" action="${path}/admin/showList">
		   <select name="search">
            	<option value="prfnm" ${pageInfo.search eq 'prfnm'? 'selected' : '' }>
            		공연명</option>
            	<option value="userId" ${pageInfo.search eq 'userId'? 'selected' : '' }>
            		아이디</option>
	 		</select> 
	 		 <input type="text" name="keyword" placeholder="입력" value="${pageInfo.keyword }">
		     <input class="searchBtn" id="searchBtn" type="submit" onclick="$('form1').submit()" value="검색"></input>      
	       </form>     
            </tr> 
              </table> 
      </div>

      


<div class="table-responsive">
  <table class="table table-hover" >
     <thead>
      <tr>
          <th>예매번호</th>
          <th>회원ID</th>
          <th>공연날짜</th>
          <th>공연명</th>
          <th>인원수</th>
          <th>티켓가격</th>
          <th>좌석번호</th>
          <th>예약상태</th>
          <th>예약관리</th>
      </tr>
     </thead>
     <tbody>
        <c:forEach var="ticket" items="${ticketList}">
         <td>
                <c:out value="${ticket.ticket_num}"/>
         </td>
         <td>
                <c:out value="${ticket.user_id}"/>
         </td>
         <td>
          <c:out value="${ticket.ticket_date}"/>
         </td>
          <td>
          <c:out value="${ticket.prfnm}"/>
         </td>
         <td>
           <c:out value="${ticket.ticket_qty}"/>
         </td>
          <td>
          <c:out value="${ticket.pcseguidance}"/>
         </td>
         <td>
          <c:out value="${ticket.ticket_seat}"/>
         </td>
         <td>
          <c:out value="${ticket.ticket_status}"/>
         </td>
          <td>
          <form action="${path}/admin/ticketcancel" method="post" onsubmit="return confirm('정말 취소하시겠습니까?');">
			 <input type="hidden" name="ticket_num" value="${ ticket.ticket_num }">
			 <button type="submit" class="btn btn-danger">취소하기</button>
		  </form>
          </td>
         <tr>
        </c:forEach>
     </tbody>
  </table>
</div>

<div id="pageBar">
			<!-- 맨 처음으로 -->
			<button onclick="location.href='${path}/admin/showbook?page=1'">&lt;&lt;</button>
			
			<!-- 이전 페이지로 -->
			<button onclick="location.href='${path}/admin/showbook?page=${pageInfo.prvePage}'">&lt;</button>

			<!--  10개 페이지 목록 -->
			<c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}" step="1" varStatus="status">
				<c:if test="${status.current == pageInfo.currentPage}">
					<button disabled><c:out value="${status.current}"/></button>
   				</c:if>
				<c:if test="${status.current != pageInfo.currentPage}">
					<button onclick="location.href='${path}/admin/showbook?page=${status.current}'"><c:out value="${status.current}"/></button>
   				</c:if>
			</c:forEach>
			
			<!-- 다음 페이지로 -->
			<button onclick="location.href='${path}/admin/showbook?page=${pageInfo.nextPage}'">&gt;</button>
			
			<!-- 맨 끝으로 -->
			<button onclick="location.href='${path}/admin/showbook?page=${pageInfo.maxPage}'">&gt;&gt;</button>
		</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>