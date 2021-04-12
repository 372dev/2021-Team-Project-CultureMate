<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.standalone.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.kr.min.js"></script>


<link rel="stylesheet" href="${path}/css/slick.css">
<link rel="stylesheet" href="${path}/css/slick-theme.css">
<script src="${path}/js/slick.js"></script>
<script src="${path}/js/index.js"></script>

<style>
.dot {
	cursor: pointer;
	height: 13px;
	width: 13px;
	margin: 0 2px;
	background-color: #bbb;
	border-radius: 50%;
	display: inline-block;
	transition: background-color 0.6s ease;
	}
	
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
    width: 35%;
}
	
	.rn-03-right {
    width: 35%;
    float: left;
    margin-left: 50px;
    border-right: solid 1px;
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
   color: navy;
  font-size: 14px;
}

#star a{ text-decoration: none; color: gray; } #star a.on{ color: red; }

a#btn-insert {
    margin-bottom: 30px;
    /* top: -10px; */
}

.disable { background-color: gray;  }

#deletereply{
	float: right;
}

div#datepicker {
    width: 20%;
    float: left;
    margin-left: 50px;
}

#re-button{
 margin-left: 110px;
 margin-top: 50px;
}

#today_text{
text-align: center;

}

.text_today {
	display: inline-block;
    top: 35px;
    transform: translateX(-50%);
    font-family: var(--font);
    font-size: 25px;
    text-align: center;
   
}

#today {
    width: 100%;
    height: 350px;
   text-align: center;
    display: inline-block;
}

#today .list {
    text-align: center;
    width: 250px;
    height: 330px;
}

#today .list01, .list03, .list05 {
   
}

#today .list02, .list04, .list06 {
   
}


