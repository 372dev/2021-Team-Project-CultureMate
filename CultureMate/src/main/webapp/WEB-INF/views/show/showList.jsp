<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<style>
		.showList {
			display: flex;
			flex-wrap: wrap;
		}
		.card {
			margin: 10px;
		}
		.cardImgWrapper {
			width: 18rem;
			height: 24rem;
			cursor: pointer;
			position: relative;
			background-color: gray;
		}
		.card-img-top {
			max-height: 100%;
			width: 100%;
			height: auto;
			position: absolute;
			top: 0;
			bottom: 0;
			left: 0;
			right: 0;
			margin: auto;
		}
	</style>
	<h1>
		Show!
	</h1>
	
	<div class="showList">
		<c:if test="${showList == null}">
			<p>조회된 게시물이 없습니다.</p>
		</c:if>
		<c:if test="${showList != null}">
			<c:forEach var="slvo" items="${ showList }">
			<div class="card" style="width: 18rem;">
				<div class="cardImgWrapper" onclick="location.href='${pageContext.request.contextPath}';">
					<img src="${ slvo.poster }" class="card-img-top" alt="${ slvo.prfnm }">
				</div>
				<div class="card-body">
					<h5 class="card-title">${ slvo.prfnm }</h5>
					<p class="card-text">${ slvo.fcltynm }</p>
					<p class="card-text">${ slvo.prfpdfrom } - ${ slvo.prfpdto }</p>
				</div>
			</div>
			</c:forEach>
		</c:if>
	</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
