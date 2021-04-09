<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<c:set var="path" value="${pageContext.request.contextPath}" />
<style>
  #shareSection {
	     min-height: 800px;
	     width: 1280px;
	     margin: 0 auto;
 
 
	}
    #shareUpdate-container{ 
        text-align: center;
		margin: 0 auto;
		width: 1000px;
		height: 800px;
   
    }
    #shareTitle{
        text-align: left;
    }
    #shareUpdate-frm{
        text-align: center;    
        border: 1px;
        border-radius: 10px;
        margin: auto;      
    }
  
    #shareUpdate-tbl{
    	border-collapse: collapse;
	    text-align: center;       
        margin: 0 auto;
    }
    #shareUpdate-tr{
    	border-bottom: 1px solid lightgray;
     	border-top: 1px solid lightgray;
    }
    #shareUpdate-tr>td{
    	padding: 5px;
    }
    #shareUpdate-tr>td:nth-child(4){
    	width: 300px;
    }
    #shareUpdate-tr>td:nth-child(6){
    	width: 100px;
    }
    #shareUpdate-tr1>td{
    	padding: 5px;
    }
      #shareButton{
     	height:35px;
	  	border: none;
		border-radius: 5px;
		background: yellowgreen;
		color: white;
  }	
   
</style>
</head>
<body>
<section id="shareSection">
       
		    <div id="shareUpdate-container">
		        <div id="shareTitle">
			       <h1>티켓 나눔</h1>
			        <h4>&nbsp; - 공연 티켓 괌</h4>
		    	</div>
		    <hr>
		    <form action="${path}/share/update" id="shareUpdate-frm" method="post" enctype="multipart/form-data">
			    <input type="hidden" name="shareId" value = "${share.shareId}">
				<input type="hidden" name="shareOriginalFileName" value = "${share.shareOriginalFileName}">
				<input type="hidden" name="shareRenamedFileName" value = "${share.shareRenamedFileName}">
			
	     	<table id="shareUpdate-tbl">
			 <tr id="shareUpdate-tr">
		            <td>${share.shareId}번호</td>		           
		            <td>
			        <select style="border-radius:5px;height:28px;" name="shareShow" id="shareShow">
			            <option value="뮤지컬">뮤지컬</option>
			            <option value="연극">연극</option>
			            <option value="클래식">클래식</option>
			        </select>
			    	</td>
			    	<td>
					   <select style="border-radius:5px;height:28px;" name="shareOpen" id="shareOpen">
					            <option value="나눔중">나눔중</option>
					            <option value="나눔완료">나눔완료</option>
					    </select>
					</td>
		            <td><input style="border-radius:5px;height:28px;border:1px solid" type="text" name="shareTitle" id="shareTitle" value="${share.shareTitle }" ></td>		            
		            <td>
		        		<input style="border-radius:5px;height:28px;border:1px solid;width:80px;" type="text" name="userNick" id="userNick" value="${loginMember.userNick }" readonly>
		        	</td>          
		            <td>${share.shareCreateDate}날짜</td>	           
		            <td>${share.shareCount}조회수</td>			            
		        </tr>
		<tr id="shareUpdate-tr1">
	        <td colspan="7">티켓 인증 올리기</td>			        
	    </tr>
   	     <tr id="shareUpdate-tr1">
	        <td colspan="7">
	        	<input style="height:28px;" type="file" name="reloadFile">
        	<c:if test="${ !empty share.shareOriginalFileName }">
				<br>현재 업로드한 파일 : 
				<a href="${ path }/resources/upload/board/${ share.shareRenamedFileName }" download="${ share.shareOriginalFileName }">
					${ share.shareOriginalFileName }
				</a>
		   </c:if>
        	</td>
	     </tr>
		  <tr id="shareUpdate-tr1">
		       <td colspan="7">
		       <textarea style="border-radius:5px;" name="shareContent" id="shareContent" cols="80" rows="10">${share.shareContent}</textarea>
		       </td>
		</tr>
		</table>
		<br>
			<button id="shareButton" type="submit" value="수정학기">수정하기</button>&nbsp;
		    <button id="shareButton" type="button" onclick="location.replace('${path}/share/list')">목록으로</button>&nbsp;		
		    <button id="shareButton" type="button" onclick="history.back()">취소하기</button>
		</form>
	 </div>	
</section>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>