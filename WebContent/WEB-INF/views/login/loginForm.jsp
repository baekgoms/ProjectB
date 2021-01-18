<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<link href="/projectB/resource/bootstrap/css/style.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="/projectB/resource/bootstrap/assets/extra-libs/prism/prism.css">
<link rel="icon" type="image/png" sizes="16x16"
	href="/projectB/resource/bootstrap/assets/images/143.png">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.2/modernizr.js"></script>

<title>login</title>

<style type="text/css">
.auth-wrapper .auth-box {
	box-shadow: 0px 3px 9px 0px rgba(162, 176, 190, 0.15);
	max-width: 400px;
	margin: 5% 0;
	position: relative;
}

.row {
	display: flex;
	flex-wrap: wrap;
	margin-right: -15px;
	margin-left: -15px;
}

.col-lg-5 {
    flex: 0 0 100%;
    max-width: 100%;
}
</style>

<script type="text/javascript">
$(function() { 
	$("input:text").keydown(function(evt) { 
		if (evt.keyCode == 13)
			return false;
	});
});

function loginCheck(){
	if(!$('#id').val() || !$('#"pwd"').val()){
		alert("id / password를 확인 해주세요");
		return false;
	}
	
	return true;
}
</script>
</head>
<body>
	<div class="main-wrapper">
		<!-- ============================================================== -->
		<!-- Preloader - style you can find in spinners.css -->
		<!-- ============================================================== -->
		<div class="preloader">
			<div class="lds-ripple">
				<div class="lds-pos"></div>
				<div class="lds-pos"></div>
			</div>
		</div>
		<!-- ============================================================== -->
		<!-- Preloader - style you can find in spinners.css -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- Login box.scss -->
		<!-- ============================================================== -->
		<div
			class="auth-wrapper d-flex no-block justify-content-center align-items-center position-relative"
			style="background: url(/projectB/resource/bootstrap/assets/images/big/auth-bg.jpg) no-repeat center center;">
			<div class="auth-box row">
				<div class="col-lg-5 col-md-7 bg-white">
					<div class="p-3">
						<div class="text-center">
							<img
								src="/projectB/resource/bootstrap/assets/images/big/main.png"
								alt="wrapkit" width="300" height="200">
						</div>
						<h2 class="mt-3 text-center">Login</h2>
						<p class="text-center">아이디와 비밀번호를 입력하세요.</p>
						<form class="mt-4" action="loginPro.aa" onSubmit="return loginCheck()">
							<div class="row">
								<div class="col-lg-12">
									<div class="form-group">
										<label class="text-dark" for="uname">ID</label> 
										<input id = "id" name = "id" class="form-control"
											type="text" placeholder="your ID">
									</div>
								</div>
								<div class="col-lg-12">
									<div class="form-group">
										<label class="text-dark" for="pwd">Password</label>
										<input id="pwd" name = "password" class="form-control" type="password"
											placeholder="your password">
									</div>
								</div>
								<div class="col-lg-12 text-center">
									<button type="submit" class="btn btn-block btn-dark">Login</button>
								</div>
								<div class="col-lg-12 text-center mt-5">
									계정이 없습니까? <a href="/projectB/petitioner/signUp.aa" class="text-danger"> 회원 가입 </a>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- ============================================================== -->
		<!-- Login box.scss -->
		<!-- ============================================================== -->
	</div>
	<!-- ============================================================== -->
	<!-- All Required js -->
	<!-- ============================================================== -->
	<!--  부트스트랩 js 사용 -->
	<script
		src="/projectB/resource/bootstrap/assets/libs/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap tether Core JavaScript -->
	<script
		src="/projectB/resource/bootstrap/assets/libs/popper.js/dist/umd/popper.min.js"></script>
	<script
		src="/projectB/resource/bootstrap/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- ============================================================== -->
	<!-- This page plugin js -->
	<!-- ============================================================== -->
	<script>
		$(".preloader ").fadeOut();
	</script>
</body>
</html>