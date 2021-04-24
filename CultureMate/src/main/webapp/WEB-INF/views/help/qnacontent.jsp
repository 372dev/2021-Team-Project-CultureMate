<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${path}/resources/css/cscenter.css">
    <%@ include file="/WEB-INF/views/common/header.jsp"%>

<link rel="stylesheet" href="${path}/resources/css/cscenter.css">

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

       <h3>문의</h3>
       
    
       <div class="cs_qna">
           <div class="qnalist">
               <label style="font-size: large;">문의유형</label>
              
                   <select name="qnaType">
                       <option selected>문의유형선택</option>
                           <option value="공연">공연</option>
                           <option value="메이트">메이트/티켓나눔 게시판</option>
                      
                   </select>
           </div>
            <div>
					<lable style="font-size: large;">작성자</label>
					<input type="text" name="userId" value="${ loginMember.userId }" readonly>
           </div>
           <div class="qnaname">
               <label style="font-size: large;"  >문의제목</label>
               <input type="text"  name="qnaTitle">
               <label>비공개</label>
               <input type="checkbox" value='N' name="qnaOpenStatus" id="qnaOpenStatus">
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