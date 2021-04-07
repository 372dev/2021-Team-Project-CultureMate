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
	border-bottom: solid 1px;
	width: 1181px;
}

.bls_tbbk {
    margin-bottom: 0;
	
}

.bls_tbbk {
    margin: 30px 0 20px;
}

.bls_tbls.c3 {
    margin-right: -1%;
    width: 100%;
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
}

#plcMap{
	 box-sizing: content-box;
}

.box{
	font-size: 13px;

	
}

.pt{
	width: 100%;
}

.pt th{
	border: solid 1px;
}

.pt td{
border: solid 1px;
}




.rn{
	position: absolute;
    width: 238px;
    padding-left: 1px;
    font-size: 30px;
    font-weight: bold;
    color: #333;
    font-family: 'Noto Sans KR','NanumBarunGothic','맑은 고딕','Malgun Gothic',sans-serif;
}

.rn-1{
    margin-left: 240px;
    clear: right;
    font-size: 14px;
    line-height: 28px;
    color: #555;
    padding: 0 0 85px 3px;
    letter-spacing: -0.03em;
}

.rn-2{
    padding: 33px 0 15px 0;
    margin-left: -3px;
}

.re-ta{
	padding: 33px 0 15px 0;
    margin-left: -3px;
}

.re-ta table {
    border-collapse: collapse;
    width: 100%;
}

.re-ta table th {
    border-top: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
    background: #fbe5d5;
    text-align: center;
    font-size: 15px;
    color: #333;
    padding: 8px 0 3px 0;
}

.re-ta table td {
    border-bottom: 1px solid #eee;
    text-align: center;
    font-size: 14px;
    color: #555;
    padding: 6px 0 5px 0;
    vertical-align: middle;
}

div#comment-container {
  height: 200px;
  background: #C9E6D1;
  padding: 5px;
  border: solid 1px; 
}

div#comment-container button#btn-insert {
  width: 100px;
  height: 100px;
  color: black;
  background-color: white;
  position: relative;
  top: -45px;
}

/*댓글테이블*/
table#tbl-comment {
  border-collapse: collapse;
  clear: both;
  width: 100%;
}

table#tbl-comment tr td {
  border-bottom: 1px solid;
  text-align: left;
  width: 1000px;
}

table#tbl-comment sub.comment-writer {
  color: navy;
  font-size: 14px;
}

table#tbl-comment sub.comment-date {
  color: tomato;
  font-size: 10px;
}

#star a{ text-decoration: none; color: gray; } #star a.on{ color: red; }

a#btn-insert {
    margin-bottom: 30px;
    /* top: -10px; */
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
		<!-- 
		</div>
		 --> 
		
		
		
		
		
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
            		<br>
					<c:forEach var="i" begin="0" end="${max}">
					<img alt="" src="${show.styurls.styurl[i]}"><br>
					</c:forEach>
			</div>
		</div>

		<!--공연장 정보-->
        <div class="bxo_vcb" style="display: none">
			<div class="tib">
				<h4 class="nb_tit1" >
				공연장 정보
				</h4>
				
		<table class="pt">
        <tr>
          <th>공연기간</th>
          <td>
          	<c:if test="${show.prfpdfrom != null}">
				<c:out value="${show.prfpdfrom}"/> ~ <c:out value="${show.prfpdto}"/>
			</c:if>
			<c:if test="${show.prfpdfrom == null}">
				<c:out value="정보가 없습니다."/> 
			</c:if>
		</td>
        </tr>
        <tr>
          <th>최석수</th>
          <td>
          	<c:out value="${place.get(0).seatscale}"/> 
          </td>
        </tr>
        <tr>
          <th>시설특성</th>
          <td>
          	<c:out value="${place.get(0).fcltychartr}"/>
          </td>
        </tr>
          <tr>
          <th>주소</th>
          <td>
          	<c:out value="${place.get(0).adres}"/>
          </td>
        </tr>
          <tr>
          <th>홈페이지</th>
          <td>
			<c:out value="${place.get(0).relateurl}"/>
          </td>
        </tr>
   		</table>
   		
			</div>
			<br>
			<h3 style="text-align: center;">공연장 위치</h3>
		</div>
		<div id="plcMap" style="width:100%;height:400px;" ></div>
		
		
		<div class="bxo_vcb" style="display: none">
			<div class="tib">
				<h4 class="nb_tit1">관람 후기</h4>
			</div>
			<div id="comment-container">
				<div> 게시판 운영규정에 맞지 않는 글은 사전 통보없이 삭제될 수 있습니다.  </div>
				<form method="post" id="reply_form">
					<P id="star"> 
					<a  value="1">★</a> 
					<a  value="2">★</a> 
					<a  value="3">★</a> 
					<a  value="4">★</a> 
					<a  value="5">★</a> 
					</p>
					<textarea name="reviewContent" cols="100" rows="4" onfocus="" id="reviewContent"></textarea>
					<input type="hidden" id="mt20id" name="mt20id" value="${result.get(0).mt20id}">
					<a href='#'  id="btn-insert" onClick="fn_comment('${result.get(0).mt20id}')" class="btn pull-right btn-success">등록</a>
				</form>
			</div>
			<br>
			<table id="tbl-comment">
			<!-- for문을 사용하여 댓글수만큼 출럭 가능하게 구현하기 -->
			<tr class="level1">
					<td><sub class="comment-writer"> 작성자: 김민규	</sub> 
					<sub class="comment-date"> 2021.04.06	</sub>
					<a id="deletereply" href="">삭제</a>
					 <br><br> 
					 여기에 내용이 작성될 예정입니다.
					<br><br>
					</td>
				</tr>
			</table>
			
			<div>
			
			</div>
		</div>
		
		<div class="bxo_vcb" style="display: none" >
			<div class="tib">
				<h4 class="nb_tit1">환불 정보</h4>
			</div>
			<div class="rn">
			예매
			</div>
			<div class="rn-1">
			예매는 PC, 모바일, 고객센터 를 통해 신용카드, 가상계좌(무통장 입금), CM머니, CM상품권, 예치금 등으로 예매하실 수 있습니다.<br>
			(단, 상품마다 사용 가능한 결제 수단이 다르게 적용될 수 있으니 상품 상세페이지 안내 사항을 확인해주세요.)<br>
			무통장입금 결제 선택 시 입금 마감시간은 예매일 익일 밤 11시 29분까지입니다. 입금 마감시간 내 미입금 된 경우 예매가 자동 취소됩니다.<br>
			(단, 상품에 따라 예매 당일 밤 11시 29분에 마감되는 경우가 있으니 예매 전후 반드시 확인해주시기 바랍니다.)<br>
			예매수수료는 다음과 같습니다.<br>
			<div class="re-ta">
			<table >
				<tr> 
					<th>장르 </th>
					<th> PC / 모바일</th>
					<th> 전화예매</th>
				</tr>
				<tr> 
					<td>콘서트, 뮤지컬, 클래식, 국악, 무용 </td>
					<td>장당 1,000원</td>
					<td rowspan="3"> 장당 2,000원</td>
				</tr>
				<tr> 
					<td>연극, 전시 </td>
					<td>장당 500원</td>
				</tr>
				<tr> 
					<td>체험, 행사 </td>
					<td>장당 300원</td>
				</tr>
			</table>
			</div>
			
			</div>
			
		</div>
		
		</section>
			

