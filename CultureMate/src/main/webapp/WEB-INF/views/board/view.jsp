<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

			<section>
					<dt>제목</dt>
					<dd><c:out value="${array1}"/></dd>
					<dt>상영관</dt>
					<dd><c:out value="${array1}"/></dd>
					<dt>가격</dt>
					<dd><c:out value="${array2}"/></dd> 
					<br>
					<img alt="" src="${array3[0]}"><br>
					<img alt="" src="${array3[1]}"><br>
					<img alt="" src="${array3[2]}"><br>
			</section>
			
			

<%@ include file="/WEB-INF/views/common/footer.jsp"%>