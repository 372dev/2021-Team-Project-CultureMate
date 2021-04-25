<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<link rel="stylesheet" href="${path}/resources/css/cscenter.css">
<style>
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
	background:#f8f8f8  no-repeat center center;
	margin-left:0;
}
.page_nation .prev {
	background:#f8f8f8 no-repeat center center;
	margin-right:7px;
}
.page_nation .next {
	background:#f8f8f8 no-repeat center center;
	margin-left:7px;
}
.page_nation .nnext {
	background:#f8f8f8  no-repeat center center;
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
              <a class="nav-link" href="${path}/help/csmain" id="poster">자주묻는질문(FAQ)</a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" style="background-color: #6C757D;" href="${path}/help/notice" id="perf">공지사항</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="${path}/help/qnalist" id="refund">Q&A</a>
            </li>
          </ul>
          
            <hr>
        
        
        <div class="table-responsive noticelist">
            <table class="table table-hover noticelist" >
                 <tr>
                  <th>분류</th>
                  <th>제목</th>
                  <th>작성자</th>
                </tr>
                <c:if test="${notice == null}">
                <tr>
                   <td colspan="6">
                    조회된 게시글이 없습니다.
                   </td>
                </tr>	
                </c:if>
                <c:if test="${notice != null}">
                    <c:forEach var="notice" items="${notice}">
                      <tr>
                        <td>
                         <c:out value="${notice.csboardKind}"/>
                        </td>
                        <td>
                        <a href="#">
                        <c:out value="${notice.csboardTitle}"/>
                        </a>
                        </td>
                        <td>
                        내용
                        </td>
                      </tr>
                    </c:forEach>
                </c:if>
                <tr>
                  <td>
                    공연
                  </td>
                  <td>
                    <a href="#" style = color:black;>
                    [티켓오픈]시카고 티켓 오픈 안내
                    </a>
                  </td>
                  <td>
                    관리자
                  </td>
                </tr>
                <tr>
                  <td>
                    공연
                  </td>
                  <td>
                  <a href="#"style = color:black;>
                    [티켓오픈]시크릿 쥬쥬 별의 여신 뮤지컬 시즌2 티켓오픈 안내
                    </a>
                  </td>
                  <td>
                    관리자
                  </td>
                </tr>
                <tr>
                   <td>
                    메이트/소모임
                  </td>
                  <td>
                    <a href="#" style = color:black;>
                    티켓 나눔 관련 공지사항
                    </a>
                  </td>
                  <td>
                    관리자
                  </td>
                </tr>
                <tr>
                   <td>
                    공연
                  </td>
                  <td>
                    <a href="#" style = color:black;>
                    [티켓오픈]마마,돈크라이 티켓오픈 예정
                    </a>
                  </td>
                  <td>
                    관리자
                  </td>
                  <tr>
                   <td>
                    공연
                  </td>
                  <td>
                    <a href="#" style = color:black;>
                    [단독판매]광주국악상설공연 5월 티켓오픈 안내
                    </a>
                  </td>
                  <td>
                    관리자
                  </td>
                </tr>
                <tr>
                   <td>
                    공연
                  </td>
                  <td>
                    <a href="#" style = color:black;>
                    뮤지컬 [마지막 사건] 추가오픈 안내
                    </a>
                  </td>
                  <td>
                    관리자
                  </td>
                </tr>
            </table>
            
      <div  class="page_wrap">
		    <div  class="page_nation">
		    
                <!-- 맨 처음으로 -->
			<a class="arrow pprev">&lt;&lt;</a>
			
			<!-- 이전 페이지로 -->
			<a class="arrow prev" >&lt;</a>

			<!--  10개 페이지 목록 -->
					<a class="active">1</a>

			<a class="arrow next">&gt;</a>
			
			<!-- 맨 끝으로 -->
			<a class="arrow nnext">&gt;&gt;</a>
			</div>
		  </div>
        </div>
                      
    </div>



<%@ include file="/WEB-INF/views/common/footer.jsp"%>