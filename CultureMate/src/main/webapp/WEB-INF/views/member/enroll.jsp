<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<section>
    <div class="enroll">
        <img class="cm_logo" src="resources/images/logo.png" alt="">
        
        <form method="POST" id="enroll_form">
            <label>아이디<br>
                <input type="text" id="userId" name="userId" placeholder="아이디" size="30" required>
            </label> <br>
            <label>비밀번호<br>
                <input type="password" id="password1" name="password" placeholder="비밀번호" size="30" required>
            </label> <br>
            <label>비밀번호 재확인<br>
                <input type="password" id="password2" name="password" placeholder="비밀번호 재확인" size="30" required>
            </label> <br>
            <label>이름<br>
                <input type="text" id="userName" name="userName" placeholder="이름" size="30" required>
            </label> <br>
            <label>생년월일<br>
                <input type="text" id="dateBirth" name="dateBirth" placeholder="ex) 970630" size="30" required>
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
               주소api사용
            </label> <br><br><br>
            <input type="submit" value="가입하기" id="enroll_button" onclick="validate();">
        </form>    
        
    </div>
</section>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
