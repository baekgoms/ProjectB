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


<div>
<h4>추천 TOP5</h4> <br />
<table class="table">
<thead class="thead-light">
<tr>
<th scope="col"></th>
<th scope="col">오늘기준</th>
<c:forEach items="${weekList}" var="week">
<th scope="col"><a href=""><c:out value="${week}" /></a></th>
</c:forEach>
</tr>
</thead>
<tr><td colspan="7"></td></tr>
</table>
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
<tr height="30"><td colspan="6"></td></tr>
</table>
</div>

<c:set var="number" value="1"/>

<div>
<h4>댓글 TOP5</h4><br />
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
