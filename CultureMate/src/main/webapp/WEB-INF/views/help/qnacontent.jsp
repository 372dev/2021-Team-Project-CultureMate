<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${path}/resources/css/cscenter.css">
    <%@ include file="/WEB-INF/views/common/header.jsp"%>

<link rel="stylesheet" href="${path}/resources/css/cscenter.css">

<div class="col">
	<p>고객센터</p>
	<form action='${path}/help/qnacontent' method="post" enctype="multipart/form-data">
	<ul class="nav nav-pills">
		<li class="nav-item"><a class="nav-link active" 
			href="${path}/help/csmain">자주묻는질문 & FAQ</a></li>
		<li class="nav-item"><a class="nav-link"
			href="${path}/help/notice ">공지사항</a></li>
		<li class="nav-item"><a class="nav-link"
			href="${path}/help/qnalist">1:1문의</a></li>
	</ul>
    
      <nav>
        <ul>
          <li><a href="${path}/help/qnalist">문의내역</a></li>
          <li><a href="${path}/help/qnacontent">문의하기</a></li>
          
        </ul>
      </nav>

       <hr>

       <h3>1:1 문의</h3>
       
    
       <div class="cs_qna">
           <div class="qnalist">
               <label style="font-size: large;">문의유형</label>
              
                   <select name="qnaType">
                       <option selected>문의유형선택</option>
                           <option value="공연">공연</option>
                           <option value="메이트">메이트 게시판</option>
                      
                   </select>
           </div>
           
            <div class="form-inline">
               <input type="radio" name="qnaOpenStatus" id="qnaopen" value="Y" class="radio" /><span class="ml_10">공개</span>&nbsp;&nbsp;&nbsp;&nbsp;
               <input type="radio" name="qnaOpenStatus" id="qnaopen" value="N" class="radio" /><span class="ml_10">비공개</span>&nbsp;
            </div>
            <div>
					<lable style="font-size: large;">작성자</label>
					<input type="text" name="userId" value="${ loginMember.userId }" readonly>
           </div>
           <div class="qnaname">
               <label style="font-size: large;"  >문의제목</label>
               <input type="text"  name="qnaTitle">
           </div>

          
      
           <div id="msgBody" class="qnacontent">
               <textarea name="qnaContent" cols="90" rows="15" placeholder="내용을 입력해주세요."></textarea>
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
           <input type="submit" value="등록">
           <input type="reset" value="취소">
          </div>
       </div>

</form>
    
    <%@ include file="/WEB-INF/views/common/footer.jsp"%>