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

<title>청원진행중인 게시판</title>
</head>
<body>
<br />
<br />
<div align="center">
	<input type="button" value="							진행중인 청원							" class="btn waves-effect waves-light btn-outline-dark"
		onclick="document.location.href='/projectB/petition/afootPetition.aa'">
	<input type="button" value="							완료된 청원								" class="btn waves-effect waves-light btn-outline-dark"	
		onclick="document.location.href='/projectB/petition/finidh_list.aa'">
</div>
<br />
<div align="center">
<c:set var="i" value="0" />
<c:set var="j" value="6" />
<table>
	<c:forEach items="${category}" varStatus="list">
		<c:if test="${i%j==0}">
			<tr>
		</c:if>
		<c:set var="categorya" value="${category[i].num}" />
		<c:choose>
			<c:when test="${categorya == 0}">
			<td>
				<input type="button" style="width:180pt;" value="${category[i].categoryName}" class="btn waves-effect waves-light btn-outline-dark"
				onClick="document.location.href='/projectB/petition/afootPetition.aa'">
			</td>
			</c:when>
			<c:when test="${categorya != 0 }">
			<td>
				<input type="button" style="width:180pt;" value="${category[i].categoryName}" class="btn waves-effect waves-light btn-outline-dark"
				onClick="document.location.href='/projectB/petition/afootPetitionCategory.aa?category=${categorya}'">			
			</td>
			</c:when>
		</c:choose>
		<c:if test="${i%j == j-1}">
			</tr>
		</c:if>
		<c:set var="i" value="${i+1}" />
	</c:forEach>
</table>
</div>

<form name="form" method="post" action="/projectB/petition/afootPetitionSearch.aa" id="search">
<table class="table" width="1200">
	<tr>
	<td>
		<input type="text" class="form-control" name="keyword" id="keyword" placeholder="검색어를 입력하세요.">
		<div class="invalid-feedback">
			검색어가 입력되지 않았습니다.
		</div>
	</td>
	<td>
		<button type="button" class="btn waves-effect waves-light btn-outline-dark" onClick="inputCheck()">검색</button>
	</td>
	</tr>
	<tr>
	<td>
		<select class="cusom-select mr-sm-2" id="inlineFormCustomSelect">
											<option selected="">정렬</option>
											<option value="1" onClick="document.location.href='/projectB/petition/afootPetition.aa?pageNum=1'">최신순</option>
											<option value="2" onClick="document.lacation.href='/projectB/petition/afootPetitionSort.aa?pageNum=1&sort=1'">동의순</option>
		</select>
	</td>
	<td colspan="5" align="right">
		<button type="button" class="btn waves-effect waves-light btn-outline-dark">지금 청원하기</button>
	</td>
	</tr>
	<tr>
		<th scope="col">글번호</th>
		<th scope="col">분류</th>
		<th scope="col">제목</th>
		<th scope="col">청원만료일</th>
		<th scope="col">참여인원</th>
	</tr>
	
	<c:choose>
		<c:when test="${count == 0 && empty keyword}">
		<table class="table">
		<tr>
			<td align="center">진행중인 청원이 없습니다.</td>
		</tr>			
		</table>
		</c:when>
		<c:when test="${count == 0 && not empty keyword }">
		<tr>
			<td align="center">점색하신 청원이 없습니다.</td>
		</tr>
		</c:when>
	</c:choose>
	
	<c:if test="${count > 0 }">
	<c:forEach var="article" items="${ articleList }">
	<tr>
		<c:out value="${ number }" />
		<c:set var="number" value="${number-1}" />
		<th scope="row">${article.num}</th>
			<td>
				${ category[article.category].categoryName }
			</td>
	</tr>
	</c:forEach>
	</c:if>
</table>
</form>

</body>
</html>