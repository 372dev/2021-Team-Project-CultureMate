<%@page import="com.kh.cm.qna.model.vo.QnaBoard"%>
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
			href="${path}/help/qnalist">1:1문의</a></li>
	</ul>
      <h5>나의 문의내역</h5>
      
      <nav>
        <ul>
          <li><a href="${path}/help/qnalist">문의내역</a></li>
          <li><a href="${path}/help/qnacontent">문의하기</a></li>
        </ul>
      </nav>

    <hr>

    <div class="table-responsive qnalist">
      <table class="table table-hover qnalist" >
          <tr>
              <th>분류</th>
              <th>제목</th>
              <th>답변상태</th>
          </tr>
         <c:if test="${qnalist == null}">
				<tr>
					<td colspan="6">
						조회된 게시글이 없습니다.
					</td>
				</tr>	
			</c:if>
			<c:if test="${qnalist != null}">
			  <c:forEach var="qnalist" items="${qnalist}">
          <tr>
             <td>
             <c:out value="${qnalist.qnaType}"/>
             </td>
             <td>
              <a href="${path}/help/qnaview?qnaId=${qnalist.qnaId}">
              <c:out value="${qnalist.qnaTitle}"/>
              </a>
             </td>
             <td>
              내용
             </td>
             </tr>
          </c:forEach>
         </c:if>
      </table>
    </div>

 </div>  
 

<%@ include file="/WEB-INF/views/common/footer.jsp"%>















