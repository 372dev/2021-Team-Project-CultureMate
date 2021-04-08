<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<link rel="stylesheet" href="${path}/resources/css/withdrawal.css" />
<section>
    <div class="withdrawal">
        
        <h3>탈퇴 안내</h2>
        <p>회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.</p>
        <div class="withdrawlInfo">
            <h4>* 사용하고 계신 아이디(<span style="color: green" >${ loginMember.userId }</span>)는 탈퇴할 경우 <span style="color: red">재사용 및 복구가 불가능</span>합니다.</h4>
            <p>탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가하오니 신중하게 선택하시기 바랍니다.</p>
            <br>
            <h4>* 탈퇴 후 회원정보 및 개인형 서비스 이용기록은 <span style="color: red">모두 삭제</span>됩니다.</h4>
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
            <ul>
            	<li> 이름 : ${ loginMember.userName }
            	<!-- TODO 추후 수정 필요 -->
            	<li> 예약중인 공연 : 0건
            	<li> 예치금 : 0원
            	<li> 포인트 : 0원
            </ul>
        </div>
        <hr>
        <div>
            <h3>어떤 점이 불편하셨나요?</h3>
            <p>고객님의 소중한 의견을 반영하여 더 좋은 컬처메이트가 되기 위해 노력하겠습니다.</p>
        </div>
        <div class="nested_boxes">
        	<form>
				<div class="form-row">
					<div class="form-group">
						<div class="nested_check_in"><input name="" type="checkbox"> <label class="nested_label">공연정보 부족</label></div>
					</div>
					<div class="form-group">
						<div class="nested_check_in"><input name="" type="checkbox"> <label class="nested_label">공연 및 콘텐츠 검색 불편</label></div>
					</div>
					<div class="form-group">
						<div class="nested_check_in"><input name="" type="checkbox"> <label class="nested_label">사이트 불편</label></div>
					</div>
					<div class="form-group">
						<div class="nested_check_in"><input name="" type="checkbox"> <label class="nested_label">회원혜택 부족</label></div>
					</div>
					<div class="form-group">
						<div class="nested_check_in"><input name="" type="checkbox"> <label class="nested_label">상담원 응대 불친절</label></div>
					</div>
					<div class="form-group">
						<div class="nested_check_in"><input name="" type="checkbox"> <label class="nested_label">개인정보 및 보안 우려</label></div>
					</div>
					<div class="form-group">
						<div class="nested_check_in"><input name="" type="checkbox"> <label class="nested_label">시스템 오류</label></div>
					</div>
					<div class="form-group">
						<div class="nested_check_in"><input name="" type="checkbox"> <label class="nested_label">컬쳐메이트 이용안함</label></div>
					</div>
				</div>
			</form>
		</div>
        <hr>
        <h3>정확한 본인확인을 위해 비밀번호를 입력해 주세요.</h3>
        <form>
            <input type="text" value="${ loginMember.userId }" readonly><br><p>
            <input type="password" placeholder="비밀번호"><br><br><br>
            <label>
                <input type="radio">안내 사항을 모두 확인하였으며, 이에 동의합니다.</input>
            </label>
            <br><br><br>
            <input type="button" onclick="deleteMember();" value="탈퇴"></input>
        </form>
    </div>
</section>

<script>
	function deleteMember(){
		if(confirm("회원 탈퇴하시겠습니까?")){
			location.replace("${path}/member/delete?userId=${loginMember.userId}");
		}
	}
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>