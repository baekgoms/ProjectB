<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<link href="/projectB/resource/bootstrap/css/style.min.css"	rel="stylesheet">
<link rel="stylesheet" type="text/css"	href="/projectB/resource/bootstrap/assets/extra-libs/prism/prism.css">
<link rel="icon" type="image/png" sizes="16x16"	href="/projectB/resource/bootstrap/assets/images/favicon.png">
<style type="text/css">
.container {
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 80vh;
}

.card .card-title {
    position: relative;
    font-weight: 500;
    margin-bottom: 10px;
    text-align: center;
    color: #212529;
}

.form-group {
    margin-bottom: 1rem;
    margin-top: 1rem;
    text-align: center !important;
}

</style>
<title>Insert title here</title>
</head>
<body>
	<div class = "container">
		<div class="col-sm-12 col-md-6 col-lg-4">
			<div class="card">
				<div class="card-body">
					<c:if test="${ confirmResult == 1 }">
						<h4 class="card-title">인증 되었습니다.</h4>
					</c:if>
					
					<c:if test="${ confirmResult != 1 }">
						<h4 class="card-title">인증에 실패하였습니다.</h4>
					</c:if>
					
					<form class="mt-4" action = "inputAuthEmail.aa">
						<div class="form-group">
							<button type="button" onclick=""
								class="btn waves-effect waves-light btn-outline-dark">
								국민 청원 바로가기</button>
						</div>
					</form>
				</div>
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