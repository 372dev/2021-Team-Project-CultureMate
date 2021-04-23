<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<style>
  #eventSection {
		width: 1280px;
	     min-height: 800px;	    
	     margin: 0 auto;
	}
     #eventcontainer{ 
        text-align: center;
		margin: 0 auto;		
		height: 900px;
   
    }
   .scale {
  transform: scale(1);
  -webkit-transform: scale(1);
  -moz-transform: scale(1);
  -ms-transform: scale(1);
  -o-transform: scale(1);
  transition: all 0.3s ease-in-out;   /* 부드러운 모션을 위해 추가*/
}
.scale:hover {
  transform: scale(1.05);
  -webkit-transform: scale(1.05);
  -moz-transform:scale(1.05);
  -ms-transform: scale(1.05);
  -o-transform: scale(1.05);
}

</style>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/0fe4d45686.js"
		crossorigin="anonymous"></script>
  <section id="eventSection">  
        <div id="eventContainer">
        	 <h1 style=" font-family: 'Do Hyeon', sans-serif;"><i class="far fa-check-square"></i> 입문자를 위한 친절한 가이드</h1><br>
              <div class="card" style="width: 22rem;float:left;margin-left: 3%;">
			  <a href="${path}/show/boList?genre=musical"><div class="scale"> <img class="card-img-top" src="${path}/resources/event/뮤지컬.jfif" alt="Card image cap" style="height:240px;"></div> </a>
			  <div class="card-body">
			    <p class="card-text" style="font-weight:bold;">눈과 귀를 사로잡는, '뮤지컬'</p>
			     <p>영화와 달리 뮤지컬은 관람하는 데 망설여진다. <br>
			     가격도 물론이고, 어떤 극이 자신의 취향일지 모른다는 점이 큰 모험이다.<br>
			     또한 뮤지컬에서 사용하는 용어 역시 생소해 낯설게 느껴진다. <br>
                <p>
                   <p class="card-text" style="font-weight:bold;"> STEP 1. 이해가 쉬운 뮤지컬 </p>
                    대부분의 사람들에게 디즈니에서 나온 작품들이 이해가 쉬울 것이다. <br>
                    <라이온킹><겨울왕국><알라딘>
                </p>      
                <p>
                    <p class="card-text" style="font-weight:bold;">  STEP 2. 화려한 연출</p> 
                   뮤지컬은 듣는 것 뿐만 아니라 보는 것도 매우 중요한 공연이므로 화려함으로 시선강탈하는 뮤지컬이라면 눈과 귀 중 눈은 일단 합격일 것이다. 
                </p>      
			   
	</div>
	</div>
              <div class="card" style="width: 22rem;float:left;margin-left: 3.5%;">
			  <a href="${path}/show/boList?genre=play"><div class="scale"> <img class="card-img-top" src="${path}/resources/event/연극.jpg" alt="Card image cap" style="height:240px;"></div> </a>
			  <div class="card-body">
			    <p class="card-text" style="font-weight:bold;">  먼 것 같으면서도 가까운 문화생활, '연극'</p>
			   <p>
                    영화와 달리 관객이 연극에서 느낄 수 있는 가장 큰 다른점은 바로 생동감이다.<br>
                </p>
                <p> 
                    <p class="card-text" style="font-weight:bold;"> STEP 1. 프롬 덕질</p>
                 <p>   평소 좋아하는 배우가 공연하는 연극을 찾아보는 것이 좋다.   </p>                 
                    
                   <p class="card-text" style="font-weight:bold;">  STEP 2. 랭킹 1위 연극 </p>                  
                 <p>   오랜 시간동안 관객들을 만나온 연극은 대중성을 가지고 있기 때문에, 연극을 처음 접하는 사람도 쉽게 접근 할 수 있다.                  
                 </p>
                </p>
			   
	</div>
	</div>
              <div class="card" style="width: 22rem;float:right;margin-right: 8%;">
			  <a href="${path}/show/boList?genre=classic"><div class="scale"> <img class="card-img-top" src="${path}/resources/event/클래식1.jfif" alt="Card image cap" style="height:240px;"></div> </a>
			  <div class="card-body">
			    <p class="card-text" style="font-weight:bold;">오랜 역사를 가진, '클래식'</p>
			     <p>  “클래식을 듣고 싶은데 뭐부터 들어야 할지 모르겠어.” <br>
                    “클래식은 어떻게 입문해야 하지?” <br>
                    
                    사실 이 질문들은 <br>
                    
                    “힙합을 듣고 싶은데 뭐부터 들어야 할지 모르겠어.”<br>
                    “프로그레시브 하우스는 어떻게 입문해야 하지?”<br>
                    
                    이 질문들과 다를 것이 없다. <br>
                 </p>
                 <p class="card-text" style="font-weight:bold;"> 
                    STEP 1. 홀로서기 - 리사이틀  <br>            
                    STEP 2. 하나보단 둘 - 듀오 공연<br>
 					STEP 3. 무적의 트리오 - 삼중주   <br>
                    STEP 4. 별들이 모이면 은하수가 된다 - 오케스트라
                   
                    </p>
			   
			</div>
			</div>
               
        </div >
  </section>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
