<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>


	<h2>리스트 출력 화면</h2>
	
	<section class="div1">
		<table id="tbl-board">
			<tr>
				<th>순번</th>
				<th>영화제목</th>
				<th>시작날짜</th>
				<th>포스터</th>
				<th>장르</th>
			</tr>
			<c:forEach var="i" begin="0" end="${max}">
			<tr>
				<td><c:out value="${i}"/></td>
				<td><c:out value="${array[i]}"/></td>
				<td><c:out value="${array1[i]}"/></td>
				<td> <a href="${path}/show/view?name=${array4[i]}"><img alt="" src="<c:out value="${array2[i]}"/>" width="200px" height="200px"></a></td>
					<td><c:out value="${array3[i]}"/></td>
			</tr>	
			</c:forEach>
		</table>
	</section>




<%@ include file="/WEB-INF/views/common/footer.jsp"%>