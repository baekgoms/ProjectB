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

<title>기간이 만료된 게시판</title>
</head>
<body>

<br />
<br />
<form name="form" method="post">

<div align="center">
<input type="button" value="							진행중인 청원							" class="btn waves-effect waves-light btn-outline-dark"
	onclick="document.location.href='/projectB/petition/ing_list.aa'" >
<input type="button" value="							완료된 청원								" class="btn waves-effect waves-light btn-outline-dark"
	onclick="document.location.href='/projectB/petition/finish_list.aa'" >
</div>

<br />
<div align="center">
<input type="button" value="				답변된 청원				" class="btn waves-effect waves-light btn-outline-dark"
	onclick="document.location.href='/projectB/petition/finish_list.aa'" >
<input type="button" value="				답변 대기중인 청원				" class="btn waves-effect waves-light btn-outline-dark"
	onclick="document.location.href='/projectB/petition/waiting_list.aa'" >
<input type="button" value="			기간이 만료된 청원				" class="btn waves-effect waves-light btn-outline-dark"
	onclick="document.location.href='/projectB/petition/timeout_list.aa'" >
</div>
<br />
<br />




<div class="table-responsive">
 <table class="table" >
   <thead>

   <tr>
   <td colspan ="5" align="left" >기간이 만료된 청원</td>
   </tr>
    <tr>
   		<th scope="col">글번호</th>
    	<th scope="col">분류</th>
    	<th scope="col">제목</th>
    	<th scope="col">청원만료일</th>
    	<th scope="col">참여인원</th>
    </tr>
  </thead>
  <tbody>
  <c:if test="${count == 0}">
<div class="table-responsive" align="center">
 <table>
 	<tr>
 		<td align ="center">
 		기간이 만료된 청원이 없습니다.
 		</td>
 	</tr>
 </table>
</div>
</c:if>

<c:if test="${count > 0}">
    <c:forEach var="article" items="${ articleList }"> 
    <tr>
    <c:out value="${ number }"/>
    <c:set var="number" value="${ number -1 }"/>
   		<th scope="row">${article.num}</th>
        	<td>${article.category }</td>
        	<td>
        	<a href ="projectB/petition/content.aa?num=${article.num}&pageNum=${currentPage}">
        	${article.title}</a>
        	</td>
            <td>${article.endDate}</td>
            <td>${artilcle.petition}</td>
    </tr>
    </c:forEach>
    </c:if>
   </tbody>
  </table>
</div>


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
      	<a class="page-link" href="/projectB/petition/timeout_list.aa?pageNum=${startPage - 10}" aria-label="Previous">
     	<span aria-hidden="true">«</span>
      	<span class="sr-only">Previous</span>
        	</a>
    	</li>
	</c:if>

	<c:forEach var="i" begin="${ startPage }" end="${ endPage }">    
		<li class="page-item"><a class="page-link" href="/projectB/petition/timeout_list.aa?pageNum=${i}">${i}</a></li>
	</c:forEach>
	
	<c:if test="${endPage < pageCount}">
		<li class="page-item">
		<a class="page-link" href="/projectB/petition/timeout_list.aa?pageNum=${startPage + 10}" aria-label="Next">
	  	<span aria-hidden="true">»</span>
	  	<span class="sr-only">Next</span>
	  	</a>
		</li>
	</c:if>
	</ul>
</c:if>



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