<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


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
<link href="/projectB/resource/bootstrap/css/style.min.css" rel="stylesheet">
<!-- This Page CSS -->
<link href="/projectB/resource/bootstrap/assets/libs/morris.js/morris.css" rel="stylesheet">
<link href="/projectB/resource/bootstrap/css/discussion.css" rel="stylesheet">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>answer main</title>
<style>
a:visited {
	color: green;
	text-decoration: none;
}

.text_line {
	display: inline-block; width: 120px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;
}
</style>
<script type="text/javascript">
	function selectOption(obj){
		window.location.href = "/projectB/answer/answerMain.aa?sort=" + obj.value;
	}
	
	
	function init() {
		var osize = '${petitionOppsites.size()}';
		var asize = '${petitionOppsites.size()}';
		var ob = osize * 77;
		var ab = asize * 154;
		if(osize < 10 ){
			ob = ob + 14;
		}
		
		if(asize < 10 ){
			ab = ab + 30;
		}
		$("#oppsiteCard").css("bottom", ob)
		$("#additionCard").css("bottom", ab)
		
		console.log("ob/" + ob);
		console.log("ab/" + ab);
	}
</script>
</head>
<body onload = "init()">
	<jsp:include page="/WEB-INF/views/topbar/anwerTopbar.jsp" />
	<br>
	<br>
	<br>
	<br>
	
	<div class="col-12" style="max-width: 25%; height: 900px">	
		<div class="card" style="position: relative; left: 1628px; width: 150px">
			<select class="form-control" id="exampleFormControlSelect1" onchange="selectOption(this)">
			<!-- 나중에 테이블로 뺴서 카테고리화 시킬 것 ? -->				
				<option value="ALL" <c:if test="${ 'ALL' == sort }">selected</c:if>>전체</option>
				<option value="WEEK"<c:if test="${ 'WEEK' == sort }">selected</c:if>>일주일</option>
				<option value="MONTH"<c:if test="${ 'MONTH' == sort }">selected</c:if>>한달</option>
				<option value="HALF_YEAR"<c:if test="${ 'HALF_YEAR' == sort }">selected</c:if>>6개월</option>
				<option value="YEAR"<c:if test="${ 'YEAR' == sort }">selected</c:if>>12개월</option>
			</select>
		</div>
		
 		<%-- <c:out value="${ petitionRecommends.size() }"/>
		<c:out value="${ petitionOppsites.size() }"/>
		<c:out value="${ petitionAdditions.size() }"/>
		  --%>
		<div class="card" style="position: relative; left: 70px;">
			<div class="card-body">				
				<h4 class="card-title" style="text-align: center;">추천순</h4>
			</div>
			
			<div class="table-responsive">
				<table class="table table-bordered" >
					<!-- <thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">First</th>
							<th scope="col">Last</th>
							<th scope="col">Handle</th>
						</tr>
					</thead> -->
					<tbody>
						<c:forEach varStatus="status" var = "recommend" items = "${ petitionRecommends }">
							<tr style="text-align: center;">
								<th scope="row">${ status.index + 1 }</th>
								<td>
									<a href="" style="color: brown; 
									display: inline-block; width: 150px; 
									white-space: nowrap; overflow: hidden; 
									text-overflow: ellipsis;">
										${ recommend.title }
									</a>
								</td>
							</tr>
						</c:forEach>												
					</tbody>
				</table>
			</div>
		</div>
		
		<div class="card" id = "oppsiteCard" style="position: relative; bottom: 770px; left: 700px">
			<div class="card-body">
				<h4 class="card-title" style="text-align: center;">반대순</h4>
			</div>
			
			<div class="table-responsive">
				<table class="table table-bordered">
					<tbody>
						<c:forEach varStatus="status" var = "oppsite" items = "${ petitionOppsites }">
							<tr style="text-align: center;">
								<th scope="row">${ status.index + 1}</th>
								<td>
									<a href="" style="color: brown; 
									display: inline-block; width: 150px; 
									white-space: nowrap; overflow: hidden; 
									text-overflow: ellipsis;">
										${ oppsite.title }
									</a>
								</td>
							</tr>
						</c:forEach>
												
					</tbody>
				</table>
			</div>
		</div>
		
		<div class="card" id = "additionCard" style="position: relative; bottom: 1540px; left: 1330px">
			<div class="card-body">
				<h4 class="card-title" style="text-align: center;">추가 답변 대기순</h4>
			</div>
			
			<div class="table-responsive">
				<table class="table table-bordered">
					<tbody>
						<c:forEach varStatus="status" var = "addition" items = "${ petitionAdditions }">
							<tr style="text-align: center;">
								<th scope="row">${ status.index + 1 }</th>
								<td>
									<a href="" style="color: brown; 
									display: inline-block; width: 150px; 
									white-space: nowrap; overflow: hidden; 
									text-overflow: ellipsis;">
										${ addition.title }
									</a>
								</td>
							</tr>
						</c:forEach>
												
					</tbody>
				</table>
			</div>
		</div>
		<div class="card" style="position: relative; bottom: 1540px; left: 140px; width: 1600px;">
			<h4 class="card-title" style="text-align: center;">인기 태그 TOP5</h4>
			<div class="table-responsive">
				<table class="table table-bordered" >
					<tr>
						<c:forEach var = "tag" items = "${ tags }">
							<td>
								${ tag.name }								
							</td>
						</c:forEach>
					</tr>
				</table>
			</div>
		</div>
	</div>

	


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