<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "java.util.Date" %>


 
<!DOCTYPE html>
<html>
<head>
   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <meta name="description" content="">
   <meta name="author" content="">
   <link rel="icon" type="image/png" sizes="16x16" href="/projectB/resource/bootstrap/assets/images/favicon.png">
   <link href="/projectB/resource/bootstrap/css/style.min.css" rel="stylesheet">
   <link rel="stylesheet" type="text/css" href="/projectB/resource/bootstrap/assets/extra-libs/prism/prism.css">
   <link rel="stylesheet" type="text/css" href="/projectB/resource/bootstrap/assets/libs/chart.js/dist/Chart.min.css">
   <script type="text/javascript" src="/projectB/resource/bootstrap/assets/libs/chart.js/dist/Chart.min.js"></script>
   <style>
      body {
         text-align: center;
      }

		div {
			border: 1px solid;
		}
		
      iframe {
         width: 1000px;
         border: none;
         height: 1000px;
         margin: 20px auto;
      }
      
      
   </style>

   <title>청원 보기</title>
</head>

<body>
<div>
<br>
<form>
   <table cellspacing="0" cellpadding="0" align="center" width="800">
      <tr height="70">
         <td align="center"  colspan="4" width="800">청원제목 ${PetitionDTO.title}</td>
      </tr>
 
      <tr height="70">
         <td align="center" colspan="4" width="800">참여인원 : [ ${PetitionDTO.petition} 명]</td>
      </tr>
      
      <tr height="70">
         <td align="center"  colspan="4" width="800">
            <input type="hidden" id="achive" value="${PetitionDTO.petition / 2000}" />
            <div style="display: inline-block; height: 200px; width: 400px;">
	        	<canvas id="barr-chart" class="chartjs-render-monitor"
	                    style="display: inline; height: 200px; width: 400px;">
	            </canvas>
	        </div>





         </td>
      </tr>
      <tr height="70">
         <td align="center" width="100">카테고리 ${categoryName}</td>

         <c:choose>
         <c:when test="${1!=1 }">
         <td align="center" >
            </c:when>
            <c:otherwise>
         <td align="center" width="100" >
            청원시작
         <br/><fmt:formatDate value="${PetitionDTO.startDate}"
                        pattern = "yyyy-MM-dd" />
         </td>
         <td align="center" width="100">
            청원마감
         <br/><fmt:formatDate value="${PetitionDTO.endDate}"
                        pattern = "yyyy-MM-dd" />


            
            </c:otherwise>
            </c:choose>
         </td>
         <td align="center" width="200">청원인 : ${PetitionDTO.writer}</td>
      </tr>

      <tr height="70">
         <td align="center">청원상태</td>
      </tr>
	   <tr height="70">
         <td align="center">${petitionState}</td>
      </tr>
	

      <tr >
         <td align="center" width="200" colspan="1">내용 </td>
         <td align="left" width="600" colspan="3">${PetitionDTO.content}</td>
      </tr>
      <tr height="70">
         <td align="center" width="200" colspan="1"> 태그 </td>
         <td width="600" align="left" width="600" colspan="3">
            <c:forEach items="${fn:split(PetitionDTO.tag, ',') }" var="item">
               <a href="/projectB/petition/tag?tag=${item}" class="btn btn-light dropdown-toggle"
                aria-haspopup="true">#${item}</a>
            </c:forEach>
         </td>
      </tr>
  
      <tr height="70">
         <td align="center" width="200" colspan="1">관련 링크</td>
         <td width="600" align="left" width="600" colspan="3" >
            <c:forEach items="${fn:split(PetitionDTO.link, ',') }" var="item">
               <a href="${item}" target="_blank">${item}</a>
               <br/>
            </c:forEach>
         </td>
      </tr>
   </table>
