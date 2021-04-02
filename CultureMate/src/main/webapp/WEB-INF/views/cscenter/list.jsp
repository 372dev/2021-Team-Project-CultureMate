<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link rel="stylesheet" href="${path}/resources/css/cscenter.css">

<div class="cs-container" >
   <h1>고객센터</h1>
    <div class="btn_menu"> 
      <input type="button" class="cs_que" value="자주 묻는 질문">
      <input type="button" class="cs_sug" value="제안하기">
      <input type="button" class="cs_inq" value="1:1문의">
      <input type="button" class="cs_faq" value="FAQ">
     </div>
    
    <div class="notice">
        <pre>
        궁금한 내용은 1:1문의를 이용해 주세요.
        평일오전 9시~ 6시 (공휴일 제외)
        02-1111-2222
        </pre>
    </div>
     
    <input type="text" class="text_ser" ><button type="submit">검색</button>
    <hr>

    <h5>자주 묻는 질문 TOP5</h5>

    <table class="Que_content1" border="1" width="500px"> 
            <tr>
              <thead>
                <th>번호</th>
                <th>분류</th>
                <th>제목</th>
            </tr>
              </thead>
              <tbody>
            <tr>
                <th>내용</th>
                <th>내용</th>
                <th>내용</th>
            </tr>
            <tr>
                <th>내용</th>
                <th>내용</th>
                <th>내용</th>
            </tr>
            <tr>
                <th>내용</th>
                <th>내용</th>
                <th>내용</th>
            </tr>
            <tr>
                <th>내용</th>
                <th>내용</th>
                <th>내용</th>
            </tr>
            <tr>
                <th>내용</th>
                <th>내용</th>
                <th>내용</th>
            </tr>
        </tbody>
    </table>

    <div class="btn_menu2"> 
        <input type="button" class="cs_all" value="전체보기">
        <input type="button" class="cs_return" value="환불">
        <input type="button" class="cs_buy" value="구매/결제">
        <input type="button" class="cs_book" value="예약">
        <input type="button" class="cs_mate" value="메이트/소모임">
        <input type="button" class="cs_etc" value="기타">
      </div>

      <table class="que_content2" border="1" width="500px">
        <tr>
            <th>번호</th>
            <th>분류</th>
            <th>제목</th>
        </tr>
        <tr>
            <th>내용</th>
            <th>내용</th>
            <th>내용</th>
        </tr>
        <tr>
            <th>내용</th>
            <th>내용</th>
            <th>내용</th>
        </tr>
        <tr>
            <th>내용</th>
            <th>내용</th>
            <th>내용</th>
        </tr>
        <tr>
            <th>내용</th>
            <th>내용</th>
            <th>내용</th>
        </tr>
        <tr>
            <th>내용</th>
            <th>내용</th>
            <th>내용</th>
        </tr>
     </table>
  <input type="submit" value="나의 1:1 문의보기">
 </div>




<%@ include file="/WEB-INF/views/common/footer.jsp"%>