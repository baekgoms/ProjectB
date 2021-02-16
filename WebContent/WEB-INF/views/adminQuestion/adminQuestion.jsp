<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<!-- Custom CSS -->
<link href="/projectB/resource/bootstrap/css/style.css" rel="stylesheet">
<link href="/projectB/resource/bootstrap/css/style.min.css"
	rel="stylesheet">
<!-- This Page CSS -->
<link
	href="/projectB/resource/bootstrap/assets/libs/morris.js/morris.css"
	rel="stylesheet">
<link href="/projectB/resource/bootstrap/css/discussion.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>문의 관리</title>
<style>
a:visited {
	color: green;
	text-decoration: none;
}
</style>

<script type="text/javascript">

	function selectOption(obj) {
		window.location.href = "question.aa?sort=" + obj.value;
	}
	
	function openNewWindow(url) { 
		open(url,"Mail","toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, width=1000, height=875");
	}
	
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/topbar/admintopbar.jsp" />
	<br>
	<br>
	<br>
	<br>

	<div class="card">
		<div class="card-body">
			<select class="form-control" id="exampleFormControlSelect1" style="width: 150px; float: right;"
				onchange = "selectOption(this)">
				<option value="0" <c:if test="${ '0' == sort }">selected</c:if>>전체</option>
				<option value="1" <c:if test="${ '1' == sort }">selected</c:if>>미답변</option>
				<option value="2" <c:if test="${ '2' == sort }">selected</c:if>>답변 완료</option>
			</select>
		</div>
		
		<div class="table-responsive">
			<table class="table">
				<thead class="thead-light" align="center">
					<tr>
						<th scope="col">분류</th>
						<th scope="col">제목</th>
						<th scope="col">답변여부</th>
						<th scope="col">작성자</th>						
						<th scope="col">작성시간</th>
					</tr>
				</thead>
				<tbody>
					 
					<c:forEach var = "question" items="${ questions }" varStatus="status">
						<tr align="center">
						 	<td>
						 		<c:if test="${ question.category == 1 }">
									게시물 문의
								</c:if>
								<c:if test="${ question.category == 2 }">
									사용자 문의
								</c:if>
								<c:if test="${ question.category == 3 }">
									기타
								</c:if>
						 	</td>
						 	<td>
								<a href="javascript:openNewWindow('/projectB/question/content.aa?num=${question.num}')">
									${ question.title }
								</a>
							</td>
							<td>
								<c:if test="${ question.reply == 0 }">
									미답변
								</c:if>
								<c:if test="${ question.reply == 1 }">
									답변 완료
								</c:if>								
							</td>
							<td>${ question.writer }</td>
							<td>${ question.reg }</td>							
						</tr>
					 </c:forEach>
				</tbody>				
			</table>
		</div>
	</div>

	<c:if test="${ questionCount > 0 }">
		<ul id="commentPage" class="pagination justify-content-center">
			<!-- << -->
			<c:if test="${ startPageIndex > 10 }">
				<li class="page-item">
					<button class="page-link" onclick="document.location.href='question.aa?pageNum=${ startPageIndex - 10 }&sort=${ sort }'">
						«
					</button>
				</li>
			</c:if>

			<c:forEach var="i" begin="${ startPageIndex }"
				end="${ endPageIndex }">
				<li class="page-item">					
					<button class="page-link" onclick="document.location.href='question.aa?pageNum=${ i }&sort=${ sort }'">
						${i}
					</button>
				</li>
			</c:forEach>

			<!-- >> -->
			<c:if test="${ endPageIndex < pageTotalCount }">
				<li class="page-item">
					<button class="page-link" onclick="document.location.href='question.aa?pageNum=${ startPageIndex + 10 }&sort=${ sort }'">
						»
					</button>
				</li>
			</c:if>
		</ul>
	</c:if>

	<!--  부트스트랩 js 사용 -->
	<script src="/projectB/resource/bootstrap/assets/libs/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap tether Core JavaScript -->
	<script src="/projectB/resource/bootstrap/assets/libs/popper.js/dist/umd/popper.min.js"></script>
	<script src="/projectB/resource/bootstrap/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- apps -->
	<!-- apps -->
	<script src="/projectB/resource/bootstrap/js/app-style-switcher.js"></script>
	<script src="/projectB/resource/bootstrap/js/feather.min.js"></script>
	<!-- slimscrollbar scrollbar JavaScript -->
	<script src="/projectB/resource/bootstrap/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
	<script src="/projectB/resource/bootstrap/assets/extra-libs/sparkline/sparkline.js"></script>
	<!--Wave Effects -->
	<!-- themejs -->
	<!--Menu sidebar -->
	<script src="/projectB/resource/bootstrap/js/sidebarmenu.js"></script>
	<!--Custom JavaScript -->
	<script src="/projectB/resource/bootstrap/js/custom.min.js"></script>

</body>
</html>