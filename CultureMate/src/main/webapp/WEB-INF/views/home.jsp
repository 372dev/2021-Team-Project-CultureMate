<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<c:set var="path" value="${ pageContext.request.contextPath }" />

    <link rel="stylesheet" href="${path}/resources/css/home.css" />
	<link rel="stylesheet" href="${ path }/resources/css/showListStyle.css?v=1" />
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
	<h2>${ mbo[0].cate } 주간 박스 오피스</h2>
	<div>
		<button id="reLocToBoList">
			더 보기
		</button>
	</div>
	<div id="boListDiv" class="ListDiv">
		<c:if test="${ mbo == null }">
			<p>조회된 게시물이 없습니다.</p>
		</c:if>
		<c:if test="${ mbo != null }">
			<c:forEach var="mboVO" items="${ mbo }" begin="0" end="3">
			<div class="card">
				<div class="cardImgWrapper" onclick="location.href='${ path }/show/restview?name=${mboVO.mt20id}';">
					<img src="http://www.kopis.or.kr${ mboVO.poster }" class="card-img-top" alt="${ mboVO.prfnm }">
				</div>
				<div class="card-body">
					<h5 class="card-title">${ mboVO.prfnm }</h5>
					<p class="card-text subTitle">${ mboVO.prfplcnm }</p>
					<p class="card-text">${ mboVO.prfpd }</p>
				</div>
			</div>
			</c:forEach>
		</c:if>
	</div>
	<h2>${ pbo[0].cate } 주간 박스 오피스</h2>
	<div>
		<button id="reLocToBoList">
			더 보기
		</button>
	</div>
	<div id="boListDiv" class="ListDiv">
		<c:if test="${ pbo == null }">
			<p>조회된 게시물이 없습니다.</p>
		</c:if>
		<c:if test="${ pbo != null }">
			<c:forEach var="pboVO" items="${ pbo }" begin="0" end="3">
			<div class="card">
				<div class="cardImgWrapper" onclick="location.href='${ path }/show/restview?name=${pboVO.mt20id}';">
					<img src="http://www.kopis.or.kr${ pboVO.poster }" class="card-img-top" alt="${ pboVO.prfnm }">
				</div>
				<div class="card-body">
					<h5 class="card-title">${ pboVO.prfnm }</h5>
					<p class="card-text subTitle">${ pboVO.prfplcnm }</p>
					<p class="card-text">${ pboVO.prfpd }</p>
				</div>
			</div>
			</c:forEach>
		</c:if>
	</div>
	<h2>${ cbo[0].cate } 주간 박스 오피스</h2>
	<div>
		<button id="reLocToBoList">
			더 보기
		</button>
	</div>
	<div id="boListDiv" class="ListDiv">
		<c:if test="${ cbo == null }">
			<p>조회된 게시물이 없습니다.</p>
		</c:if>
		<c:if test="${ cbo != null }">
			<c:forEach var="cboVO" items="${ cbo }" begin="0" end="3">
			<div class="card">
				<div class="cardImgWrapper" onclick="location.href='${ path }/show/restview?name=${cboVO.mt20id}';">
					<img src="http://www.kopis.or.kr${ cboVO.poster }" class="card-img-top" alt="${ cboVO.prfnm }">
				</div>
				<div class="card-body">
					<h5 class="card-title">${ cboVO.prfnm }</h5>
					<p class="card-text subTitle">${ cboVO.prfplcnm }</p>
					<p class="card-text">${ cboVO.prfpd }</p>
				</div>
			</div>
			</c:forEach>
		</c:if>
	</div>
	
	<script>
		var genre = null;
	</script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>