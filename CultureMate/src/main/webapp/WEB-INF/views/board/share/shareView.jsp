<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@page import="com.kh.cm.share.model.vo.Share"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<c:set var="path" value="${pageContext.request.contextPath}" />
<%
	Share share = (Share)request.getAttribute("share");	
%>
<style>
    #shareSection {
	     min-height: 800px;
	     width: 1280px;
	     margin: 0 auto;
 
 
	}
    #shareView-container{ 
        text-align: center;
		margin: 0 auto;
		width: 1000px;
		height: 900px;
   
    }
    #share-Title{
        text-align: left;
    }
    #shareView-frm{
        text-align: center;    
        margin: auto;      
    }
  
    #shareView-tbl{
    	border-collapse: collapse;
	    border-spacing: 0 7px;
	    text-align: center;       
        margin: 0 auto;
    }
    #shareView-tr{
    	border-bottom: 1px solid lightgray;
     	border-top: 1px solid lightgray;
    }
     #shareView-tr>td:nth-child(4){
     	width: 300px;
     }
     #shareView-tr>td:nth-child(6){
     	width: 200px;
     }
    #shareView-tr>td{
    	padding:7px;
    	width:100px;
    }
    #shareView-tr1>td{
    	padding: 5px;
    }
    #btn-insert {
		width: 70px;
		height: 70px;
		border: none;
		border-radius: 5px;
		background: yellowgreen;
		color: white;
		position:relative;
		top:-28px;
	}
    .shareButton{
     	height:35px;
	  	border: none;
		border-radius: 5px;
		background: yellowgreen;
		color: white;
  }	
  
/*댓글테이블*/
table#tbl-comment {
	width:580px; 
	margin:0 auto; 
	border-collapse:collapse; 
	clear:both; 
} 

table#tbl-comment tr td {
	border-bottom:1px solid; 
	border-top:1px solid; 
	padding:5px; 
	text-align:left; 
	line-height:120%;
}

table#tbl-comment tr td:first-of-type {
	padding: 5px 5px 5px 50px;
}

table#tbl-comment tr td:last-of-type {
	text-align:left; 
	width: 100px;
}

table#tbl-comment button.btn-reply {
	display:none;
}

table#tbl-comment button.btn-update {
	display:none;
}
table#tbl-comment button.btn-reWrite {
	display:none;
}

table#tbl-comment button.btn-delete {
	display:none;
}

table#tbl-comment tr:hover {
	background:lightgray;
}

table#tbl-comment tr:hover button.btn-reply {
	display:inline;
}

table#tbl-comment tr:hover button.btn-update {
	display:inline;
}
table#tbl-comment tr:hover button.btn-reWrite {
	display:inline;
}

table#tbl-comment tr:hover button.btn-delete {
	display:inline;
}

table#tbl-comment sub.comment-writer {
	vertical-align: top;
	color:navy; 
	font-size:14px
}

table#tbl-comment sub.comment-date {
	vertical-align: top;
	color:lightgray;
	font-size:10px
}
   
