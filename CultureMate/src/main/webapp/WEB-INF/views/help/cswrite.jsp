<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ include file="/WEB-INF/views/common/header.jsp"%>
 <h2>자주묻는질문 글쓰기</h2>
 
<div>
    <h2>게시판 작성</h2>
		<form action='${path}/help/cswrite' method="post" enctype="multipart/form-data">
			<table id='tbl-board'>
				<tr>
					<div class="qnalist">
		               <label style="font-size: large;">문의유형</label>
		              
		                   <select name="national">
		                       <option selected>질문유형</option>
		                           <option value="ko">전체보기</option>
		                           <option value="ch">환불</option>
		                           <option value="jp">구매/결제</option>
		                           <option value="jp">메이트/소모임</option>
		                           <option value="jp">기타</option>
		                   </select>
		            </div>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="boardTitle" id="title"></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input type="text" name="userId" value="${ loginMember.userId }" readonly></td>
				</tr>
				<tr>
					<th>첨부파일1</th>
					<td><input type="file" name="upfile"></td>
					
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea name="boardContent" cols="50" rows="15" ></textarea></td>
				</tr>
				<tr>
					<th colspan="2">
						<input type="submit" value="등록">
						<input type="reset" value="취소">
					</th>
				</tr>
			</table>
		</form>
	</div>
	
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>