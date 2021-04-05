<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/cscenter/csmain.jsp"%>
<link rel="stylesheet" href="${path}/resources/css/cscenter.css">
    
    <div class="container3">

      <h5>나의 문의내역</h5>

      <nav>
        <ul>
          <li><a href="#">문의내역</a></li>
          <li><a href="#">문의하기</a></li>
          
        </ul>
      </nav>

       <hr>

       <h3>1:1 문의</h3>

       <div class="cs_qna">
           <div class="qnalist">
               <label style="font-size: large;">문의유형</label>
              
                   <select name="national">
                       <option selected>문의유형선택</option>
                           <option value="ko">환불</option>
                           <option value="ch">구매/결제</option>
                           <option value="jp">예약</option>
                           <option value="jp">메이트/소모임</option>
                           <option value="jp">기타</option>
                   </select>
           </div>

           <div class="qnaname">
               <label style="font-size: large;"  >문의제목</label>
               <input type="text"  name="rev_id">
           </div>

      
           <div id="msgBody" class="qnacontent">
               <textarea cols="90" rows="15" placeholder="내용을 입력해주세요."></textarea>
           </div>
      </div>
      
           <hr>

      <div class="qnaagree">
        <pre>
          수집하는 개인정보[(필수)이메일, 문의내용],[(선택)첨부파일]눈 문의 내용처리 및 처리 및
          고객 불만의 해결을위해 사요외며, 관련 법령에 따라 3년간 보관후 삭제됩니다.
          문의 접수, 처리 및 회신을 위한 필욫최소산의 개인정보이므로 동의를 해주셔야 
          서비스를 이용하실 수 있습니다.
          <input type="checkbox"> 위, 개인정보 수집 및 이용에 동의합니다.
           
        </pre>
      </div>
   
           <div class="qnabtn">
           <input type="button" value="목록으로">
           <input type="button" value="확인">
          </div>
       </div>

    </div>
    