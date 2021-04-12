<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }" />
<%@ include file="/WEB-INF/views/common/header.jsp"%>

	<link rel="stylesheet" href="${ path }/resources/css/showListStyle.css?v=1" />
	<div class="searchOptionContainer">
		<div id="showSearchOption">
			<input type="radio" id="prfstate01" name="prfstate" value="01" checked>
			<label for="prfstate01">공연예정</label>
			<input type="radio" id="prfstate02" name="prfstate" value="02">
	  		<label for="prfstate02">공연중</label>
			<input type="radio" id="prfstate03" name="prfstate" value="03">
	  		<label for="prfstate03">공연완료</label>
			<br>
			<input type="radio" id="shcate01" name="shcate" value="AAAB" checked>
	  		<label for="shcate01">뮤지컬</label>
			<input type="radio" id="shcate02" name="shcate" value="AAAA">
	  		<label for="shcate02">연극</label>
			<input type="radio" id="shcate03" name="shcate" value="CCCA">
	  		<label for="shcate03">클래식</label>
			<br>
			<label for="showTitle">공연명</label>
			<input type="text" id="showTitle" name="showTitle">
			<button id="submitSearchForm" class="btn">상세 검색</button>
		</div>
		<hr>
		<button class="btn" type="button">숨기기</button>
	</div>
	
	<div id="showListDiv" class="ListDiv">
		<c:if test="${ showList == null }">
			<p>조회된 게시물이 없습니다.</p>
		</c:if>
		<c:if test="${ showList != null }">
			<c:forEach var="slvo" items="${ showList }">
			<div class="card">
				<div class="cardImgWrapper" onclick="location.href='${ path }/show/restview?name=${ slvo.mt20id }';">
					<img src="${ slvo.poster }" class="card-img-top" alt="${ slvo.prfnm }">
				</div>
				<div class="card-body">
					<h5 class="card-title">${ slvo.prfnm }</h5>
					<p class="card-text subTitle">${ slvo.fcltynm }</p>
					<p class="card-text">${ slvo.prfpdfrom }~${ slvo.prfpdto }</p>
				</div>
			</div>
			</c:forEach>
		</c:if>
	</div>

	<script>
	$('#submitSearchForm').on('click', function () {
		var prfstateVal = $('input[name="prfstate"]:checked').val();
		var shcateVal = $('input[name="shcate"]:checked').val();
		var shprfnm = $('#showTitle').val();
		$.ajax({
			type : "GET",
			url : "/cm/show/ajaxShowList",
			data : {
				"prfstate" : prfstateVal,
				"shcate" : shcateVal,
				"shprfnm" : shprfnm,
			},
			error : function(error) {
				console.log("ajax-error");
			},
			success : function(result) {
				console.log("ajax-success");
				$("#showListDiv").empty();
				var toAdd = '';
				if(result == null || $.isEmptyObject(result)) {
					console.log("no result");
					toAdd += "<p>검색 조건에 맞는 게시물이 없습니다.</p>";
				} else {
					console.log("result != null");
					for(i = 0; i < result.length; i++) {
						toAdd += '<div class="card">';
						toAdd += '<div class="cardImgWrapper" onclick="location.href=\'' + '${ path }/show/restview?name=' + result[i].mt20id + '\';">';
						toAdd += '<img src="' + result[i].poster + '" class="card-img-top" alt="' + result[i].prfnm + '">';
						toAdd += '</div>';
						toAdd += '<div class="card-body">';
						toAdd += '<h5 class="card-title">' + result[i].prfnm + '</h5>';
						toAdd += '<p class="card-text subTitle">' + result[i].fcltynm + '</p>';
						toAdd += '<p class="card-text">' + result[i].prfpdfrom + ' ~ ' + result[i].prfpdto + '</p>';
						toAdd += '</div>';
						toAdd += '</div>';
					}
				}
				$("#showListDiv").append(toAdd);
			}
		});
	})
	</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>