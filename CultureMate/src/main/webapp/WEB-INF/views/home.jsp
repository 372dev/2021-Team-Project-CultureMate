<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<c:set var="path" value="${ pageContext.request.contextPath }" />

    <link rel="stylesheet" href="${ path }/resources/css/home.css" />
	<link rel="stylesheet" href="${ path }/resources/css/listStyleHome.css" />
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
    		<a href="${ path }/mate/list" class="treeMenuLv0">메이트</a>
    		<a href="${ path }/share/list" class="treeMenuLv0">티켓나눔</a>
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
		    <input type="radio" name="radioGenre" value="" autocomplete="off" checked>전체
		  </label>
		  <label class="btn btn-outline-secondary">
		    <input type="radio" name="radioGenre" value="musical" autocomplete="off">뮤지컬
		  </label>
		  <label class="btn btn-outline-secondary">
		    <input type="radio" name="radioGenre" value="play" autocomplete="off">연극
		  </label>
		  <label class="btn btn-outline-secondary">
		    <input type="radio" name="radioGenre" value="classic" autocomplete="off">클래식
		  </label>
		</div>
		<div class="innerDivInput">
		  <input type="text" name="searchInput" id="searchInput" class="searchInput" placeholder="공연 제목으로 검색하기">
		  <div class="input-group-append">
		    <button id="showSearchBtn" class="btn btn-outline-secondary btn-lg" type="button">검색</button>
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
	
	<div id="boContainer" class="boContainer"></div>
	
	<script>
	$(document).ready(ajaxCall("m")).ready(ajaxCall("p")).ready(ajaxCall("c"));

	$('#musicalReloc').on('click', function() {
		reloc('musical');
	});
	$('#playReloc').on('click', function() {
		reloc('play');
	});
	$('#classicReloc').on('click', function() {
		reloc('classic');
	});

	$('#showSearchBtn').on('click', function() {
		var searchInput = $('#searchInput').val();
		var radioGenre = $('input[name="radioGenre"]:checked').val();
		mainShowSearch(searchInput, radioGenre);
	});
	
	$('#searchInput').on('keypress', function (e) {
	    if (e.key === 'Enter') {
			var searchInput = $('#searchInput').val();
			var radioGenre = $('input[name="radioGenre"]:checked').val();
			mainShowSearch(searchInput, radioGenre);
	    }
	});
	
	$('#iconsMusical').on('click', function() {
		window.location.replace('${ path }/show/boList?genre=musical');
	})
	$('#iconsPlay').on('click', function() {
		window.location.replace('${ path }/show/boList?genre=play');
	})
	$('#iconsClassic').on('click', function() {
		window.location.replace('${ path }/show/boList?genre=classic');
	})
	$('#iconsMate').on('click', function() {
		window.location.replace('${ path }/mate/list');
	})
		
	function ajaxCall(genre) {
		$.ajax({
			type : "GET",
			async: false,
			url : "/cm/show/ajaxBoList",
			data : {
				"genre" : genre,
			},
			error : function(error) {
				console.log("ajax-error : " + error);
			},
			success : function(result) {
				console.log("ajax-success");
				if(result) {
					var toAdd = '';
					if(result == null) {
						console.log("result == null");
						toAdd += "<div><p>박스 오피스에 일시적으로 접근이 불가합니다. 관리자에게 문의해 주세요.</p>";
					} else {
						console.log("result != null");
						toAdd += '<div class="boTitle"><h2 class="titleFont">' + result[0].cate + ' 주간 박스 오피스</h2>'
						toAdd += '<button type="button" class="btn btn-secondary btn-lg btnFont" id="'
							+ (result[0].cate == "뮤지컬" ? "musical" : (result[0].cate == "연극" ? "play" : "classic"))
							+ 'Reloc">더 보기</button></div>';
						toAdd += '<div class="ListDiv">';
						for(i = 0; i < 3; i++) {
							toAdd += '<img src="${ path }/resources/images/main/';
							if(i == 0) {
								toAdd += '1st-place.png" class="rankImg">';
							} else if(i == 1) {
								toAdd += '2nd-place.png" class="rankImg">';
							} else {
								toAdd += '3rd-place.png" class="rankImg">';
							}
							toAdd += '<div class="card ' + i + 'nd">';
							toAdd += '<div class="cardImgWrapper" onclick="location.href=\'' + '${ path }/show/restview?name=' + result[i].mt20id + '\';">';
							toAdd += '<img src="http://www.kopis.or.kr' + result[i].poster + '" class="card-img-top" alt="' + result[i].prfnm + '">';
							toAdd += '</div>';
							toAdd += '<div class="card-body">';
							toAdd += '<h5 class="card-title">' + result[i].prfnm + '</h5>';
							toAdd += '<p class="card-text subTitle">' + result[i].prfplcnm + '</p>';
							toAdd += '<p class="card-text">' + result[i].prfpd + '</p>';
							toAdd += '</div>';
							toAdd += '</div>';
						}
					}
					toAdd += '</div>';
					$("#boContainer").append(toAdd);
				}
			}
		});
	}

	function reloc(genre) {
		if(genre != null) {
	        $(location).attr("href", "${ path }/show/boList?genre=" + genre);
		}
	}

	function mainShowSearch(searchInput, radioGenre) {
	    $(location).attr("href", "${ path }/show/showList?title=" + searchInput + "&genre=" + radioGenre);
	}
	</script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>