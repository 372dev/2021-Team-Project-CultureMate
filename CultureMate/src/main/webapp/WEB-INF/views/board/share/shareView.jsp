<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<c:set var="path" value="${pageContext.request.contextPath}" />
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
		height: 800px;
   
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
    #shareButton{
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
		            <td>${share.shareCreateDate}</td>	           
		            <td>${share.shareCount}</td>			            
		        </tr>
			<tr id="shareView-tr1">
				<td colspan="7">티켓 인증</td>				
			</tr>
			<tr>
				<td colspan="7">
			<c:if test="${ !empty share.shareOriginalFileName }">
				<a href="javascript:fileDownload('${share.shareOriginalFileName}', '${share.shareRenamedFileName}');">		
					<img src="${path}/images/file.png" width="20" height="20">
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
				<td colspan="7"><img style="width: 400px;height: 150px;" alt="" src="${path}/resources/upload/board/${share.shareRenamedFileName} "></td>
			</tr>
		   <tr id="shareView-tr1">
		       <td colspan="7">
		       ${share.shareContent}
		    </td>
		</tr>
		</table>
		 <br>
		 <%--글작성자/관리자인경우 수정삭제 가능 --%>
		  <c:if test="${ !empty loginMember && (loginMember.Id == share.Id || loginMember.userRole == 'ROLE_ADMIN')}">  
				    <button id="shareButton" type="button" onclick="updateMate()">수정하기</button> &nbsp;
			</c:if>	    
				    <button id="shareButton" type="button" onclick="location.replace('${path}/share/list')">목록으로</button> &nbsp;
			<c:if test="${ !empty loginMember && (loginMember.Id == mate.Id || loginMember.userRole == 'ROLE_ADMIN')}">  	    
				    <button id="shareButton" type="button" onclick="deleteShare()">삭제하기</button>
			</c:if>	
		<div id="comment-container">
	    	<div class="comment-editor">
	    		<br>
	    		<form action="${path}/share/reply/write" method="post">
	    			<input type="hidden" name="shareId" id="shareId" value="${share.shareId}">
	    			<input type="hidden" name="writer" value='${loginMember != null ? loginMember.id : "" }'>
					<textarea style="height: 70px;border-radius:5px;" name="content" cols="55" rows="3" onfocus="checkLogin()"></textarea>
					<button type="submit" id="btn-insert">등록</button>	    			
	    		</form>
	    	</div>
	    </div>
		<table id="tbl-comment">
		    	<c:forEach var = "shareReply" items="${shareReplies}">
			    	<tr class="level1">
			    <!-- 	<c:if test="${ !empty loginMember && (loginMember.id == shareReply.id || loginMember.userRole == 'ROLE_ADMIN')}">
			    </c:if>
			     --> 
			     	<c:if test="${shareReply.shareReplyId== shareReply.shareReplyGroup }">
			    		<td>
			    			<sub class="comment-writer">${shareReply.userNick}</sub>
			    			<sub class="comment-date">${shareReply.shareReplyCreateDate}</sub> 
			    			<br>
			    			<c:out value="${shareReply.shareReplyContent}"></c:out>
			    		</td>
		    		</c:if>
			    	<!--	<c:if test= "${empty loginMember || loginMember.id != shareReply.id}">
				    		<td>
				    			<c:out value="비밀댓글입니다."></c:out>
				    		</td>	
		    		</c:if>
		    		  -->
			    		<td>
			    		
		    		    <c:if test="${ !empty loginMember && (loginMember.id == shareReply.id || loginMember.userRole == 'ROLE_ADMIN')}">
		    				<button class="btn-update" onclick="updateShareReply()">수정</button>
		    				<button class="btn-delete" onclick="deleteShareReply()">삭제</button>
		    			</c:if>
			    		</td>
			    	</tr>	
	    		    <c:if test="${shareReply.shareReplyId != shareReply.shareReplyGroup }">			    				
			    	<tr class="level2">	    	
			    		<td>
			    			<sub class="comment-writer">→${shareReply.userNick}</sub>
			    			<sub class="comment-date">${shareReply.shareReplyCreateDate}</sub> 
			    			<br>
			    			<c:out value="${shareReply.shareReplyContent}"></c:out>
			    		</td>			    		
			    		<td>
		    		    <c:if test="${ !empty loginMember && (loginMember.id == shareReply.id || loginMember.userRole == 'ROLE_ADMIN')}">
		    				<button class="btn-update" onclick="updateShareReply()">수정</button>
		    				<button class="btn-delete" onclick="deleteShareReply()">삭제</button>
		    			</c:if>
			    		</td>
			    	</tr>
			    	</c:if>		    	
		    	</c:forEach>
		    </table>	
	</div>
</section>
<script>
	function updateShare(){
			location.href = "${path}/share/update?shareId=${share.shareId}";
	}
		
	function deleteShare(){		
		if(confirm("게시글을 삭제 하시겠습니까?")){
			location.replace('${path}/share/delete?shareId=${share.shareId}');
		}
	}
		
	function checkLogin() {
		if(${ loginMember } == null){
			alert("로그인 후 이용해주세요!");
	//		$("#userId").focus();
		}
	}
	
	function updateShareReply(){
		if(confirm("댓글을 수정 하시겠습니까?")){
			location.href= '${path}/share/reply/update?shareReplyId=${shareReply.shareReplyId}';
		}
	}
	function deleteshareReply(){
		if(confirm("댓글을 삭제 하시겠습니까?")){
			location.replace('${path}/share/reply/delete?shareReplyId=${shareReply.shareReplyId}');
		}
	}
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>