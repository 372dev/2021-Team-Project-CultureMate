<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ include file="/WEB-INF/views/common/header.jsp"%>
    
    <h2>게시판</h2>
    
    <div class="row">
        <div class="col-xs-2 col-md-2"></div>
        <div class="col-xs-8 col-md-8">
        <h2 class="text-center">FAQ게시글 보기</h2><p>&nbsp;</p>
        <div class="table table-responsive">
            <table class="table">
        
             
            <tr>
                <th class="success">작성자</th>
                <td>${csboard.csboardId}</td>
                <th class="success">작성일</th>
                <td>${csboard.csboardCreateDate}</td>
            </tr>

            <tr>
                <th class="success">제목</th>
                <td colspan="3">${csboard.csboardTitle}</td>
            </tr>
            <tr>
			<th>첨부파일</th>
			<td>
			<c:if test="${ !empty csboard.csboardOriginalFile }">
				<a href="javascript:fileDownload('${csboard.csboardOriginalFile}', '${csboard.csboardRenamedFile}');">		
					<img src="${path}/images/img.png" width="20" height="20">
					<c:out value="${csboard.csboardOriginalFile}" />
				</a>
			</c:if>
			<c:if test="${ empty csboard.csboardRenamedFile }">			
				<span style="color: gray;"> - </span>
			</c:if>
			</td>
		</tr> 
            <tr>
                <th class="success">글 내용</th>
                <td colspan="3">${csboard.csboardContent}</td>
            </tr>
             
            <tr>
			<th colspan="2">                  
			<c:if test="${ !empty loginMember && (loginMember.userId == qnaboard.userId || loginMember.userRole == 'ROLE_ADMIN')}">
				<button type="button" onclick="updateBoard()">수정</button>
				<button type="button" onclick="deleteBoard()">삭제</button>
			</c:if>
				<button type="button" onclick="location.replace('${path}/help/csmain')">목록으로</button>
			</th>
		   </tr>    
        </table>
        </div>
    </div>
</div>  
<%@ include file="/WEB-INF/views/common/footer.jsp"%>