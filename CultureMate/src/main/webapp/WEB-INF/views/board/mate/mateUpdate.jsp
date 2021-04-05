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
		height: 800px;
   
    }
    #mateTitle{
        text-align: left;
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
		background: yellowgreen;
		color: white;
  }
</style>
</head>
<body>
<section id="mateSection">
       
		    <div id="mateUpdate-container">
		        <div id="mateTitle">
			        <h1>같이 가요</h1>
			        <h4>&nbsp; - 같이 갈 메이트 괌</h4>
		    	</div>
		    <hr>
		    <form action="${path}/mate/update" id="mateUpdate-frm" method="post" >
		   		<input type="hidden" name="mateId" value = "${mate.mateId}">
		     <table id="mateUpdate-tbl">
		       <tr id="mateUpdate-tr">
		       	<td>${mate.mateId}번호</td>
		        	<td>
				        <select name="mateShow" id="mateShow" style="border-radius:5px;height:28px;">
				            <option value="뮤지컬">뮤지컬</option>
				            <option value="연극">연극</option>
				            <option value="클래식">클래식</option>
				        </select>
			        </td>
			        <td>
						<select name="mateOpen" id="mateOpen" style="border-radius:5px;height:28px;">
							<option value="모집중">모집중</option>
							<option value="모집완료">모집완료</option>
						</select>
					</td>
		            <td><input style="border-radius:5px;height:28px;border:1px solid; width:200px;" type="text" name="mateTitle" id="mateTitle" value="${mate.mateTitle }"></td>		            
		            <td> <input style="border-radius:5px;height:28px;border:1px solid; width:80px;" type="text" name="userNick" value="${loginMember.userNick }" readonly> </td>
		                               
		            <td>${mate.mateCreateDate}날짜</td>	           
		            <td>${mate.count}조회수</td>	  
		        </tr>
		       <tr id="mateUpdate-tr1">
		          <td colspan="7">API</td> 
		        </tr>
		    <tr id="mateUpdate-tr1">
		     <td colspan="7">
			   <select name="mateAge" id="mateAge" style="border-radius:5px;height:28px;">
			            <option value="">연령대</option>
			            <option value="10대">10대</option>
			            <option value="20대">20대</option>
			            <option value="30대">30대</option>
			            <option value="40대">40대</option>
			            <option value="50대 이상">50대 이상</option>
			    </select>
			    <select name="martGender" id="mateGender" style="border-radius:5px;height:28px;">
						<option value="">성별</option>
						<option value="여성">여성</option>
						<option value="남성">남성</option>
						<option value="아무나 환영">아무나 환영</option>
				</select>
				<select name="mateNum" id="mateNum" style="border-radius:5px;height:28px;">
			        <option value="">인원수</option>
			        <option value="1명">1명</option>
			        <option value="5명 이하">5명 이하</option>
			        <option value="10명 이하">10명 이하</option>
			        <option value="15명 이하">15명 이하</option>
				</select>
		    </td>
			</tr>
		   <tr id="mateUpdate-tr1">
		       <td colspan="7">
		       <textarea style="border-radius:5px" name="mateContent" id="mateContent" cols="80" rows="10">${mate.mateContent }</textarea>
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
<%@ include file="/WEB-INF/views/common/footer.jsp"%>