</form>
	<div>
		 <input type="hidden" id="manCount" value="${petitionIndicatorDTO.manCount}" />
	     <input type="hidden" id="womanCount" value="${petitionIndicatorDTO.womanCount}" />
	     <input type="hidden" id="teens" value="${petitionIndicatorDTO.teens}" />
	     <input type="hidden" id="twenties" value="${petitionIndicatorDTO.twenties}" />
	     <input type="hidden" id="thirties" value="${petitionIndicatorDTO.thirties}" />
	     <input type="hidden" id="forties" value="${petitionIndicatorDTO.forties}" />
	     <input type="hidden" id="fifties" value="${petitionIndicatorDTO.fifties}" />
	     <input type="hidden" id="sixties" value="${petitionIndicatorDTO.sixties}" />
	
	     	<div style="display: inline-block; height: 200px; width: 300px;">
	        	<canvas id="pie-chart"  class="chartjs-render-monitor"
	                    style="display: inline; height: 200px; width: 300px;">
	            </canvas>
	        </div>
	
	            
	    				
	        <div style="display: inline-block; height: 200px; width: 300px;">
	           <canvas id="bar-chart"  style="display: inline; height: 200px; width: 300px;" 
	                   class="chartjs-render-monitor">
	           </canvas>
	     	</div>
	
	</div>
	
			<div>
				<input  type="button" class="btn waves-effect waves-light btn-outline-dark" align="left" value="신고"
	                  	onclick="document.location.href='신고창 url'">
				
				<input  type="button" class="btn waves-effect waves-light btn-outline-dark" align="center" value="목록보기"
	                  	onclick="document.location.href='목록url'">

	          
				<i class="far fa-trash-alt" align="right" onclick="document.location.href='삭제창 url'"></i>

			</div>	
	</div>
	
	
	
	
<iframe src="/projectB/petition/petComment.aa?petitionNum=${PetitionDTO.num}"></iframe>


<script src="/projectB/resource/bootstrap/assets/libs/jquery/dist/jquery.min.js"></script>
<script src="/projectB/resource/bootstrap/assets/libs/popper.js/dist/umd/popper.min.js"></script>
<script src="/projectB/resource/bootstrap/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="/projectB/resource/bootstrap/js/app-style-switcher.js"></script>
<script src="/projectB/resource/bootstrap/js/feather.min.js"></script>
<script src="/projectB/resource/bootstrap/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
<script src="/projectB/resource/bootstrap/assets/extra-libs/sparkline/sparkline.js"></script>
<script src="/projectB/resource/bootstrap/js/sidebarmenu.js"></script>
<script src="/projectB/resource/bootstrap/js/custom.min.js"></script>
<script src="/projectB/resource/bootstrap/assets/extra-libs/prism/prism.js"></script>
<script type="text/javascript">
   $(document).ready(function () {
      var manCount = $('#manCount').val();
      var womanCount = $('#womanCount').val();
      var teens = $('#teens').val();
      var twenties = $('#twenties').val();
      var thirties = $('#thirties').val();
      var forties = $('#forties').val();
      var fifties = $('#fifties').val();
      var sixties = $('#sixties').val();

      new Chart(document.getElementById("pie-chart"), {
         type: 'pie',
         data: {
            labels: ["남자", "여자"],
            datasets: [{
               label: "Population (millions)",
               backgroundColor: ["#A9E2F3", "#F5A9BC"],
               data: [manCount, womanCount]
            }]
         },
         options: {
            title: {
               display: false
            }
         }
      });

     

      new Chart(document.getElementById("bar-chart"), {
         type: 'bar',
         data: {
            labels: ["10대","20대","30대","40대","50대","60대"],
            datasets: [
               {
                  backgroundColor: ["#6174d5", "#5f76e8", "#768bf4", "#7385df", "#b1bdfa", '#FF0000'],
                  data: [teens,twenties,thirties,forties,fifties,sixties]
               }
            ]
         },
         options: {
            legend: {display: false},
            title: {
               display: false
            }
         }
      });


      var achive = $('#achive').val();

      new Chart(document.getElementById("barr-chart"), {
         type: 'horizontalBar',
         data: {
        	labels: ['달성도'],
            datasets: [{
               label: "달성도(%)",
               backgroundColor: ["#5a6be6"],
               data: [achive]
            }]
         },
         options: {
        	 scales: { 
        		 xAxes: [{ 
        			 offset: false,
        			gridLines: { 
        				 display: false
        				},
        				display: true,
        	            ticks: {
        	                suggestedMin: 0,    // minimum will be 0, unless there is a lower value.
        	                // OR //
        	                beginAtZero: true ,  // minimum value will be 0.
        	                max: 100
        	            }
        		 	}], 
        		 yAxes: [{
        			 offset: false,
        			 gridLines: { 
        				 display: false//축과 데이터의 경계선 표시 여부 
        		     }, 
        		 ticks: { 
        			 display: false,//축의 값 표시 여부 
        			 max: 100, 
        			 min: 0 
        	     } 
        		}] 
         	},

        		 
            title: {
               display: false
            }
         }
      })
   });
		
   
   
</script>
</body>
</html>      