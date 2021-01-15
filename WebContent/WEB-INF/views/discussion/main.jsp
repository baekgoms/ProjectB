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
<input type="button" value="                           최신순                              " class="btn waves-effect waves-light btn-outline-dark" 
	onclick="document.location.href='/projectB/discussion/main.aa?pageNum=${pageNum}'">
<input type="button" value="                           베스트순                           " class="btn waves-effect waves-light btn-outline-dark" 
	onclick="document.location.href='/projectB/discussion/mainSort.aa?pageNum=${pageNum}&sort=1'">

<br />
<form action="/projectB/discussion/mainSearch.aa?pageNum=${pageNum}">
<table>
<tr height="50">
<td></td></tr>
<tr>
<td><input type="text" name="keyword">  <input class="btn waves-effect waves-light btn-outline-dark" type="submit" value="검색" >
</td>
</tr>
<tr height="50">
<td></td></tr>
</table>
<input type="hidden" name="pageNum" value="${pageNum}">
</form>
<c:if test="${count == 0}">
<table>
  <tr>
    <td align="center">
      게시판에 저장된 글이 없습니다.
    </td>
  </tr>
</table>
</c:if>
<c:if test="${count > 0}">
<c:set var="i" value="0" />
<c:set var="j" value="5" />
<table border="1">
<c:forEach items="${articleList}" var="article">
<c:if test="${i%j == 0 }">
<tr>
</c:if>
<td><div id="morris-donut-chart" style= "height: 100px"></div>
	${article.subject}<br />
	${article.write}<br />
	${article.reg}<br /></td>
<c:if test="${i%j == j-1 }">
</tr>
</c:if>
<c:set var="i" value="${i+1 }" />
</c:forEach>
</table>
</c:if>

<c:if test="${count > 0}">
   <c:set var="pageCount" value="${count / pageSize + ( count % pageSize == 0 ? 0 : 1)}"/>
   <c:set var="pageBlock" value="${20}"/>
   <fmt:parseNumber var="result" value="${currentPage / 10}" integerOnly="true" />
   <c:set var="startPage" value="${result * 10 + 1}" />
   <c:set var="endPage" value="${startPage + pageBlock-1}"/>
   <c:if test="${endPage > pageCount}">
        <c:set var="endPage" value="${pageCount}"/>
   </c:if> 
   
<input type="button" class="btn waves-effect waves-light btn-outline-dark" 
	onclick="document.location.href='/projectB/discussion/writeForm.aa?pageNum=${pageNum}'" value="토론글 작성하기">
<div class="col-lg-4 mb-4">
<nav aria-label="Page navigation example">
<ul class="pagination justify-content-center">
<c:if test="${startPage > 20}">
<li class="page-item">
    <a class="page-link" href="/projectB/discussion/main.aa?pageNum=${startPage - 10}"aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
        <span class="sr-only">Previous</span>
    </a>
</li>
</c:if>
<c:choose>
	<c:when test="${empty keyword && empty sort}">
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<li class="page-item"><a class="page-link"
  	 	     href="/projectB/discussion/main.aa?pageNum=${i}">${i}</a>
			</li>
		</c:forEach>
	</c:when>
	<c:when test="${empty keyword && not empty sort}">
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<li class="page-item"><a class="page-link"
  		      href="/projectB/discussion/mainSort.aa?pageNum=${i}&sort=${sort}">${i}</a>
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

    	new Morris.Donut({
    	        element: 'morris-donut-chart',
    	        data: [{
    	            label: "찬성",
    	            value: 30,

    	        }, {
    	            label: "반대",
    	            value: 30
    	        }],
    	        resize: true,
    	        colors:['#5f76e8', '#01caf1', '#8fa0f3']
    	    });   
</script>
</center>