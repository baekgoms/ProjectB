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
<style>
      th {
        text-align: center;
      }
  
</style>

</head>
<body>
<jsp:include page="/WEB-INF/views/topbar/top.jsp" />
<br>
<br>
<br>
<br>
<div align="center">
	<input type="button" value="							진행중인 청원							" class="btn waves-effect waves-light btn-outline-dark"
		onclick="document.location.href='/projectB/petition/afootPetition.aa'">
	<input type="button" value="							완료된 청원								" class="btn waves-effect waves-light btn-outline-dark"	
		onclick="document.location.href='/projectB/answer/completedAnswer.aa'">
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
	<table class="table"  >
		<tr>
			<td>
				<input type="text" class="form-control" name="keyword" id="keyword" placeholder="검색어를 입력하세요.">
				<div class="invalid-feedback" align="center">
					검색어가 입력되지 않았습니다.
				</div>
			</td>
			<td>
				<button type="button" class="btn waves-effect waves-light btn-outline-dark" onClick="inputCheck()">검색</button>
			</td>
		</tr>
		<tr>
			<td>
				<c:if test="${keyword == null }">
		  			<select class="custom-select mr-sm-2"  id="select" name="select" onchange="if(this.value) location.href=(this.value);" >
						<option value="http://localhost:8080/projectB/petition/afootPetition.aa" selected>정렬</option>
						<option value="http://localhost:8080/projectB/petition/afootPetition.aa?pageNum=1">최신순</option>
						<option value="http://localhost:8080/projectB/petition/afootPetitionSort.aa?pageNum=1&sort=1" >동의순</option>
					</select>
				</c:if>
			</td>
			<td colspan="5" align="right">
				<button type="button" class="btn waves-effect waves-light btn-outline-dark"
				onClick="document.location.href='/projectB/petition/upload.aa'">지금 청원하기</button>
			</td>
		</tr>

		<tr>
			<th scope="col" >글번호</th>
			<th scope="col" >분류</th>
			<th scope="col" >제목</th>
			<th scope="col" >청원만료일</th>
			<th scope="col" >참여인원</th>
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
				<table class="table">
					<tr>
						<td align="center">검색하신 청원이 없습니다.</td>
					</tr>
				</table>
			</c:when>
		</c:choose>
		

		<c:if test="${count > 0 }">
			<c:forEach var="article" items="${ articleList }">
				<tr>
					<c:set var="number" value="${number-1}" />
					<td width=80 scope="row" align="center">${article.num}</td>
					<td width=100 align="center">
						${ category[article.category].categoryName }
					</td>
					<td width=300 align="center">
	        			<a href ="/projectB/petition/petContent.aa?num=${article.num}&pageNum=${currentPage}">${article.title}
	        			</a>
	        		
	        		</td>
					<td width=100 align="center">${article.endDate}</td>
					<td width=100 align="center">${article.petition}</td>
				</tr>
			</c:forEach>
		</c:if>
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
				<c:if test="${startPage > 10 }">
					<li class="page-item">
						<a class="page-link" href="/projectB/petition/afootPetition.aa?pageNum=${startPage - 10}" aria-label="Previous">
							<span aria-hidden = "true">«</span>
							<span class="sr-only">Previous</span>
						</a>
					</li>
				</c:if>
			<c:choose>
				<c:when test="${empty keyword && empty sort}">
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<li class="page-item">
							<a class="page-link"  href="/projectB/petition/afootPetition.aa?pageNum=${i}">${i}</a>
						</li>
					</c:forEach>
				</c:when>
				<c:when test="${empty keyword && not empty sort}">
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<li class="page-item">
							<a class="page-link"  href="/projectB/petition/afootPetitionSort.aa?pageNum=${i}&sort=${sort}">${i}</a>
						</li>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<li class="page-item">
							<a class="page-link" href="/projectB/petition/afootPetitionSearch?keyword=${keyword}&pageNum=${i}">${i}</a>
						</li>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			<c:if test="${endPage < pageCount}">
				<li class="page-item">
					<a class="page-link" href="/projectB/petition/afootPetition.aa?pageNum=${startPage + 10}" aria-label="Next">
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
<script src="/projectB/resource/bootstrap/assets/libs/raphael/raphael.min.js"></script>
<script src="/projectB/resource/bootstrap/assets/libs/morris.js/morris.min.js"></script>
<script src="/projectB/resource/bootstrap/js/pages/morris/morris-data.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<script style="text/javascript">


$('#select').on('change', function() {
    location.href= this.value;
});
$('#select').val(location.href);

</script>


</body>
</html>