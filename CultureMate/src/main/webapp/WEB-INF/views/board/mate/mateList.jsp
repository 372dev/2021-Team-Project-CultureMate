<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<c:set var="path" value="${pageContext.request.contextPath}" />
<style>
     #mateSection {
	     min-height: 800px;
	     width: 1280px;
	     margin: 0 auto;
	}
    #mateList-container{ 
        text-align: center;
		margin: 0 auto;
		width: 1000px;
		height: 900px;
   
    }
    #mate-Title{
        text-align: left;
    }
    #mate-Search{
    	text-align: right;
    }
     #mate-Search1{
    	float: left;
    }
    #mate-Search2{
    	text-align: right;
    }
    #mateList-frm{
        text-align: center;    
        margin: auto;      
    }
  
    #mateList-tbl{           
        border-collapse: collapse;	   
	    text-align: center;       
        margin: 0 auto;
    }
    #mateList-tr{
   		border-bottom: 1px solid lightgray;
     	border-top: 1px solid lightgray;
    }
    #mateList-tr>td:nth-child(8){
    	width: 300px;
    }
    #mateList-tr>td:nth-child(3){
    	width: 130px;
    }
    #mateList-tr>td:nth-child(4){
    	width: 150px;
    }
    #mateList-tr>td:nth-child(6){
    	width: 130px;
    }
    #mateList-tr>td:nth-child(10){
    	width: 200px;
    }
    #mateList-tr>td{
    	padding: 6px;
    	width:80px;
    }
    .searchButton{
       vertical-align: top;
    }
    
 
</style>
<section id="mateSection">
	
	<div id="mateList-container">
		<div id="mate-Title">
			        <h1>같이 가요</h1>
			        <h4>&nbsp; - 같이 갈 메이트 괌</h4>
		    	</div>
		 <div id="mate-Search">
		 <div id="mate-Search1">
		 	 <c:if test="${loginMember != null}">
			<button type="button" id="btn-insert" style="border-radius:5px;border:0.5px solid;height:30px;width:70px;font-size:10pt;background-color: #6c757d; color:white;"
			onclick="location.href ='${path}/mate/write'">글쓰기</button>
		</c:if>
		 </div>   	
 <div id="mate-Search2">
	<form name="form1" method="post" action="${path}/mate/list.do">
		<select name="search" style="border-radius:5px;height:30px;">
            	<option value="userNick" ${pageInfo.search eq 'userNick'? 'selected' : '' }>
            			작성자</option>
            	<option value="mateTitle" ${pageInfo.search eq 'mateTitle'? 'selected' : '' }>
            			제목</option>
            	<option value="mateContent" ${pageInfo.search eq 'mateContent'? 'selected' : '' }>
            			내용</option>
	 		</select> 
	 		 <input style="border-radius:5px;border:0.5px solid;height:30px;" type="text" name="keyword" placeholder="내용을 입력하세요" value="${pageInfo.keyword }">
		     <input class="searchButton" id="searchButton" type="submit"  style="border-radius:5px;border:0.5px solid;height:30px;width:50px;font-size:10pt;background-color: #6c757d; color:white;" value="검색" onclick="$('form1').submit()"></input>      
		</form>     	 	 
	</div>      
</div> 			    	
		    	
		    <hr>		
		<table id="mateList-tbl">
			<tr id="mateList-tr">
				<td>번호</td>
				<td>분류</td>
				<td>모집상태</td>			
				<td>모집성별</td>
				<td>연령대</td>
				<td>인원수</td>
				<td>지역</td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>조회수</td>
			</tr>
            <c:if test="${mateList == null}">
				<tr id="mateList-tr">
					<td colspan="11">
						조회된 게시글이 없습니다.
					</td>
				</tr>	
			</c:if>
			<c:if test="${mateList != null}">
			<c:forEach var="mate" items="${mateList}">
					<tr id="mateList-tr">
						<td><c:out value="${mate.mateId}"/></td>
						<td><c:out value="${mate.mateShow}"/></td>
                        <td><c:out value="${mate.mateOpen}"/></td>
                        <td><c:out value="${mate.mateGender}"/></td>
                        <td><c:out value="${mate.mateAge}"/></td>
                        <td><c:out value="${mate.mateNum}"/></td>
                        <td><c:out value="${mate.mateLoc}"/></td>
						<td>
							<a href="${path}/mate/view?mateId=${mate.mateId}">
								<c:out value="${mate.mateTitle}"/>
							</a>
						</td>
						<td><c:out value="${mate.userNick}"/></td>
					<td><fmt:formatDate value="${mate.mateCreateDate}" pattern="yy/MM/dd HH:mm:ss"/></td>                     
                        <td><c:out value="${mate.mateCount}"/></td>
                        </tr>
                        </c:forEach>
                     </c:if>    
                 </table>
		<br>
		<div id="pageBar">
			<!-- 맨 처음으로 -->
			<button onclick="location.href='${path}/mate/list?page=1'">&lt;&lt;</button>
			
			<!-- 이전 페이지로 -->
			<button onclick="location.href='${path}/mate/list?page=${pageInfo.prvePage}'">&lt;</button>

			<!--  10개 페이지 목록 -->
			<c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}" step="1" varStatus="status">
				<c:if test="${status.current == pageInfo.currentPage}">
					<button disabled><c:out value="${status.current}"/></button>
   				</c:if>
				<c:if test="${status.current != pageInfo.currentPage}">
					<button onclick="location.href='${path}/mate/list?page=${status.current}'"><c:out value="${status.current}"/></button>
   				</c:if>
			</c:forEach>
			
			<!-- 다음 페이지로 -->
			<button onclick="location.href='${path}/mate/list?page=${pageInfo.nextPage}'">&gt;</button>
			
			<!-- 맨 끝으로 -->
			<button onclick="location.href='${path}/mate/list?page=${pageInfo.maxPage}'">&gt;&gt;</button>
		</div>		
  </div>
 <!-- 
  <script type="text/javascript">
  $(document).ready(function(){
	
	  $('table tr').css("backgroundColor","#f5f5fc"); 
	  
	
	
	});
  </script>	
   --> 		
</section>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>