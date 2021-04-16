<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@page import="com.kh.cm.mate.model.vo.Mate"%>
<%
	Mate mate = (Mate)request.getAttribute("mate");	
%>
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
	top:-28px;
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
<section id="mateSection">
	  <div id="mateView-container">
		        <div id="mate-Title">
			        <h1>같이 가요</h1>
			        <h4>&nbsp; - 같이 갈 메이트 괌</h4>
		    	</div>
		    <hr>
		    <div id="ajaxResultDiv" class=""></div>
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
	    		<form action="${path }/mate/reply/write" method="post" onsubmit="return checkEmpty()">
	    			<input type="hidden" name="mateId" value="${mate.mateId}">
	    			<input type="hidden" name="writer" value='${loginMember != null ? loginMember.userNick : "" }'>
					<textarea style="border-radius:5px;height:70px;" id="content" name="content" cols="55" rows="3"></textarea>
					<button type="submit" id="btn-insert" onclick="return checkLogin()">등록</button>	    			
	    		</form>
	    	</div>
	    </div>
		<table id="tbl-comment">
		    	<c:forEach var = "mateReply" items="${mateReplies}">
		    	 <c:if test="${mateReply.mateReplyId == mateReply.mateReplyGroup }">
			    	<tr class="level1">
			    		<td>
			    			<sub class="comment-writer">${mateReply.userNick}</sub>
			    			<sub class="comment-Id">${mateReply.mateReplyId}</sub>
			    			<sub class="comment-date">${mateReply.mateReplyCreateDate}</sub>
			    			<br>
			    			<c:out value="${mateReply.mateReplyContent}"></c:out>
			    		</td>
			    		<td>
		    		    <c:if test="${ !empty loginMember && (loginMember.userNick == mateReply.userNick || loginMember.userRole == 'ROLE_ADMIN')}">
		    		    	<input type="hidden" class="mateReplyId" name="mateReplyId" value="${mateReply.mateReplyId }">
		    		    	<input type="hidden" name="mateId" id="mateId" value="${mateReply.mateId }">
		    				<button class="btn-update">수정</button>
		    				<button class="btn-reWrite">답글</button>
		    				<button class="btn-delete" onclick="deleteMateReply()">삭제</button>
		    				<script type="text/javascript">
		    				$(".btn-reWrite").on("click", () => {
		    					//	var mateReplyId = $("#mateReplyId").val();
		    						
		    						const url = "${path}/mate/reply/reWrite?mateReplyId=" + $(".mateReplyId").val();
		    						const title = "RE";
		    						const status = "left=500px, top=100px, width=500px, height=300px";
		    						
		    						window.open(url, title, status);
		    						
		    						
		    					});
		    				
		    				function deleteMateReply(){
		    					let mateReplyId = $(".mateReplyId").val();
		    					if(confirm("댓글을 삭제 하시겠습니까?")){
		    						location.replace('${path}/mate/reply/delete?mateId='+ <%=mate.getMateId()%>+ '&mateReplyId=' + mateReplyId);
		    					}
		    				}
		    				
		    				</script>
		    			</c:if>
			    		</td>
			    	</tr>
			    	</c:if>
			    	 <c:if test="${mateReply.mateReplyId != mateReply.mateReplyGroup }">			    				
			    	<tr class="level2">	    	
			    		<td>
			    			<sub class="comment-writer">&nbsp;&nbsp;RE:${mateReply.userNick}</sub>
			    			<sub class="comment-Id">&nbsp;&nbsp;RE:${mateReply.mateReplyId}</sub>
			    			<sub class="comment-date">${mateReply.mateReplyCreateDate}</sub> 
			    			<br>
			    			&nbsp;&nbsp;→<c:out value="${mateReply.mateReplyContent}"></c:out>
			    		</td>			    		
			    		<td>
		    		    <c:if test="${ !empty loginMember && (loginMember.userNick == mateReply.userNick || loginMember.userRole == 'ROLE_ADMIN')}">
		    		    	<input type="hidden" name="mateReplyId" id="mateReplyId" value="${mateReply.mateReplyId }">
		    		    	<input type="hidden" name="mateId" id="mateId" value="${mateReply.mateId }">
		    				<button class="btn-update" onclick="updateMateReply()">수정</button>
		    				<button class="btn-delete" onclick="deleteMateReReply()">삭제</button>		    				
		    				<script type="text/javascript">
		    				function deleteMateReReply(){
		    					let mateReplyId = $("#mateReplyId").val();
		    					if(confirm("댓글을 삭제 하시겠습니까?")){
		    						location.replace('${path}/mate/reply/delete?mateId='+ <%=mate.getMateId()%>+ '&mateReplyId=' + mateReplyId);
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
			<button onclick="location.href='${path}/mate/view?mateId=${mate.mateId }&page=${pageInfo.nextPage}'">&gt;</button>
			
			<!-- 맨 끝으로 -->
			<button onclick="location.href='${path}/mate/view?mateId=${share.shareId }&page=${pageInfo.maxPage}'">&gt;&gt;</button>	
	 </div>
	 <script type="text/javascript">
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
	
	function updateMateReply() {
		var mateReplyId = $("#mateReplyId").val();
		location.href= '${path}/mate/reply/update?mateReplyId=' + mateReplyId;
	}
	
	

	

	/*
		 onclick="location.replace('${path}/mate/reply/reWrite?mateReplyId=${mateReply.mateReplyId}')"
	$(".btn-reWrite").on("click", () => {
	//	var mateReplyId = $("#mateReplyId").val();
		
		const url = "${path}/mate/reply/reWrite?mateReplyId=" + $("#mateReplyGroup").val();
		const title = "RE";
		const status = "left=500px, top=100px, width=500px, height=300px";
		
		window.open(url, title, status);
		
		
	});
	
	}
	
   	$('.replyReLink').click(function(event){  //버튼을 클릭 했을시 popupOpen 함수 출력 
        console.log('click');
        popupOpen();
    });
	
	function popupOpen(){
		var mateReplyId = $("#mateReplyId").val();
		var mateId = $("#mateId").val();
		
		const url = "${path}/mate/reply/reWrite";
		const title = "RE";
		const status = "left=500px, top=100px, width=500px, height=300px";
		
		window.open(url, title, status);
		
		reWrite.target = title; // form 전송하는 윈도우를 설정
		reWrite.action = url;// 새창에서 처리하므로 url지정
		reWrite.method = "POST";
		reWrite.mateReplyId.value = mateReplyId;
		reWrite.mateId.value = mateId;
		
		reWrite.submit();
	}
	
	*/
	
	<!-- Ajax script -->
	
	$(document).ready(function () {
		
		var mt20id = "${ mate.mt20id }";
		$.ajax({
			type : "GET",
			url : "/cm/show/mateAjax",
			data : {
				"mt20id" : mt20id,
			},
			error : function(error) {
				console.log("ajax-error");
			},
			success : function(result) {
				console.log("ajax-success");
				$("#ajaxResultDiv").empty();
				var toAdd = '';
				if(result == null || $.isEmptyObject(result)) {
					console.log("no result");
					toAdd += "<p>검색 조건에 맞는 게시물이 없습니다.</p>";
				} else {
					console.log(result);
					toAdd += '<div onclick="location.href=\'' + '${ path }/show/restview?name=' + result[0].mt20id + '\';">';
					toAdd += '<img src="' + result[0].poster + '" alt="' + result[0].prfnm + '">';
					toAdd += '</div>';
					toAdd += '<div>';
					toAdd += '<h5>공연명 : ' + result[0].prfnm + '</h5>';
					toAdd += '<p>공연장 : ' + result[0].fcltynm + '</p>';
					toAdd += '<p>공연기간 : ' + result[0].prfpdfrom + '~' + result[0].prfpdto + '</p>';
					toAdd += '<p>런타임 : ' + result[0].prfruntime + '</p>';
					toAdd += '<p>관람연령 : ' + result[0].prfage + '</p>';
					toAdd += '<p>티켓가격 : ' + result[0].pcseguidance + '</p>';
					toAdd += '<p>출연진 : ';
					if(result[0].prfcast == " " || "") {
						toAdd += "정보가 없습니다.";
					} else {
						toAdd += result[0].prfcast;
					}
					toAdd += '</p></div>';
				}
				$("#ajaxResultDiv").append(toAdd);
			}
		});
	})
	
	</script>
	</div>

</section>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>