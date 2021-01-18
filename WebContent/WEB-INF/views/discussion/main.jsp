<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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

<title>토론게시판</title>
<center>
<div class="col-12">
<br><br>
</div>
<c:choose>
<c:when test="${empty keyword}">
	<input type="button" value="                           최신순                              " class="btn waves-effect waves-light btn-dark" 
		onclick="document.location.href='/projectB/discussion/main.aa?pageNum=1'">
	<input type="button" value="                           베스트순                           " class="btn waves-effect waves-light btn-outline-dark" 
		onclick="document.location.href='/projectB/discussion/mainBest.aa?pageNum=1'">
	</c:when>
<c:otherwise>
	<input type="button" value="                           최신순                              " class="btn waves-effect waves-light btn-outline-dark" 
		onclick="document.location.href='/projectB/discussion/main.aa?pageNum=1'">
	<input type="button" value="                           베스트순                           " class="btn waves-effect waves-light btn-outline-dark" 
		onclick="document.location.href='/projectB/discussion/mainBest.aa?pageNum=1'">
</c:otherwise>
</c:choose>

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
	<c:when test="${count == 0 && empty keyword}">
		<table class="table">
		  <tr>
		    <td align="center">작성된 글이 없습니다.</td>
		  </tr>
		</table>
	</c:when>
	<c:when test="${count == 0 && not empty keyword }">
		<table class="table">
			<tr>
		    <td align="center">검색결과가 없습니다.</td>
			</tr>
		</table>
	</c:when>
</c:choose>


<c:if test="${count > 0}">
<c:set var="i" value="0" />
<c:set var="j" value="3" />

<table class="table">
<c:forEach items="${articleList}" var="article">

<c:if test="${i%j == 0 }">
<tr align="center">
</c:if>
<td width="450">
<div id="${article.num}" style= "height: 200px"></div>
	<a href="/projectB/discussion/content.aa?pageNum=${pageNum}&num=${article.num}">${article.subject}<br />
	${article.write}<br />
	${article.reg}<br />
	</a>
	</td>
<c:if test="${i%j == j-1}">
</tr>
</c:if>
<c:set var="i" value="${i+1}" />
</c:forEach>
</table>
</c:if>

<c:if test="${count > 0}">
   <c:set var="pageCount" value="${count / pageSize + ( count % pageSize == 0 ? 0 : 1)}"/>
   <c:set var="pageBlock" value="${10}"/>
   <fmt:parseNumber var="result" value="${currentPage / 10}" integerOnly="true" />
   <c:set var="startPage" value="${result * 10 + 1}" />
   <c:set var="endPage" value="${startPage + pageBlock-1}"/>
   <c:if test="${endPage > pageCount}">
        <c:set var="endPage" value="${pageCount}"/>
</c:if> 

<div class="col-12">
<br><hr><br>
</div>
                                   
<div class="col-lg-4 mb-4">
<nav aria-label="Page navigation example">
<ul class="pagination justify-content-center">
<c:if test="${startPage > 10}">
<li class="page-item">
    <a class="page-link" href="/projectB/discussion/main.aa?pageNum=${startPage - 10}"aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
        <span class="sr-only">Previous</span>
    </a>
</li>
</c:if>
<c:choose>
	<c:when test="${empty keyword}">
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<li class="page-item"><a class="page-link"
  	 	     href="/projectB/discussion/main.aa?pageNum=${i}">${i}</a>
			</li>
		</c:forEach>
	</c:when>
	<c:otherwise>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<li class="page-item"><a class="page-link"
  		      href="/projectB/discussion/mainSearch.aa?keyword=${keyword}&pageNum=${i}">${i}</a>
			</li>
		</c:forEach>
	</c:otherwise>
</c:choose>
<c:if test="${endPage < pageCount}">
<li class="page-item">
    <a class="page-link" href="/projectB/discussion/main.aa?pageNum=${startPage + 10}" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
        <span class="sr-only">Next</span>
    </a>
</li>
</c:if>
</ul>
</nav>
</div>
</c:if>

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
<c:forEach items="${articleList}" var="chart">
	new Morris.Donut({
		element: '${chart.num}',
		data: [{ label: "찬성", value: '${chart.agreement}' }, 
			   { label: "반대", value: '${chart.opposition}'}],
		resize: true,
		colors:['#5f76e8','#e04643']
});
</c:forEach>
</script>

</center>