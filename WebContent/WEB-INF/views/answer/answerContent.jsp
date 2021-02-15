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
<input type="hidden" id="achive" value="${petitionDTO.petition}" />
<input type="hidden" id="endDate" value="<fmt:formatDate value="${petitionDTO.endDate}"
                        pattern = "yyyy-MM-dd" />"/>

<section class="petition-container" style="width: 900px;">
	<div class="petition-area-wrap">
		<div class="petition-title-area">
			<br/>
			<span style="color:black;font-weight:bold">${petitionDTO.title}</span>
		</div>
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
				<span style="font-weight:bold;">카테고리 :</span> 
				<span style="margin-right:25px;">${categoryName}</span>
				<span class="petition-time"style="font-weight:bold;">청원기간 : </span>
				<span>
					<fmt:formatDate value="${petitionDTO.startDate}" pattern = "yyyy-MM-dd" /> ~
					<fmt:formatDate value="${petitionDTO.endDate}" pattern = "yyyy-MM-dd" />
				</span>	
                <span style="margin-left:25px;font-weight:bold;">청원인  : </span>
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

	<div>
		<iframe style="margin-left:80px;" width="700" height="394" src="https://www.youtube.com/embed/${answerList[fn:length(answerList) - 1].answerLink}" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	</div>
	
	<div class="petition-body"><h3 style="color:black;">청원 내용</h3>
		<br/>
		<pre style="font-size:14px; font-family: Ubuntu Mono;white-space: pre-wrap;">${petitionDTO.content}</pre>
		<br/>
			<c:if test="${petitionDTO.tag != null}">
				<c:forEach items="${fn:split(petitionDTO.tag, ',') }" var="item">
		            <a href="/projectB/petition/afootPetitionSearch.aa?keyword=${item}">#${item}</a>
		        </c:forEach>
	        </c:if>
	</div>

	<br/><br/>
	<c:if test="${petitionDTO.link != null}">
		<div class="petition-link-area">
			<h3 style="color:black;">관련 링크</h3>
			<c:forEach items="${fn:split(petitionDTO.link, ',') }" var="item">
	           <a href="${item}" target="_blank">${item}</a>
	        </c:forEach>
		</div>
	</c:if>

	<c:if test="${fn:length(answerList) == 1}">
		<div class="answer-reply-content">
			<h3 style="color:black;">답변원고</h3>
			<br/>
			<pre style="font-size:14px; font-family: Ubuntu Mono;white-space: pre-wrap;">${answerList[0].content}</pre>
			
		</div>
	</c:if>
	
	
	<c:if test="${fn:length(answerList) == 2}">
		<div class="answer-reply-content">
	
				<h5 style="color:black;">답변원고_1</h5>
				<br/>
				<pre style="font-size:14px; font-family: Ubuntu Mono;white-space: pre-wrap;">${answerList[0].content}</pre>
				
				<br/><br/>
				<h5 style="color:black;">답변원고_2</h5>
				<br/>
				<pre style="font-size:14px; font-family: Ubuntu Mono;white-space: pre-wrap;">${answerList[1].content}</pre>
				
				<br/><br/>
		</div>
	</c:if>

		<div class="answer-reaction" style="text-align: center;">
			<button type="button" class="btn waves-effect waves-light btn-danger" onclick="fnAnswerReact(1, ${answerList[fn:length(answerList) - 1].num})">추천(<span id="recommendCnt">${answerList[fn:length(answerList) - 1].recommend}</span>)</button>
			<button type="button" class="btn waves-effect waves-light btn-primary" onclick="fnAnswerReact(2, ${answerList[fn:length(answerList) - 1].num})">반대(<span id="oppositeCnt">${answerList[fn:length(answerList) - 1].opposite}</span>)</button>
			<c:if test="${fn:length(answerList) == 1}">
				<button type="button" class="btn waves-effect waves-light btn-warning" onclick="fnAnswerReact(3, ${answerList[fn:length(answerList) - 1].num})">추가답변 원해요(<span id="additionCnt">${answerList[fn:length(answerList) - 1].addition}</span>)</button> 
			</c:if>
		</div>

		<c:if test="${petitionerDTO.getState() == 6 }" > 
		<input type="button" style="margin-top:30px; margin-left:370px;" class="btn waves-effect waves-light btn-outline-dark" align="center" value="수정하기"
		onclick="document.location.href='/projectB/answer/answerContentUpdate.aa?petitionNum=${petitionDTO.num}'"></button>
		<input type="button" style="margin-top:30px;" class="btn waves-effect waves-light btn-outline-dark" align="center" value="목록보기"
		onclick="document.location.href='/projectB/answer/list.aa?state=${answerList[0].state}'"></button>
	    </c:if>
	    
		
		<c:if test="${petitionerDTO.getState() != 6 }" > 
		<input type="button" style="margin-top:30px; margin-left:410px;" class="btn waves-effect waves-light btn-outline-dark" align="center" value="목록보기"
		onclick="document.location.href='/projectB/answer/completedAnswer.aa'"></button>
		</c:if>

	
	<script>
		var isVoted = false; // 참여 여부
		function fnAnswerReact(type, num) {
			if (isVoted) {
				// 참여한 경우
				alert("투표에 이미 참여하였습니다.");
				return false;
			}
			$.ajax({
				url : '/projectB/answer/answerReact.aa',
				method: 'POST',
				data : {
					type : type,
					answerNum : num
				},
				dataType: 'json',
				beforeSend : function () {
					
				},
				success : function (data) {
					if (data == 1) {
						// 성공
						if (type == 1) {
							$('#recommendCnt').text((parseInt($('#recommendCnt').text()) + 1));
						} if (type == 2) {
							$('#oppositeCnt').text((parseInt($('#oppositeCnt').text()) + 1));
						} if (type == 3) {
							$('#additionCnt').text((parseInt($('#additionCnt').text()) + 1));
						}
						isVoted = true;
					} else if (data == 2) {
						// 완료
						alert("투표에 이미 참여하였습니다.");
					} else {
						alert("DB 처리에 실패하였습니다.");
					}
				},
				error : function (request,status,error) {
					 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				},
				complete : function () {
					
				}
			})
		}
	</script>
</body>
</html>      