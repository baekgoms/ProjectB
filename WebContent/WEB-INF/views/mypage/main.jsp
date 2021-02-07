<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
<!-- Custom CSS -->
<link href="/projectB/resource/bootstrap/css/style.min.css" rel="stylesheet">
<!-- This Page CSS -->
<link rel="stylesheet" type="text/css" href="/projectB/resource/assets/extra-libs/prism/prism.css">
<title>마이페이지</title>
</head>
<center>
<div id="main-wrapper" data-theme="light" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full" data-sidebar-position="fixed" data-header-position="fixed" data-boxed-layout="full">
<aside class="left-sidebar" data-sidebarbg="skin6">
<div class="scroll-sidebar" data-sidebarbg="skin6">
<nav class="sidebar-nav">
   <ul id="sidebarnav">
	<li class="nav-small-cap"><span class="hide-menu">마이페이지 메뉴</span></li>
	<li class="sidebar-item"><a class="sidebar-link sidebar-link" href="/projectB/mypage/modify.aa" aria-expanded="false">
	<span class="hide-menu">내 정보 수정</span></a></li>
	<li class="sidebar-item"> <a class="sidebar-link has-arrow" href="javascript:void(0)" aria-expanded="false">
	<span class="hide-menu">나의 키워드</span></a>
		<ul aria-expanded="false" class="collapse  first-level base-level-line">
			<li class="sidebar-item"><a href="/projectB/mypage/keywordNews.aa" class="sidebar-link">
			<span class="hide-menu">키워드 뉴스피드</span></a></li>
			<li class="sidebar-item"><a href="/projectB/mypage/keyword.aa" class="sidebar-link">
			<span class="hide-menu">관심키워드 설정</span></a></li>
		</ul>
	<li class="sidebar-item"> <a class="sidebar-link has-arrow" href="javascript:void(0)" aria-expanded="false">
	<span class="hide-menu">나의 청원</span></a>
		<ul aria-expanded="false" class="collapse  first-level base-level-line">
			<li class="sidebar-item"><a href="/projectB/mypage/main.aa" class="sidebar-link">
			<span class="hide-menu">내가 작성한 청원 보기</span></a></li>
			<li class="sidebar-item"><a href="/projectB/mypage/main.aa?content=2" class="sidebar-link">
			<span class="hide-menu">내가 동의한 청원 보기</span></a></li>
		</ul>
	<li class="sidebar-item"> <a class="sidebar-link has-arrow" href="javascript:void(0)" aria-expanded="false">
	<span class="hide-menu">나의 토론</span></a>
		<ul aria-expanded="false" class="collapse  first-level base-level-line">
			<li class="sidebar-item"><a href="/projectB/mypage/mydiscussion.aa" class="sidebar-link">
			<span class="hide-menu">내가 작성한 토론 보기</span></a></li>
			<li class="sidebar-item"><a href="/projectB/mypage/mydiscussion.aa?content=2" class="sidebar-link">
			<span class="hide-menu">댓글단 토론 보기</span></a></li>
		</ul>
	</ul>
</nav>
</div>
</aside>
<div class="page-wrapper">

<table class="table">
<tr align="center">
<td>진행상황</td>
<td>분류</td>
<td>제목</td>
<td>쳥원만료일</td>
<td>참여인원</td>
</tr>
<c:if test="${count == 0 && content ==1}">
<tr align="center"><td colspan="5"> 작성된 청원이 없습니다. </td></tr>
</c:if>
<c:if test="${count == 0 && content ==2 }">
<tr align="center"><td colspan="5"> 동의한 청원이 없습니다. </td></tr>
</c:if>
<c:if test="${content == 1}">
<c:forEach items="${myPetitionList}" var="article">
<tr align="center">
<td>${state[article.petitionState-1].state}</td>
<td>${category[article.category].categoryName}</td>
<td><a href="/projectB/petition/petContent.aa?num=${article.num}">${article.title}</a></td>
<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${article.endDate}" /></td>
<td>${article.petition}</td>
</tr>
</c:forEach>
<tr><td colspan="5"></td></tr>
</c:if>
<c:if test="${content == 2 }">
<c:forEach items="${agreesList}" var="articles">
<c:forEach items="${articles}" var="article">
<tr align="center">
<td>${state[article.petitionState-1].state}</td>
<td>${category[article.category].categoryName}</td>
<td><a href="/projectB/petition/petContent.aa?num=${article.num}">${article.title}</a></td>
<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${article.endDate}" /></td>
<td>${article.petition}</td>
</tr>
</c:forEach>
</c:forEach>
<tr><td colspan="5"></td></tr>
</c:if>

