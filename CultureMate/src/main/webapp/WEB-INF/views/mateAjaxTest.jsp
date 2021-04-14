<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<c:set var="path" value="${ pageContext.request.contextPath }" />

<h1>메이트 게시판 ajax 공연정보 가져오기 테스트</h1>

<!-- 조회만 가능하게 되어 있으니까 메이트 테이블에 임의로 공연 아이디 추가해 놓고 불러오기 먼저 해보자
임시아이디 : PF172528 -->

<input type="text" name="showId" id="showId">
<button type="button" id="getShowButton">가져오기</button>

<!-- 이 div에다가 결과가 들어가도록 되어 있어! -->
<div id="ajaxResultDiv" class=""></div>

<script>
<!-- 지금은 테스트 용으로 버튼을 누르면 작동하게 되어있는데
	실제로 적용할 때는 document.ready로 화면 뜨자마자 작동하게 바꾸면 돼! -->
	$('#getShowButton').on('click', function () {
		
		<!-- 이것도 테스트용으로 입력창에 있는 값을 가져오게 되어 있는데, DB 쿼리로 가져온 아이디가 들어가게 JSTL문 쓰면 돼! -->
		var mt20id = $('#showId').val();
		$.ajax({
			type : "GET",
			url : "/cm/show/mateAjax",
			data : {
				"mt20id" : mt20id,
			},
			error : function(error) {
				console.log("ajax-error");
			},
			success : function(result) {
				console.log("ajax-success");
				$("#ajaxResultDiv").empty();
				var toAdd = '';
				if(result == null || $.isEmptyObject(result)) {
					console.log("no result");
					toAdd += "<p>검색 조건에 맞는 게시물이 없습니다.</p>";
				} else {
					console.log(result);
					toAdd += '<div onclick="location.href=\'' + '${ path }/show/restview?name=' + result[0].mt20id + '\';">';
					toAdd += '<img src="' + result[0].poster + '" alt="' + result[0].prfnm + '">';
					toAdd += '</div>';
					toAdd += '<div>';
					toAdd += '<h5>공연명 : ' + result[0].prfnm + '</h5>';
					toAdd += '<p>공연장 : ' + result[0].fcltynm + '</p>';
					toAdd += '<p>공연기간 : ' + result[0].prfpdfrom + '~' + result[0].prfpdto + '</p>';
					toAdd += '<p>런타임 : ' + result[0].prfruntime + '</p>';
					toAdd += '<p>관람연령 : ' + result[0].prfage + '</p>';
					toAdd += '<p>티켓가격 : ' + result[0].pcseguidance + '</p>';
					toAdd += '<p>출연진 : ' + result[0].prfcast + '</p>';
					toAdd += '</div>';
				}
				$("#ajaxResultDiv").append(toAdd);
			}
		});
	})
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>