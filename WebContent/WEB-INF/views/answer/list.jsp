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

<title>답변 게시판</title>
<style>
      th {
        text-align: center;
      }
	  form#search {
	    width: 1700px;
	  }
	  .answer-tab {
	  }
	  
	  input.answer-tab {width: 48%;float: left;display: inline-block;margin: 0 1%;margin-bottom: 30px;line-height: 40px;font-size: 20px;margin-top: 13px;}
  
	  .btn-outline-dark.on, input.answer-tab.on {
	  	color: #fff;
	    background-color: #1c2d41;
	    border-color: #1c2d41;
	  }
	  
	  .category-btn {
		width: 280px;
	    line-height: 28px;
        border-color: #ccc !important;
	  }
	  
	  .button-wrap input#keyword {
	     width: auto;
	     display: inline-block;
	  }

	  select#select {
	    width: auto;
	    float: right;
	    right: 40px;
	    position: relative;
	    border: 1px solid black;
	    color: black;
	    background: white;
	  }
	  
	  .button-wrap {
	    margin: 10px 0;
	  }
	  
	  table.category-table {
	    margin-top: 43px;
	  }
	  
	  .col-lg-3 {
	    margin-left: 10px;
	    top: 32px;
	  }
</style>

</head>
<body>
<jsp:include page="/WEB-INF/views/topbar/anwerTopbar.jsp" />
<br>
<br>

<div class="col-lg-4">
<div align="center">
	<c:set var="i" value="0" />
	<c:set var="j" value="6" />
		<table class="category-table">
			<c:forEach items="${category}" varStatus="list">
				<c:if test="${i%j==0}">
					<tr>
				</c:if>
				<c:set var="categorya" value="${category[i].num}" />
				<c:choose>
					<c:when test="${categorya == 0}">
						<td>
							<input type="button" value="${category[i].categoryName}" 
							class="btn waves-effect waves-light btn-outline-dark category-btn <c:if test="${answerDTO.category == categorya}">on</c:if>"
							onclick="document.location.href='/projectB/answer/list.aa?state=${state}&keyword=${keyword}'">
						</td>
					</c:when>
					<c:when test="${categorya != 0 }">
						<td>
							<input type="button" value="${category[i].categoryName}" 
							class="btn waves-effect waves-light btn-outline-dark category-btn <c:if test="${answerDTO.category == categorya}">on</c:if>"
							onclick="document.location.href='/projectB/answer/list.aa?state=${state}&keyword=${keyword}&category=${categorya}'">			
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

