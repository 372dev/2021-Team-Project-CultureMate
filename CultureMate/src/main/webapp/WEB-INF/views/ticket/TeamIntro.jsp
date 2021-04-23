<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<style>
	#TeamIntro{
		width: 1000px;
		height: 700px;
		position: relative;
		margin-left: 100px;
	}

	#TeamIntro > img{
		width: 1000px;
		opacity: 20%;
	}

	#TeamIntro > .title{
		left: 50%;
		top: 200px;
		transform: translateX(-50%);
		position: absolute;
		font-family: 'Noto Sans KR', sans-serif;
		font-weight: 400;
		font-size: 50px;
		color: black;
	}

	#TeamIntro > p{
		position: absolute;
		left: 50%;
		transform: translateX(-50%);
		font-family: 'Noto Sans KR', sans-serif;
		font-weight: 300;
		font-size: 24px;
	}

	#TeamIntro > .text01{
		top: 500px;
	}

	#TeamIntro > .text02{
		top: 540px;
	}

	#TeamIntro > .title_sub01{
		font-family: 'Noto Sans KR', sans-serif;
		font-weight: 400;
		font-size: 18px;
		top: 670px;
	}

	#TeamIntro > .text03{
		top: 700px;
	}

	#TeamIntro > .title_sub01{
		position: absolute;
		left: 50%;
		transform: translateX(-50%);
	}

</style>

<div id="TeamIntro">
	<img alt="" src="${path}/resources/images/intro/members.jpg">
	<div class="title">후회는 없조</div>
	<p class="text01">후회없이 열심히 하자는 의미로 지었습니다.</p>
	<p class="text02">열심히 목표를 향해 달려나가겠습니다!</p>
	<div class="title_sub01">Members</div>
	<p class="text03">김민규 김정은 박상철 손진주 이지연 황의정</p>
</div>






<%@ include file="/WEB-INF/views/common/footer.jsp"%>






































