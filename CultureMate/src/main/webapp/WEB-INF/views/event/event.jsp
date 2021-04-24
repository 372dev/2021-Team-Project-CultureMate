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
   #cardTitle {
   	height:25px;
   	width:100px;
   	border:0.5px solid orange;
   	color:orange;
   	font-weight:bold;
	display: table-cell;
    vertical-align: middle;
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
.card-img-top {
	
}  
</style>

<section id="eventSection">
<div id="eventContainer">
	<div class="card" style="width: 22rem;float:left;margin-left: 3%;">
			  <a href="${path}/show/restview?name=PF173021"><div class="scale"> <img class="card-img-top" src="${path}/resources/event/안녕 여름.jpg" alt="Card image cap"></div> </a>
			  <div class="card-body">
			    <div id="cardTitle">초대 이벤트</div><br>
			    <p class="card-text" style="font-weight:bold;">연극 <안녕, 여름> 기대평 이벤트</p>
			     <p>기대평 작성 시 초대권을 무료로 드립니다.</p>
			     <p style="color:#b5b5b3;">2021.04.19 ~ 2021.04.26 | 2021.04.30 발표</p>
			  
	</div>
	</div>
	<div class="card" style="width: 22rem;;float:left;margin-left: 3%;">
			  <a href="${path}/show/restview?name=PF173006"><div class="scale"> <img class="card-img-top" src="${path}/resources/event/위키드.jpg" alt="Card image cap"></div> </a>
			  <div class="card-body">
			    <div id="cardTitle">초대 이벤트</div><br>
			    <p class="card-text" style="font-weight:bold;">뮤지컬 <위키드> <부산> 기대평 이벤트</p>
			    <p>기대평 작성 시 초대권을 무료로 드립니다.</p>
			    <p style="color:#b5b5b3;">2021.04.21 ~ 2021.05.19 | 2021.05.20 발표</p>
			  <range></range>
  			</div>
	</div>
	<div class="card" style="width: 22rem;float:right;margin-right: 3%;">
			  <a href="${path}/show/restview?name=PF172434"><div class="scale"> <img class="card-img-top" src="${path}/resources/event/태양의 노래.jpg" alt="Card image cap"></div> </a>
			  <div class="card-body">
			    <div id="cardTitle" >초대 이벤트</div><br>
			    <p class="card-text" style="font-weight:bold;">뮤지컬 <태양의 노래> 기대평 이벤트 </p>		
			    <p>기대평 작성 시 초대권을 무료로 드립니다.</p>	
			     <p style="color:#b5b5b3;">2021.04.16 ~ 2021.04.29 | 2021.04.30 발표</p>  
  			</div>
	</div>
	<div class="card" style="width: 22rem;float:left;margin-left: 3%;margin-top: 3%;">
			  <a href="${path}/show/restview?name=PF171029"><div class="scale"> <img class="card-img-top" src="${path}/resources/event/검은사제들.jpg" alt="Card image cap"></div> </a>
			  <div class="card-body">
			    <div id="cardTitle">경품 이벤트</div><br>
			    <p class="card-text" style="font-weight:bold;">뮤지컬 <검은 사제들> 관람후기 이벤트</p>
			    <br>
			     <p style="color:#b5b5b3;">2021.04.25 ~ 2021.05.31 | 2021.06.01 발표</p>
			  
	</div>
	</div>
	<div class="card" style="width: 22rem;float:left;margin-left: 3%;margin-top: 3%;">
			  <a href="${path}/show/restview?name=PF171092"><div class="scale"> <img class="card-img-top" src="${path}/resources/event/위키드.jpg" alt="Card image cap"></div> </a>
			  <div class="card-body">
			    <div id="cardTitle">경품 이벤트</div><br>
			    <p class="card-text" style="font-weight:bold;">뮤지컬 <위키드> 관람후기 이벤트</p>
			    <br>
			     <p style="color:#b5b5b3;">2021.04.16 ~ 2021.05.01 | 2021.05.02 발표</p>
			  
	</div>
	</div>
</div >
</section>









<%@ include file="/WEB-INF/views/common/footer.jsp"%>