<form name="form" method="get" action="/projectB/answer/list.aa" id="search">
	<input type="hidden" name="state" value="${answerDTO.state}" />
	<input type="hidden" name="category" value="${answerDTO.category}" />
	<div class="button-wrap">
		<input type="text" class="form-control" value="${keyword}" name="keyword" id="keyword" placeholder="검색어를 입력하세요.">
		<button type="button" class="btn waves-effect waves-light btn-outline-dark" onClick="inputCheck()">검색</button>
 		<select class="custom-select mr-sm-2"  id="select" name="select" onchange="if(this.value) location.href=(this.value);" >
			<option value="/projectB/answer/list.aa?state=${state}&category=${answerDTO.category}&keyword=${keyword}&pageNum=1"<c:if test="${sort == null or sort == ''}">selected</c:if> >정렬</option>
			<option value="/projectB/answer/list.aa?state=${state}&category=${answerDTO.category}&keyword=${keyword}&pageNum=1&sort=1" <c:if test="${sort == '1'}">selected</c:if> >최신순</option>
			<option value="/projectB/answer/list.aa?state=${state}&category=${answerDTO.category}&keyword=${keyword}&pageNum=1&sort=2" <c:if test="${sort == '2'}">selected</c:if> >동의순</option>
		</select>
	</div>
	<table class="table">
		<tr align = "center">
			<th scope="col" >글번호</th>
			<th scope="col" >분류</th>
			<th scope="col" >제목</th>
			<th scope="col" >청원만료일</th>
			<th scope="col" >참여인원</th>
			<c:if test="${state == 4 || state == 6}">
				<th scope="col" >답변</th>
			</c:if>
			<c:if test="${state == 5 || state == 7}">
				<th scope="col" >답변</th>
			</c:if>
		</tr>

	
		<c:choose>
			<c:when test="${count == 0 && empty keyword}">
				<table class="table">
					<tr>
						<td align="center">답변 할 청원이 없습니다.</td>
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
			<c:forEach var="article" items="${ articleList }" varStatus="status">
				<tr>
					<c:set var="number" value="${number-1}" />
					<td width=80 scope="row" align="center">${article.num}</td>
					<td width=100 align="center">
						${ category[article.category].categoryName }
					</td>
					<td width=300 align="center">
	        			<a href ="/projectB/petition/petContent.aa?num=${petitionList[status.index].num}&pageNum=${currentPage}">${petitionList[status.index].title}
	        			</a>
	        			
	        		</td>
					<td width=100 align="center"><fmt:formatDate value="${petitionList[status.index].endDate}"
                        pattern = "yyyy-MM-dd" />
					
					</td>
					<td width=100 align="center">${petitionList[status.index].petition}</td>
					<td width=100 align="center">
						<c:if test="${state == 4}">
							<button type="button" class="btn waves-effect waves-light btn-outline-dark"
								onClick="document.location.href='/projectB/answer/answerUpload.aa?petitionNum=${articleList[status.index].petitionNum}'">답변작성</button> 
						</c:if>
						<c:if test="${state == 6}">
							<button type="button" class="btn waves-effect waves-light btn-outline-dark"
								onClick="document.location.href='/projectB/answer/addAnswerUpload.aa?petitionNum=${articleList[status.index].petitionNum}'">답변작성</button> 
						</c:if>
						<c:if test="${state == 5}">
							<button type="button" class="btn waves-effect waves-light btn-outline-dark"
								onClick="document.location.href='/projectB/answer/answerContent.aa?petitionNum=${articleList[status.index].petitionNum}'">답변확인</button> 
						</c:if>
						<c:if test="${state == 7}">
							<button type="button" class="btn waves-effect waves-light btn-outline-dark"
								onClick="document.location.href='/projectB/answer/addAnswerContent.aa?petitionNum=${articleList[status.index].petitionNum}'">답변확인</button> 
						</c:if>
					</td>
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
					
						<a class="page-link" href="/projectB/answer/list.aa?state=${state}&category=${answerDTO.category}&keyword=${keyword}&sort=${sort}&pageNum=${startPage - 10}" aria-label="Previous">
							<span aria-hidden = "true">«</span>
							<span class="sr-only">Previous</span>
						</a>
					</li>
				</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<li class="page-item">
					<a class="page-link" href="/projectB/answer/list.aa?state=${state}&category=${answerDTO.category}&keyword=${keyword}&sort=${sort}&pageNum=${i}">${i}</a>
				</li>
			</c:forEach>
			<c:if test="${endPage < pageCount}">
				<li class="page-item">
					<a class="page-link" href="/projectB/answer/list.aa?state=${state}&category=${answerDTO.category}&keyword=${keyword}&sort=${sort}&pageNum=${startPage + 10}" aria-label="Next">
		  				<span aria-hidden="true">»</span>
		 				 <span class="sr-only">Next</span>
		 			</a>
				</li>
			</c:if>
		</ul>
	</c:if>
</form>

</div>
	</div>
</div>


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
function openReport(num){
	
	
	url = "/projectB/petition/declareArticle.aa?num=" + num;
	
	window.open(url, "confirm", 
    "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=600, height=400");
}

$('#select').on('change', function() {
    location.href= this.value;
});

</script>


</body>
</html>