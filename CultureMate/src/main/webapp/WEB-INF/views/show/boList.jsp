<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }" />
<%@ include file="/WEB-INF/views/common/header.jsp"%>

	<link rel="stylesheet" href="${ path }/resources/css/showListStyle.css?v=1" />
	<h1>${ cate } 주간 박스 오피스</h1>
	<div id="boListDiv" class="ListDiv">
		<c:if test="${ boList == null }">
			<p>조회된 게시물이 없습니다.</p>
		</c:if>
		<c:if test="${ boList != null }">
			<c:forEach var="blvo" items="${ boList }">
			<div class="card">
				<div class="cardImgWrapper" onclick="location.href='${ path }/show/restview?name=${ blvo.mt20id }';">
					<img src="http://www.kopis.or.kr${ blvo.poster }" class="card-img-top" alt="${ blvo.prfnm }">
				</div>
				<div class="card-body">
					<h5 class="card-title">${ blvo.prfnm }</h5>
					<p class="card-text subTitle">${ blvo.prfplcnm }</p>
					<p class="card-text">${ blvo.prfpd }</p>
				</div>
			</div>
			</c:forEach>
		</c:if>
	</div>
	<div>
		<button id="reLocToShowList">
			더 보기(상세 검색)
		</button>
	</div>
	
	<script>
		var genre = null;
	</script>	
<%@ include file="/WEB-INF/views/common/footer.jsp"%>