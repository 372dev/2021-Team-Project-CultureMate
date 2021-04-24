<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ include file="/WEB-INF/views/common/header.jsp"%>

<style>
h1{
    border:1px solid #6C757D;
	line-height: 70px;
	font-size: 25px;
	border-radius: 5px;

}
 .nav-item {
	display: inline-block;
	inline-size: 30%;
	border:1px solid #EDEDED;
	border-radius: 5px;

}

.box{
          margin-top: 30px;
        }
        
  #searchBtn{
 background-color: #6C757D;
 
 }
 .table-responsive{
    margin-top:30px;
 }
 
 .btn-danger{
   background-color: #FF8C00;
   border-color:  #FF8C00;
   color: black;
 }
 .btn-danger:hover,
 
 .btn-danger:focus{
   border-color: #FF8C00;
    background-color: #FF8C00;
    color: White;
 }
 
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

       <h1>관리자페이지</h1>

       
        <ul class="nav nav-pills nav-fill">
          <li class="nav-item">
          <a class="nav-link active" style="background-color: #9DB81F;" href="${path}/admin/adminpage">회원조회</a>
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
		    <select name="search" style="border-radius: 5px; width:100px;height:30px;">
            	<option value="userId" ${pageInfo.search eq 'userId'? 'selected' : '' }>
            		아이디</option>
            	<option value="userName" ${pageInfo.search eq 'userName'? 'selected' : '' }>
            		이름</option>
            	<option value="email" ${pageInfo.search eq 'email'? 'selected' : '' }>
            		이메일</option>
	 		</select> 
	 		 <input type="text" name="keyword" placeholder="입력" value="${pageInfo.keyword }" style="border-radius: 5px; width:200px;height:30px;"> 
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
              <th>회원탈퇴</th>
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
  
   <div id="pageBar" class="page_wrap">
       <div class="page_nation">
			<!-- 맨 처음으로 -->
			<a onclick="location.href='${path}/admin/adminpage?page=1'"  class="arrow pprev">&lt;&lt;</a>
			
			<!-- 이전 페이지로 -->
			<a onclick="location.href='${path}/admin/adminpage?page=${pageInfo.prvePage}'" class="arrow prev">&lt;</a>

			<!--  10개 페이지 목록 -->
			<c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}" step="1" varStatus="status">
				<c:if test="${status.current == pageInfo.currentPage}">
					<a disabled class="active"><c:out value="${status.current}"/></a>
   				</c:if>
				<c:if test="${status.current != pageInfo.currentPage}">
					<a onclick="location.href='${path}/admin/adminpage?page=${status.current}'" class="active"><c:out value="${status.current}"/></a>
   				</c:if>
			</c:forEach>
			
			<!-- 다음 페이지로 -->
			<a onclick="location.href='${path}/admin/adminpage?page=${pageInfo.nextPage}'" class="arrow next">&gt;</a>
			
			<!-- 맨 끝으로 -->
			<a onclick="location.href='${path}/admin/adminpage?page=${pageInfo.maxPage}'"  class="arrow nnext">&gt;&gt;</a>
		</div>
	</div> 
  
<%@ include file="/WEB-INF/views/common/footer.jsp"%>