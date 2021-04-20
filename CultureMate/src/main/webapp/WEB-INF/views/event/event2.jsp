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
		<h3>클래식</h3>
		<p>“클래식을 듣고 싶은데 뭐부터 들어야 할지 모르겠어.”
			“클래식은 어떻게 입문해야 하지?”
			
			사실 이 질문들은
			
			“힙합을 듣고 싶은데 뭐부터 들어야 할지 모르겠어.”
			“프로그레시브 하우스는 어떻게 입문해야 하지?”
			
			이 질문들과 다를 것이 없다.
		</p>
</div >
</section>









<%@ include file="/WEB-INF/views/common/footer.jsp"%>
