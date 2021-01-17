<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page import = "java.text.SimpleDateFormat" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" type="image/png" sizes="16x16" href="/projectB/resource/bootstrap/assets/images/favicon.png">
    <link href="/projectB/resource/bootstrap/css/style.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/projectB/resource/bootstrap/assets/extra-libs/prism/prism.css">

<title>청원 댓글</title>
</head>

<body>  



<form method="post" action="petitionCommentPro.aa" onsubmit="return formCheck(this)">
		<input type="hidden" name="petitionNum" value="${petitionNum}" />
        <table align="center" width = "500" border="1">
		
			<tr>
				<td width ="50" >댓글번호</td>
                <td width="100">${sessionId}
                <input type="hidden" name="writer" value="${sessionId}"></td>
                <td width="350"> 동의합니다.</td>
                <td width = "50">
				<input type="submit" VALUE="동의" onclick="Confirm()"/></td>					
			</tr>
		</table>
  
         <table align="center" width = "500" border="1">
		
		<c:forEach var="x" items="${petCmtList}">  
		<tr>
            <td width ="50" >${x.num}</td>
            <td width ="100">${x.writer}</td>
            <td width ="350">${x.content}</td>
            <td width ="100">${x.reg}</td>
		</tr>
		</c:forEach>  
	</table>
    <tbody>
    </tbody>
     
<c:if test="${count > 0}">
    <c:set var="pageCount" value="${count / pageSize +(count % pageSize == 0 ? 0: 1)}" />
    <c:set var="pageBlock" value="${10}" />
    <fmt:parseNumber var="result" value="${ currentPage/10 }" integerOnly="true" />
    <c:set var ="startPage" value="${ result * 10 + 1 }" />
    <c:set var="endPage" value="${startPage + pageBlock-1 }" />
    <c:if test="${ endPage > pageCount }">
        <c:set var="endPage" value="${ pageCount }" />
</c:if>   
     
<div class="col-lg-4 mb-4">
<nav aria-label="Page navigation example">
<ul class="pagination justify-content-center">
   <ul class="pagination">
   <c:if test="${startPage > 10}">
     <li class="page-item">
          <a class="page-link" href="/projectB/petition/petComment.aa?pageNum=${startPage - 10}&petitionNum=${petitionNum}" aria-label="Previous">
         <span aria-hidden="true">«</span>
          <span class="sr-only">Previous</span>
            </a>
        </li>
    </c:if>
    <c:forEach var="i" begin="${startPage}" end="${endPage}">    
        <li class="page-item"><a class="page-link" href="/projectB/petition/petComment.aa?pageNum=${i}&petitionNum=${petitionNum}">${i}</a></li>
    </c:forEach>
    <c:if test="${endPage < pageCount}">
        <li class="page-item">
        <a class="page-link" href="/projectB/petition/petComment.aa?pageNum=${startPage + 10}&petitionNum=${petitionNum}" aria-label="Next">
          <span aria-hidden="true">»</span>
          <span class="sr-only">Next</span>
          </a>
        </li>
    </c:if>
    </ul>
</ul>
</c:if>
</nav>
</div>
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
    <script src="/projectB/resource/bootstrap/assets/extra-libs/prism/prism.js"></script>         
</body>
</html>      
