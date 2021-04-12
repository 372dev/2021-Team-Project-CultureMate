<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<style>
     #mateSection {
	     min-height: 800px;
	     width: 1280px;
	     margin: 0 auto;
 
 
	}
    #mateView-container{ 
        text-align: center;
		margin: 0 auto;
		width: 1000px;
		height: 900px;
   
    }
    #mate-Title{
        text-align: left;
    }
    #mateView-frm{
        text-align: center;    
        margin: auto;      
    }
  
    #mateView-tbl{ 
    	border-collapse: collapse;
	    border-spacing: 0 7px;
	    text-align: center;       
        margin: 0 auto;
    }
    #mateView-tr{
     border-bottom: 1px solid lightgray;
     border-top: 1px solid lightgray;
    }
     #mateView-tr>td:nth-child(8){
     	width: 300px;
     }
     #mateView-tr>td:nth-child(10){
     	width: 200px;
     }
      #mateView-tr>td:nth-child(4){
    	width: 100px;
    }
      #mateView-tr>td:nth-child(3){
    	width: 130px;
    }
   
     #mateView-tr>td{
     	padding:5px;
     	width:80px;
     }
     #mateView-tr1>td{
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
	top:-30px;
}
  #mateButton{
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
<section id="mateSection">
	  <div id="mateView-container">
		        <div id="mate-Title">
			        <h1>같이 가요</h1>
			        <h4>&nbsp; - 같이 갈 메이트 괌</h4>
		    	</div>
		    <hr>
		     <table id="mateView-tbl">
		        <tr id="mateView-tr">
		        	<td>${mate.mateId}</td>		        	
		        	<td>${mate.mateShow}</td>
		        	<td>${mate.mateOpen}</td>
		        	<td>${mate.mateGender}</td>		        	
		        	<td>${mate.mateAge}</td>		        	
		        	<td>${mate.mateNum}</td>		        	
		        	<td>${mate.mateLoc}</td>			        		        	
		            <td>${mate.mateTitle}</td>	
		           	<td>${mate.userNick }</td>	                     
		            <td><fmt:formatDate value="${mate.mateCreateDate}" pattern="yy/MM/dd HH:mm:ss"/></td>	           
		            <td>${mate.mateCount}</td>	           
		        </tr>		       
		    <tr id="mateView-tr1">
		     <td colspan="11">
			      <textarea style="height:200px;width:400px;border:0.5px solid lightgray;margin: 0 auto;text-align: left;" wrap="hard" readonly="readonly">
		       	 	${mate.mateContent}
		       `</textarea>
			 </td>
			</tr>
		 </table>
		 <br>
		 <%--글작성자/관리자인경우 수정삭제 가능 --%>
		  <c:if test="${ !empty loginMember && (loginMember.userNick == mate.userNick || loginMember.userRole == 'ROLE_ADMIN')}">  
				    <button id="mateButton" type="button" onclick="location.replace('${path}/mate/update?mateId=${mate.mateId}')">수정하기</button> &nbsp;
			</c:if>	    
				    <button id="mateButton" type="button" onclick="location.replace('${path}/mate/list')">목록으로</button> &nbsp;
			<c:if test="${ !empty loginMember && (loginMember.userNick == mate.userNick || loginMember.userRole == 'ROLE_ADMIN')}">  	    
				    <button id="mateButton" type="button" onclick="location.replace('${path}/mate/delete?mateId=${mate.mateId}')">삭제하기</button>
			</c:if>	    	
		 <div id="comment-container">
	    	<div class="comment-editor">
	    	<br>
	    		<form action="${path }/mate/reply/write" method="post">
	    			<input type="hidden" name="mateId" value="${mate.mateId}">
	    			<input type="hidden" name="writer" value='${loginMember != null ? loginMember.userNick : "" }'>
					<textarea style="border-radius:5px;height:70px;" name="content" cols="55" rows="3" onfocus="checkLogin()"></textarea>
					<button type="submit" id="btn-insert">등록</button>	    			
	    		</form>
	    	</div>
	    </div>
		<table id="tbl-comment">
		    	<c:forEach var = "mateReply" items="${mateReplies}">
			    	<tr class="level1">
			    		<td>
			    			<sub class="comment-writer">${mateReply.userNick}</sub>
			    			<sub class="comment-date">${mateReply.mateReplyCreateDate}</sub>
			    			<br>
			    			<c:out value="${mateReply.mateReplyContent}"></c:out>
			    		</td>
			    		<td>
		    		    <c:if test="${ !empty loginMember && (loginMember.userNick == mateReply.userNick || loginMember.userRole == 'ROLE_ADMIN')}">
		    		    	<input type="hidden" name="mateReplyNo" id="mateReplyNo" value="${matereply.relyNo}">
		    				<button class="btn-update" onclick="updateMateReply()">수정</button>
		    				<button class="btn-delete" onclick="deleteMateReply()">삭제</button>
		    			</c:if>
			    		</td>
			    	</tr>
			    	 <c:if test="${mateReply.mateReplyId != mateReply.mateReplyGroup }">			    				
			    	<tr class="level2">	    	
			    		<td>
			    			<sub class="comment-writer">&nbsp;&nbsp;RE:${mateReply.userNick}</sub>
			    			<sub class="comment-date">${mateReply.mateReplyCreateDate}</sub> 
			    			<br>
			    			&nbsp;&nbsp;<c:out value="→${mateReply.mateReplyContent}"></c:out>
			    		</td>			    		
			    		<td>
		    		    <c:if test="${ !empty loginMember && (loginMember.userNick == mateReply.userNick || loginMember.userRole == 'ROLE_ADMIN')}">
		    		    	<input type="hidden" name="mateReplyId" value="${mateReply.mateReplyId }">
		    		    	<input type="hidden" name="mateId" value="${shareReply.shareId }">
		    				<button class="btn-update" onclick="updateMateReply()">수정</button>
		    				<button class="btn-delete" onclick="deleteMateReply()">삭제</button>		    				
		    			</c:if>
			    		</td>
			    	</tr>
			    	</c:if>			    	
		    	</c:forEach>
		    </table>
		     <br>
		    <div id="pageBar">
			<!-- 맨 처음으로 -->
			<button onclick="location.href='${path}/mate/view?mateId=${mate.mateId }&page=1'">&lt;&lt;</button>
			
			<!-- 이전 페이지로 -->
			<button onclick="location.href='${path}/mate/view?mateId=${mate.mateId }&page=${pageInfo.prvePage}'">&lt;</button>

			<!--  10개 페이지 목록 -->
			<c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}" step="1" varStatus="status">
				<c:if test="${status.current == pageInfo.currentPage}">
					<button disabled><c:out value="${status.current}"/></button>
   				</c:if>
				<c:if test="${status.current != pageInfo.currentPage}">
					<button onclick="location.href='${path}/mate/view?mateId=${mate.mateId }&page=${status.current}'"><c:out value="${status.current}"/></button>
   				</c:if>
			</c:forEach>
			
			<!-- 다음 페이지로 -->
			<button onclick="location.href='${path}/mate/view?mateId=${share.shareId }&page=${pageInfo.nextPage}'">&gt;</button>
			
			<!-- 맨 끝으로 -->
			<button onclick="location.href='${path}/mate/view?mateId=${share.shareId }&page=${pageInfo.maxPage}'">&gt;&gt;</button>	
	 </div>
	</div>
	 <script>
	/*
	function checkLogin() {
		if(${ loginMember } == null){
			alert("로그인 후 이용해주세요!");
	//		$("#userId").focus();
		}
	}
	
	*/
	function updateMateReply(){
		if(confirm("댓글을 수정 하시겠습니까?")){
		location.href= '${path}/mate/reply/update?mateReplyId=${mateReply.mateReplyId}';
		}
	}
	function deleteMateReply(){
		var mateReplyNo = document.getElementById("mateReplyNo").value;
		if(confirm("댓글을 삭제 하시겠습니까?")){
			location.replace('${path}/mate/reply/delete?mateReplyId=' + mateReplyNo);
		}
	}
</script> 	
</section>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>