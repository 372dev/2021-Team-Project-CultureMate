<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>


<style>
	#ServiceIntro{
		width: 1000px;
		margin-left: 100px;
		position: relative;
	}

	#ServiceIntro > .title{
		font-family: 'Noto Sans KR', sans-serif;
		font-weight: 400;
		font-size: 28px;
		margin-bottom: 30px;
	}

	#ServiceIntro > .list{
		font-family: 'Noto Sans KR', sans-serif;
		font-weight: 400;
		font-size: 20px;
	}

	#ServiceIntro > .under{
		font-family: 'Noto Sans KR', sans-serif;
		font-weight: 200;
		font-size: 18px;
		margin-bottom: 20px;
		color: rgb(71, 71, 71);
	}

	#ServiceIntro > img{
		position: absolute;
		opacity: 0.2;
		right: 0;
		top: 50%;
		transform: translateY(-50%);
	}

</style>

<div id="ServiceIntro">
	<img src="${path}/resources/images/intro/friend.png" alt="">
	<div class="title">서비스 소개</div>
	<div class="list">공연조회</div>
	<div class="under">
		현재 상영중/상영예정인 공연을 조회하실 수 있습니다. <br>
		상세 검색을 통해서 뮤지컬/연극/클래식, 전체/공연중/공연예정 등 <br>
		조건을 추가하여 검색 가능합니다.
	</div>
	<div class="list">예매</div>
	<div class="under">
		원하시는 공연을 선택해서 예매하실 수 있습니다. <br>
		날짜 선택후 팝업창으로 나오는 좌석선택 페이지에서 좌석 선택후 결제하기 클릭 시 <br>
		결제 페이지로 넘어가며 카카오페이 결제로 간편하게 결제 가능합니다. <br>
		이후 마이페이지의 예매내역에서 예매하신 티켓을 확인하실 수 있습니다.
	</div>
	<div class="list">메이트</div>
	<div class="under">
		메이트 게시판을 통하여 같이 갈 친구를 구해보세요! <br>
		공연 종류, 나이, 인원수 등 원하는 조건을 추가해서 같이 갈 친구를 구하거나 <br>
		올라와있는 글에 댓글로 지원해서 함께 공연을 보러 가보세요.
	</div>
	<div class="list">티켓나눔</div>
	<div class="under">
		티켓이 남아서 어떻게 해야할 지 모르겠다면 <br>
		티켓 나눔 게시판을 통해 다른 회원님들과 나눠보세요! <br>
		상세 조건을 추가해서 나눔글을 올리거나 올라와있는 글에 <br>
		댓글을 달 수 있습니다!
	</div>
</div>







<%@ include file="/WEB-INF/views/common/footer.jsp"%>






























