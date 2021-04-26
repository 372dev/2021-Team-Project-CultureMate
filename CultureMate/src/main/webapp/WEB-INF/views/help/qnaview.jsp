<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<style>
#btnSave {
	background-color: #9DB81F;
	color: white;
}

#btnList {
	background-color: #9DB81F;
	color: white;
}

#list{
background-color: #6C757D;
color: white;
}

</style>
<div class="row">
	<div class="col-xs-2 col-md-2"></div>
	<div class="col-xs-8 col-md-8">
		<h2 class="text-center">게시글 보기<span id="stats1"></span></h2>
		<p>&nbsp;</p>
		<div class="table table-responsive">
		
			<table class="table">
				<tr>
					<th class="success">작성자</th>
					<td>${qnaboard.userId}</td>
					<th class="success">작성일</th>
					<td><fmt:formatDate value="${qnaboard.qnaCreateDate}"  pattern="yy/MM/dd HH:mm:ss"/></td>
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
						<button type="button" onclick="updateBoard()"  class="btn btn-default btn-sm" id="btnSave">수정</button>
						<button type="button" onclick="deleteBoard()" class="btn btn-default btn-sm" id="btnList">삭제</button>
					</c:if>
					<button type="button"
							onclick="location.replace('${path}/help/qnalist')" class="btn btn-default btn-sm" id="list">목록으로</button>
					</th>
				</tr>
			</table>
		</div>
		
		<div class="container">
		<form method="GET" name="commentInsertForm" id="commentInsertForm">
			<div class="input-group">
				<c:if
					test="${ !empty loginMember && (loginMember.userId == qnaboard.userId || loginMember.userRole == 'ROLE_ADMIN')}">
					<label for="content">댓글</label>
					<input type="hidden" name="qnaId" id="qnaId" value="${qnaboard.qnaId}" />
					<input type="hidden" name="userId" id="userId" value="${loginMember.userId}" />
					<input type="text" class="form-control" id="qnaReContent"
						name="qnaReContent" placeholder="내용을 입력하세요.">
					<span class="input-group-btn">
						<button class="btn btn-default" type="submit" onclick="fn_reply()"
							name="commentInsertBtn" id="commentInsertBtn">등록</button>
					</span>
				</c:if>
			</div>
		</form>
	</div>

	<div class="container">
		<form id="commentListForm" name="commentListForm" method="post">
        <div id="commentList">
        </div>
       </form>
		</div>
	</div>
</div>

<script>
	function updateBoard() {
		location.href = "${path}/help/qnaupdate?qnaId=${qnaboard.qnaId}";
	}

	function deleteBoard() {
		if (confirm("정말로 게시글을 삭제 하시겠습니까?")) {
			location.replace('${path}/help/delete?qnaId=${qnaboard.qnaId}');
		}
	}
	
function fn_reply(){
		
		$.ajax({
			type : 'POST',
			url : "<c:url value='/help/addreply.do'/>",
			data: $("#commentInsertForm").serialize(),
			success : function(data){
				if(data == "success")
			{
					console.log("정상저장?");
					getqnaReplyList();
				  $("#qnaReContent").val("");
			}
		},
		error:function(request,status,error){
		}
			
		});
		
	}

$(function(){
	
	getCommentList();
});

function getCommentList(){
	console.log("getCommentList 오는거니?");
$.ajax({
    type:'GET',
    url : "<c:url value='/help/replyList.do'/>",
    dataType : "json",
    data:$("#commentInsertForm").serialize(),
    contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
    success : function(data){
        
        var html = "";
        var cCnt = data.length;
        
        if(data.length > 0){
            
        	for(i=0; i<data.length; i++){
        		console.log(data[i]);
                html += "<div>";
                html += "<div><table class='table'><h6><strong>"+data[i].userId+ " | " + data[i].createDate +"</strong>";
                html += "</h6>";
                html += '<a id="delReply" href="#" onclick="delReply(' + data[i].qnaReId +')"><img alt="삭제" src="${ path }/resources/images/view/trash-fill.svg"></a>';
                html += data[i].qnaReContent + "<tr><td></td></tr>"
                html += "</table>"
                html += "</div>";
                html += "</div>";
            }
            
        } else {
            
            html += "<div>";
            html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
            html += "</table></div>";
            html += "</div>";
            
        }
        
        $("#cCnt").html(cCnt);
        $("#commentList").html(html);
        
    },
    error:function(request,status,error){
        
   }
    
});

}

function delReply(qnaReId) {
	var rlt = confirm("삭제하시겠습니까?");
	if(rlt){
	console.log("del실행" + qnaReId);
  $.ajax({
      type : 'GET',
      url : "<c:url value='/help/delReply?qnaReId=" + qnaReId + "'/>",
    success : function (data) {
    	
    	console.log("삭제쓰");
    	var html = data;
        $("#stats1").html(html);
    	getCommentList();
	}
  });
  	alert("삭제되었습니다.");
	}else{
		alert("취소하였습니다.");
	}
	
	
}
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>