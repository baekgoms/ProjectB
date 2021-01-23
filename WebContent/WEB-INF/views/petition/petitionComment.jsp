<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page import = "java.text.SimpleDateFormat" %>

<%
	// TODO : Delete ME!!
	session.setAttribute("memId", "123");
%>

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

<form id="agreeForm">
	<input type="button" VALUE="청원동의" class="btn btn-block btn-primary" onclick="Confirm()"/>
		
		
     <div class="card-body">
            	<div class="table-responsive">
                	<table class="table" align="center">
                        <tbody>
                        <c:forEach var="x" items="${petCmtList}">
                            <tr>
                                <td align="center">${x.writer}"memId"</td>
                                <td align="center">${x.content}</td>
                                <td align="center"> <fmt:formatDate value="${x.reg}" pattern="yy-MM-dd HH:mm"/></td>
                            </tr>
                        </c:forEach>            
                        </tbody>
                   	</table>
                </div>
		</div>
     
     
<c:if test="${count > 0}">
    <c:set var="pageCount" value="${count / pageSize +(count % pageSize == 0 ? 0: 1)}" />
    <c:set var="pageBlock" value="${10}" />
    <fmt:parseNumber var="result" value="${ currentPage/10 }" integerOnly="true" />
    <c:set var ="startPage" value="${ result * 10 + 1 }" />
    <c:set var="endPage" value="${startPage + pageBlock-1 }" />
    <c:if test="${ endPage > pageCount }">
        <c:set var="endPage" value="${ pageCount }" />
</c:if>   
     
     
<div align="center">  
<div class="col-lg-4 mb-4">
<nav aria-label="Page navigation example">
<ul class="pagination justify-content-center" align="center">
   <ul class="pagination" align="center">
   <c:if test="${startPage > 10}">
     <li class="page-item" align="center">
          <a class="page-link" href="/projectB/petition/petComment.aa?pageNum=${startPage - 10}&petitionNum=${petitionNum}" aria-label="Previous">
         <span aria-hidden="true">«</span>
          <span class="sr-only">Previous</span>
            </a>
        </li>
    </c:if>
    <c:forEach var="i" begin="${startPage}" end="${endPage}">    
        <li class="page-item" align="center"><a class="page-link" href="/projectB/petition/petComment.aa?pageNum=${i}&petitionNum=${petitionNum}">${i}</a></li>
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

	<script type="text/javascript">
	$("#agreeForm").submit(function(e){
	    e.preventDefault();
	  });

	
		function Confirm() {
			<c:choose>
				<c:when test="${memId == null}">
					alert("로그인이 필요한 서비스 입니다.");
					window.location = "";
				</c:when>
				<c:when test="${petitionPetitionerService.isAgreed(petitionNum,memId)}">
					alert("이미 동의한 청원입니다.");
				</c:when>
				<c:otherwise>
                    $.ajax({
                        url: "/projectB/petition/petitionCommentPro.aa",
                        method: "post",
                        data: {
                            "writer" : "${memId}",
                            "content" : "동의합니다.",
                            "petitionNum" : "${petitionNum}"
                        },
                        success: function(e) {
                            alert("동의가 완료되었습니다.");
                            location.reload();
                        },
                        error : function(e) {
                            alert("오류가 발생했습니다.");
                        }
                    });
				</c:otherwise>
			</c:choose>
		}
	</script>
</body>
</html>      
