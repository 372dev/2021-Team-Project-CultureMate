<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #mateSection {
	     min-height: 800px;
	     width: 1280px;
	     margin: 0 auto;
 		
	}
    #mateUpdate-container{ 
        text-align: center;
		margin: 0 auto;
		width: 1000px;
		height: 950px;
   
    }
    #mateTitle{
        text-align: left;
        font-family: 'Do Hyeon', sans-serif; 
    }
   	#mate-Title > a{
    	color: black;
    	text-decoration:none;  	       
    }
    #mate-Title > h2 {
    	text-decoration:line-through #9db81f;
    		margin-left:100px;
    }
    #mateUpdate-frm{
        text-align: center;    
        margin: auto;      
    }
  
    #mateUpdate-tbl{ 
    	border-collapse: collapse;
	    text-align: center;       
        margin: 0 auto;
   }
    #mateUpdate-tr{
    	border-bottom: 1px solid lightgray;
     	border-top: 1px solid lightgray;
   }
    #mateUpdate-tr>td:nth-child(4){
    	width: 300px;
    }
    #mateUpdate-tr>td:nth-child(6){
    	width: 100px;
    }
   #mateUpdate-tr>td{
   	padding: 5px;
   }
  #mateUpdate-tr1>td {
  		padding: 5px;
   }
   #mateButton{
     	height:35px;
	  	border: none;
		border-radius: 5px;
		background: #9db81f;
		color: white;
  }
