
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<!-- Custom CSS -->
	<link href="/projectB/resource/bootstrap/css/style.css" rel="stylesheet">
	<!-- This Page CSS -->
	<link href="/projectB/resource/assets/libs/morris.js/morris.css" rel="stylesheet">
   <link rel="stylesheet" type="text/css" href="/projectB/resource/petition/petition.css">
   <script type="text/javascript" src="/projectB/resource/bootstrap/assets/libs/chart.js/dist/Chart.min.js"></script>
   <script src="https://d3js.org/d3.v2.js"></script>
   <script src="/projectB/resource/bootstrap/assets/libs/jquery/dist/jquery.min.js"></script>
   <style>
      body {
         text-align: center;
      }
      iframe {
         width: 100%;
         border: none;
         height: 900px;
         margin: 20px auto;
      }
      
		.petition-body > pre {
		    white-space: pre-wrap;
		}
   </style>

   <title>청원 보기</title>
</head>

<body>
<jsp:include page="/WEB-INF/views/topbar/top.jsp" />
<br>
<br>
<br>
<input type="hidden" id="achive" value="${petitionDTO.petition}" />
<input type="hidden" id="petitionState" value="${petitionDTO.petitionState}" />
<input type="hidden" id="endDate" value="<fmt:formatDate value="${petitionDTO.endDate}"
                        pattern = "yyyy-MM-dd" />"/>

<section class="petition-container" style="width: 900px;">
	<div class="petition-area-wrap">
		<div class="petition-title-area">
			<br/>
			<span style="color:black;font-weight:bold">${petitionDTO.title}</span>
		</div>
				<c:if test = "${petitionDTO.petitionState == 1 }">
					<span class="petition-dday" style="visibility: hidden;" id="dDay"></span>
				</c:if>
				<c:if test = "${petitionDTO.petitionState == 2 }">
					<span class="petition-dday" style="visibility: hidden;" id="dDay"></span>
				</c:if>
	</div>
	<div class="petition-header">
		<br/>
			<div class="petition-people-area" style="color:black;">
				<span style="font-size:12pt;font-weight:bold">참여인원  : [</span>
				<span style="margin:15px;font-size:16pt">${petitionDTO.petition}</span>
				<span style="font-size:12pt;font-weight:bold">명 ]</span>
				<span style="margin:50px;" id="percentageChart" ></span>
			</div>
				<br/><br/>
			<div class="petition-info-area"style="font-size:12pt;align:center;color:black;">
				<span style="font-weight:bold">카테고리 :</span> 
				<span style="margin-right:25px;">${categoryName}</span>
				<span class="petition-time"style="font-weight:bold">청원기간 : </span>
				<span>
					<fmt:formatDate value="${petitionDTO.startDate}" pattern = "yyyy-MM-dd" /> ~
					<fmt:formatDate value="${petitionDTO.endDate}" pattern = "yyyy-MM-dd" />
				</span>	
                <span style="margin-left:25px;font-weight:bold">청원인  : </span>
                <span>${petitionDTO.writer}</span>
			</div>
	</div>
	

	<div class="petition-state-area">
		<ul class="petition-state-list">
			<li <c:if test="${petitionDTO.petitionState == 1}">class="on"</c:if> >
				<div class="line-box">청원 시작</div>
				<div class="line"></div>
			</li>
			<li <c:if test="${petitionDTO.petitionState == 2}">class="on"</c:if> >
				<div class="line-box">청원 진행중</div>
				<div class="line"></div>
			</li>
			<li <c:if test="${petitionDTO.petitionState == 3}">class="on"</c:if> >
				<div class="line-box">청원 종료</div>
				<div class="line"></div>
			</li>
			<li <c:if test="${petitionDTO.petitionState == 4}">class="on"</c:if> >
				<div class="line-box">답변 대기중</div>
			</li>
		</ul>
	</div>

	<div class="petition-body">
		<pre style="font-size:14px; font-family: Ubuntu Mono">${petitionDTO.content}</pre>
		<br/>
			
		<c:if test="${petitionDTO.tag != null}">
			<c:forEach items="${fn:split(petitionDTO.tag, ',') }" var="item">
	            <a href="/projectB/petition/afootPetitionSearch.aa?keyword=${item}">#${item}</a>
	        </c:forEach>
        </c:if>
	</div>

	
	<c:if test="${petitionDTO.link != null}">
	<div class="petition-link-area">
		<h5 style="color:black;">관련 링크</h5>
		<c:forEach items="${fn:split(petitionDTO.link, ',') }" var="item">
           <a href="${item}" target="_blank">${item}</a>
        </c:forEach>
	</div>
	</c:if>
	
	 
	<input type="hidden" id="manCount" value="${petitionIndicatorDTO.manCount}" />
    <input type="hidden" id="womanCount" value="${petitionIndicatorDTO.womanCount}" />
    <input type="hidden" id="teens" value="${petitionIndicatorDTO.teens}" />
    <input type="hidden" id="twenties" value="${petitionIndicatorDTO.twenties}" />
    <input type="hidden" id="thirties" value="${petitionIndicatorDTO.thirties}" />
    <input type="hidden" id="forties" value="${petitionIndicatorDTO.forties}" />
    <input type="hidden" id="fifties" value="${petitionIndicatorDTO.fifties}" />
    <input type="hidden" id="sixties" value="${petitionIndicatorDTO.sixties}" />
		
		<c:if test="${petitionIndicatorDTO.manCount != 0 || petitionIndicatorDTO.womanCount != 0}">
	<div style="margin-top: 30px;" id="chartArea">
	     	<div style="display: inline-block; height: 200px; width: 300px; margin-left:100px;">
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
	</c:if>
	<div class="petition-link-area2">
		<h5 style="color:black;">URL</h5>
		<a id="copy_url" target="_blank"></a>
		<button type="button" class="btn waves-effect waves-light btn-outline-dark" onclick="copyToClipboard('#copy_url')">복사하기</button>
	</div>
	<br/>
	<div class="button-area" style="margin-left:420px">
		<c:if test="${memId != null and memId != petitionDTO.writer}">
			<button type="button" class="btn waves-effect waves-light btn-outline-dark" onClick="openReport(${petitionDTO.num});">신고</button>
		</c:if>
		
		<c:if test="${petitionDTO.petitionState != 1}">
			<button type="button" onclick="goPetitionList()" class="btn waves-effect waves-light btn-outline-dark">목록</button>
		</c:if>
		<c:if test="${petitionDTO.petitionState == 1}">
			<c:if test="${memId != null and memId == petitionDTO.writer}">
				<button type="button" onclick="window.location.href='/projectB/petition/deletePetition.aa?petitionNum=${petitionDTO.num}'"
					class="btn waves-effect waves-light btn-outline-dark">삭제</button>
			</c:if>
		</c:if>
	</div>
	<br/><br/>
	
		<iframe src="/projectB/petition/petComment.aa?petitionNum=${petitionDTO.num}" ></iframe>


		
