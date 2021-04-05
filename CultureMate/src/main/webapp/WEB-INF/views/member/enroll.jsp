<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<c:set var="path" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CultureMate 회원가입</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="${path}/resources/css/main.css">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>

<section>
    <div class="well well-lg">
        <img class="cm_logo" src="resources/images/logo.png" alt="${ path }/">
        
        <form action="${ path }/member/enroll" method="POST" id="enrollForm" >
            <label>아이디<br>
                <input type="text" id="userId" name="userId" placeholder="아이디" size="30" required>
                <input type="button" class="btn btn-primary" id="checkDuplicate" value="중복확인"/>
            </label> <br>
            <label>비밀번호<br>
                <input type="password" id="password1" name="password" placeholder="비밀번호" size="30" required>
            </label> <br>
            <label>비밀번호 재확인<br>
                <input type="password" id="password2" name="password" placeholder="비밀번호 재확인" size="30" required>
            </label> <br>
            <label>닉네임<br>
                <input type="text" id="userNick" name="userNick" placeholder="이름" size="30" required>
            </label> <br>
            <label>이름<br>
                <input type="text" id="userName" name="userName" placeholder="이름" size="30" required>
            </label> <br>
            <label>생년월일<br>
                <input type="date" id="dateBirth" name="dateBirth" placeholder="ex) 970630" size="30" required>
            </label> <br>
            <label>성별<br>
                <select name="gender" required>
                    <option value="" disabled>성별</option>
                    <option value="남">남</option>
                    <option value="여">여</option>
                </select>
            </label> <br>
            <label>본인 확인 이메일<br>
                <input type="email" id="email" name="email" placeholder="ex) cm@gmail.com" size="30" required>
            </label> <br>
            <label>휴대전화<br>
                <input type="text" id="phone" name="phone" placeholder="기호를 빼고 입력해주세요" size="30" required>
            </label> <br>
            <label>주소<br>
				<input type="text" id="sample6_postcode" name="postcode" placeholder="우편번호">
				<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
				<input type="text" id="sample6_address"  name="address" placeholder="주소"><br>
				<input type="text" id="sample6_detailAddress"  name="detailAddr" placeholder="상세주소">
				<input type="text" id="sample6_extraAddress" name="extraAddr" placeholder="참고항목">
            </label> <br><br><br>
            <security:csrfInput/>	
            <input type="submit" value="가입하기" id="enroll_button" class="btn btn-primary">
        </form>    
	    </div>
</section>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

// 아이디 중복을 확인 처리 콜백함수
$("#checkDuplicate").on("click", () => {
	  // 중복확인전에 아이디 값이 4글자 이상인지 확인
    let userId = $("#newId").val().trim();
    
    if (id.length < 4) {
       alert("아이디는 최소 4글자 이상 입력하셔요.")
       
       return;
    }
    
    $.ajax({
  	  type: "get",
  	  url: "${path}/member/idCheck",
  	  dataType: "json",
  	  data: {
  		userId // 파라미터의 키값과 변수명이 동일할 경우 
  	  },
  	  success: function(data){
  		  console.log(data);
  		  
  		  if(data.validate !== true){
  			  alert("사용 가능한 아이디입니다.");
  		  } else {
  			  alert("이미 사용중인 아이디입니다.");
  		  }
  	  },
  	  error: function(data){
  		  console.log(data);
  	  }
    });
});


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
</body>
</html>
