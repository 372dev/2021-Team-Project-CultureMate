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
		background:#9db81f;
		color: white;
		position:relative;
		top:-30px;
	}
    .shareButton{
     	height:35px;
	  	border: none;
		border-radius: 5px;
		background:#9db81f;
		color: white;
  }
  .btn-update {
  	height: 20px;
  	font-zize: 5pt;
  }	
  
/*댓글테이블*/
table#tbl-comment {
	width:480px; 
	margin:0 auto; 
	border-collapse:collapse; 
	clear:both; 
} 

table#tbl-comment tr td {
	border-bottom:0.5px solid; 
	border-top:0.5px solid; 
	padding:5px; 
	text-align:left; 
	line-height:100%;
}

table#tbl-comment tr td:first-of-type {
	padding: 5px 5px 5px 20px;
}

table#tbl-comment tr td:last-of-type {
	text-align:left; 
	width: 100px;
}

table#tbl-comment sub.comment-writer {
	vertical-align: top;
	color:navy; 
	font-size:9pt;
	top:8px;
}

table#tbl-comment sub.comment-date {
	vertical-align: top;
	color:lightgray;
	font-size:9pt;
	top:8px;
}
.level1 >td> sub {
	font-size: 7pt;
}
.level2 >td> sub {
	margin-left:30px;
	font-size: 7pt;
}
   
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
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
				<span style="color: gray;font-size: 9pt;"> 등록된 인증 사진이 없습니다. </span>
			</c:if>
			</td>
			</tr>
			<tr>
			<c:if test="${!empty share.shareRenamedFileName }">	
				<td colspan="7"><img style="width: 400px;height: 200px;" alt="" src="${path}/resources/upload/board/${share.shareRenamedFileName} "></td>
				</c:if>
			</tr>
		   <tr id="shareView-tr1">
		       <td colspan="7">
		        <div style="border-radius:5px;height: 250px;width: 500px;background-color: GAINSBORO;margin:0 auto; display: flex; align-items: center;">
		       <div style="background-color:white;white-space:pre;border-radius:5px;height:210px;width:460px;border:0.5px solid lightgray;margin: 0 auto;text-align: left;">${share.shareContent}</div>
		     	</div>
		    </td>
		</tr>
	</table>
	<br>
		<c:if test="${ !empty loginMember && (loginMember.userNick == share.userNick || loginMember.userRole == 'ROLE_ADMIN')}">  
			    <button class="shareButton" id="update" type="button" onclick="location.replace('${path}/share/update?shareId=${share.shareId}')">수정하기</button> &nbsp;
			     
			</c:if>	    
				    <button class="shareButton" type="button" onclick="location.replace('${path}/share/list')">목록으로</button> &nbsp;
			<c:if test="${ !empty loginMember && (loginMember.userNick == share.userNick || loginMember.userRole == 'ROLE_ADMIN')}">  	    
				    <button  class="shareButton" id="delete" type="button" onclick="location.replace('${path}/share/delete?shareId=${share.shareId}')">삭제하기</button>
			</c:if>	
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
			    			<sub class="comment-date"><fmt:formatDate value="${shareReply.shareReplyCreateDate}" pattern="yy/MM/dd HH:mm:ss"/></sub> 
			    			<br>
			    			<span style="font-size:9pt;"><c:out value="${shareReply.shareReplyContent}"></c:out></span>
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
		    		    	<a href="javascript:deleteShareReply()" ><span style="font-size:7pt;color:gray;float:right;top:10px;" class="glyphicon glyphicon-remove">삭제</span></a>
		    		    	<a href="javascript:" id="btn-reWrite"><span style="font-size:7pt;color:gray;float:right;margin-right:5px;top:10px;" class=" glyphicon glyphicon-pencil">답글</span></a>
		    				
		    				<script type="text/javascript">
		    				$("#btn-reWrite").on("click", () => {
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
			    			<sub class="comment-writer" >RE:${shareReply.userNick}</sub>
			    			<sub class="comment-Id">RE:${shareReply.shareReplyId}</sub>
			    			<sub class="comment-date"><fmt:formatDate value="${shareReply.shareReplyCreateDate}" pattern="yy/MM/dd HH:mm:ss"/></sub> 
			    			<br>
			    			<span style="margin-left:30px;font-size:9pt;">→<c:out value="${shareReply.shareReplyContent}"></c:out></span>
			    		</td>			    		
			    		<td>
		    		    <c:if test="${ !empty loginMember && (loginMember.userNick == shareReply.userNick || loginMember.userRole == 'ROLE_ADMIN')}">
		    		    	<input type="hidden" name="shareReplyId" id="shareReplyId" value="${shareReply.shareReplyId }">
		    		    	<input type="hidden" name="shareId" id="shareId" value="${shareReply.shareId }">
		    				<a href="javascript:deleteShareReReply()" ><span style="font-size:7pt;color:gray;float:right;top:10px;" class="glyphicon glyphicon-remove">삭제</span></a>	    				
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
			<button type="button" class="btn btn-default btn-sm" onclick="location.href='${path}/share/view?shareId=${share.shareId }&page=1'"><span class="glyphicon glyphicon-menu-left"></span><span class="glyphicon glyphicon-menu-left"></span></button>
			
			<!-- 이전 페이지로 -->
			<button type="button" class="btn btn-default btn-sm" onclick="location.href='${path}/share/view?shareId=${share.shareId }&page=${pageInfo.prvePage}'"><span class="glyphicon glyphicon-menu-left"></span></button>

			<!--  10개 페이지 목록 -->
			<c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}" step="1" varStatus="status">
				<c:if test="${status.current == pageInfo.currentPage}">
					<button type="button" class="btn btn-default btn-xs" disabled><c:out value="${status.current}"/></button>
   				</c:if>
				<c:if test="${status.current != pageInfo.currentPage}">
					<button type="button" class="btn btn-default btn-xs" onclick="location.href='${path}/share/view?shareId=${share.shareId }&page=${status.current}'"><c:out value="${status.current}"/></button>
   				</c:if>
			</c:forEach>
			
			<!-- 다음 페이지로 -->
			<button type="button" class="btn btn-default btn-sm" onclick="location.href='${path}/share/view?shareId=${share.shareId }&page=${pageInfo.nextPage}'"><span class="glyphicon glyphicon-menu-right"></span></button>
			
			<!-- 맨 끝으로 -->
			<button type="button" class="btn btn-default btn-sm" onclick="location.href='${path}/share/view?shareId=${share.shareId }&page=${pageInfo.maxPage}'"><span class="glyphicon glyphicon-menu-right"></span><span class="glyphicon glyphicon-menu-right"></span></button>
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
</script>
</section>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>