<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ include file="/WEB-INF/views/common/header.jsp"%>
 <h2>자주묻는질문 글쓰기</h2>
 
<div>
    <h2>게시판 작성</h2>
		<form action='${path}/help/cswrite' method="post" enctype="multipart/form-data">
			<table id='tbl-board'>
				<tr>
					<div class="cslist">
		               <label style="font-size: large;">게시글종류</label>
		              
		                   <select name="csboardKind">
		                       <option selected>종류</option>
		                           <option value="all">전체보기</option>
		                           <option value="faq">FAQ</option>
		                           <option value="notice">공지사항</option>
		                   </select>
		            </div>
		            <div class="faqlist">
		               <label style="font-size: large;">게시글유형</label>
		              
		                   <select name="csboardType">
		                       <option selected>유형</option>
		                           <option value="all">전체보기</option>
		                           <option value="횐불">환불</option>
		                           <option value="구매">구매/결제</option>
		                           <option value="메이트">메이트/소모임</option>
		                           <option value="기타">기타</option>
		                   </select>
		            </div>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="csboardTitle" id="title"></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input type="text" name="userId" value="${ loginMember.userId }" readonly></td>
				</tr>
				<tr>
					<th>첨부파일1</th>
					<td><input type="file" name="upfile" value=""></td>
					
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea name="csboardContent" cols="50" rows="15" ></textarea></td>
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