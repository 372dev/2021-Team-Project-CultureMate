<%@ page import="com.kh.cm.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<div class="container">
	<div class="row">
		<div class="col-md-3 ">
		     <div class="list-group ">
              <a href="#" class="list-group-item list-group-item-action active">회원정보 수정</a>
              <a href="#" class="list-group-item list-group-item-action">예매내역</a>
              <a href="#" class="list-group-item list-group-item-action">활동관리</a>
              <a href="#" class="list-group-item list-group-item-action">포인트충전</a>
              <a href="#" class="list-group-item list-group-item-action">결제정보관리</a>
            </div> 
		</div>
		<div class="col-md-9">
		    <div class="card">
		        <div class="card-body">
		            <div class="row">
		                <div class="col-md-12">
		                    <h4>회원정보 수정</h4>
		                    <hr>
		                </div>
		            </div>
		            <div class="row">
		                <div class="col-md-12">
		                    <form action="${path}/member/update" method="POST">
                              <div class="form-group row">
                                <label for="username" class="col-4 col-form-label">아이디</label> 
                                <div class="col-8">
                                  <input id="userId" name="userId" value="${ loginMember.userId }" class="form-control here" readonly required="required" type="text">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="password" class="col-4 col-form-label">현재 비밀번호</label> 
                                <div class="col-8">
                                  <input id="password" name="password" placeholder="현재 비밀번호" class="form-control here" type="password">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="newPassqword" class="col-4 col-form-label">새 비밀번호</label> 
                                <div class="col-8">
                                  <input id="newPassqword" name="newPassqword" placeholder="새 비밀번호" class="form-control here" type="password">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="userName" class="col-4 col-form-label">이름</label> 
                                <div class="col-8">
                                  <input id="userName" name="userName" value="${ loginMember.userName }" class="form-control here" readonly required="required" type="text">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="userNick" class="col-4 col-form-label">닉네임</label> 
                                <div class="col-8">
                                  <input id="userNick" name="userNick" placeholder="닉네임" value="${ loginMember.userNick }" class="form-control here" required="required" type="text">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="email" class="col-4 col-form-label">이메일</label> 
                                <div class="col-8">
                                  <input id="email" name="email" placeholder="이메일" value="${ loginMember.email }" class="form-control here" type="email">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="phone" class="col-4 col-form-label">휴대전화</label> 
                                <div class="col-8">
                                  <input id="phone" name="phone" placeholder="(-없이)" value="${ loginMember.phone }" maxlength="11" class="form-control here" type="tel">
                                </div>
                              </div> 
                              <div class="form-group" align="center">
                              	<button type="submit" class="btn btn-primary">수정</button>
                              	<button type="reset" class="btn btn-default">취소</button>
                              </div>
                            </form>
                            <div align="right">
                            	<h6>컬처메이트를 더이상 사용하지 않는다면 <a href="${ path }/member/withdrawl">회원탈퇴하기</a></h6>
                            </div>
		                </div>
		            </div>
		            
		        </div>
		    </div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>