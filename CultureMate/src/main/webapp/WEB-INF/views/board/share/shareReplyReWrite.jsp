<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<c:set var="path" value="${pageContext.request.contextPath }" />


	<div id="replyReWrite-container">
		
		<form action="${path}/share/reply/reWrite" method="post" name="reWriteFrm">
			<input type="hidden" name="shareReplyId" value = "${shareReply.shareReplyId}">
			<label>	<input type="text" name="shareReplyId" id="shareReplyId" value="${shareReply.shareReplyId }" readonly="readonly"></label>
			<lable>	<input type="text" name="shareId" id="shareId" value="${shareReply.shareId }"  readonly="readonly"></label>
			<lable>	<input type="text" name="writer" id="writer"   value='${loginMember != null ? loginMember.userNick : "" }'></label>
		    
		    	<textarea rows="" cols="" name="content"></textarea>
		    	<button type="submit" onclick="submit()">댓글 등록</button>
		</form>
	</div>
	<script type="text/javascript">


</script>
