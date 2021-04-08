<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<c:set var="path" value="${ pageContext.request.contextPath }" />

    <link rel="stylesheet" href="${path}/resources/css/home.css" />
	<link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
    />
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    
    <div class="topDiv">
    	<div class="sideMenuDiv">menu<br>tree<br>menu<br>tree<br>menu<br>tree<br></div>
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
		              src="https://dummyimage.com/1000x300/ffe812/000.png&text=Hello"
		              alt="First Slide"
		            />
	            </a>
	          </div>
	          <div class="carousel-item">
	          	<a href="">
		            <img
		              src="https://dummyimage.com/1000x300/ffe812/000.png&text=How"
		              alt="Second Slide"
		            />
		        </a>
	          </div>
	          <div class="carousel-item">
	          	<a href="">
		            <img
		              src="https://dummyimage.com/1000x300/ffe812/000.png&text=RU"
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

<%@ include file="/WEB-INF/views/common/footer.jsp"%>