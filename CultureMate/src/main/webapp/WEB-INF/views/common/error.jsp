<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<c:set var="path" value="${ pageContext.request.contextPath }" />

<link rel="stylesheet" href="${ path }/resources/css/error.css" />
<div class="container gridContainer">
	<div class="row">
		<div class="col colBorder"><h1 class="errorCode">${errorMsg}</h1></div>
	</div>
	<div class="row">
		<div class="col-6 detailMessageDiv">
		<p class="errorFirstMessage">
			<c:choose>
				<c:when test="${ errorMsg eq 'Error:401' || errorMsg eq 'Error:403' }">잘못된 접근입니다<br>동일한 문제가 지속적으로 발생할 경우 오류 내용과 함께 고객센터에 문의해 주세요</c:when>
				<c:when test="${ errorMsg eq 'Error:404' }">요청하신 경로를 찾을 수 없습니다<br>동일한 문제가 지속적으로 발생할 경우 오류 내용과 함께 고객센터에 문의해 주세요</c:when>
				<c:when test="${ errorMsg eq 'Error:500' }">서버에서 에러가 발생하였습니다<br>동일한 문제가 지속적으로 발생할 경우 오류 내용과 함께 고객센터에 문의해 주세요</c:when>
				<c:otherwise>에러가 발생하였습니다<br>동일한 문제가 지속적으로 발생할 경우 오류내용과 함께 고객센터에 문의해 주세요</c:otherwise>
			</c:choose>
		</p>
		<a href="${ path }/help/csmain" class="redirectionToCS">고객센터로 이동하기</a>
		<p class="errorDetailMessage"><br>
			<c:choose>
				<c:when test="${ errorMsg eq 'Error:401' || errorMsg eq 'Error:403' }">
					입력하신 페이지의 주소가 정확한지 다시 한번 확인해 주시기 바랍니다<br>
					방문을 원하시는 페이지의 접근이 제한되어 있습니다<br>
					컬쳐메이트는 고객님께 최고의 서비스를 제공하기 위해 최선을 다하겠습니다
				</c:when>
				<c:when test="${ errorMsg eq 'Error:404' }">
					입력하신 페이지의 주소가 정확한지 다시 한번 확인해 주시기 바랍니다<br>
					방문을 원하시는 페이지의 주소가 잘못 입력되었거나 변경/삭제 되었을 수 있습니다<br>
					컬쳐메이트는 고객님께 최고의 서비스를 제공하기 위해 최선을 다하겠습니다
				</c:when>
				<c:when test="${ errorMsg eq 'Error:500' }">
					서버에서 발생한 에러로 인해 일시적으로 서비스 이용이 지연되고 있습니다<br>
					이용에 불편을 드리게 되어 죄송합니다<br>
					컬쳐메이트는 고객님께 최고의 서비스를 제공하기 위해 최선을 다하겠습니다
				</c:when>
				<c:otherwise>
					이용에 불편을 드리게 되어 죄송합니다<br>
					일시적으로 서비스 이용이 지연되고 있습니다<br>
					컬쳐메이트는 고객님께 최고의 서비스를 제공하기 위해 최선을 다하겠습니다
				</c:otherwise>
			</c:choose>
		</p>
		</div>
		<div class="col-6">
			<c:choose>
				<c:when test="${ errorMsg eq 'Error:401' || errorMsg eq 'Error:403' }">
					<img alt="banned" src="${ path }/resources/images/error/banned.png">
				</c:when>
				<c:when test="${ errorMsg eq 'Error:404' }">
					<img alt="lost" src="${ path }/resources/images/error/lost.png">
				</c:when>
				<c:when test="${ errorMsg eq 'Error:500' }">
					<img alt="warning" src="${ path }/resources/images/error/warning.png">
				</c:when>
				<c:otherwise>
					<img alt="browser" src="${ path }/resources/images/error/browser.png">
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>