</section>

<script>
//based on this tutorial: http://mbostock.github.com/d3/tutorial/bar-1.html
// with adjustments and stuff
// see it here: http://jsbin.com/avemek/2/
  
var achive = parseInt(document.getElementById("achive").value);
if (achive == 0) {
	  achive = 1;
}
var data = [100, achive]; // here are the data values; v1 = total, v2 = current value

var chart = d3.select("#percentageChart").append("svg") // creating the svg object inside the container div
  .attr("class", "chart")
  .attr("width", 200) // bar has a fixed width
  .attr("height", 40);

var x = d3.scale.linear() // takes the fixed width and creates the percentage from the data values
  .domain([0, d3.max(data)])
  .range([0, 200]); 

chart.selectAll("rect") // this is what actually creates the bars
  .data(data)
.enter().append("rect")
  .attr("width", x)
  .attr("height", 40)
  .attr("rx", 5) // rounded corners
  .attr("ry", 5);
  
chart.selectAll("text") // adding the text labels to the bar
  .data(data)
.enter().append("text")
  .attr("x", x)
  .attr("y", 22) // y position of the text inside bar
  .attr("dx", -3) // padding-right
  .attr("dy", ".35em") // vertical-align: middle
  .attr("text-anchor", "end") // text-align: right
  .text(String);
  
function copyToClipboard(element) {
	var $temp = $("<input>");
	$("body").append($temp);
	$temp.val($(element).text()).select();
	document.execCommand("copy");
	$temp.remove();
	alert("URL이 복사 되었습니다.");
}

//두개의 날짜를 비교하여 차이를 알려준다.
function dateDiff(_date1, _date2) {
	
    var diffDate_1 = _date1 instanceof Date ? _date1 :new Date(_date1);
    var diffDate_2 = _date2 instanceof Date ? _date2 :new Date(_date2);
 
    diffDate_1 =new Date(diffDate_1.getFullYear(), diffDate_1.getMonth()+1, diffDate_1.getDate());
    diffDate_2 =new Date(diffDate_2.getFullYear(), diffDate_2.getMonth()+1, diffDate_2.getDate());
 
    var diff = Math.abs(diffDate_2.getTime() - diffDate_1.getTime());
    diff = Math.ceil(diff / (1000 * 3600 * 24));
 
    return diff;
}

$(document).ready(function () {
	$('#copy_url').attr('href', document.location.href);
	$('#copy_url').text(document.location.href);
    
	var endDate = $('#endDate').val();
    var today = new Date();

    console.log(endDate);
    console.log(today);
    console.log(dateDiff(endDate, today));
    
    var dateDiffCnt = dateDiff(endDate, today);
    if (dateDiffCnt > 0) {
    	$('#dDay').text(" D-" + dateDiffCnt);
    	$('#dDay').css("visibility", 'visible');
    }
    
    var manCount = $('#manCount').val();
    var womanCount = $('#womanCount').val();
    var teens = $('#teens').val();
    var twenties = $('#twenties').val();
    var thirties = $('#thirties').val();
    var forties = $('#forties').val();
    var fifties = $('#fifties').val();
    var sixties = $('#sixties').val();

    if (!(manCount == 0 && womanCount == 0)) {
    	$('#chartArea').show();
    	new Chart(document.getElementById("pie-chart"), {
   	       type: 'pie',
   	       data: {
   	          labels: ["남자", "여자"],
   	          datasets: [{
   	             label: "Population (millions)",
   	             backgroundColor: ["#7385df", "#F5A9D0"],
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
   	                backgroundColor: ["#6174d5", "#5f76e8", "#768bf4", "#7385df", "#b1bdfa", '#F5A9D0'],
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
    }
})

function goPetitionList() {
	var petitionState = $("#petitionState").val(); // 청원 상태값
	
	if (petitionState == '1') {
		alert("청원 상태를 확인해주세요.");
		window.location.reload(); // 새로고침
	} else if (petitionState == '2') {
		window.location.href = '/projectB/petition/afootPetition.aa';
	} else if (petitionState == '3') {
		window.location.href = '/projectB/petition/terminationPetition.aa';
	} else if (petitionState == '4') {
		window.location.href = '/projectB/petition/standbyPetition.aa';
	}
}

function openReport(num){
	
	
	url = "/projectB/petition/declareArticle.aa?num=" + num;
	
	window.open(url, "confirm", 
    "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=600, height=400");
}
</script>
</body>
</html>      