</style>
			<section>
			<c:set var="show" value="${result.get(0)}"></c:set>
			
			<div class="title">
				<h3>[<c:out value="${show.genrenm}"/>]<c:out value="${show.prfnm}"/></h3>
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
			<div id="cal">
			<div id="datepicker" ></div>
			<input type="hidden" id="my_hidden_input">
			<button type="button" class="btn btn-success" id="re-button">예매하기</button>
			</div>
			</div>
			
			</div><!--rn-03-right-->
			
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
					<a id=star1 value=1>★</a> 
					<a id=star1 value=2>★</a> 
					<a id=star1 value=3>★</a> 
					<a id=star1 value=4>★</a> 
					<a id=star1 value=5>★</a> 
					</p>
					<textarea name="reviewContent" cols="100" rows="4" onfocus="" id="reviewContent"></textarea>
					<input type="hidden" id="mt20id" name="mt20id" value="${result.get(0).mt20id}">
					<c:if test="${ !empty loginMember}">
					<input type="hidden" id="id" name="id" value="${loginMember.id}">
					<input type="hidden" id="userNick" name="userNick" value="${loginMember.userNick}">
					<div id="hstar" style="float: left">
					
					</div>
					</c:if>
					 
					 
					 <c:choose>
					 	<c:when test="${!empty loginMember}">
					 	<a href="" id="btn-insert" onClick='fn_comment()' class="btn pull-right btn-success ">등록</a>
					 	</c:when>
					 	<c:otherwise>
					 	<a  id="btn-insert"  class="btn pull-right btn-success disable ">등록</a>
					 	</c:otherwise>
					 </c:choose>
					
				</form>
			</div>
			<br>
			<table id="tbl-comment">
			<!-- for문을 사용하여 댓글수만큼 출럭 가능하게 구현하기 -->
			</table>
			
			<table id="tbl-comment">
					<c:forEach var="review1"  items="${review}">
					<tr class='level1'>
                    <td><sub class="comment-writer">${review1.userNick} |</sub>
                     <sub class="comment-date">${review1.reviewDate} | </sub> 
                     <c:forEach var ="j" begin="1" end="${review1.reviewRating}">
                     <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16"><path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
					</svg>
					</c:forEach>
                     <c:if test="${loginMember.userNick == review1.userNick }">
                     <a id='deletereply' href='' onclick="del(${review1.reviewID})">삭제</a>
                     </c:if>
                     <br><br>${review1.reviewContent}<br><br></td></tr>
                     </c:forEach>
			</table>
			
			<div>
			
			</div>
		</div>
		
		<div class="bxo_vcb" style="display: none" >
			<div class="tib">
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
					<td>뮤지컬, 콘서트</td>
					<td>장당 1,000원</td>
					<td rowspan="2"> 장당 2,000원</td>
				</tr>
				<tr> 
					<td>연극</td>
					<td>장당 500원</td>
				</tr>
			</table>
			</div>
			
			</div>
			<hr>
			<!-- 티켓수령 방법  -->
			<div class="rn">
			티켓수령방법
			</div>
			<div class="rn-1">
			현장수령<br>
			티켓은 예매자 본인 수령이 기본 원칙입니다.<br>
			공연 당일 예매확인서와 예매자의 신분증 을 지참하신 후 공연장 매표소에서 티켓을 수령하시면 됩니다.<br>
			<br>
			배송<br>
			배송을 선택하신 경우 예매완료(결제익일) 기준 5~7일 이내에 예매 시 입력하신 주소로 배송됩니다.(영업일 기준)<br>
			일괄배송의 경우 각 상품의 지정된 배송일자 기준으로 배송이 시작됩니다. 배송 시작일은 상세정보 및 예매공지사항에서 확인할 수 있습니다.<br>
			지역 및 배송 서비스 사정에 따라 배송사가 변경될 수 있으며, 배송일이 추가적으로 소요될 수 있습니다.(CJ대한통운, 우체국 외 1개 업체)<br>
			* 티켓 수령과 관련된 정책은 상품별로 상이하니 자세한 내용은 각 상품 상세정보에서 확인 부탁드립니다.<br>
			</div>
			
			<hr>
			
			<!-- 취소마감시간 -->
			<div class="rn">
			취소마감시간
			</div>
			<div class="rn-1">
			<div class="re-ta">
			<table >
				<tr> 
					<th>공연 관람일 </th>
					<th> 취소 마감일</th>
				</tr>
				<tr> 
					<td>화요일 ~ 토요일 </td>
					<td>관람일 전일 평일 오후 5시</td>
				</tr>
				<tr> 
					<td>일요일 ~ 월요일 </td>
					<td>토요일 오전 11시</td>
				</tr>
				<tr> 
					<td>공휴일 및 공휴일 익일 </td>
					<td>공휴일 전일이 평일인 경우 - 오후 5시 <br>
						공휴일 전일이 토요일, 일요일인 경우 - 토요일 오전 11시 <br>
						공휴일에는 예매 취소 불가</td> 
				</tr>
			</table>
			</div>
			관람일 당일 예매하신 건은 취소, 변경, 환불 불가합니다. <br>
			배송이 시작된 티켓의 경우 티켓이 컬처메이트 공연 고객센터로 취소마감시간 이전까지 반송되어야 취소 가능합니다.(취소수수료는 도착일 기준으로 부과됩니다.) <br>
			결제수단을 복수로 선택한 경우 인터넷으로 부분취소가 불가하오니, 고객센터로 문의해주시기 바랍니다. <br>
			 <br>
			일부 공연에 한해, 취소 마감 정책이 달라질 수 있습니다. <br>
			각 상품 상세페이지에 안내되어 있는 취소 정책이 우선 적용되오니, 반드시 예매 전 확인해주시기 바랍니다. <br>
			</div>
			
			<hr>
			<!-- 취소수수료 -->
			<div class="rn">
			취소수수료
			</div>
			<div class="rn-1">
			<div class="re-ta">
			<table >
				<tr> 
					<th>취소일 </th>
					<th>취소수수료</th>
				</tr>
				<tr> 
					<td>예매 후 7일 이내 </td>
					<td>없음</td>
				</tr>
				<tr> 
					<td>예매 후 8일 ~ 관람일 10일 전까지 </td>
					<td>뮤지컬, 콘서트 : 장당 4,000원 / 연극 : 장당 2,000원(단, 티켓 금액의 10% 이내)</td>
				</tr>
				<tr> 
					<td>공관람일 9일 전 ~ 관람일 7일 전까지 </td>
					<td>티켓 금액의 10%</td> 
				</tr>
				<tr> 
					<td>관람일 6일 전 ~ 관람일 3일 전까지 </td>
					<td>티켓 금액의 20%</td> 
				</tr>
				<tr> 
					<td>관람일 2일 전 ~ 취소마감일시까지 </td>
					<td>티켓 금액의 30%</td> 
				</tr>
			</table>
			</div>
			예매 후 7일 이내라도 취소시점이 관람일로부터 10일 이내라면 그에 해당하는 취소수수료가 부과됩니다. <br>
			관람일 당일 취소 가능한 상품의 경우 관람일 당일 취소 시 티켓금액의 90%가 부과됩니다. <br>
			상품의 특성에 따라 취소수수료 정책이 달라질 수 있습니다.(각 상품 예매 시 취소수수료 확인) <br>
			</div>
			
			<hr>
		<!-- 환불  -->
		<div class="rn">
			취소수수료
			</div>
			<div class="rn-1">
			예매수수료는 예매 당일 밤 12시 이전까지 환불되며, 그 이후 기간에는 환불되지 않습니다.<br>
			배송 및 반송처리 된 티켓의 배송비는 환불되지 않습니다.<br>
			<div class="re-ta">
			<table >
				<tr> 
					<th>결제수단 </th>
					<th>환불안내</th>
				</tr>
				<tr> 
					<td>신용카드 </td>
					<td>	
					일반적으로 취소완료 되고 4~5일(토, 공휴일 제외) 후 카드 승인 취소가 확인됩니다. <br>
					취소시점에 따라 취소수수료와 예매수수료, 배송 받으신 경우 배송비를 제외한 금액만큼 환불 처리 됩니다.<br>  
					(부분 취소 시에는 잔여 티켓 금액 + 수수료 등을 제외하고 환불 처리 됩니다.)<br>
					각 카드사의 취소 정책에 따라 승인취소 및 환급일에 차이가 있을 수 있습니다.<br>
					자세한 사항은 카드사로 문의 바랍니다.<br>
					</td>
				</tr>
				<tr> 
					<td>무통장입금 </td>
					<td>
					예매 취소 시 반드시 환불 받으실 계좌번호와 은행명을 입력하세요. <br> 
					취소수수료,예매수수료와 배송 받으신 경우 배송비를 제외한 후 환불 처리됩니다.<br> 
					취소 후 환불 처리는 영업일 기준 3~5일 정도 소요됩니다.<br> 
					환불진행상태는 MY공연>예매확인/취소 상세내역에서 확인할 수 있습니다.<br> 
					<br> 
					* 배송 받은 티켓의 취소를 위해 고객센터로 발송하실 때, 환불 받으실 계좌 정보를 기입하여 보내주시면 보다 빠른 환불 처리가 가능합니다.<br> 
					</td>
				</tr>
			</table>
			</div>
			</div>
			
		
		</div>
		
		<br><br><br>
		
		<div id="today_best">
		<h1 id="today_text">다른 추천 공연</h1><br>
		        <div id="today">
		         <c:forEach var="i"  begin="0" end="7">
		          <div class="list" >
		          <a href="${path}/show/restview?name=${slist.get(i).mt20id}"><img src="${slist.get(i).poster}" class="m_img" style="width: 250px; height: 250px; text-align: center;" t></a>
		          <br><strong id="title">11</strong>
		          </div>
		  			 </c:forEach>
		     
		       </div>
		       <div style="text-align: center" id="dot">
						<span class="dot" onclick="currentSlide(1)"></span> 
						<span class="dot" onclick="currentSlide(2)"></span> 
						<span class="dot" onclick="currentSlide(3)"></span>
						<span class="dot" onclick="currentSlide(4)"></span>
				</div>
		</div>
		
		
		</section>
			

