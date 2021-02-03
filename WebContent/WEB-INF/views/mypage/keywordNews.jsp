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
	<input type="button" value="                           뉴스피드                              " class="btn waves-effect waves-light btn-dark" 
		onclick="document.location.href='javascript:void(0)'" style="height:70px; width:400px;">
	<input type="button" value="                         키워드 등록                           " class="btn waves-effect waves-light btn-outline-dark"
		onclick="document.location.href='/projectB/mypage/keyword.aa'" style="height:70px; width:400px;">
<div class="col-12">
<br><br>
</div>

<c:choose>
<c:when test="${not empty tagArticleList}">


<table class="table">
<tr align="center"><td width="250">태그</td><td>제목</td></tr>
<c:forEach items="${tagArticleList}" var="article">
<tr align="center"><td width="250">
${article.tag}</td><td><a href="/projectB/petition/petContent.aa?num=${article.num}"> ${article.title}</a> </td></tr>
</c:forEach>
</table>

</c:when>
<c:otherwise>
<table class="table">
<tr align="center"><td> 새로 올라온 글이 없습니다. </td></tr>
</table>
</c:otherwise>
</c:choose>
</div>
</div>
</center>
<script src="/projectB/resource/bootstrap/assets/extra-libs/prism/prism.js"></script>
<script src="/projectB/resource/bootstrap/assets/libs/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap tether Core JavaScript -->
<script src="/projectB/resource/bootstrap/assets/libs/popper.js/dist/umd/popper.min.js"></script>
<script src="/projectB/resource/bootstrap/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
<!--  apps -->
<script src="/projectB/resource/bootstrap/js/app-style-switcher.js"></script>
<script src="/projectB/resource/bootstrap/js/feather.min.js"></script>
<!-- slimscrollbar -->
<script src="/projectB/resource/bootstrap/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
<script src="/projectB/resource/bootstrap/assets/extra-libs/sparkline/sparkline.js"></script>
<!--Menu sidebar -->
<script src="/projectB/resource/bootstrap/js/sidebarmenu.js"></script>
<script src="/projectB/resource/bootstrap/js/custom.min.js"></script>
<script src="/projectB/resource/bootstrap/assets/libs/raphael/raphael.min.js"></script>
