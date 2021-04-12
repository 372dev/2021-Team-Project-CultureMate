<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ include file="/WEB-INF/views/common/header.jsp"%>
    
    <h2>게시판</h2>
    <div>
	<table id="tbl-board">
	   <tr>
			<th>유형</th>
			<td>${qnaboard.qnaType}</td>
		</tr>
		<tr>
			<th>제 목</th>
			<td>${qnaboard.qnaTitle}</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${qnaboard.userId}</td>
		</tr>

		<tr>
			<th>내 용</th>
			<td>${qnaboard.qnaContent}</td>
		</tr>

		<tr>
			<th colspan="2">                  
			<c:if test="${ !empty loginMember && (loginMember.userId == qnaboard.userId || loginMember.userRole == 'ROLE_ADMIN')}">
				<button type="button" onclick="updateBoard()">수정</button>
				<button type="button" onclick="deleteBoard()">삭제</button>
			</c:if>
				<button type="button" onclick="location.replace('${path}/help/qnalist')">목록으로</button>
			</th>
		</tr>
	</table>
   </div>


<%@ include file="/WEB-INF/views/common/footer.jsp"%>