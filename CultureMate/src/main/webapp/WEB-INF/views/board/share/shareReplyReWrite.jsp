<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<c:set var="path" value="${pageContext.request.contextPath }" />
<style>
#replyReWrite-container {
	text-align: center;
		margin:0 auto;
}
	#replyWriteFrm {
		
	}
</style>

	<div id="replyReWrite-container">
		
		<form id="reWriteFrm" name="reWriteFrm" action="${path}/share/reply/reWrite" method="post" >
			<input type="hidden" name="shareReplyId" value = "${shareReply.shareReplyId}">
			<lable>게시글   <input style="border-radius:5px;height:25px;width:40px;border: 0.5px solid;" type="text" name="shareId" id="shareId" value="${shareReply.shareId }"  readonly="readonly"></label>
			<label>댓글 그룹 <input style="border-radius:5px;height:25px;width:40px;border: 0.5px solid;" type="text" name="shareReplyId" id="shareReplyId" value="${shareReply.shareReplyId }" readonly="readonly"></label> 
			<label>작성자 <input style="border-radius:5px;height:25px;width:50px;border: 0.5px solid;" type="text" name="writer" id="writer"   value='${loginMember != null ? loginMember.userNick : "" }'></label>
		     <br><br>
		    	<textarea style="resize: none;border-radius:5px;border: 0.5px solid;" rows="5" cols="30" name="content"></textarea>  <br>
		    	<br>
		    	<button id="reWriteBtn" type="submit" style="border-radius:5px;border:0.5px solid;height:30px;width:80px;font-size:10pt;background-color: #6c757d; color:white;">댓글 등록</button>
		    	
		</form>
	</div>
	<script>
	//action="${path}/share/reply/reWrite" method="post" 
	/*$("#reWriteBtn").on("click", ()=> {
	document.reWriteFrm.action = "${path}/share/reply/reWrite";
	document.reWriteFrm.method = "POST";
		document.reWriteFrm.submit();
	
	});
	*/
	
	</script>
