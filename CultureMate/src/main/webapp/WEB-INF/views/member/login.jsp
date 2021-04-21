<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<style>
	section{
		padding: 100 300 0 300;
		width: 100%;
	}
	
	#wrapper{
		text-align: center;
	}
	
	.l_form{
		margin: .2em 0;
		font-size: 1em;
		padding: .5em;
		border: 1px solid #ccc;
		border-color: #dbdbdb #d2d2d2 #d0d0d0 #d2d2d3;
		box-shadow: insert 0.1em 0.1em 0.15em rgb(0 0 0 / 10%);
		vertical-align: middle;
		line-height: 1.25em;
		outline: 0;
		width: 20em;
	}
	
	.btn{
		margin-left: 5em;
		background-color: #9DB81F;
	}
	
	.btn:hover{
		color: white;
	}
</style>

<section>
    <div id="wrapper">
        <form action="${ path }/member/login" method="post">
            <input type="text" class="l_form" name="userId" placeholder="아이디" required><br>
            <input type="password" class="l_form" name="password" placeholder="비밀번호" required="required"> <br>
            <label>
                <input type="checkbox" id="remember-me" value="remember-me">로그인 유지
            </label>
            <br><br><br>
            <div class="form-group">
              <div class="col-lg-offset-2 col-lg-10">
                  <button type="submit" class="btn px-5" id="login">로그인</button>
              </div>
            </div>
        </form>
    </div>
	<a href="${ path }/member/findIdAndPwd" >
		아이디 | 비밀번호 찾기
	</a>
</section>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>