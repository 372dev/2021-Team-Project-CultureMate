<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }" />
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<link rel="stylesheet" href="${ path }/resources/css/showList.css" />
<link rel="stylesheet" href="${ path }/resources/css/listStyle.css" />
<div class="searchOptionContainer">
	<h1 class="showPageTitle titleFont">공연 검색</h1>
	<div class="showSearchOption collapse" id="showSearchOption">
		<div class="btn-group btn-group-toggle innerDivRadio" data-toggle="buttons">
			<label class="btn btn-outline-secondary active">
		    	<input type="radio" name="prfstate" value="01|02" autocomplete="off" checked>전체
		  	</label>
			<label class="btn btn-outline-secondary active">
		    	<input type="radio" name="prfstate" value="01" autocomplete="off">공연 예정
		  	</label>
			<label class="btn btn-outline-secondary active">
		    	<input type="radio" name="prfstate" value="02" autocomplete="off">공연중
		  	</label>
		</div>
		<div class="btn-group btn-group-toggle innerDivRadio" data-toggle="buttons">
			<label class="btn btn-outline-secondary active">
		    	<input type="radio" name="shcate" value="" autocomplete="off" checked>전체
		  	</label>
			<label class="btn btn-outline-secondary active">
		    	<input type="radio" name="shcate" value="AAAB" autocomplete="off">뮤지컬
		  	</label>
			<label class="btn btn-outline-secondary active">
		    	<input type="radio" name="shcate" value="AAAA" autocomplete="off">연극
		  	</label>
			<label class="btn btn-outline-secondary active">
		    	<input type="radio" name="shcate" value="CCCA" autocomplete="off">클래식
		  	</label>
		</div>
		<div class="searchTitleDiv">
		<input type="text" id="showTitle" class="showTitleSearch" name="showTitle" placeholder="공연명">
		<button id="submitSearchForm" class="btn btn-secondary btnFont">검색</button>
		</div>
	</div>
	<button id="toggleBtn" class="btn btnBahia btn-lg btn-block" type="button" data-toggle="collapse"
	data-target="#showSearchOption" aria-expanded="false" aria-controls="showSearchOption">▼ 상세검색 펼치기 ▼</button>
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
	$('#toggleBtn').on('click', function() {
		$(this).text( $(this).text() == "▼ 상세검색 펼치기 ▼" ? "▲ 상세검색 숨기기 ▲" : "▼ 상세검색 펼치기 ▼");
	});

	$('#submitSearchForm').on('click', function() {
		showListAjaxCall();
	});
	
	$('#showTitle').keyup(function(e){
	    if(e.keyCode == 13)
	    {
			showListAjaxCall();
		}
	});
	
	function showListAjaxCall() {
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
						toAdd += '<p class="card-text">' + result[i].prfpdfrom + '~' + result[i].prfpdto + '</p>';
						toAdd += '</div>';
						toAdd += '</div>';
					}
				}
				$("#showListDiv").append(toAdd);
			}
		});
	}
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>