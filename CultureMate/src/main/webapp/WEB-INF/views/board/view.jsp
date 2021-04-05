<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<style>
	.a{
		border: solid 1px;
		min-height: 500px;
	}
	
	.b{
		border: solid 1px;
	}
	
	.rn-03 {
    margin-top: 40px;
    margin-left: 400px;
    overflow: hidden;
    padding-bottom: 50px;
    position: relative;
   
}

.rn-03-left {
    float: left;
    width: 430px;
}
	
	.rn-03-right {
    width: 701px;
    float: left;
    margin-left: 50px;
}
	
	.rn-03-right .rn-product-area1 {
    border-bottom: 1px solid #000;
    position: relative;
   
}

 .rn-product-imgbox {
    width: 430px;
    height: 600px;
    position: relative;
}

.rn-03-right dt {
    font-size: 20px;
    color: #333;
    font-weight: bold;
    float: left;
    line-height: 35px;
}
	
	.rn-03-right dd {
    font-size: 15px;
    color: #333;
    clear: right;
    margin: 0 0 3px 86px;
    line-height: 35px;
    position: relative;
}
	
.rn-03-right .rn-product-area3 {
    min-height: 174px;
    border-bottom: 1px solid #000;
}

.title{
	margin-left: 400px;
	border-bottom: solid 1px;
	width: 1181px;
}

.bls_tbbk {
    margin-bottom: 0;
	
}

.bls_tbbk {
    margin: 30px 0 20px;
    margin-left: 400px;
}

.bls_tbls.c3 {
    margin-right: -1%;
    width: 1181px;
}

.bls_tbls {
    overflow: hidden;
    text-align: center;
}

.bls_tbls.c3 > li {
    width: 25%;
}

.bls_tbls > li {
    float: left;
    width: 10%;
}

.bls_tbls > li > p > a {
    font-size: 17px;
    color: #666;
    display: table-cell;
    vertical-align: middle;
    padding: 0 4px;
}

.bls_tbls > li.on > p > a {
    color: #6153a7;
    font-family: 'notokr-medium';
    background: #f8f8f8;
}

.bls_tbls > li:first-child > p > a {
    border-left: 1px solid #d2d2d2;
}

.bls_tbls > li > p {
    display: table;
    width: 100%;
    box-sizing: border-box;
    height: 59px;
    border: 1px solid #d2d2d2;
    border-left: none;
}

.bls_tbls > li.on > p {
    border-top: 2px solid #6153a7;
}

ul, ol, li, dl, dt, dd {
    list-style: none;
    padding: 0;
}

.bxo_vcb {
    margin-top: 35px;
    margin-left: 400px;
}

#plcMap{
	 margin-left: 400px;
	 box-sizing: content-box;
}

.box{
	font-size: 13px;

	
}


