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
<title>청원진행중인 게시판</title>
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
<c:set var="i" value="0" />
<c:set var="j" value="6" />


<tbody>
	<c:forEach items="${category}" varStatus="list" >
		<c:if test="${i%j == 0 }">
		<tr>
		</c:if>
			<c:set var="categorya" value="${category[i].num}" />
			<c:choose>
				<c:when test="${categorya == 0 }">
				<td>
					<input type="butten" value="${category[i].categoryName}" class="btn waves-effect waves-light btn-outline-dark"
					onclick="document.location.href='/projectB/petition/ing_list.aa'">
				</td>
				</c:when >
			<c:when test="${categorya != 0 }">
			<td>
					<input type="butten" value="${category[i].categoryName}" class="btn waves-effect waves-light btn-outline-dark"
					onclick="document.location.href='/projectB/petition/ing_listcategory.aa?category=${categorya}'">
			</td>
			</c:when>
			</c:choose>
			
			<c:if test="${i%j == j-1 }">
			</tr>
			</c:if>
			<c:set var="i" value="${i+1}" />
	</c:forEach>
</tbody>
</div>


 <table class="table" width="1200">
   <thead>

   <tr>
   <td >
        <select class="custom-select mr-sm-2" id="inlineFormCustomSelect" >
                                            <option selected="">정렬</option>
                                            <option value="1" onclick="document.location.href='/projectB/petition/ing_list.aa?pageNum=1'">최신순</option>
                                            <option value="2" onclick="document.location.href='/projectB/petition/ing_listSort.aa?pageNum=1&sort=1'">동의순</option>
        </select>
	</td>
   <td colspan ="5" align="right">
   
        <button type="button" class="btn waves-effect waves-light btn-outline-dark">지금 청원하기</button>
	</td>
   </tr>

   <tr>
   <td colspan ="5" align="left" >청원 목록</td>
   </tr>
    <tr>
   		<th scope="col">글번호</th>
    	<th scope="col">분류</th>
    	<th scope="col">제목</th>
    	<th scope="col" >청원만료일</th>
    	<th scope="col" >참여인원</th>
    </tr>
  </thead>
  <tbody >
<c:if test="${count == 0}">
<table class="table">
 	<tr align ="center">
 		<td>
 		진행중인 청원이 없습니다.
 		</td>
 	</tr>
</table>
</c:if>

<c:if test="${count > 0}">
  <c:forEach var="article" items="${ articleList }"> 
    <tr>
    <c:out value="${ number }"/>
    <c:set var="number" value="${ number -1 }"/>
   		<th scope="row">${article.num}</th>
        	<td>
        		${ category[article.category].categoryName }  
        	</td>
        	<td>
        	<a href ="projectB/petition/content.aa?num=${article.num}&pageNum=${currentPage}">
        	${article.title}</a>
        	</td>
            <td>${article.endDate}</td>
            <td>${article.petition}</td>
    </tr>
    </c:forEach>
    </c:if>
   </tbody>
  </table>



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
      	<a class="page-link" href="/projectB/petition/ing_list.aa?pageNum=${startPage - 10}" aria-label="Previous">
     	<span aria-hidden="true">«</span>
      	<span class="sr-only">Previous</span>
        	</a>
    	</li>
</c:if>
<c:choose>
<c:when test="${sort == null }">
	<c:forEach var="i" begin="${ startPage }" end="${ endPage }">
	<li class="page-item"><a class="page-link" href="/projectB/petition/ing_list.aa?pageNum=${i}">${i}</a></li>
	</c:forEach>
</c:when>
<c:when test="${sort != null }">
	<c:forEach var="i" begin="${ startPage }" end="${ endPage }">
	<li class="page-item"><a class="page-link" href="/projectB/petition/ing_listSort.aa?pageNum=${i}&sort=${sort}">${i}</a></li>
	</c:forEach>
</c:when>
</c:choose>	

	<c:if test="${endPage < pageCount}">
	<li class="page-item">
	  <a class="page-link" href="/projectB/petition/ing_list.aa?pageNum=${startPage + 10}" aria-label="Next">
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