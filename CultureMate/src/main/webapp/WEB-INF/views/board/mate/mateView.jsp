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
		height: 800px;
   
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
     #mateView-tr>td:nth-child(4){
     	width: 300px;
     }
     #mateView-tr>td:nth-child(6){
     	width: 100px;
     }
     #mateView-tr>td{
     	padding:10px;
     	width:100px;
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
		        	<td>${mate.mateId}번호</td>
		        	<td>${mate.mateShow}분류</td>
		        	<td>${mate.mateOpen}모집중</td>
		            <td>${mate.mateTitle}제목</td>	
		            <td>${mate.userNick}작성자</td>	           
		            <td>${mate.mateCreateDate}날짜</td>	           
		            <td>${mate.count}조회수</td>	           
		        </tr>		       
		      
		    <tr id="mateView-tr1">
		    <td colspan="4">연령대</td>
		    <td colspan="3">${mate.mateAge}</td>
			</tr>
			<tr id="mateView-tr1">
			    <td colspan="4">인원수</td>
			    <td colspan="3">${mate.mateNum}</td>
			</tr>
			<tr id="mateView-tr1">
				<td colspan="4">모집상태</td>
				<td colspan="3">${mate.mateOpen}</td>
			</tr>
		    <tr id="mateView-tr1">
			     <td colspan="7">
			       ${mate.mateContent }내용
			    </td>
			</tr>
		 </table>
		 <br>
		 <%--글작성자/관리자인경우 수정삭제 가능 --%>
		  <c:if test="${ !empty loginMember && (loginMember.Id == mate.Id || loginMember.userRole == 'ROLE_ADMIN')}">  
				    <button id="mateButton" type="button" onclick="updateMate()">수정하기</button> &nbsp;
			</c:if>	    
				    <button id="mateButton" type="button" onclick="location.replace('${path}/mate/list')">목록으로</button> &nbsp;
			<c:if test="${ !empty loginMember && (loginMember.Id == mate.Id || loginMember.userRole == 'ROLE_ADMIN')}">  	    
				    <button id="mateButton" type="button" onclick="deleteMate()">삭제하기</button>
			</c:if>	    	
		 <div id="comment-container">
	    	<div class="comment-editor">
	    	<br>
	    		<form action="${path }/mate/reply/write" method="post">
	    			<input type="hidden" name="mateId" value="${mate.mateId}">
	    			<input type="hidden" name="writer" value='${loginMember != null ? loginMember.Id : "" }'>
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
		    		    <c:if test="${ !empty loginMember && (loginMember.Id == mateReply.Id || loginMember.userRole == 'ROLE_ADMIN')}">
		    		    	<input type="hidden" name="mateReplyNo" id="mateReplyNo" value="${matereply.relyNo}">
		    				<button class="btn-update" onclick="updateMateReply()">수정</button>
		    				<button class="btn-delete" onclick="deleteMateReply()">삭제</button>
		    			</c:if>
			    		</td>
			    	</tr>
		    	</c:forEach>
		    </table>	
	 </div>	
</section>
<script>
	function updateMate(){
			location.href = "${path}/mate/update?mateId=${mate.mateId}";
	}
		
	function deleteMate(){		
		if(confirm("정말로 게시글을 삭제 하시겠습니까?")){
			location.replace('${path}/mate/delete?mateId=${mate.mateId}');
		}
	}	
	function checkLogin() {
		if(${ loginMember } == null){
			alert("로그인 후 이용해주세요!");
	//		$("#userId").focus();
		}
	}
	
	function updateBoardReply(){
		location.href= '${path}/mate/reply/update?mateReplyId=${mateReply.mateReplyId}';
	}
	function deleteBoardReply(){
		var mateReplyNo = document.getElementById("mateReplyNo").value;
		if(confirm("댓글을 삭제 하시겠습니까?")){
			location.replace('${path}/mate/reply/delete?mateReplyId=' + mateReplyNo);
		}
	}
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>