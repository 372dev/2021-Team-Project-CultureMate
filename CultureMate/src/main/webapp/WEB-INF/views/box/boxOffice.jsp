<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }" />
<%@ include file="/WEB-INF/views/common/header.jsp"%>

	<link rel="stylesheet" href="${ path }/resources/css/showListStyle.css?v=1" />
	<h1>Box Office</h1>
	<div id="boxOfficeListDiv" class="ListDiv">
		<h2>Musical</h2>
		<c:if test="${ boxOfficeList == null }">
			<p>Failed to load</p>
		</c:if>
		<c:if test="${ boxOfficeList != null }">
			<c:forEach var="bovo" items="${ boxOfficeList }" end="4">
			<div class="card">
			<!-- 여기에 div + rnum 추가해서 position 잡고 순위 상단 모서리 표시 -->
				<div class="cardImgWrapper" onclick="location.href='${ path }';">
					<img src="http://www.kopis.or.kr${ bovo.poster }" class="card-img-top" alt="${ bovo.prfnm }">
				</div>
				<div class="card-body">
					<h5 class="card-title">${ bovo.prfnm }</h5>
					<p class="card-text subTitle">${ bovo.area }</p>
					<p class="card-text">${ bovo.prfpd }</p>
				</div>
			</div>
			</c:forEach>
		</c:if>
	</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>