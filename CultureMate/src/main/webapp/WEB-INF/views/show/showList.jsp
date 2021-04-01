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
			background-color: GAINSBORO;
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
		.fclname {
			font-weight: bold;
			color: gray;
		}
	</style>
	
	<form>
  		<label for="prfstate01">공연예정</label>
		<input type="radio" id="prfstate01" name="prfstate" value="01" checked>
  		<label for="prfstate02">공연중</label>
		<input type="radio" id="prfstate02" name="prfstate" value="02" checked>
  		<label for="prfstate03">공연완료</label>
		<input type="radio" id="prfstate03" name="prfstate" value="03" checked>
		<br>
  		<label for="shcate01">뮤지컬</label>
		<input type="radio" id="shcate01" name="shcate" value="AAAB" checked>
  		<label for="shcate02">연극</label>
		<input type="radio" id="shcate02" name="shcate" value="AAAA" checked>
  		<label for="shcate03">클래식</label>
		<input type="radio" id="shcate03" name="shcate" value="CCCA" checked>
		<br>
		
		
		<button id="submitSearchForm">검색</button>
	</form>
	
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
					<p class="card-text fclname">${ slvo.fcltynm }</p>
					<p class="card-text">${ slvo.prfpdfrom } - ${ slvo.prfpdto }</p>
				</div>
			</div>
			</c:forEach>
		</c:if>
	</div>
	
<%@ include file="/WEB-INF/views/common/footer.jsp"%>