</style>
			<section>
			<c:set var="show" value="${result.get(0)}"></c:set>
			
			<div class="title">
				<h3><c:out value="${show.prfnm}"/></h3>
				<br>
			</div>	
			<div class="rn-03"><!--상단-->
			<div class="first">
			<div class="rn-03-left"><!--포스터, 지역, 동영상-->
				<div class="rn-product-imgbox">
					<img src='${show.poster}' width="430px"/>
				</div>
				
			</div><!--rn-03-left-->
			
			<div class="rn-03-right"><!--상품정보-->
				
				<div class="rn-product-area1"><!--등급, 관람시간, 출연, 가격, 혜택-->
					<dl>
						<dt>장소</dt>
						<dd>&nbsp;<c:out value="${show.fcltynm}"/></dd>
						
						<br>
						
						<dt>기간</dt>
						<c:if test="${show.prfpdfrom != null}">
						<dd>&nbsp;<c:out value="${show.prfpdfrom}"/> ~ <c:out value="${show.prfpdto}"/></dd>
						</c:if>
						<c:if test="${show.prfpdfrom == null}">
						<dd><c:out value="정보가 없습니다."/> </dd>
						</c:if>
						<br>
						
						<dt>관람 시간&nbsp;</dt>
						<dd><c:out value="${show.prfruntime}"/></dd> 
						<c:if test="${prfruntimesize == 1}">
						<dd><c:out value="정보가 없습니다."/></dd> 
						</c:if>
						
						<br>
						
						<dt>관람 등급&nbsp;</dt>
						<c:if test="${show.prfruntime != null}"></c:if>
						<dd><c:out value="${show.prfage}"/></dd> 
							
						<br>
         			</dl>
				</div>
				
				<div class="rn-product-area3"><!--공연시간안내, 배송정보-->
					<dl>
						<br>
						
						<dt>가격</dt>
						<dd><c:out value="${show.pcseguidance}"/></dd> 
						<c:if test="${pcseguidancesize == 1}">
						<dd><c:out value="정보가 없습니다."/></dd> 
						</c:if>
						
						<br>
						<dt>출연진</dt>
						<dd><c:out value="${show.prfcast}"/> </dd>
						<c:if test="${show.prfcast.length() == 1}">
						<dd><c:out value="정보가 없습니다."/> </dd>
						</c:if>
						<br>
					</dl>
				</div>
				
			</div>
			</div><!--rn-03-right-->
			</div>
		</div><!--rn-03-->
		
		
		
		<div class="bls_tbbk">
			<ul class="bls_tbls c3">
				<li class="on"><p><a href="#n" id="poster">소개</a></p></li>
				<li><p><a href="#n" id="perf">공연 시설</a></p></li>
				<li><p><a href="#n" id="stats">관람 후기</a></p></li>
				<li><p><a href="#n" id="refund">환불 정보</a></p></li>
			</ul>
		</div>
		
		
		
		<!-- 소개 -->
		<div class="bxo_vcb">			
            <div class="detailArea">
            		<c:out value="${show.sty}"/>
					<c:forEach var="i" begin="0" end="${max}">
					<img alt="" src="${show.styurls.styurl[i]}"><br>
					</c:forEach>
			</div>
		</div>

		<!--공연장 정보-->
        <div class="bxo_vcb" style="display: none">
			<div class="tib">
				<h4 class="nb_tit1">
				공연장정보
				</h4>
			</div>
		</div>
		<div id="plcMap" style="width:500px;height:400px;" ></div>
		
		
		<div class="bxo_vcb" style="display: none">
			<div class="tib">
				<h4 class="nb_tit1">관람 후기</h4>
			</div>
		</div>
		
		<div class="bxo_vcb" style="display: none" >
			<div class="tib">
				<h4 class="nb_tit1">환불 정보</h4>
			</div>
		</div>
			
		</section>
			
			
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3350da83d3aa1ab8eefb3c639de15502"></script>
		
<script>
		var mapContainer = document.getElementById('plcMap'), // 지도를 표시할 div 
		    mapOption = {
				center: new kakao.maps.LatLng(${place[0]}, ${place[1]}), // 지도의 중심좌표
		        level: 4, // 지도의 확대 레벨
		        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
		    }; 

		// 지도를 생성한다 
		var map = new kakao.maps.Map(mapContainer, mapOption); 

		// 지도에 마커를 생성하고 표시한다
		var marker = new kakao.maps.Marker({
		    position: new kakao.maps.LatLng(${place[0]}, ${place[1]}), // 마커의 좌표
		    map: map // 마커를 표시할 지도 객체
		});

		// 마커 위에 표시할 인포윈도우를 생성한다
		var infowindow = new kakao.maps.InfoWindow({
			content : '<div style="padding:5px;"><c:out value="${result.get(0).fcltynm}"/>&nbsp</div>' // 인포윈도우에 표시할 내용
		});

		// 인포윈도우를 지도에 표시한다
		infowindow.open(map, marker);

		</script>
	
<script type="text/javascript">
	
var tabMenu = ["poster","perf","stats","refund"];
$.each(tabMenu, function(index, value) {
	$("#" + value).click(function () {
		$(".bls_tbls li").eq(index).addClass("on");
		
		//내용보이기
		if (value == "poster") {
			$("#plcMap").hide(); 
			$(".bxo_vcb").eq(0).show();
		}else if(value == "perf") {
			$("#plcMap").show();
			$(".bxo_vcb").eq(1).show();
			
		}else if(value == "stats") {
			$("#plcMap").hide();
			$(".bxo_vcb").eq(2).show();
			
			$("#plcMap").hide();
		}else if(value == "refund") {
			$("#plcMap").hide();
			$(".bxo_vcb").eq(3).show();
			
		}
		//나머지 항목
		for (var i in tabMenu) {
			if (tabMenu[i] != value) {  
				$(".bls_tbls li").eq(i).removeClass();
				$(".bxo_vcb").eq(i).hide();
			}
		};
	});
	
});

$("#plcMap").hide();
</script>



<%@ include file="/WEB-INF/views/common/footer.jsp"%>