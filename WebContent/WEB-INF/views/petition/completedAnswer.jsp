<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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

<title>답변완료된 청원 게시판</title>
<style>
.ans_name_title h4 {
    color: #fff;
    font-size: 16px;
    background-color: #1b2259;
    display: inline-block;
    padding: 8px 15px;
    font-weight: 400;
    margin-bottom: 12px;
    border-radius: 4px;
}

.ans_td1 {
    width: 60%;
}

table {
    border-collapse: collapse;
    border-spacing: 0;
}

.ans_movie_plyBtn {
    position: absolute;
    top: 40%;
    width: 82px;
    left: 50%;
    margin-left: -41px;
}

.ans_name_info {
    font-size: 16px;
    color: #767676;
    text-align: center;
    display: inline-block;
    width: 94%;
    padding: 0 3%;
}

ol, li {
    list-style: none; 
    float:left;
    margin-left:20px;
}

.ans_movie {
    position: relative;
}

.ans_td2 {
    display: block;
    /* width: 100%; */
    padding-top: 0;
}
.ans_movie_box {
    width: 480px;
    height: 270px;
    border-radius: 10px;
    overflow: hidden;
    background-repeat: no-repeat;
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;
    background-position: 50% 50%;
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/topbar/top.jsp" />
<br>
<br>
<br>
<br>
<form name="form" method="post">

<div align="center">
<input type="button" value="							진행중인 청원							" class="btn waves-effect waves-light btn-outline-dark"
	onclick="document.location.href='/projectB/petition/afootPetition.aa'" >
<input type="button" value="							완료된 청원								" class="btn waves-effect waves-light btn-outline-dark"
	onclick="document.location.href='/projectB/answer/completedAnswer.aa'" >
</div>

<br />

<div align="center">
<input type="button" value="				답변된 청원				" class="btn waves-effect waves-light btn-outline-dark"
	onclick="document.location.href='/projectB/answer/completedAnswer.aa'" >
<input type="button" value="				답변 대기중인 청원				" class="btn waves-effect waves-light btn-outline-dark"
	onclick="document.location.href='/projectB/petition/standbyPetition.aa'" >
<input type="button" value="			기간이 만료된 청원				" class="btn waves-effect waves-light btn-outline-dark"
	onclick="document.location.href='/projectB/petition/terminationPetition.aa'" >
</div>
<br />
<br />

<div class="table-responsive">
	<table class="table" style="width:100%;">
		<c:forEach var="answer" items="${comAnswer}" varStatus="status">
		    <tr>
		    	<td class="ans_td1">
		    		<div class="ans_name">
						<div class="ans_name_title" style="border-bottom:none;">
							<h4>청원답변${answer.num}호</h4>
							<a href="/projectB/answer/content.aa?petitionNum=${answer.petitionNum }">
							<h2 style="margin-bottom:15px;" class="TDepTitle">${petitionInfo[status.index].title }</h2></a>
							<br>
							<br>
						</div>
						<ol class="ans_name_info" style="margin-bottom:20px;">
				    		<li class="ans_name_info_list1" >
					    		<img src="/projectB/resource/bootstrap/assets/images/big/ans_icon1.png" alt="청원시작 아이콘" >
					    		<p class="ans_list1_1">청원시작</p>
					    		<p class="ans_list1_2">[ <fmt:formatDate value="${petitionInfo[status.index].startDate }" pattern = "yyyy-MM-dd" /> ]</p>
				    		</li>
				    		<li class="ans_name_info_list2" >
					    		<img src="/projectB/resource/bootstrap/assets/images/big/ans_icon2.png" alt="청원마감 아이콘">
					    		<p class="ans_list2_1">청원마감</p>
					    		<p class="ans_list2_2">[ <fmt:formatDate value="${petitionInfo[status.index].endDate }" pattern = "yyyy-MM-dd" /> ]</p>
				    		</li>
				    		<li class="ans_name_info_list3">
					    		<img src="/projectB/resource/bootstrap/assets/images/big/ans_icon3.png" alt="참여인원 아이콘">
					    		<p class="ans_list3_1">참여인원</p>
					    		<p class="ans_list3_2">[ ${petitionInfo[status.index].petition } ]</p>
				    		</li>
				    		<li class="ans_name_info_list4">
					    		<img src="/projectB/resource/bootstrap/assets/images/big/ans_icon4.png" alt="답변일 아이콘">
					    		<p class="ans_list4_1">답변일</p>
					    		<p class="ans_list4_2">[ <fmt:formatDate value="${answer.answerDate}" pattern = "yyyy-MM-dd" /> ]</p>
				    		</li>
		    			</ol>
		    		</div>
		    	 </td>
		    	<td class="ans_td2" > 
		    		<div class="ans_movie">
		    				<c:if test="${ answer.answerLink != null }">
		    					<object type="text/html" width="560" height="315" data="https://www.youtube.com/embed/${ answer.answerLink }" allowFullScreen></object>
		    				</c:if>		    				
					</div>
				</td>
			</tr>
		</c:forEach>
 	</table>
 	
 	<c:if test="${count == 0}">
				<div class="table-responsive" >
 					<table align="center">
 						<tr>
 							<td align ="center">
 								답변이 완료된 청원이 없습니다.
 							</td>
 						</tr>
 					</table>
				</div>
			</c:if>

        <c:if test="${count > 0}">
			<c:set var="pageCount" value="${count / pageSize +(count % pageSize == 0 ? 0: 1)}" />
			<c:set var="pageBlock" value="${10}" />
			<fmt:parseNumber var="result" value="${ currentPage/10 }" integerOnly="true" />
			<c:set var ="startPage" value="${ result * 10 + 1 }" />
			<c:set var="endPage" value="${startPage + pageBlock-1 }" />
			<c:if test="${ endPage > pageCount }">
				<c:set var="endPage" value="${ pageCount }" />
			</c:if>
		
			<ul class="pagination justify-content-center">
		  		 <c:if test="${startPage > 10}">
					 <li class="page-item">
		      			<a class="page-link" href="/projectB/answer/completedAnswer.aa?pageNum=${startPage - 10}" aria-label="Previous">
		     				<span aria-hidden="true">«</span>
		      				<span class="sr-only">Previous</span>
		      	  		</a>
		    		</li>
				</c:if>
				<c:forEach var="i" begin="${ startPage }" end="${ endPage }">    
					<li class="page-item"><a class="page-link" href="/projectB/answer/completedAnswer.aa?pageNum=${i}">${i}</a></li>
				</c:forEach>
				<c:if test="${endPage < pageCount}">
					<li class="page-item">
						<a class="page-link" href="/projectB/answer/completedAnswer.aa?pageNum=${startPage + 10}" aria-label="Next">
						  	<span aria-hidden="true">»</span>
						  	<span class="sr-only">Next</span>
			  			</a>
					</li>
				</c:if>
			</ul>
		</c:if>                     
</div>


</form>
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

</body>
</html>