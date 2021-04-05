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
    #shareList-container{ 
        text-align: center;
		margin: 0 auto;
		width: 1000px;
		height: 800px;
   
    }
    #share-Title{
        text-align: left;
    }
    #share-Search{
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
    #shareList-tr>td{
    	padding: 15px;
    	width:80px;
    }
</style>
<section id="shareSection">
	<div id="shareList-container">
		<div id="share-Title">
			        <h1>티켓 나눔</h1>
			        <h4>&nbsp; - 공연 티켓 괌</h4>
		    	</div>
		 <div id="share-Search">
		<select id="searchShare" style="border-radius:5px;height:30px;">
            	<option value="작성자">작성자</option>
            	<option value="제목">제목</option>
           		<option value="내용">내용</option>
	 	</select> 
      		 <input style="border-radius:5px;border:0.5px solid;height:30px;" type="text" id="searchText" placeholder="내용을 입력하세요">
     	 	   <button style="border-radius:5px;border:0.5px solid;height:30px;width:50px;font-size:10pt;background-color: #6c757d; color:white;" onclick="search();">검색</button>      
		</div>      
		    	
		    <hr>		
		<table id="shareList-tbl">
			<tr id="shareList-tr">
				<td>번호</td>							
				<td>분류</td>
				<td>나눔상태</td>	
				<td>제목</td>
				<td>작성자</td>
				<td>날짜</td>
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
					<tr id="shareList-tr">
						<td><c:out value="${share.shareId}"/></td>
						<td><c:out value=" ${share.shareOpen }"/></td>
                        <td><c:out value="${share.shareShow}"/></td>
						<td>
							<a href="${path}/mate/view?shareId=${share.shareId}">
								<c:out value="${share.shareTitle}"/>
							</a>
						</td>
                        <td><c:out value="${share.userNick}"/></td>
                        <td><c:out value="${share.shareCreateDate}"/></td>
                        <td><c:out value="${share.count}"/></td>
                     </tr>
                </c:forEach>
              </c:if>
          </table>              
			 <c:if test="${loginMember != null}">
			<button type="button" id="btn-insert"
			onclick="location.href ='${path}/share/write'">글쓰기</button>
		</c:if>
		<br>
		<div id="pageBar">
			<!-- 맨 처음으로 -->
			<button onclick="location.href='${path}/share/list?page=1'">&lt;&lt;</button>
			
			<!-- 이전 페이지로 -->
			<button onclick="location.href='${path}/share/list?page=${pageInfo.prvePage}'">&lt;</button>

			<!--  10개 페이지 목록 -->
			<c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}" step="1" varStatus="status">
				<c:if test="${status.current == pageInfo.currentPage}">
					<button disabled><c:out value="${status.current}"/></button>
   				</c:if>
				<c:if test="${status.current != pageInfo.currentPage}">
					<button onclick="location.href='${path}/share/list?page=${status.current}'"><c:out value="${status.current}"/></button>
   				</c:if>
			</c:forEach>
			
			<!-- 다음 페이지로 -->
			<button onclick="location.href='${path}/share/list?page=${pageInfo.nextPage}'">&gt;</button>
			
			<!-- 맨 끝으로 -->
			<button onclick="location.href='${path}/share/list?page=${pageInfo.maxPage}'">&gt;&gt;</button>
		</div>
  </div>
</section>
<script type="text/javascript">
function search() {
	var searchShare = document.getElementById("searchMate").value;
	var page = document.getElementById("pageInfo").value;
	var searchText = document.getElementById("searchText").value;
	
	if(searchMate === '작성자'){
		location.href="${path}/share/list?userNick="+ searchText+ "&page=" + page ;	
	}else if(searchMate === '제목'){
		location.href="${path}/share/list?mateTitle="+ searchText+ "&page=" + page ;	
	}else{
		location.href="${path}/share/list?mateContent="+ searchText+ "&page=" + page ;	
	}
}
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>