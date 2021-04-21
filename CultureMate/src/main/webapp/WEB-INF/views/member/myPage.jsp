<%@ page import="com.kh.cm.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<style>
	.list-group-item.active{
		background-color: #9DB81F;
		border-color: #9DB81F;
	}
	
	#update_submit{
		background-color: #9DB81F;
	}
	
	#revert{
		background-color: #FF8C00;
	}
	
	.btn:hover{
		color:white;
	}
</style>
<div class="container">
	<div class="row">
		<div class="col-md-3 ">
		     <div class="list-group ">
              <a href="${ path }/member/myPage" class="list-group-item list-group-item-action active">회원정보 수정</a>
              <a href="${ path }/member/updatePwd" class="list-group-item list-group-item-action">비밀번호 변경</a>
              <a href="${ path }/myPage/ticket" class="list-group-item list-group-item-action">예매내역</a>
              <a href="${ path }/member/myPosts" class="list-group-item list-group-item-action">내가 쓴 글 조회</a>
              <a href="${ path }/member/myReviews" class="list-group-item list-group-item-action">내가 쓴 리뷰 조회</a>
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
                                  <input id="password" name="password" placeholder="현재 비밀번호" class="form-control here" type="password" required>
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
                                  <input id="email" name="email" placeholder="이메일" value="${ loginMember.email }" class="form-control here" type="email" required>
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="phone" class="col-4 col-form-label">휴대전화</label> 
                                <div class="col-8">
                                  <input id="phone" name="phone" placeholder="(-없이)" value="${ loginMember.phone }" maxlength="11" class="form-control here" type="tel">
                                </div>
                              </div>           
                              <div class="form-group row">
                                <label for="address" class="col-4 col-form-label">주소</label> 
                                <div class="col-8">
	                                <input type="text" id="sample6_postcode" value="${ loginMember.postcode }" name="postcode" placeholder="우편번호" required>
									<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
									<input type="text" id="sample6_address"  value="${ loginMember.address }" name="address" placeholder="주소" required><br>
									<input type="text" id="sample6_detailAddress" value="${ loginMember.detailAddr }" name="detailAddr" placeholder="상세주소" required >
									<input type="text" id="sample6_extraAddress"  value="${ loginMember.extraAddr }" name="extraAddr" placeholder="참고항목" >
                                </div>
                              </div> 
                              <div class="form-group" align="center">
                              	<button type="submit" class="btn" id="update_submit">수정</button>
                              	<button type="reset" class="btn" id="revert">취소</button>
                              </div>
                            </form>
                            <div align="right">
                            	<h6>컬처메이트를 더이상 사용하지 않는다면 <a href="${ path }/member/withdrawal">회원탈퇴하기</a></h6>
                            </div>
		                </div>
		            </div>
		            
		        </div>
		    </div>
		</div>
	</div>
</div>



<!-- Daum Postcode API Script -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>