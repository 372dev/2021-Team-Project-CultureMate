<%@page import="com.kh.cm.qna.model.vo.QnaBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<link rel="stylesheet" href="${path}/resources/css/cscenter.css">
<script src="https://kit.fontawesome.com/4d8c9a2b0b.js" crossorigin="anonymous"></script>
<div class="col">
	<p>고객센터</p>
	
	<ul class="nav nav-pills nav-fill">
    <li class="nav-item">
    <a class="nav-link" href="${path}/help/csmain">자주묻는질문(FAQ)</a>
    </li>
    <li class="nav-item">
    <a class="nav-link" href="${path}/help/notice ">공지사항</a>
    </li>
    <li class="nav-item">
    <a class="nav-link active" href="${path}/help/qnalist">Q&A</a>
    </li>
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
              <c:if test="${qnalist.qnaOpenStatus eq 'N'}" >
                <c:choose>
                <c:when test="${qnalist.userId eq loginMember.userId || loginMember.userRole eq 'ROLE_ADMIN'}">
                   <a href="${path}/help/qnaview?qnaId=${qnalist.qnaId}"><i class="fas fa-lock"></i> <c:out value="${qnalist.qnaTitle}"/></a>
                </c:when>
                <c:otherwise><i class="fas fa-lock"></i> 비밀글은 작성자와 관리자만 볼 수 있습니다.</c:otherwise>
                </c:choose>
             </c:if>
             <c:if test="${qnalist.qnaOpenStatus eq 'Y'}" >
                <a href="${path}/help/qnaview?qnaId=${qnalist.qnaId}">
                 <i class="fas fa-lock-open"></i> <c:out value="${qnalist.qnaTitle}"/>
                </a>
             </c:if>
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