<!-- 달력 (datapciker) -->
<script type="text/javascript">
		
  			
		 var today = new Date().toISOString().substring(0, 10);;
		 $( 'datepicker' ).attr( 'data-date', today );
		  
		$('#datepicker').datepicker({
			format : "yyyy-mm-dd", // 달력에서 클릭시 표시할 값 형식
			language : "kr",
			todayHighlight: true
		});
		
		$('#datepicker').on('changeDate', function() {
		    $('#my_hidden_input').val(
		        $('#datepicker').datepicker('getFormattedDate')
		       
		    );
		});
	</script>
	
<!-- 댓글 평점-->
<script type="text/javascript">
$('#star a').click(function(){ 
	$(this).parent().children("a").removeClass("on"); 
	$(this).addClass("on").prevAll("a").addClass("on"); 
	console.log($(this).attr("value"));
	
	$.ajax({
		type: "post",
		url: "<c:url value='/review/star.do'/>",
		data: {"num" : $(this).attr("value")},
		success: function(result) {
		  html = '<input type="hidden" id="reviewRating" name="reviewRating" value="' + result + '  ">';
		  $("#hstar").html(html);
		  console.log("히든성공");
		},
		error: function(e) {
			console.log(e);
		}
	});
});
	
//댓글 작성
function fn_comment(){
    console.log("에이작스 호출");
    $.ajax({
        type:'POST',
        url : "<c:url value='/review/add.do'/>",
        data:$("#reply_form").serialize(),
        success : function(data){
        	console.log("불러오기 성공!!");
            if(data == ("success"))
            {
            	console.log("불러오기 성공!!");
            }
            
        },
        error:function(request,status,error){
        	console.log("불러오기실패!!");
       }
        
    });
}


//댓글삭제
function del(no) {  
	
	console.log("del실행" + no);
  $.ajax({
      type : 'GET',
      url : "<c:url value='/review/delete.do?no=" + no + "'/>",
  });

}
</script>

	
<!-- 카카오 지도 API -->		
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
//탭 메뉴	
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