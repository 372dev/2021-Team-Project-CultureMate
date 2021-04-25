<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<c:set var="path" value="${pageContext.request.contextPath}" />
<style>
     #shareSection {
	     min-height: 600px;
	     width: 1280px;
	     margin: 0 auto;
	     
	}
    #shareList-container{ 
        text-align: center;
		margin: 0 auto;
		width: 1000px;
		height: 600px;
   
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
    #share-Search1{
    	float: left;
    }
    #share-Search2{
    	text-align: right;
    }
    #shareList-frm{
        text-align: center;    
        margin: auto;      
    }
  
    #shareList-tbl{       
        border-collapse: collapse;
	    border-spacing: 0 7px;
	    text-align: center;       
        margin: 0 auto;
    }
    #shareList-tr{
    	border-bottom: 1px solid lightgray;
     	border-top: 1px solid lightgray;
    }
    #shareList-tr>td:nth-child(4){
    	width: 300px;
    }
    #shareList-tr>td:nth-child(6){
    	width: 200px;
    }
    #shareList-tr>td{
    	padding: 6px;
    	width:100px;
    }
     .searchButton{
       vertical-align: top;
    }
</style>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/0fe4d45686.js"
		crossorigin="anonymous"></script>
<section id="shareSection">
	<div id="shareList-container">
		<div id="share-Title">
			        <a href="${path}/share/list"><h1 style="font-size: 48pt;">티켓나눔</h1></a>
			        <h2>- 공연 티켓 괌</h4>		 
		    	</div>
		   <div id="share-Search">
		 <div id="share-Search1">
		 	 <c:if test="${loginMember != null}">
			<button type="button" id="btn-insert" style="border-radius:5px;border:0.5px solid;height:30px;width:70px;font-size:10pt;background-color: #6c757d; color:white;"
			onclick="location.href ='${path}/share/write'">글쓰기</button>
		</c:if>
		 </div>   	
 <div id="share-Search2">
	<form name="form1" method="post" action="${path}/share/list.do">
		<select name="search" style="border-radius:5px;height:30px;">
            	<option value="userNick"${pageInfo.search eq 'userNick'? 'selected' : '' }>
            		작성자</option>
            	<option value="shareTitle" ${pageInfo.search eq 'shareTitle'? 'selected' : '' }>
            		제목</option>
            	<option value="shareContent"${pageInfo.search eq 'shareContent'? 'selected' : '' }>
            		내용</option>
	 		</select> 
	 		 <input style="border-radius:5px;border:0.5px solid;height:30px;" type="text" name="keyword" placeholder="내용을 입력하세요" value="${pageInfo.keyword }">
		     <input class="searchButton" id="searchButton" type="submit" onclick="$('form1').submit()" style="border-radius:5px;border:0.5px solid;height:30px;width:50px;font-size:10pt;background-color: #6c757d; color:white;" value="검색"></input>      
	</form>     	 	 
</div>      
</div> 			    	
		    <hr>		
		<table id="shareList-tbl">
			<tr id="shareList-tr">
				<td>번호</td>							
				<td>분류</td>
				<td>나눔상태</td>	
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>조회수</td>
			</tr>
            <c:if test="${shareList == null}">
				<tr id="shareList-tr">
					<td colspan="7">
						조회된 게시글이 없습니다.
					</td>
				</tr>	
			</c:if>
			<c:if test="${shareList != null}"> 
				<c:forEach var="share" items="${shareList}">
					<c:if test="${share.shareOpen == '나눔완료'}">
					<tr id="shareList-tr" style="background-color: #f2f2f7;color:#c7c7c9;">
						<td><c:out value="${share.shareId}"/></td>				
                        <td><c:out value="${share.shareShow}"/></td>
                        <td><span><c:out value="${share.shareOpen }"/></span></td>
						<td>
							<a style="text-decoration: none;color:#c7c7c9;" href="${path}/share/view?shareId=${share.shareId}">
								<c:out value="${share.shareTitle}"/>
							</a>
						</td>
                        <td><c:out value="${share.userNick}"/></td>
                        <td><fmt:formatDate value="${share.shareCreateDate}" pattern="yy/MM/dd HH:mm:ss"/></td>
                        <td><c:out value="${share.shareCount}"/></td>
                     </tr>
                   </c:if>
                   <c:if test="${share.shareOpen != '나눔완료'}">
                   <tr id="shareList-tr">
						<td><c:out value="${share.shareId}"/></td>				
                        <td><c:out value="${share.shareShow}"/></td>
                        <td><span><c:out value="${share.shareOpen }"/></span></td>
						<td>
							<a style="text-decoration: none;color:black;" href="${path}/share/view?shareId=${share.shareId}">
								<c:out value="${share.shareTitle}"/>
							</a>
						</td>
                        <td><c:out value="${share.userNick}"/></td>
                        <td><fmt:formatDate value="${share.shareCreateDate}" pattern="yy/MM/dd HH:mm:ss"/></td>
                        <td><c:out value="${share.shareCount}"/></td>
                     </tr>
                     </c:if>
                </c:forEach>
              </c:if>
          </table>              
			
		<br>
		<div id="pageBar">
			<!-- 맨 처음으로 -->
			<button type="button" class="btn btn-light btn-sm" onclick="location.href='${path}/share/list?page=1'"><i class="fas fa-angle-double-left"></i></button>
			
			<!-- 이전 페이지로 -->
			<button type="button" class="btn btn-light btn-sm" onclick="location.href='${path}/share/list?page=${pageInfo.prvePage}'"><i class="fas fa-angle-left"></i></button>

			<!--  10개 페이지 목록 -->
			<c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}" step="1" varStatus="status">
				<c:if test="${status.current == pageInfo.currentPage}">
					<button type="button" class="btn btn-light btn-sm"  style="height:25px;font-size:7pt;font-weight:bold;" disabled><c:out value="${status.current}"/></button>
   				</c:if>
				<c:if test="${status.current != pageInfo.currentPage}">
					<button type="button" class="btn btn-light btn-sm"  style="height:25px;font-size:7pt;font-weight:bold;" onclick="location.href='${path}/share/list?page=${status.current}'"><c:out value="${status.current}"/></button>
   				</c:if>
			</c:forEach>
			
			<!-- 다음 페이지로 -->
			<button type="button" class="btn btn-light btn-sm" onclick="location.href='${path}/share/list?page=${pageInfo.nextPage}'"><i class="fas fa-angle-right"></i></button>
			
			<!-- 맨 끝으로 -->
			<button type="button" class="btn btn-light btn-sm" onclick="location.href='${path}/share/list?page=${pageInfo.maxPage}'"><i class="fas fa-angle-double-right"></i></button>
		</div>
  </div>
</section>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>