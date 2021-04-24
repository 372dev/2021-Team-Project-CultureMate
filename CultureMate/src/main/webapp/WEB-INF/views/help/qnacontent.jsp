<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/common/header.jsp"%>
<script src="https://kit.fontawesome.com/4d8c9a2b0b.js" crossorigin="anonymous"></script>
<style>
p {
	margin: 20px 0px;
}
.col>p {
	background-color: #9DB81F;
	line-height: 70px;
	font-size: 25px;
	border-radius: 5px;
}

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

  #btnSave{
     background-color: #9DB81F
  }
  #btnList{
     background-color: #6C757D
  }
  .nav-item {
	display: inline-block;
	inline-size: 30%;
	border:1px solid #EDEDED;
	border-radius: 5px;

}
</style>


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
       
	<article>

		<div class="container" role="main">

			<h2>문의</h2>
           <form method="post" action='${path}/help/qnacontent'>
			<div name="form" id="form" role="form">

				<div class="mb-3">

		  <i class="far fa-edit"></i><label for="title">문의유형</label> <i class="fas fa-lock" size=1x></i><label>비공개</label>
          <input type="checkbox" value='N' name="qnaOpenStatus" id="qnaOpenStatus">

          <select name="qnaType" class="form-control" name="title" id="title" required>
              <option selected>문의유형선택</option>
              <option value="공연">공연</option>
              <option value="메이트/티켓나눔">메이트/티켓나눔 게시판</option>
          </select>
			

          
				</div>

        <div class="mb-3">

					<i class="far fa-edit"></i><label for="title">작성자</label>

					<input type="text" class="form-control" name="userId" id="userId" value="${ loginMember.userId }" readonly>

				</div>

				

				<div class="mb-3">

					<i class="far fa-edit"></i><label for="reg_id">문의제목</label>

					<input type="text" class="form-control" name="qnaTitle" id="qnaTitle" required>

          
				</div>

				

				<div class="mb-3">

					<i class="far fa-edit"></i><label for="content">내용</label>

					<textarea class="form-control" rows="5" name="qnaContent" id="content" placeholder="내용을 입력해 주세요" required></textarea>

				</div>

        <div class="qnaagree">
          <pre>
            수집하는 개인정보[(필수)이메일, 문의내용],[(선택)첨부파일]눈 문의 내용처리 및 처리 및
            고객 불만의 해결을위해 사요외며, 관련 법령에 따라 3년간 보관후 삭제됩니다.
            문의 접수, 처리 및 회신을 위한 필욫최소산의 개인정보이므로 동의를 해주셔야 
            서비스를 이용하실 수 있습니다.
            <input type="checkbox" required> 위, 개인정보 수집 및 이용에 동의합니다.
             
          </pre>
        </div>
				

		

			<div align="center" >
				<input type="submit" value="등록" class="btn" id="btnSave">
				<input  type="reset" value="취소" class="btn" id="btnList">
			</div>

	    </form>
		</div>

	</article>    
    
    <%@ include file="/WEB-INF/views/common/footer.jsp"%>