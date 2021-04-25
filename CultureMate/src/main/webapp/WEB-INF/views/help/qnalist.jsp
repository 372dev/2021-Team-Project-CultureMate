<%@page import="com.kh.cm.qna.model.vo.QnaBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<link rel="stylesheet" href="${path}/resources/css/cscenter.css">

<script src="https://kit.fontawesome.com/4d8c9a2b0b.js" crossorigin="anonymous"></script>
<style>
 nav {
    width: 100%;
    background: white;
    border: 1px solid black;
    margin-top: 30px;
    /* border-right: none; */
  }

  nav ul {
    overflow: hidden;
    margin: 0;
    padding: 0;
  }

  nav ul li {
    list-style: none;
    float: left;
    text-align: center;
    border-left: 1px solid #fff;
    border-right: 1px solid #ccc;
    width: 16.6667%; /* fallback for non-calc() browsers */
    width: calc(100% / 6);
    box-sizing: border-box;
    inline-size: 50%;
  }

  nav ul li:first-child {
    border-left: none;
  }

  nav ul li a {
    display: block;
    text-decoration: none;
    color: #616161;
    padding: 10px 0;
  }
  .qnalist{
    margin-top: 30px;
  }
   .page_wrap {
	text-align:center;
	font-size:0;
 }
.page_nation {
	display:inline-block;
}
.page_nation .none {
	display:none;
}
.page_nation a {
	display:block;
	margin:0 3px;
	float:left;
	border:1px solid #e6e6e6;
	width:28px;
	height:28px;
	line-height:28px;
	text-align:center;
	background-color:#fff;
	font-size:13px;
	color:#999999;
	text-decoration:none;
}
.page_nation .arrow {
	border:1px solid #ccc;
}
.page_nation .pprev {
	background:#f8f8f8 url('img/page_pprev.png') no-repeat center center;
	margin-left:0;
}
.page_nation .prev {
	background:#f8f8f8 url('img/page_prev.png') no-repeat center center;
	margin-right:7px;
}
.page_nation .next {
	background:#f8f8f8 url('img/page_next.png') no-repeat center center;
	margin-left:7px;
}
.page_nation .nnext {
	background:#f8f8f8 url('img/page_nnext.png') no-repeat center center;
	margin-right:0;
}
.page_nation a.active {
	background-color:#42454c;
	color:#fff;
	border:1px solid #42454c;
}


</style>

<div class="col">
	<p>고객센터</p>
	
	<ul class="nav nav-pills nav-fill">
    <li class="nav-item">
    <a class="nav-link" href="${path}/help/csmain">자주묻는질문(FAQ)</a>
    </li>
    <li class="nav-item">
    <a class="nav-link" href="${path}/help/notice ">공지사항</a>
    </li>
    <li class="nav-item">
    <a class="nav-link active" style="background-color: #6C757D;" href="${path}/help/qnalist">Q&A</a>
    </li>
    </ul>
    
      <nav class="qnalsit">
        <ul class="qnaul">
          <li class="qnalist1"><a href="${path}/help/qnalist">Q&A 게시판</a></li>
          <li class="qnalist2"><a href="${path}/help/qnacontent">문의하기</a></li>
        </ul>
      </nav>

    <div class="table-responsive qnalist">
      <table class="table table-hover qnalist" >
          <tr>
              <th>문의</th>
              <th>제목</th>
              <th>작성자</th>
          </tr>
         <c:if test="${qnalist == null}">
				<tr>
					<td colspan="6">
						조회된 게시글이 없습니다.
					</td>
				</tr>	
			</c:if>

			<c:if test="${qnalist != null}">
			  <c:forEach var="qnalist" items="${qnalist}">
          <tr>
             <td>
             <c:out value="${qnalist.qnaType}"/>
             </td>
             <td>
              <c:if test="${qnalist.qnaOpenStatus eq 'N'}" >
                <c:choose>
                <c:when test="${qnalist.userId eq loginMember.userId || loginMember.userRole eq 'ROLE_ADMIN'}">
                   <a href="${path}/help/qnaview?qnaId=${qnalist.qnaId}" style=color:black;><i class="fas fa-lock"></i> <c:out value="${qnalist.qnaTitle}"/></a>
                </c:when>
                <c:otherwise><i class="fas fa-lock"></i> 비밀글은 작성자와 관리자만 볼 수 있습니다.</c:otherwise>
                </c:choose>
             </c:if>
             <c:if test="${qnalist.qnaOpenStatus eq 'Y'}" >
                <a href="${path}/help/qnaview?qnaId=${qnalist.qnaId}" style = color:black;>
                 <i class="fas fa-lock-open"></i> <c:out value="${qnalist.qnaTitle}"/>
                </a>
             </c:if>
             </td>
             <td>
              <c:out value="${qnalist.userId}"/>
             </td>
             </tr>
          </c:forEach>
         </c:if>
      </table>
    </div>
    
    <div id="pageBar" class="page_wrap">
        <div class="page_nation">
			<!-- 맨 처음으로 -->
			<a onclick="location.href='${path}/help/qnalist?page=1'" class="arrow pprev">&lt;&lt;</a>
			
			<!-- 이전 페이지로 -->
			<a onclick="location.href='${path}/help/qnalist?page=${pageInfo.prvePage}'" class="arrow prev" >&lt;</a>

			<!--  10개 페이지 목록 -->
			<c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}" step="1" varStatus="status">
				<c:if test="${status.current == pageInfo.currentPage}">
					<a disabled class="active"><c:out value="${status.current}"/></a>
   				</c:if>
				<c:if test="${status.current != pageInfo.currentPage}">
					<a onclick="location.href='${path}/help/qnalist?page=${status.current}'" class="active"><c:out value="${status.current}"/></a>
   				</c:if>
			</c:forEach>
			
			<!-- 다음 페이지로 -->
			<a onclick="location.href='${path}/help/qnalist?page=${pageInfo.nextPage}'" class="arrow next">&gt;</a>
			
			<!-- 맨 끝으로 -->
			<a onclick="location.href='${path}/help/qnalist?page=${pageInfo.maxPage}'" class="arrow nnext">&gt;&gt;</a>
		</div>
	</div>

 </div>  
 

<%@ include file="/WEB-INF/views/common/footer.jsp"%>















