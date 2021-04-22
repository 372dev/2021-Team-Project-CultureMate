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
              <th>문의</th>
              <th>제목</th>
              <th>작성자</th>
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
              <c:out value="${qnalist.userId}"/>
             </td>
             </tr>
          </c:forEach>
         </c:if>
      </table>
    </div>
    
    <div id="pageBar">
			<!-- 맨 처음으로 -->
			<button onclick="location.href='${path}/help/qnalist?page=1'">&lt;&lt;</button>
			
			<!-- 이전 페이지로 -->
			<button onclick="location.href='${path}/help/qnalist?page=${pageInfo.prvePage}'">&lt;</button>

			<!--  10개 페이지 목록 -->
			<c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}" step="1" varStatus="status">
				<c:if test="${status.current == pageInfo.currentPage}">
					<button disabled><c:out value="${status.current}"/></button>
   				</c:if>
				<c:if test="${status.current != pageInfo.currentPage}">
					<button onclick="location.href='${path}/help/qnalist?page=${status.current}'"><c:out value="${status.current}"/></button>
   				</c:if>
			</c:forEach>
			
			<!-- 다음 페이지로 -->
			<button onclick="location.href='${path}/help/qnalist?page=${pageInfo.nextPage}'">&gt;</button>
			
			<!-- 맨 끝으로 -->
			<button onclick="location.href='${path}/help/qnalist?page=${pageInfo.maxPage}'">&gt;&gt;</button>
		</div>

 </div>  
 

<%@ include file="/WEB-INF/views/common/footer.jsp"%>















