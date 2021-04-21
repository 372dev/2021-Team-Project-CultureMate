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
          <th>이름</th>
          <th>공연명</th>
          <th>예약상태</th>
          <th>수정/삭제</th>
      </tr>
     </thead>
     <tbody>
         <td>
             <a href="#">ID</a>
         </td>
         <td>
          홍길동
         </td>
         <td>
          <a href="#">위키드</a>
         </td>
         <td>
          예약완료
         </td>
         <td>
          <button>예약취소</button>
         </td>
     </tbody>
  </table>
</div>






<%@ include file="/WEB-INF/views/common/footer.jsp"%>