</style>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<section id="mateSection">
       
		    <div id="mateUpdate-container">
		        <div id="mateTitle">
			       <a style="color: black;text-decoration:none;" href="${path}/mate/list"><h1 style="font-size: 48pt;">같이가요</h1></a>
			        <h2 style="text-decoration:line-through #b7ba41;margin-left:100px;">- 같이 갈 메이트 괌</h4>
		    	</div>
		    <hr>
		    <form action="${path}/mate/update" id="mateUpdate-frm" method="post" >
		   		<input type="hidden" name="mateId" value = "${mate.mateId}">
		     <table id="mateUpdate-tbl">
		       <tr id="mateUpdate-tr">
		       	<td>${mate.mateId}</td>
		        	<td>
				        <select name="mateShow" id="mateShow" style="border-radius:5px;height:28px;">
				            <option value="뮤지컬"
				            <c:if test="${mate.mateShow == '뮤지컬'}">selected</c:if>>뮤지컬</option>
				            <option value="연극"
				            <c:if test="${mate.mateShow == '연극'}">selected</c:if>>연극</option>
				            <option value="클래식"
				             <c:if test="${mate.mateShow == '클래식'}">selected</c:if>>클래식</option>
				        </select>
			        </td>
			        <td>
						<select name="mateOpen" id="mateOpen" style="border-radius:5px;height:28px;">
							<option value="모집중"
							<c:if test="${mate.mateOpen == '모집중'}">selected</c:if>>모집중</option>
							<option value="모집완료"
							<c:if test="${mate.mateOpen == '모집완료'}">selected</c:if>>모집완료</option>
						</select>
					</td>
		            <td><input style="border-radius:5px;height:28px;border:1px solid; width:200px;" type="text" name="mateTitle" value="${mate.mateTitle }"></td>		            
		            <td> <input style="border-radius:5px;height:28px;border:1px solid; width:80px;" type="text" name="userNick" value="${loginMember.userNick }" readonly> </td>
		                               
		            		            <td><fmt:formatDate value="${mate.mateCreateDate}" pattern="yy/MM/dd HH:mm:ss"/></td>	           
		            <td>${mate.mateCount}</td>	  
		        </tr>
		       <tr id="mateUpdate-tr1">
		          <td colspan="7" id="mateShowTitle"></td>
		        </tr>
		    <tr id="mateUpdate-tr1">		     
		    <td colspan="7">
		   <select name="mateAge" id="mateAge" style="border-radius:5px;height:28px;width: 70px;">
		            <option value="10대"
		            <c:if test="${mate.mateAge == '10대'}">selected</c:if>>10대</option>
		            <option value="20대"
		            <c:if test="${mate.mateAge == '20대'}">selected</c:if>>20대</option>
		            <option value="30대"
		            <c:if test="${mate.mateAge == '30대'}">selected</c:if>>30대</option>
		            <option value="40대"
		            <c:if test="${mate.mateAge == '40대'}">selected</c:if>>40대</option>
		            <option value="50대 이상"
		            <c:if test="${mate.mateAge == '50대 이상'}">selected</c:if>>50대 이상</option>
		    </select>
		    
		    <select name="mateGender" id="mateGender" style="border-radius:5px;height:28px;width: 100px;">
						<option value="여성"
						<c:if test="${mate.mateGender == '여성'}">selected</c:if>>여성</option>
						<option value="남성"
						<c:if test="${mate.mateGender == '남성'}">selected</c:if>>남성</option>
						<option value="아무나 환영"
						<c:if test="${mate.mateGender == '아무나 환영'}">selected</c:if>>아무나 환영</option>
					</select>
					
			<select name="mateNum" id="mateNum" style="border-radius:5px;height:28px;width: 100px;">
			        <option value="1명"
			        <c:if test="${mate.mateNum == '1명'}">selected</c:if>>1명</option>
			        <option value="5명 이하"
			         <c:if test="${mate.mateNum == '5명 이하'}">selected</c:if>>5명 이하</option>
			        <option value="10명 이하"
			         <c:if test="${mate.mateNum == '10명 이하'}">selected</c:if>>10명 이하</option>
			        <option value="15명 이하"
			         <c:if test="${mate.mateNum == '15명 이하'}">selected</c:if>>15명 이하</option>
				</select>	
				
			<select name="mateLoc" id="mateLoc" style="border-radius:5px;height:28px;width: 90px;" required>
	                <option value="서울"
	                 <c:if test="${mate.mateLoc == '서울'}">selected</c:if>>서울</option>
	                <option value="경기도"
	                 <c:if test="${mate.mateLoc == '경기도'}">selected</c:if>>경기도</option>
	                <option value="강원도"
	                 <c:if test="${mate.mateLoc == '강원도'}">selected</c:if>>강원도</option>
	                <option value="충청도"
	                 <c:if test="${mate.mateLoc == '충청도'}">selected</c:if>>충청도</option>
	                <option value="전라도"
	                 <c:if test="${mate.mateLoc == '전라도'}">selected</c:if>>전라도</option>
	                <option value="경상도"
	                 <c:if test="${mate.mateLoc == '경상도'}">selected</c:if>>경상도</option>
	                <option value="제주도"
	                 <c:if test="${mate.mateLoc == '제주도'}">selected</c:if>>제주도</option>
            </select>				
		    </td>
		   
			</tr>
		   <tr id="mateUpdate-tr1">
		       <td colspan="7">
		       <textarea style="resize: none;border-radius:5px; text-align: left;" name="mateContent" id="mateContent" cols="80" rows="10">${mate.mateContent }</textarea>
		    </td>
		</tr>
		</table>
		<br>
			<button id="mateButton" type="submit">수정하기</button> &nbsp;
		    <button id="mateButton" type="button" onclick="location.replace('${path}/mate/list')">목록으로</button>&nbsp;		
		    <button id="mateButton" type="button" onclick="history.back()">취소하기</button>
		</form>
	 </div>	
</section>
<script>
<!-- Ajax script -->

$(document).ready(function () {
	var mt20id = "${ mate.mt20id }";
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
			$("#mateShowTitle").empty();
			var toAdd = '<h5>선택된 공연 - ';
			console.log(result);
			toAdd += result[0].prfnm + '</h5>';
			$("#mateShowTitle").append(toAdd);
		},
	});
})
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>