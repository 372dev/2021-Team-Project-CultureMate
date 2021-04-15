<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ include file="/WEB-INF/views/common/header.jsp"%>
    
    <h2>게시판</h2>
    
    <div class="row">
        <div class="col-xs-2 col-md-2"></div>
        <div class="col-xs-8 col-md-8">
        <h2 class="text-center">게시글 보기</h2><p>&nbsp;</p>
        <div class="table table-responsive">
            <table class="table">
        
             
            <tr>
                <th class="success">작성자</th>
                <td>${qnaboard.userId}</td>
                <th class="success">작성일</th>
                <td>${qnaboard.qnaCreateDate}</td>
            </tr>

            <tr>
                <th class="success">제목</th>
                <td colspan="3">${qnaboard.qnaTitle}</td>
            </tr>
             
            <tr>
                <th class="success">글 내용</th>
                <td colspan="3">${qnaboard.qnaContent}</td>
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
    </div>

      <div class="container">
        <label for="content">댓글</label>
        <form name="commentInsertForm">
            <div class="input-group">
               <input type="hidden" name="qnaId" value="${qnaboard.qnaId}"/>
               <input type="text" class="form-control" id="qnaReContent" name="qnaReContent" placeholder="내용을 입력하세요.">
               <span class="input-group-btn">
                    <button class="btn btn-default" type="submit" name="commentInsertBtn">등록</button>
               </span>
              </div>
              
        </form>
    </div>
            
        <div class="container">
          <div class="commentList"></div>
   
            </div>
        </div>


<script>
	function updateBoard(){
			location.href = "${path}/help/qnaupdate?qnaId=${qnaboard.qnaId}";
	}
		
	function deleteBoard(){		
		if(confirm("정말로 게시글을 삭제 하시겠습니까?")){
			location.replace('${path}/help/qnadelete?qnaId=${qnaboard.qnaId}');
		}
	}
</script>

 
 <script>
 var qnaId = '${qnaboard.qnaId}';
 
 $('[name=commentInsertBtn]').clik(function(){
	 var insertData = $('[name=commentInsertForm]').serialize();
	 commentInsert(insertData);
 });
 

 function commentInsert(insertData)
  $.ajax({
	  url : '/help/qnareply',
	  type : 'post'
	  data : insertData,
	  sucess : finction(data){
		  if(data == 1){
			  commentList();
			  $('[name=qnaReContent]').val('');
		  }
	  }
  });
 }

</script>
 
<%@ include file="/WEB-INF/views/common/footer.jsp"%>