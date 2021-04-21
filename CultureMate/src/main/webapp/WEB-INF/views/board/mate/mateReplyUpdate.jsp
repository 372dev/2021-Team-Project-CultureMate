<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="com.kh.cm.mate.model.vo.Mate"%>
<%@page import="com.kh.cm.mate.model.vo.MateReply"%>
<%
	Mate mate = (Mate)request.getAttribute("mate");	
	MateReply mateReply = (MateReply)request.getAttribute("mateReplies");	
%>
	<div id="replyUpdate-container">
		
	
			    			<form  class="replyUpdateFrm" action="${path}/mate/reply/update" method="post">
			    				<input type="hidden" name="mateReplyId" id="mateReplyId" value="${mateReply.mateReplyId }">
			    		    	<input type="hidden" name="mateId" id="mateId" value="${mateReply.mateId }">
			    		    	<textarea rows="" cols="" name="content"> <c:out value="${mateReply.mateReplyContent}"></c:out> </textarea>
			    		    	<button type="submit" onclick="updateMateReply()">수정</button>
		    				</form>

		 <br><br>
	
		</div>
