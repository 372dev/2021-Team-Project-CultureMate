<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="path" value="${pageContext.request.contextPath }" />


	<div id="replyReWrite-container">
		
	
		<form action="${path}/mate/reply/reWrite" method="post">			
				<input type="hidden" name="mateReplyId"  value = "${mateReply.mateReplyId}">
				<label>	<input type="text" name="mateReplyId" id="mateReplyId" value="${mateReply.mateReplyId }" readonly="readonly"></label>
				<label>	<input type="text" name="mateId" id="mateId" value="${mateReply.mateId }"  readonly="readonly"></label>
				<label>	<input type="text" name="writer" id="writer"   value='${loginMember != null ? loginMember.userNick : "" }'></label>
			    
			    	<textarea rows="" cols="" name="content"></textarea>
			    	<button type="submit">댓글 등록</button>
		</form>
		
		</div>
		
		<script>
		function success() {
			window.opener.location.href="${path}/mate/reply/reWrite?mateReplyId="+ $("#mateReplyGroup").val();
				
			window.close();
		}

		</script>


