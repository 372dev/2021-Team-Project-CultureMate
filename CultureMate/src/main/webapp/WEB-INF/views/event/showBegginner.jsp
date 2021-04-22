<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<style>
  #eventSection {
	     min-height: 800px;	    
	     margin: 0 auto;
	}
    #eventcontainer{ 
        text-align: center;
		margin: 0 auto;		
		height: 900px;
   
    }

</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<section id="eventSection">
<div id="eventContainer">
	<h1>공연 입문자들을 위한 친절한 설명</h1>
	<div id="classic">
		<h3>클래식</h3>
		<p>“클래식을 듣고 싶은데 뭐부터 들어야 할지 모르겠어.”
			“클래식은 어떻게 입문해야 하지?”
			
			사실 이 질문들은
			
			“힙합을 듣고 싶은데 뭐부터 들어야 할지 모르겠어.”
			“프로그레시브 하우스는 어떻게 입문해야 하지?”
			
			이 질문들과 다를 것이 없다.
		</p>
	</div>
	<div id="musical">
		<h3>뮤지컬</h3>
		<p>영화와 달리 뮤지컬은 관람하는 데 망설여진다. 가격도 물론이고, 어떤 극이 자신의 취향일지 모른다는 점이 큰 모험이다. 
			또한 뮤지컬에서 사용하는 용어 역시 생소해 낯설게 느껴진다. 
			이에 뮤지컬 입문자가 알아두면 유용한 용어와 할인정보를 정리했다.
		</p>
		<p>
			[용어설명] 넘버

넘버란 뮤지컬에 나오는 곡들을 지칭하는 단어다. 왜 뮤지컬에 나오는 노래를 ‘넘버’라고 지칭하게 됐는지는 알려지지 않았다. 다만, 극의 전개에 맞춰 곡에 순서를 붙이다 보니 넘버라고 부르게 됐다는 설이 있다. 뮤지컬 넘버는 주의깊이 들으면 극의 흐름, 극중 배우의 감정 등이 잘 스며들어 있다. 
* tip. 뮤지컬 보러가기 전, 그 극의 유명한 넘버를 듣고 가면 보다 공연을 몰입해 즐길 수 있다.
		</p>
		<p>
			[용어설명] 프리뷰

프리뷰란 본격적인 극이 시작되기 전 공연으로‘시범경기’나 ‘예선’같은 느낌의 공연이다. 공연이 완성되지 않았고, 배우들도 막바지 연습 공연으로 보기 때문에 공연 오픈 직전의 공연이라 할 수 있다. 
하지만 남들보다 먼저 극을 볼 수 있고 저렴한 가격에 볼 수 있기 때문에 프리뷰로 공연을 찾는 관객들도 많다.
		</p>
		<p>
			[용어설명] 관객 크리티컬의 약자 ‘관크’

관크는 ‘관객 크리티컬’의 약자로 극에 방해되는 관객을 이르는 말이다. 대표적인 행동에는 몸을 앞으로 숙여 시야를 가리는 것, 핸드폰 불빛으로 자신의 존재감을 드러내는 것, 노래를 따라 부르면서 옆 사람을 괴롭히는 것, 다음 내용을 미리 중얼거리며 주변을 시끄럽게 하는 행동 등이 있다. 이러한 행동은 극 중 몰입을 방해하기 때문에 불쾌감, 더 나아가서는 분노마저 유발한다.

* 예문: 오늘 옆자리 사람한테 관크 당했어.
		</p>
		<p>
			[용어설명] 배우이름 = 배우의 성 + 극중 역할?

뮤지컬 관련 글을 찾다보면 사람들이 생소한 단어로 말하는 것을 본 적이 있을 것이다. 어떤 사람을 말하는 것 같긴 하지만 완벽히 알아듣기 힘들다. 
이처럼 보통 뮤지컬 팬들 사이에서는 배우를 본명으로 부르는 것이 아니라 배우의 성과 극중 역할을 합쳐 부르는 경우가 대부분이다. 예를 들면 ‘엘리자벳’에서 
옥주현이 캐스팅된 경우, 옥주현 엘리자벳을 줄여 각각 ‘옥엘리’라고 부른다. 이외에도 류막심(류정한 막심 드윈터, <레베카>), 샤쿨(시아준수 드라큘라, <드라큘라>), 은괴 (박은태 괴물) 등과 같이 다양하게 줄여서 배우들을 부른다.

			
		</p>
</div>
<div id="play">
		<p>
			입문자들이 관람하기 좋은 연극은?

			입문자들이 관람하기 좋은 연극은 크게 두가지다
			
			첫 번째는 평소 좋아하는 배우가 공연하는 연극을 찾아보는 것이 좋다.
			
			내용보단 배우를 골라 영화를 찾아 보는 사람들이 있는 것처럼, 공연 자체는 생소하더라도, 좋아하는 배우의 새로운 모습을 보는 것 자체가 신선한 경험으로 다가오기 때문이다.
			
			첫 연극 관람을 통해 어느정도 현장의 분위기를 느꼈다면 대중적인 연극을 찾아보는 것도 좋다.
			
			특히 오랜 시간동안 관객들을 만나온 연극은 대중성을 가지고 있기 때문에, 연극을 처음 접하는 사람도 쉽게 접근 할 수 있다.
			
			해당 연극들은 보통 오픈런으로 진행되고 있기 때문에 스케쥴을 맞춰 관람하기 쉽다는 것도 장점이다.

		</p>
</div>
	<div>
	https://post.naver.com/viewer/postView.nhn?volumeNo=10452835&memberNo=2067294
		https://magazine.hankyung.com/job-joy/article/202102195945d
	</div>
</div >
</section>









<%@ include file="/WEB-INF/views/common/footer.jsp"%>
