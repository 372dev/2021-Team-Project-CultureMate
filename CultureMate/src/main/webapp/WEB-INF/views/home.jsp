<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<c:set var="path" value="${ pageContext.request.contextPath }" />

    <link rel="stylesheet" href="${ path }/resources/css/home.css" />
	<link rel="stylesheet" href="${ path }/resources/css/showListStyle.css?v=1" />
	<link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
    />
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

    <div class="topDiv">
    	<div class="sideMenuDiv">
    		<a href="${ path }/show/showList" class="treeMenuLv0">공연</a>
	    		<a href="${ path }/show/boList?genre=musical" class="treeMenuLv1">뮤지컬</a>
	    		<a href="${ path }/show/boList?genre=play" class="treeMenuLv1">연극</a>
	    		<a href="${ path }/show/boList?genre=classic" class="treeMenuLv1">클래식</a>
    		<a href="" class="treeMenuLv0">메이트</a>
	    		<a href="${ path }/mate/list" class="treeMenuLv1">같이가요</a>
	    		<a href="${ path }/share/list" class="treeMenuLv1">티켓나눔</a>	    	
    		<a href="" class="treeMenuLv0">이벤트</a>
    		<a href="" class="treeMenuLv0">고객센터</a>
    	</div>
		<div id="myCarousel" class="carousel slide carouselDiv" data-ride="carousel">
	        <ol class="carousel-indicators">
	          <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
	          <li data-target="#myCarousel" data-slide-to="1"></li>
	          <li data-target="#myCarousel" data-slide-to="2"></li>
	        </ol>
	        <div class="carousel-inner">
	          <div class="carousel-item active">
	          	<a href="">
		          	<img
		              src="https://dummyimage.com/1050x300/ffe812/000.png&text=Hello"
		              alt="First Slide"
		            />
	            </a>
	          </div>
	          <div class="carousel-item">
	          	<a href="">
		            <img
		              src="https://dummyimage.com/1050x300/ff8c00/000.png&text=How"
		              alt="Second Slide"
		            />
		        </a>
	          </div>
	          <div class="carousel-item">
	          	<a href="">
		            <img
		              src="https://dummyimage.com/1050x300/228b22/000.png&text=RU"
		              alt="Third Slide"
		            />
	            </a>
	          </div>
	        </div>
	        <!-- Carousel controls -->
	        <a class="carousel-control-prev" href="#myCarousel" data-slide="prev">
	          <span class="carousel-control-prev-icon"></span>
	        </a>
	        <a class="carousel-control-next" href="#myCarousel" data-slide="next">
	          <span class="carousel-control-next-icon"></span>
	        </a>
		</div>
	</div>
	
	<div class="searchContainer">
		<div class="btn-group btn-group-toggle innerDivRadio" data-toggle="buttons">
		  <label class="btn btn-outline-secondary active">
		    <input type="radio" name="genre" id="radioGenreNone" autocomplete="off" checked>전체
		  </label>
		  <label class="btn btn-outline-secondary">
		    <input type="radio" name="genre" id="radioGenreMusical" autocomplete="off">뮤지컬
		  </label>
		  <label class="btn btn-outline-secondary">
		    <input type="radio" name="genre" id="radioGenrePlay" autocomplete="off">연극
		  </label>
		  <label class="btn btn-outline-secondary">
		    <input type="radio" name="genre" id="radioGenreClassic" autocomplete="off">클래식
		  </label>
		</div>
		<div class="innerDivInput">
		  <input type="text" class="searchInput" placeholder="상연중인 공연 제목으로 검색하기">
		  <div class="input-group-append">
		    <button class="btn btn-outline-secondary btn-lg" type="button">검색</button>
		  </div>
		</div>
	</div>
	
	<div id="iconsContainer" class="titleFont">
		<div id="iconsMusical" class="icons">
			<img alt="뮤지컬" src="${ path }/resources/images/main/choir.png">
			<p>뮤지컬</p>
		</div>
		<div id="iconsPlay" class="icons">
			<img alt="연극" src="${ path }/resources/images/main/theater.png">
			<p>연극</p>
		</div>
		<div id="iconsClassic" class="icons">
			<img alt="클래식" src="${ path }/resources/images/main/violin.png">
			<p>클래식</p>
		</div>
		<div id="iconsMate" class="icons">
			<img alt="메이트" src="${ path }/resources/images/main/friends.png">
			<p>메이트</p>
		</div>
	</div>
	
	<div id="boContainer"></div>
	
	<script src="${ path }/resources/js/home.js"></script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>