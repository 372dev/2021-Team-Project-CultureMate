<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<section>
    <div class="withdrawl">
        <h2>탈퇴 안내</h2>
        <p>회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.</p>
        <div>
            <h4>* 사용하고 계신 아이디({id})는 탈퇴할 경우 재사용 및 복구가 불가능합니다.</h4>
            <p>탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가하오니 신중하게 선택하시기 바랍니다.</p>
            <br>
            <h4>* 탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다.</h4>
            <br>
            <h4>* 탈퇴 후에도 게시판형 서비스에 등록한 게시물은 그대로 남아 있습니다.</h4>
            <p>
                리뷰, Q&A 등에 올린 게시글 및 댓글은 탈퇴 시 자동 삭제되지 않고 그대로 남아 있습니다.<br>
                삭제를 원하는 게시글이 있다면 반드시 탈퇴 전 비공개 처리하거나 삭제하시기 바랍니다.<br>
                탈퇴 후에는 회원 정보가 삭제되어 본인 여부를 확인할 수 있는 방법이 없어, 게시글을 임의로 삭제해드릴 수 없습니다.
            </p>
        </div>
        <br><br>
        <div>
            <h4>회원님의 정보 내역을 확인해 주세요.</h4>
            <p>회원탈퇴 후 모두 소멸됩니다.</p>
            
        </div>
        <hr>
        <div>
            <h3>어떤 점이 불편하셨나요?</h3>
            <p>고객님의 소중한 의견을 반영하여 더 좋은 컬처메이트가 되기 위해 노력하겠습니다.</p>
        </div>
        <hr>
        <h3>정확한 본인확인을 위해 비밀번호를 입력해 주세요.</h3>
        <form>
            <input type="text" placeholder="id" readonly><br><p>
            <input type="password" placeholder="password"><br><br><br>
            <label>
                <input type="radio">안내 사항을 모두 확인하였으며, 이에 동의합니다.</input>
            </label>
            <br><br><br>
            <input type="submit" value="확인"></input>
        </form>
    </div>
</section>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>