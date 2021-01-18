<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- Custom CSS -->
<link href="/projectB/resource/bootstrap/css/style.css" rel="stylesheet">
<!-- This Page CSS -->
<link href="/projectB/resource/assets/libs/morris.js/morris.css" rel="stylesheet">
 
<title>토론게시판</title>
<center>
<div class="col-12">
<br><br>
</div>  
	<input type="button" value="                           최신순                              " class="btn waves-effect waves-light btn-outline-dark" 
		onclick="document.location.href='/projectB/discussion/main.aa?pageNum=1'">
	<input type="button" value="                           베스트순                           " class="btn waves-effect waves-light btn-dark" 
		onclick="document.location.href='/projectB/discussion/mainBest.aa'">

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

<div>
	<input type="button" value="                           주간베스트 토론                            " class="btn waves-effect waves-light btn-outline-dark" 
		onclick="document.location.href='/projectB/discussion/mainBest.aa?sort=1'">
	<input type="button" value="                           월간베스트 토론                        " class="btn waves-effect waves-light btn-outline-dark" 
		onclick="document.location.href='/projectB/discussion/mainBest.aa?sort=2'">
</div>

<h5>주간베스트</h5>
<div>
추천 TOP5 <br />
1월 2주차 1월 1주차 12월 
<table class="table">
<tr align="center">
<td>제목</td>
<td>작성자</td>
<td>찬성수/반대수</td>
<td>작성일</td>
<c:forEach items="${articleList}" var="article">
<tr align="center">
<td><a href="/projectB/discussion/content.aa?num=${article.num}">${article.subject}</a></td>
<td>${article.write}</td>
<td>${article.agreement} / ${article.opposition}</td>
<td>${article.reg}</td>
</tr>
</c:forEach>

</table>

</div>
<div>
댓글 TOP5<br />
<table>
<tr align="center">
<td>제목</td>
<td>작성자</td>
<td>찬성수/반대수</td>
<td>작성일</td>
<c:forEach items="${articleCList}" var="articleC">
<tr align="center">
<td><a href="/projectB/discussion/content.aa?num=${articleC.num}">${articleC.subject}</a></td>
<td>${articleC.write}</td>
<td>${articleC.agreement}</td>
<td>${articleC.agreement} / ${articleC.opposition}</td>
<td>${articleC.reg}</td>
</tr>
</c:forEach>
</table>
</div>

</center>