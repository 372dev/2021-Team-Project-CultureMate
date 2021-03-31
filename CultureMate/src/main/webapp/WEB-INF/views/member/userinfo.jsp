<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<section>
    <div class="userinfo">
        <form id="memberForm">
            <table>
                <tr>
                    <th>아이디 : </th>
                    <td>
                        <input type="text" name="userId" id="userId" value="admin1234" readonly>
                    </td>
                </tr>
                <tr>
                    <th>이름 : </th>
                    <td>
                        <input type="text" name="userName" id="userName" value="관리자" readonly>
                    </td>
                </tr>
                <tr>
                    <th>생년월일 : </th>
                    <td>
                        <input type="number" name="dateBirth" id="dateBirth" value="970330" required>
                    </td>
                </tr>
                <tr>
                    <th>주소 : </th>
                    <td>
                        api사용
                    </td>
                </tr>
                <tr>
                    <th>이메일 : </th>
                    <td>
                        <input type="email" name="email" id="email" value="cm@gmail.com" required> 
                    </td>
                </tr>
                <tr>
                    <th>휴대전화 : </th>
                    <td>
                        <input type="tel" name="phone" id="phone" value="01023334456" required>
                    </td>
                </tr>
            </table>
            <div>
                <input type="button" value="취소">
                <input type="submit" value="수정">
            </div>
        </form>
        <div>
            컬처메이트를 더이상 사용하지 않는다면 <a href="">회원탈퇴하기</a>
        </div>
    </div>

</section>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>