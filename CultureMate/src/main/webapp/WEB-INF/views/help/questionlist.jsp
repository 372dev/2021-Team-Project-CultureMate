<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<link rel="stylesheet" href="${path}/resources/css/cscenter.css">

<div class="col">
	<p>고객센터</p>
	<ul class="nav nav-pills">
		<li class="nav-item"><a class="nav-link active" 
			href="${path}/help/csmain">자주묻는질문 & FAQ</a></li>
		<li class="nav-item"><a class="nav-link"
			href="${path}/help/notice ">공지사항</a></li>
		<li class="nav-item"><a class="nav-link"
			href="${path}/help/questionlist">1:1문의</a></li>
	</ul>

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

    

<%@ include file="/WEB-INF/views/common/footer.jsp"%>