<!-- 댓글 작성 ajax -->
<script type="text/javascript">

function fn_comment(code){
    console.log("에이작스 호출");
    $.ajax({
        type:'POST',
        url : "<c:url value='/review/add.do'/>",
        data:$("#reply_form").serialize(),
        success : function(data){
            if(data=="success")
            {
                getCommentList();
                $("#reviewContent").val("");
            }
        },
        error:function(request,status,error){
       }
        
    });
}


$(function(){
    console.log("aaaar?");
    getCommentList();
    
});




/**
 * 댓글 불러오기(Ajax)
 */
function getCommentList(){
    
    $.ajax({
        type:'GET',
        url : "<c:url value='/review/list.do'/>",
        dataType : "json",
        data:$("#reply_form").serialize(),
        contentType: "charset=UTF-8", 
        success : function(data){
            
            var html = "";
            var cCnt = data.length;
            
            if(data.length > 0){
			
                for(i=0; i<data.length; i++){
                    html += "<tr class='level1'>";
                    html += "<td><sub class='comment-writer'>" + data[i].id + "</sub> ";
                    html += "<sub class='comment-date'>" +data[i].reviewDate + "</sub>" ;
                    html += "<a id='deletereply' href=''>삭제</a> <br><br>"  + data[i].reviewContent + " <br><br></td></tr>" ;
                }
                
            } else {
                
                html += "<div>";
                html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
                html += "</table></div>";
                html += "</div>";
                
            }
            
         //   $("#cCnt").html(cCnt);
            $("#tbl-comment").html(html);
            
        },
        error:function(request,status,error){
            
       }
        
    });
}
</script>

		
<script type="text/javascript">
$('#star a').click(function(){ 
	$(this).parent().children("a").removeClass("on"); 
	$(this).addClass("on").prevAll("a").addClass("on"); 
	console.log($(this).attr("value")); });

</script>		
			
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3350da83d3aa1ab8eefb3c639de15502"></script>
		
<script>
		var mapContainer = document.getElementById('plcMap'), // 지도를 표시할 div 
		    mapOption = {
				center: new kakao.maps.LatLng(${place.get(0).la}, ${place.get(0).lo}), // 지도의 중심좌표
		        level: 4, // 지도의 확대 레벨
		        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
		    }; 

		// 지도를 생성한다 
		var map = new kakao.maps.Map(mapContainer, mapOption); 

		// 지도에 마커를 생성하고 표시한다
		var marker = new kakao.maps.Marker({
		    position: new kakao.maps.LatLng(${place.get(0).la}, ${place.get(0).lo}), // 마커의 좌표
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