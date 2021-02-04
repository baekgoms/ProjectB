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

   <title>답변 보기</title>
</head>

<body>
<input type="hidden" id="achive" value="${petitionDTO.petition / 2000}" />
<input type="hidden" id="petitionState" value="${petitionDTO.petitionState}" />
<input type="hidden" id="endDate" value="<fmt:formatDate value="${petitionDTO.endDate}"
                        pattern = "yyyy-MM-dd" />"/>

<section class="petition-container" style="width: 900px;">
	<div class="petition-area-wrap">
		<div class="petition-title-area">
			<br/>
			<span>${petitionDTO.title}</span>
		</div>
		<span class="petition-dday" style="visibility: hidden;" id="dDay"></span>
	</div>
	<div class="petition-header">
		<br/>
			<div class="petition-people-area">
				<span style="font-size:12pt;font-weight:bold">참여인원  : [</span>
				<span style="margin:15px;font-size:16pt">${petitionDTO.petition}</span>
				<span style="font-size:12pt;font-weight:bold">명 ]</span>
				<span style="margin:50px;" id="percentageChart" ></span>
			</div>
				<br/><br/>
			<div class="petition-info-area"style="font-size:12pt;align:center;">
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
			<li>
				<div class="line-box">청원 시작</div>
				<div class="line"></div>
			</li>
			<li>
				<div class="line-box">청원 진행중</div>
				<div class="line"></div>
			</li>
			<li>
				<div class="line-box">청원 종료</div>
				<div class="line"></div>
			</li>
			<li class="on">
				<div class="line-box">답변 완료</div>
			</li>
		</ul>
	</div>

	<!-- 영상을 넣자 -->
	<div>
		<iframe style="margin-left:80px;" width="700" height="394" src="https://www.youtube.com/embed/${answerDTO.answerLink}" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	</div>
																								
	
	<div class="petition-body"><h5>청원 내용</h5>
		<br/>
		<pre style="font-size:14px; font-family: Ubuntu Mono">${petitionDTO.content}</pre>
		<br/>
		<a href="#">#안녕</a>
		<c:forEach items="${fn:split(petitionDTO.tag, ',') }" var="item">
           <a href="/projectB/petition/tag?tag=${item}">#${item}</a>
        </c:forEach>
	</div>

	
	<div class="petition-link-area">
		<h5>관련 링크</h5>
		<c:forEach items="${fn:split(petitionDTO.link, ',') }" var="item">
           <a href="${item}" target="_blank">${item}</a>
        </c:forEach>
        	
	</div>

	<div class="answer-reply-content">
		<h5>답변원고</h5>
		${answerDTO.content}
	</div>

	
	
</body>
</html>      