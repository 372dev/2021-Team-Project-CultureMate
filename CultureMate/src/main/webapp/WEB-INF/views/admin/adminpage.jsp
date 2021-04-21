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
              <thead>
                <tr> 
                  <th> 검색어 </th> 
                  <td> <input type="text" value="검색"/> </td>
                </tr> 
              </thead>
              <tbody> 
                <tr> 
                  <th> 회원등급 </th> 
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
              <th>이름</th>
              <th>이메일</th>
              <th>등급</th>
              <th>상태</th>
              <th>수정/삭제</th>
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
              <button>수정</button>
              <button type="submit" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal"
                       onclick="deleteMember()">
              탈퇴
              </button>
             </td>
           </tr>
           </c:forEach>
         </tbody>
      </table>
  </div>
<script>
function deleteMember() {
	if (confirm("정말로 회원님을 삭제 하시겠습니까?")) {
		location.replace('${path}/admin/delMember?userId=${member.userId}');
	}
}
</script>



<%@ include file="/WEB-INF/views/common/footer.jsp"%>