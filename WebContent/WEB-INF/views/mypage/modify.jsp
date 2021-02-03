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
	<div class="page-wrapper">
	<br /><h3>내 정보 수정</h3><br />
	<form method="post" name="modifyForm" action="/projectB/mypage/modifyPro.aa" class="mt-4">
	<table class="table">
	<tr>
		<td align="center" width="250">아이디</td>
		<td>${member.id} <input type="hidden" value="${member.id}" name="id"></td>
	</tr>
	<tr>
		<td align="center">이름</td>
		<td>${member.name}</td>
	</tr>
	<tr>
		<td align="center">현재 비밀번호</td>
		<td><input type="password" name="password" class="form-control form-control-sm" style="width:200px"></td>
	</tr>
	<tr>
		<td align="center">변경 비밀번호</td>
		<td><input type="password" name="newPassword" class="form-control form-control-sm" style="width:200px"></td>
	</tr>
	<tr>
		<td align="center">연락처</td>
		<td><input type="text" value="${member.contact}" name="contact" class="form-control form-control-sm" style="width:250px"></td>
	</tr>
	<tr>
		<td align="center">이메일</td>
		<td><input type="email" value="${member.email}" name="email" class="form-control form-control-sm" style="width:300px"></td>
	</tr>
	<tr>
		<td align="center">이메일 수신여부</td>
		<td>
		<c:choose>
		<c:when test="${member.emailArg == 0}">
			<div class="form-check form-check-inline">
			<input class="form-check-input" type="radio" name="emailArg" id="agree" value="0" checked>
			<label class="form-check-label" for="agree">수신</label>   
			</div>
			<div class="form-check form-check-inline">
			<input class="form-check-input" type="radio" name="emailArg" id="disagree" value="1">
			<label class="form-check-label" for="agree">수신거부</label>
			</div>
		</c:when>
		<c:when test="${member.emailArg == 1}">
			<div class="form-check form-check-inline">
			<input class="form-check-input" type="radio" name="emailArg" id="agree" value="0">
			<label class="form-check-label" for="agree">수신</label>
			</div>
			<div class="form-check form-check-inline">
			<input class="form-check-input" type="radio" name="emailArg" id="disagree" checked value="1">
			<label class="form-check-label" for="agree">수신거부</label>
			</div>
		</c:when>
		</c:choose>
		</td>
	</tr>
	<tr>
		<td align="center">성별</td>
		<td>${member.gender}</td>
	</tr>
	<tr>
		<td align="center">생년월일</td>
		<td>
		<fmt:parseDate value="${member.birthday}" var="noticePostDate" pattern="yyMMdd"/>
		<fmt:formatDate value="${noticePostDate}" pattern="yyyy-MM-dd"/>
		</td>
	</tr>
	<tr align="right">
	<td colspan="2"><input type="submit" value="수정하기" class="btn waves-effect waves-light btn-outline-dark"></td>
	</tr>
	</table>
	</form>
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