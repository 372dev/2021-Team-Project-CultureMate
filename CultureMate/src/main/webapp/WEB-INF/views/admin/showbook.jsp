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
          <thead>
            <tr> 
              <th> 검색어 </th> 
              <td> <input type="text" value="검색"/> </td>
            </tr> 
          </thead>
          <tbody> 
            <tr> 
              <th> 예약상태 </th> 
              <td><input drop value="드롭다운"/> </td>
            </tr> 
              </tbody> 
              </table> 
              <button>검색</button>
      </div>

      


<div class="table-responsive">
  <table class="table table-hover" >
     <thead>
      <tr>
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
             <a href="#">
                <c:out value="${ticket.user_id}"/>
             </a>
         </td>
         <td>
          <c:out value="${ticket.ticket_date}"/>
         </td>
          <td>
          <c:out value="${ticket.prfnm}"/>
         </td>
         <td>
          <a href="#">
           <c:out value="${ticket.ticket_qty}"/>
          </a>
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
			 <input name="ticket_num" value="${ ticket.ticket_num }">
			 <button type="submit" class="btn btn-light">취소하기</button>
		  </form>
          </td>
         <tr>
        </c:forEach>
     </tbody>
  </table>
</div>






<%@ include file="/WEB-INF/views/common/footer.jsp"%>