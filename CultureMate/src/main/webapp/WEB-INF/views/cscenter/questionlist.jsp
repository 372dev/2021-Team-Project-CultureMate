<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/cscenter/csmain.jsp"%>
<link rel="stylesheet" href="${path}/resources/css/cscenter.css">

   <div class="container3">
      <h5>나의 문의내역</h5>

      <nav>
        <ul>
          <li><a href="${path}/cscenter/questionlist">문의내역</a></li>
          <li><a href="${path}/cscenter/qnacontent">문의하기</a></li>
      
        </ul>
      </nav>

    <hr>

    <div class="table-responsive qnalist">
      <table class="table table-hover qnalist" >
         <thead>
          <tr>
              <th>번호</th>
              <th>제목</th>
               <th>답변상태</th>
          </tr>
         </thead>
         <tbody>
             <td>
                 1
             </td>
             <td>
              <a href="#">문의합니다.</a>
             </td>
             <td>
              내용
             </td>
         </tbody>
      </table>
    </div>
   </div>
    

















