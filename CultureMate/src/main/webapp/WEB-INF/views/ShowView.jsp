<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

	<h1>
		Show!
	</h1>
	
	<c:if test="${showList == null}">
		<p>조회된 게시물이 없습니다.</p>
	</c:if>
	<c:if test="${showList != null}">
		<c:forEach var="SLVO" items="${showList}">
		<p>mt20id : <c:out value = "${ SLVO.mt20id }"/></p>
		</c:forEach>
	</c:if>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>