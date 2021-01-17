<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import = "java.text.SimpleDateFormat" %>



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
        
        iframe {
            width: 500px;
            border: none;
            height: 500px;
            margin: 20px auto;
        }
    </style>
    
<title>청원 보기</title>
</head>

<body>  
<br>
<form>
<table width="500" border="1" cellspacing="0" cellpadding="0"  align="center">  
  <tr height="30">
  	<td align="center" width="500" colspan="4">청원제목 ${petDTO.title}</td> 
  </tr>
  <tr height="30">
  	<td align="center" width="500" colspan="4">참여인원 : [ ${petDTO.petition} 명]</td>
  </tr>
  <tr>
      <td align="center" width="250" colspan="4">달성도차트</td>
  </tr>  
  <tr height="30">
      <td align="center" width="125" >카테고리 ${categoryName}</td>
      
      <c:choose>
          <c:when test="${1!=1 }">
              <td align="center" width="250" colspan="2" >
                  D-Day 3
          </c:when>
          <c:otherwise>
              <td align="center" width="125" >
                  청원시작<br>
                  <fmt:formatDate value="${petDTO.startDate}"
                    pattern = "yyyy-MM-dd" />
            </td>
              <td align="center" width="125" >
                  청원마감<br>
                  <fmt:formatDate value="${petDTO.endDate}"
                    pattern = "yyyy-MM-dd" />
          </c:otherwise>
      </c:choose>
    </td>
  	<td align="center" width="125" >청원인 : ${petDTO.writer}</td>
  </tr>
  
  <tr height="30">
  	<td align="center" width="500" colspan="4">청원진행도</td> 
  </tr>
  
  <tr height="30"> 
    <td align="left" width="500" colspan="4"><pre>내용 ${petDTO.content}</pre></td>
  </tr>
  <tr height="30">
      <td align="center" width="500" colspan="4">
          태그
        <br/>
        <c:forEach items="${fn:split(petDTO.tag, ',') }" var="item">
            <a href="/projectB/petition/tag?tag=${item}">#${item}</a>
        </c:forEach>
    </td>
  </tr>
  <tr height="30">
      <td align="center" width="500" colspan="4">
          관련 링크
        <br/>
        <c:forEach items="${fn:split(petDTO.link, ',') }" var="item">
            <a href="${item}" target="_blank">${item}</a>
            <br/>
        </c:forEach>
    </td>
  </tr>
  <tr height="100">
      <td align="center" width="250" colspan="4" style="padding: 20px 0;">
          지표
        <input type="hidden" id="manCount" value="${petitionIndicatorDTO.manCount}" />
        <input type="hidden" id="womanCount" value="${petitionIndicatorDTO.womanCount}" />
        <input type="hidden" id="teens" value="${petitionIndicatorDTO.teens}" />
        <input type="hidden" id="twenties" value="${petitionIndicatorDTO.twenties}" />
        <input type="hidden" id="thirties" value="${petitionIndicatorDTO.thirties}" />
        <input type="hidden" id="forties" value="${petitionIndicatorDTO.forties}" />
        <input type="hidden" id="fifties" value="${petitionIndicatorDTO.fifties}" />
        <input type="hidden" id="sixties" value="${petitionIndicatorDTO.sixties}" />
        
          <div>
              <div class="chartjs-size-monitor">
                  <div class="chartjs-size-monitor-expand">
                      <div class=""></div>
                </div>
                <div class="chartjs-size-monitor-shrink">
                    <div class=""></div>
                </div>
            </div>
            <canvas id="pie-chart" height="382" width="766" class="chartjs-render-monitor" 
                style="display: block; height: 255px; width: 511px;"></canvas>
        </div>

        <div>
            <div class="chartjs-size-monitor">
                <div class="chartjs-size-monitor-expand">
                    <div class=""></div>
                </div>
                <div class="chartjs-size-monitor-shrink">
                    <div class=""></div>
                </div>
            </div>
            <canvas id="bar-chart" height="361" style="display: block; height: 241px; width: 483px;" width="724" 
                class="chartjs-render-monitor"></canvas>
        </div>
      </td>        
        
  </tr>
    <tr height="30">      
    <td colspan="4" align="center" > 	

       <input  type="button" align="right" value="신고" 
       onclick="document.location.href='신고창 띄우기'">
	   &nbsp;&nbsp;&nbsp;&nbsp;
    </td>
  </tr>
  
</table>    
</form>   

<iframe src="/projectB/petition/petComment.aa?petitionNum=${petDTO.num }"></iframe>


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
                    backgroundColor: ["#5a6be6", "#ffc5fd"],
                    data: [manCount,womanCount]
                  }]
                },
                options: {
                  title: {
                    display: false
                  }
                }
            });
            
            var labels = [];
            var datas = [];
            if (teens != "0") {labels.push("10대"); datas.push(teens);}
            if (twenties != "0") {labels.push("20대"); datas.push(twenties);}
            if (thirties != "0") {labels.push("30대"); datas.push(thirties);}
            if (forties != "0") {labels.push("40대"); datas.push(forties);}
            if (fifties != "0") {labels.push("50대"); datas.push(fifties);}
            if (sixties != "0") {labels.push("60대"); datas.push(sixties);}

            new Chart(document.getElementById("bar-chart"), {
                type: 'bar',
                data: {
                  labels: labels,
                  datasets: [
                    {
                      backgroundColor: ["#6174d5", "#5f76e8", "#768bf4", "#7385df", "#b1bdfa", '#FF0000'],
                      data: datas
                    }
                  ]
                },
                options: {
                  legend: { display: false },
                  title: {
                    display: false
                  }
                }
            });
        });
    </script>        
</body>
</html>      
