<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<link rel="stylesheet" href="${path}/resources/css/cscenter.css">

<p>고객센터</p>
	<ul class="nav nav-pills">
		<li class="nav-item"><a class="nav-link active" 
			href="${path}/help/csmain">자주묻는질문 & FAQ</a></li>
		<li class="nav-item"><a class="nav-link"
			href="${path}/help/notice ">공지사항</a></li>
		<li class="nav-item"><a class="nav-link"
			href="${path}/help/questionlist">1:1문의</a></li>
	</ul>

      <h3>공지사항</h3>

      
    <hr>
             <div class="tab-content">
              <div class="tab-pane fade show active" id="qwe">
                <div class="table-responsive">
                  <table class="table table-hover" >
                     <thead>
                      <tr>
                          <th>분류</th>
                          <th>제목</th>
                           <th>조회수</th>
                      </tr>
                     </thead>
                     <tbody>
                         <td>
                             내용
                         </td>
                         <td>
                          <a href="#">오픈티켓</a>
                         </td>
                         <td>
                          내용
                         </td>
                     </tbody>
                  </table>
              </div>
            </div>




<%@ include file="/WEB-INF/views/common/footer.jsp"%>