</table>

<c:if test="${count > 0}">
	<fmt:parseNumber var="pageCount" value="${count / pageSize + ( count % pageSize == 0 ? 0 : 1)}" integerOnly="true" />
   <c:set var="pageBlock" value="${10}"/>
   <fmt:parseNumber var="result" value="${currentPage/10}" integerOnly="true" />
   <c:if test="${currentPage % 10 == 0}">
   <c:set var="result" value="${result-1}" />
   </c:if>
   <c:set var="startPage" value="${(result * 10) + 1 }" />
   <c:set var="endPage" value="${startPage + pageBlock-1}"/>
   <c:if test="${endPage > pageCount}">
        <c:set var="endPage" value="${pageCount}"/>
</c:if> 

<div class="col-lg-4 mb-4" align="center">
<nav aria-label="Page navigation example">
<ul class="pagination justify-content-center">
<c:if test="${startPage > 10}">
<li class="page-item">
	<c:choose>
	<c:when test="${content == 2}">
		<a class="page-link" href="/projectB/mypage/main.aa?pageNum=${startPage - 10}&content=${content}" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
        <span class="sr-only">Previous</span>
		</a>
	</c:when>
	<c:otherwise>
		<a class="page-link" href="/projectB/mypage/main.aa?pageNum=${startPage - 10}"aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
        <span class="sr-only">Previous</span>
		</a>
	</c:otherwise>
	</c:choose>
</li>
</c:if>
<c:forEach var="i" begin="${startPage}" end="${endPage}">
	<c:choose>
	<c:when test="${content == 2}">
		<li class="page-item"><a class="page-link"
	 	     href="/projectB/mypage/main.aa?pageNum=${i}&content=${content}">${i}</a>
	</li>
	</c:when>
	<c:otherwise>
		<li class="page-item"><a class="page-link"
	 	     href="/projectB/mypage/main.aa?pageNum=${i}">${i}</a>
	</li>
	</c:otherwise>
	</c:choose>
</c:forEach>

<c:if test="${endPage < pageCount}">
<li class="page-item">
<c:choose>
	<c:when test="${content == 2}">
		<a class="page-link" href="/projectB/mypage/main.aa?content=${content}&pageNum=${startPage + 10}" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
        <span class="sr-only">Next</span>
		</a>
	</c:when>
	<c:otherwise>
		<a class="page-link" href="/projectB/mypage/main.aa?pageNum=${startPage + 10}" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
        <span class="sr-only">Next</span>
    	</a>
	</c:otherwise>
	</c:choose>
   
</li>
</c:if>
</ul>
</nav>
</div>
</c:if>

<div>
<br><br><br>
</div>
</div>
</div>
</center>
<script src="/projectB/resource/bootstrap/assets/extra-libs/prism/prism.js"></script>
<script src="/projectB/resource/bootstrap/js/custom.min.js"></script>
<script src="/projectB/resource/bootstrap/assets/libs/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap tether Core JavaScript -->
<script src="/projectB/resource/bootstrap/assets/libs/popper.js/dist/umd/popper.min.js"></script>
<script src="/projectB/resource/bootstrap/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- apps -->
<!-- apps -->
<script src="/projectB/resource/bootstrap/js/app-style-switcher.js"></script>
<script src="/projectB/resource/bootstrap/js/feather.min.js"></script>
<!--Menu sidebar -->
<script src="/projectB/resource/bootstrap/js/sidebarmenu.js"></script>
<script src="/projectB/resource/bootstrap/js/custom.min.js"></script>
<script src="/projectB/resource/bootstrap/assets/libs/raphael/raphael.min.js"></script>
<!-- slimscrollbar -->
<script src="/projectB/resource/bootstrap/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
<script src="/projectB/resource/bootstrap/assets/extra-libs/sparkline/sparkline.js"></script>

