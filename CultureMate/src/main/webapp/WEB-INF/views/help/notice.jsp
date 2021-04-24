<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<link rel="stylesheet" href="${path}/resources/css/cscenter.css">

<div class="col">
        <p>고객센터</p>
        
         <ul class="nav nav-pills nav-fill">
            <li class="nav-item">
              <a class="nav-link" href="${path}/help/csmain" id="poster">자주묻는질문(FAQ)</a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" href="${path}/help/notice" id="perf">공지사항</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="${path}/help/qnalist" id="refund">Q&A</a>
            </li>
          </ul>
        
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
                <tr>
                  <td>
                    공연
                  </td>
                  <td>
                    <a href="#">
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
                  <a href="#">
                    시크릿 쥬쥬 별의 여신 뮤지컬 시즌2 티켓오픈 안내
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
                    <a href="#">
                    티켓 나눔 관련 공지사항
                    </a>
                  </td>
                  <td>
                    관리자
                  </td>
                </tr>
            </table>
        </div>
                      
    </div>



<%@ include file="/WEB-INF/views/common/footer.jsp"%>