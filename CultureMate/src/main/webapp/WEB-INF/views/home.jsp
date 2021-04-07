<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<c:set var="path" value="${ pageContext.request.contextPath }" />

<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>

<p>
	<a href="${path}/mate/write">메이트 글쓰기</a>
</p>
<p>
	<a href="${path}/mate/list">메이트 조회</a>
</p>
<p>
	<a href="${path}/mate/update">메이트 수정</a>
</p>
<p>
	<a href="${path}/mate/view">메이트 상세 조회</a>
</p>
<p>
	<a href="${path}/share/write">티켓나눔 글쓰기</a>
</p>
<p>
	<a href="${path}/share/list">티켓나눔 조회</a>
</p>
<p>
	<a href="${path}/share/update">티켓나눔 수정</a>
</p>
<p>
	<a href="${path}/share/view">티켓나눔 상세조회</a>
</p>


<%@ include file="/WEB-INF/views/common/footer.jsp"%>