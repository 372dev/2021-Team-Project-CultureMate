<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>


<h1>관리자페이지</h1>

       
        <ul class="nav nav-pills nav-fill">
          <li class="nav-item">
          <a class="nav-link"  href="${path}/admin/adminpage">회원조회</a>
          </li>
          <li class="nav-item">
          <a class="nav-link" href="${path}/admin/showbook">공연에약관리</a>
          </li>
          <li class="nav-item">
          <a class="nav-link active" style="background-color: #9DB81F;" href="${path}/admin/statistics">통계관리</a>
          </li>
         </ul>


<script type="text/javascript">
     
    google.charts.load('current', {'packages':['corechart'] }  );
    //google.charts.load('current', {'packages':['bar']}); 
    
    google.charts.setOnLoadCallback(drawChart);
      function drawChart() {

        var data = google.visualization.arrayToDataTable(
        	${str}	
        );

        var options = {
          title: '상품가격 비율'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
    </script>
    
    
      <div id="piechart" style="width: 900px; height: 500px;"></div>
   
  <div style="background-color: white;">
  	
  </div>
  
<%@ include file="/WEB-INF/views/common/footer.jsp"%>