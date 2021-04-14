<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<link rel="stylesheet" href="${path}/resources/css/cscenter.css">

<div class="col" style="border:1px solid black;" >
        <p>고객센터</p>
        
        <div class="list" style="border:1px solid black;" >
            <ul class="bls_tbls c3">
                <li class="active"><a href="${path}/help/csmain" id="poster">자주묻는질문(FAQ)</a></li>
                <li><a href="${path}/help/notice" id="perf">공지사항</a></li>
                <li><a href="${path}/help/qnalist" id="refund">1:1문의</a></li>
            </ul>
        </div>
        
              <h3>공지사항</h3>
        
              
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
            </table>
        </div>
                      
    </div>



<%@ include file="/WEB-INF/views/common/footer.jsp"%>