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
	<li class="sidebar-item"><a class="sidebar-link sidebar-link" href="/projectB/mypage/keyword.aa" aria-expanded="false">
		<span class="hide-menu">관심키워드 설정</span></a></li>
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
<div class="col-12">
<br><br>
</div>
	<div class="page-wrapper">
	<table class="table">
	<tr align="center">
	<td>
	<c:choose>
	<c:when test="${count == 0 && content == 1}">
	작성된 토론이 없습니다.
	</c:when>
	<c:when test="${count == 0 && content == 2}">
	댓글을 작성한 토론이 없습니다.
	</c:when>
	</c:choose>
	</td></tr>
	</table>
	
	<c:if test="${count > 0}">
	<c:set var="i" value="0" />
	<c:set var="j" value="3" />
	
		<table class="table">
		<c:choose>
		<c:when test="${content == 1}">
			<c:forEach items="${myDiscussionList}" var="article">
				<c:if test="${i%j == 0 }">
					<tr align="center">
				</c:if>
				<td>
				<div class="col-lg-9">
					<div id="${article.num}"></div>
					<img src="" id="noimg" height=""> <br />
					<a href="/projectB/discussion/content.aa?pageNum=${pageNum}&discussionNum=${article.num}">
					${article.subject}<br />
					${article.write}<br />
					<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${article.reg}" /><br />
					</a>
				</div>
				</td>
				<c:if test="${i%j == j-1}">
					</tr>
				</c:if>
				<c:set var="i" value="${i+1}" />
			</c:forEach>
		</c:when>
		<c:when test="${content == 2}">
			<c:forEach items="${commList}" var="articles">
			<c:forEach items="${articles}" var="article">
				<c:if test="${i%j == 0 }">
					<tr align="center">
				</c:if>
				<td width="350">
					<div id="${article.num}"></div>
					<img src="" id="noimg" height=""> <br />
					<a href="/projectB/discussion/content.aa?pageNum=${pageNum}&discussionNum=${article.num}">
					${article.subject}<br />
					${article.write}<br />
					<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${article.reg}" /><br />
					</a>
				</td>
				<c:if test="${i%j == j-1}">
					</tr>
				</c:if>
				<c:set var="i" value="${i+1}" />
			</c:forEach>
			</c:forEach>
		</c:when>
		</c:choose>
		</table>
	</c:if>
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
<script src="/projectB/resource/bootstrap/assets/libs/morris.js/morris.min.js"></script>
<script src="/projectB/resource/bootstrap/js/pages/morris/morris-data.js"></script>
<script>
<c:forEach items="${commList}" var="articles">
<c:forEach items="${articles}" var="chart">

var a = parseInt('${chart.opposition}');
var b = parseInt('${chart.agreement}');

if (a+b == 0){
	var id = document.getElementById("noimg");
	id.src = "/projectB/resource/images/nochart.jpg";
	id.height = "200";
}else{
	new Morris.Donut({
		element: '${chart.num}',
		data: [{ label: "찬성", value: '${chart.agreement}' }, 
			   { label: "반대", value: '${chart.opposition}'}],
		resize: true,
		colors:['#5f76e8','#e04643']
})
	var id = document.getElementById("${chart.num}");
	id.style.height = "200px";
};
</c:forEach>
</c:forEach>

<c:forEach items="${myDiscussionList}" var="chart">

var a = parseInt('${chart.opposition}');
var b = parseInt('${chart.agreement}');

if (a+b == 0){
	var id = document.getElementById("noimg");
	id.src = "/projectB/resource/images/nochart.jpg";
	id.height = "200";
}else{
	new Morris.Donut({
		element: '${chart.num}',
		data: [{ label: "찬성", value: '${chart.agreement}' }, 
			   { label: "반대", value: '${chart.opposition}'}],
		resize: true,
		colors:['#5f76e8','#e04643']
})
	var id = document.getElementById("${chart.num}");
	id.style.height = "200px";
};
</c:forEach>

</script>