</style>
<section id="shareSection">
<div id="shareView-container">
		        <div id="share-Title">
			        <h1>티켓 나눔</h1>
			        <h4>&nbsp; - 공연 티켓 괌</h4>
		    	</div>
		    <hr>
		     <table id="shareView-tbl">
		        <tr id="shareView-tr">
		            <td>${share.shareId}</td>
		            <td>${share.shareShow}</td>
		            <td>${share.shareOpen}</td>
		            <td>${share.shareTitle}</td>	
		            <td>${share.userNick}</td>	           
		            <td><fmt:formatDate value="${share.shareCreateDate}" pattern="yy/MM/dd HH:mm:ss"/></td>	           
		            <td>${share.shareCount}</td>			            
		        </tr>
			<tr id="shareView-tr1">
				<td colspan="7">티켓 인증</td>				
			</tr>
			<tr>
				<td colspan="7">
			<c:if test="${ !empty share.shareOriginalFileName }">
				<a href="javascript:fileDownload('${share.shareOriginalFileName}', '${share.shareRenamedFileName}');">		
					<img src="${path}/resources/images/img.png" width="20" height="20">
					<c:out value="${share.shareOriginalFileName}" />
				</a>
				<script>
					function fileDownload(oriname, rename) {
						const url="${path}/share/fileDown";
						
						let oName = encodeURIComponent(oriname);
						let rName = encodeURIComponent(rename);
						
						location.assign(url + "?oriname=" + oName + "&rename=" + rName);
					}
				</script>
			</c:if>
			<c:if test="${ empty share.shareOriginalFileName }">			
				<span style="color: gray;"> - </span>
			</c:if>
			</td>
			</tr>
			<tr>
				<td colspan="7"><img style="width: 400px;height: 200px;" alt="" src="${path}/resources/upload/board/${share.shareRenamedFileName} "></td>
			</tr>
		   <tr id="shareView-tr1">
		       <td colspan="7">
		       <div style="height:200px;width:500px;border:0.5px solid lightgray;margin: 0 auto;text-align: left;">
		       	 ${share.shareContent}
		       </div>
		     
		    </td>
		</tr>
		<tr>
			<td colspan="7">
				<c:if test="${ !empty loginMember && (loginMember.userNick == share.userNick || loginMember.userRole == 'ROLE_ADMIN')}">  
			    <button class="shareButton" id="update" type="button" onclick="location.replace('${path}/share/update?shareId=${share.shareId}')">수정하기</button> &nbsp;
			     
			</c:if>	    
				    <button class="shareButton" type="button" onclick="location.replace('${path}/share/list')">목록으로</button> &nbsp;
			<c:if test="${ !empty loginMember && (loginMember.userNick == share.userNick || loginMember.userRole == 'ROLE_ADMIN')}">  	    
				    <button  class="shareButton" id="delete" type="button" onclick="location.replace('${path}/share/delete?shareId=${share.shareId}')">삭제하기</button>
			</c:if>	
			</td>
		</tr>
		</table>
	<br>
		<div id="comment-container">
	    	<div class="comment-editor">
	    		<br>
	    		<form action="${path}/share/reply/write" method="post" onsubmit="return checkEmpty()">
	    			<input type="hidden" name="shareId" id="shareId" value="${share.shareId}">
	    			<input type="hidden" name="writer" value='${loginMember != null ? loginMember.userNick : "" }'>
					<textarea style="height: 70px;border-radius:5px;" id="content" name="content" cols="55" rows="3"></textarea>
			  		<button type="submit" id="btn-insert" onclick="return checkLogin()" >등록</button>	  	
	    		</form>
	    		
	    	</div>
	    </div>
		<table id="tbl-comment">
		    	<c:forEach var = "shareReply" items="${shareReplies}">
		    	<c:if test="${shareReply.shareReplyId == shareReply.shareReplyGroup }">
			    	<tr class="level1">
			    <!-- 	<c:if test="${ !empty loginMember && (loginMember.id == shareReply.id || loginMember.userRole == 'ROLE_ADMIN')}">
			    </c:if>
			     --> 			     	
			    		<td>
			    			<sub class="comment-writer">${shareReply.userNick}</sub>
			    			<sub class="comment-Id">${shareReply.shareReplyId}</sub>
			    			<sub class="comment-date">${shareReply.shareReplyCreateDate}</sub> 
			    			<br>
			    			<c:out value="${shareReply.shareReplyContent}"></c:out>
			    		</td>
		    		
			    	<!--	<c:if test= "${empty loginMember || loginMember.id != shareReply.id}">
				    		<td>
				    			<c:out value="비밀댓글입니다."></c:out>
				    		</td>	
		    		</c:if>
		    		  -->
			    		<td>			    		
		    		    <c:if test="${ !empty loginMember && (loginMember.userNick == shareReply.userNick || loginMember.userRole == 'ROLE_ADMIN')}">
		    		    	<input class="shareReplyId" type="hidden" name="shareReplyId" value="${shareReply.shareReplyId }">
		    		    	<input type="hidden" name="shareId" id="shareId" value="${shareReply.shareId }">
		    		    	<button class="btn-update" onclick="updateShareReply()">수정</button>
		    		    	<button class="btn-reWrite" >답글</button>
		    				<button class="btn-delete" onclick="deleteShareReply()">삭제</button>
		    				<script type="text/javascript">
		    				$(".btn-reWrite").on("click", () => {
		    					//	var mateReplyId = $("#mateReplyId").val();
		    						
		    						const url = "${path}/share/reply/reWrite?shareReplyId=" + $(".shareReplyId").val();
		    						const title = "RE";
		    						const status = "left=500px, top=100px, width=500px, height=300px";
		    						
		    						window.open(url, title, status);
		    				});
		    				
		    				function deleteShareReply(){
		    					let shareReplyId = $(".shareReplyId").val();
		    					if(confirm("댓글을 삭제 하시겠습니까?")){
		    						location.href = '${path}/share/reply/delete?shareId=' + <%=share.getShareId()%> + '&shareReplyId=' + shareReplyId;
		    					}
		    				}
		    				</script>
		    			</c:if>
			    		</td>
			    	</tr>
			    	</c:if>	
	    		    <c:if test="${shareReply.shareReplyId != shareReply.shareReplyGroup }">			    				
			    	<tr class="level2">	    	
			    		<td>
			    			<sub class="comment-writer">&nbsp;&nbsp;RE:${shareReply.userNick}</sub>
			    			<sub class="comment-Id">&nbsp;&nbsp;RE:${shareReply.shareReplyId}</sub>
			    			<sub class="comment-date">${shareReply.shareReplyCreateDate}</sub> 
			    			<br>
			    			&nbsp;&nbsp;→<c:out value="${shareReply.shareReplyContent}"></c:out>
			    		</td>			    		
			    		<td>
		    		    <c:if test="${ !empty loginMember && (loginMember.userNick == shareReply.userNick || loginMember.userRole == 'ROLE_ADMIN')}">
		    		    	<input type="hidden" name="shareReplyId" id="shareReplyId" value="${shareReply.shareReplyId }">
		    		    	<input type="hidden" name="shareId" id="shareId" value="${shareReply.shareId }">
		    				<button class="btn-update" onclick="updateShareReply()">수정</button>
		    				<button class="btn-delete" onclick="deleteShareReReply()">삭제</button>		    				
		    				<script type="text/javascript">
		    				function deleteShareReReply(){
		    					let shareReplyId = $("#shareReplyId").val();
		    					if(confirm("댓글을 삭제 하시겠습니까?")){
		    						location.replace('${path}/share/reply/delete?shareId='+ <%=share.getShareId()%>+ '&shareReplyId=' + shareReplyId);
		    					}
		    				}
		    		    	</script>
		    			</c:if>
			    		</td>
			    	</tr>
			    	</c:if>			    	
		    	</c:forEach>
		    </table>
		    <br>
		    <div id="pageBar">
			<!-- 맨 처음으로 -->
			<button onclick="location.href='${path}/share/view?shareId=${share.shareId }&page=1'">&lt;&lt;</button>
			
			<!-- 이전 페이지로 -->
			<button onclick="location.href='${path}/share/view?shareId=${share.shareId }&page=${pageInfo.prvePage}'">&lt;</button>

			<!--  10개 페이지 목록 -->
			<c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}" step="1" varStatus="status">
				<c:if test="${status.current == pageInfo.currentPage}">
					<button disabled><c:out value="${status.current}"/></button>
   				</c:if>
				<c:if test="${status.current != pageInfo.currentPage}">
					<button onclick="location.href='${path}/share/view?shareId=${share.shareId }&page=${status.current}'"><c:out value="${status.current}"/></button>
   				</c:if>
			</c:forEach>
			
			<!-- 다음 페이지로 -->
			<button onclick="location.href='${path}/share/view?shareId=${share.shareId }&page=${pageInfo.nextPage}'">&gt;</button>
			
			<!-- 맨 끝으로 -->
			<button onclick="location.href='${path}/share/view?shareId=${share.shareId }&page=${pageInfo.maxPage}'">&gt;&gt;</button>
		</div>	
	</div>
	<script>
	function checkEmpty() {
		var content = $("#content").val();
		if( content == ""  || content == null || content == '&nbsp;' || content == '<p>&nbsp;</p>') {
			alert('입력값이 없습니다.');
			return false;
		}
	}
	
	function checkLogin() {
		if(${empty loginMember}) {
			alert("로그인 후 댓글등록이 가능합니다.");
			return false;
		}
	}
	function updateShareReply(){
		if(confirm("댓글을 수정 하시겠습니까?")){
			location.href= '${path}/share/reply/update?shareReplyId=${shareReply.shareReplyId}';
		}
	}
	
	
	/*
	onclick="location.replace('${path}/share/reply/reWrite?shareReplyId=${shareReply.shareReplyId}')"
		$(".btn-reWrite").on("click", () => {
	//	var mateReplyId = $("#mateReplyId").val();
		
		const url = "${path}/mate/reply/reWrite?mateReplyId=" + $("#mateReplyGroup").val();
		const title = "RE";
		const status = "left=500px, top=100px, width=500px, height=300px";
		
		window.open(url, title, status);
		
		
	});
	*/
</script>
</section>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>