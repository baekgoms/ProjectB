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
				<td width ="50" >댓글번호${petCmtList.num}</td>
                <td width="100">${sessionId}
                <input type="hidden" name="writer" value="${sessionId}"></td>
                <td width="350" align="center"> 동의합니다.</td>
                <td width = "50">
				<input type="submit" VALUE="동의" onclick="Confirm()"/></td>					
			</tr>
		</table>
  
         <table align="center" width = "500" border="1">
		
		<c:forEach var="x" items="${petCmtList}">  
		<tr>
			<td width ="50" >댓글번호${x.num}</td>
            <td width ="100">작성자${x.writer}</td>
            <td width ="350">내용${x.content}</td>
            <td width ="100">작성날짜${x.reg}</td>
		</tr>
		</c:forEach>  
	</table>
    <tbody>
    </tbody>
     
     
<div class="col-lg-4 mb-4">
<nav aria-label="Page navigation example">
<ul class="pagination justify-content-center">
   <ul class="pagination">
   <c:if test="${startPage > 10}">
     <li class="page-item">
          <a class="page-link" href="/projectB/petition/petitionComment.aa?pageNum=${startPage - 10}" aria-label="Previous">
         <span aria-hidden="true">«</span>
          <span class="sr-only">Previous</span>
            </a>
        </li>
    </c:if>
    <c:forEach var="i" begin="${startRow}" end="${endRow}">    
        <li class="page-item"><a class="page-link" href="/projectB/petition/petitionComment.aa?pageNum=${i}">${i}</a></li>
    </c:forEach>
    <c:if test="${endPage < pageCount}">
        <li class="page-item">
        <a class="page-link" href="/projectB/petition/petitionComment.aa?pageNum=${startPage + 10}" aria-label="Next">
          <span aria-hidden="true">»</span>
          <span class="sr-only">Next</span>
          </a>
        </li>
    </c:if>
    </ul>
</ul>
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
