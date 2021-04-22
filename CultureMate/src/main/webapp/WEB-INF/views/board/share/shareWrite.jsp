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
    #shareWrite-container{ 
        text-align: center;
		margin: 0 auto;
		width: 1000px;
		height: 900px;
   
    }
    #share-Title{
        text-align: left;
        font-family: 'Do Hyeon', sans-serif; 
    }
     #share-Title > a{
   	color: black;
   	text-decoration:none; 
 	       
    }
    #share-Title > h2 {
    	text-decoration:line-through #b7ba41;
    	margin-left:100px;
    }
    #shareWrite-frm{
        text-align: center;    
        border: 1px;
        border-radius: 10px;
        margin: auto;      
    }
  
    #shareWrite-tbl{ 
	    border-collapse: separate;
	    border-spacing: 0 5px;
	    text-align: center;    
        margin: auto;       
    }
     #shareWrite-tr1>td:nth-child(3){
     	width: 100px;
     }
   #shareWrite-tr1>td{
   	   padding: 5px;
   	   width: 50px;
   }
     #shareButton{
     height:35px;
  	 border: none;
	 border-radius: 5px;
	 background: #9db81f;
	 color: white;
  }	
   
</style>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<section id="shareSection">
       
		    <div id="shareWrite-container">
		        <div id="share-Title">
			       <a href="${path}/share/list"><h1 style="font-size: 48pt;">티켓나눔</h1></a>
			        <h2>- 공연 티켓 괌</h4>	
		    	</div>
		    <hr>
		    <form action="${path}/share/write" id="shareWrite-frm" method="post" enctype="multipart/form-data" >
		     <table id="shareWrite-tbl">
		        <tr id="shareWrite-tr1">
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
		            <td><input style="border-radius:5px;height:28px;border:1px solid" type="text" name="shareTitle" id="shareTitle" placeholder="제목을 입력해주세요." ></td>		            
		            <td>
		        		<input style="border-radius:5px;height:28px;border:1px solid;width:80px;" type="text" name="userNick" id="userNick" value="${loginMember.userNick }" readonly>
		        	</td>
		        </tr>
			  <tr id="shareWrite-tr1">
			        <td colspan="4">티켓 인증 올리기</td>			        
			    </tr>
			  <tr id="shareWrite-tr1">
			  	<td colspan="4">
		        	<input style="height:28px;" type="file" name="upfile">
	        	</td>
			  </tr>  
		   <tr id="shareWrite-tr1">
		       <td colspan="4">
		       <textarea style="resize: none;border-radius:5px;" name="shareContent" id="shareContent" cols="80" rows="10"></textarea>
		    </td>
		</tr>
		</table>
		<br>
			<input id="shareButton" type="submit" value="등록하기"></input> &nbsp;
		    <input id="shareButton" type="button" onclick="location.replace('${path}/share/list')" value="목록으로"></input>
		</form>
	 </div>	
</section>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>