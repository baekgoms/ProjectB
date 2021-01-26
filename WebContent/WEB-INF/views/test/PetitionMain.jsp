<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<!-- Custom CSS -->
<link href="/projectB/resource/bootstrap/css/style.css" rel="stylesheet">
<!-- This Page CSS -->
<link href="/projectB/resource/assets/libs/morris.js/morris.css" rel="stylesheet">
<title>청원메인페이지</title>
</head>
<body>


<table width="1200" style="text-align: center;">
<br>
<br>

	<tr>
	<td colspan="2" align="right">
	<c:choose>
	<c:when test ="${memId == null}">
				<button type="button" class="btn waves-effect waves-light btn-outline-dark">로그인</button>
	</c:when>
	<c:when test ="${memId != null}">
				<button type="button" class="btn waves-effect waves-light btn-outline-dark">내 정보 보기</button>
	</c:when>
	</c:choose>		
				<hr>
			</td>
	</tr>
	<tr>
		<td width="600">추가답변 원해요(랜덤)<br>
		<c:if test="${ count > 0 }">
			<c:forEach var="article" items="${articleList}" begin="0" end="5" step="1" varStatus="status">
		<a href ="projectB/petition/petContent.aa?num=${article.num}">${article.title}</a><br>
		</c:forEach>
		</c:if>
		</td>
		<td width="600">11111111111111(워드클라우드?)</td>
	</tr>
</table>

<table width="1200" style="text-align: center;">
<br>
<br>
	<tr>
		<td width="600">마감임박 청원(마감임박순)<br>
		<c:forEach var="enddate" items="${enddateList}" begin="0" end="5" step="1" varStatus="status">
			<a href ="projectB/petition/petContent.aa?num=${enddate.num}">${enddate.title}</a><br>
		
		</c:forEach>
		</td>
		
		<td width="600">동의수 높은 청원(동의수순)<br>
		1, ############<br>
		2, ############<br>
		3, ############<br>
		4, ############<br>
		5, ############<br>
		</td>
	
	</tr>
	<br>
	<br>

</table>

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
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
</body>
</html>