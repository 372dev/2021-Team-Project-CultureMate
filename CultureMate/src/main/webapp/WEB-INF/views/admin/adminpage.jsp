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
          <a class="nav-link active" href="${path}/admin/adminpage">회원조회</a>
          </li>
          <li class="nav-item">
          <a class="nav-link" href="${path}/admin/showbook">공연에약관리</a>
          </li>
          <li class="nav-item">
          <a class="nav-link" href="${path}/admin/adminpage2">통계관리</a>
          </li>
          </ul>

          <div class="box"> 
            <table   class = "membertable" border="1" > 
                <tr> 
         <div id="showSearch">
	     <form name="form1" method="post" action="${path}/admin/list.do">
		    <select name="search">
            	<option value="userId" ${pageInfo.search eq 'userId'? 'selected' : '' }>
            		아이디</option>
            	<option value="userName" ${pageInfo.search eq 'userName'? 'selected' : '' }>
            		이름</option>
            	<option value="email" ${pageInfo.search eq 'email'? 'selected' : '' }>
            		이메일</option>
	 		</select> 
	 		 <input type="text" name="keyword" placeholder="입력" value="${pageInfo.keyword }">
		     <input class="searchBtn" id="searchBtn" type="submit" onclick="$('form1').submit()" value="검색"></input>      
	      </form>     
	    </div>	 
		 </tr> 
        </table> 
       </div>

          


    <div class="table-responsive">
      <table class="table table-hover" >
         <thead>
          <tr>
              <th>회원ID</th>
              <th>이름</th>
              <th>이메일</th>
              <th>등급</th>
              <th>상태</th>
              <th>회원탈퇴/삭제</th>
          </tr>
         </thead>
         <tbody>
          <c:forEach var="member" items="${memlist}">
           <tr>
             <td>
                 <a href="${path}/admin/memupdate?userId=${member.userId}">
                 <c:out value="${member.userId}"/>
                 </a>
             </td>
             <td>
              <c:out value="${member.userName}"/>
             </td>
             <td>
             <c:out value="${member.email}"/>
             </td>
             <td>
              <c:out value="${member.rank}"/>
             </td>
             <td>
              <c:out value="${member.status}"/>
             </td>
             <td>
             <form action="${path}/admin/delteMemebr" method="post" onsubmit="return confirm('${ member.userId }님을 탈퇴처리하겠습니까?');">
			 <input type="hidden" name="userId" value="${ member.userId }">
			 <button type="submit" class="btn btn-danger">탈퇴</button>
		    </form>
             </td>
           </tr>
           </c:forEach>
         </tbody>
      </table>
  </div>
  
   <div id="pageBar">
			<!-- 맨 처음으로 -->
			<button onclick="location.href='${path}/admin/adminpage?page=1'">&lt;&lt;</button>
			
			<!-- 이전 페이지로 -->
			<button onclick="location.href='${path}/admin/adminpage?page=${pageInfo.prvePage}'">&lt;</button>

			<!--  10개 페이지 목록 -->
			<c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}" step="1" varStatus="status">
				<c:if test="${status.current == pageInfo.currentPage}">
					<button disabled><c:out value="${status.current}"/></button>
   				</c:if>
				<c:if test="${status.current != pageInfo.currentPage}">
					<button onclick="location.href='${path}/admin/adminpage?page=${status.current}'"><c:out value="${status.current}"/></button>
   				</c:if>
			</c:forEach>
			
			<!-- 다음 페이지로 -->
			<button onclick="location.href='${path}/admin/adminpage?page=${pageInfo.nextPage}'">&gt;</button>
			
			<!-- 맨 끝으로 -->
			<button onclick="location.href='${path}/admin/adminpage?page=${pageInfo.maxPage}'">&gt;&gt;</button>
		</div>
  
<%@ include file="/WEB-INF/views/common/footer.jsp"%>