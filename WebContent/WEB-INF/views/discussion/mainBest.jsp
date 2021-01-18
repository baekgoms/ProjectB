<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- Custom CSS -->
<link href="/projectB/resource/bootstrap/css/style.css" rel="stylesheet">
<!-- This Page CSS -->
<link href="/projectB/resource/assets/libs/morris.js/morris.css" rel="stylesheet">

<script src="/projectB/resource/bootstrap/assets/libs/jquery/dist/jquery.min.js"></script>
<script src="/projectB/resource/bootstrap/assets/libs/popper.js/dist/umd/popper.min.js"></script>
<script src="/projectB/resource/bootstrap/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="/projectB/resource/bootstrap/js/app-style-switcher.js"></script>
<script src="/projectB/resource/bootstrap/js/feather.min.js"></script>
<script src="/projectB/resource/bootstrap/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
<script src="/projectB/resource/bootstrap/assets/extra-libs/sparkline/sparkline.js"></script>
<script src="/projectB/resource/bootstrap/js/sidebarmenu.js"></script>
<script src="/projectB/resource/bootstrap/js/custom.min.js"></script>
<script src="/projectB/resource/bootstrap/assets/libs/raphael/raphael.min.js"></script>
<script src="/projectB/resource/bootstrap/assets/libs/morris.js/morris.min.js"></script>
<script src="/projectB/resource/bootstrap/js/pages/morris/morris-data.js"></script>
<script>
function inputCheck(){ 
	if($("#keyword").val() == ""){
		$("#keyword").addClass(" is-invalid");
		$("#keyword").focus(); 
		return;
	}else{
		$("#search").submit();
	}
}
</script>

<title>토론게시판</title>
<center>
<div class="col-12">
<br><br>
</div>
	<input type="button" value="                           최신순                              " class="btn waves-effect waves-light btn-outline-dark" 
		onclick="document.location.href='/projectB/discussion/main.aa?pageNum=1'">
	<input type="button" value="                           베스트순                           " class="btn waves-effect waves-light btn-dark" 
		onclick="document.location.href='/projectB/discussion/mainBest.aa'">

<form action="/projectB/discussion/mainSearch.aa" id="search">
<table class="table">
<tr height="50">
<td colspan="2"></td>
</tr>
<tr>
<td width="30"></td>
<td>
<input type="text" class="form-control" name="keyword" id="keyword" placeholder="검색어를 입력해주세요"><div class="invalid-feedback">
검색어가 입력되지 않았습니다.
</div>
</td>
<td width="100">
<button type="button" class="btn waves-effect waves-light btn-outline-dark" onClick="inputCheck()" >검색</button>
</td>
</tr>
<tr height="50" align="right">
<td colspan="3"><input type="button" class="btn waves-effect waves-light btn-outline-dark" 
	onclick="document.location.href='/projectB/discussion/writeForm.aa?pageNum=${pageNum}'" value="토론글 작성하기"></td></tr>
</table>
</form>
<c:choose>
<c:when test="${sort ==1}">
<div>
	<input type="button" value="                           주간베스트 토론                            " class="btn waves-effect waves-light btn-dark" 
		onclick="document.location.href='/projectB/discussion/mainBest.aa?sort=1'">
	<input type="button" value="                           월간베스트 토론                        " class="btn waves-effect waves-light btn-outline-dark" 
		onclick="document.location.href='/projectB/discussion/mainBest.aa?sort=2'">
</div>
</c:when>
<c:otherwise>
	<input type="button" value="                           주간베스트 토론                            " class="btn waves-effect waves-light btn-outline-dark" 
		onclick="document.location.href='/projectB/discussion/mainBest.aa?sort=1'">
	<input type="button" value="                           월간베스트 토론                        " class="btn waves-effect waves-light btn-dark" 
		onclick="document.location.href='/projectB/discussion/mainBest.aa?sort=2'">
</c:otherwise></c:choose>
<c:choose>
<c:when test="${sort == 1 }">
<h3>주간베스트</h3>
<h5>지난 한주간 추천과 댓글이 많았던 토론입니다.</h5>
</c:when>
<c:otherwise>
<h3>월간베스트</h3>
<h5>지난 한달간 추천과 댓글이 많았던 토론입니다.</h5>
</c:otherwise>
</c:choose>

<div>
추천 TOP5 <br />
1월 2주차 1월 1주차 12월 
<table class="table">
<tr align="center">
<td>순위</td>
<td>제목</td>
<td>작성자</td>
<td>찬성수/반대수</td>
<td>작성일</td>
<td>댓글수</td>
</tr>
<c:forEach items="${articleList}" var="article">
<tr align="center">
<td><c:out value="${number}"/>
	<c:set var="number" value="${number + 1}"/></td>
<td width="500"><a href="/projectB/discussion/content.aa?num=${article.num}">${article.subject}</a></td>
<td>${article.write}</td>
<td>${article.agreement} / ${article.opposition}</td>
<td>${article.reg}</td>
<td>${article.commentcount}</td>
</tr>
</c:forEach>
</table>
</div>

<c:set var="number" value="1"/>

<div>
댓글 TOP5<br />
<table class="table">
<tr align="center">
<td>순위</td>
<td>제목</td>
<td>작성자</td>
<td>찬성수/반대수</td>
<td>작성일</td>
<td>댓글수</td></tr>
<c:forEach items="${articleCList}" var="articleC">
<tr align="center">
<td><c:out value="${number}"/>
	<c:set var="number" value="${number + 1}"/></td>
<td width="500"><a href="/projectB/discussion/content.aa?num=${articleC.num}">${articleC.subject}</a></td>
<td>${articleC.write}</td>
<td>${articleC.agreement} / ${articleC.opposition}</td>
<td>${articleC.reg}</td>
<td>${articleC.commentcount}</td>
</tr>
</c:forEach>
</table>
</div>

</center>