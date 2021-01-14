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

<link href="/projectB/resource/bootstrap/css/style.min.css"	rel="stylesheet">
<link rel="stylesheet" type="text/css"	href="/projectB/resource/bootstrap/assets/extra-libs/prism/prism.css">
<link rel="icon" type="image/png" sizes="16x16"	href="/projectB/resource/bootstrap/assets/images/143.png">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- <script type='text/javascript' src='/projectB/resource/bootstrap/js/loadImg.js'></script> -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.2/modernizr.js"></script>

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

.success {
	text-align: center;;
	right :5px;
	bottom :-5px;
	position : relative;
	color: green;
}

.fail {
	text-align: center;
	right :5px;
	bottom :-5px;
	position : relative;
	color: red;
}
/* .card {
	margin-bottom: 15px;
} */
.card-body {
  flex: 1 1 auto;
  padding-bottom: 15px;
  padding-top: 0px; 
  
}

.no-js #loader { display: none;  }
.js #loader { display: block; position: absolute; left: 100px; top: 0; }
.se-pre-con {
	position: fixed;
	left: 0px;
	top: 0px;
	width: 100%;
	height: 100%;
	z-index: 9999;
	background: url(/projectB/resource/bootstrap/assets/images/Preloader_3.gif) center no-repeat #fff;
}

</style>
<title>sign up</title>
</head>


<script type="text/javascript">
var newValue;
// 모든 텍스트의 변경에 반응합니다.
$(function() { 
	$("input:text").keydown(function(evt) { 
		if (evt.keyCode == 13)
			return false;
	});
});

$(function() { 
	$("input:password").keydown(function(evt) { 
		if (evt.keyCode == 13)
			return false;
	});
});

function signUpCheck(){
	if(!$('#id').val() || !$('#pw').val()){
		alert("id / password를 확인 해주세요");
		return false;
	}
	var inputRadio = $("input[name='gender']:checked").val();
	if(!inputRadio){
		alert("성별을 선택하세요!");
		return false;
	}
	if(!$('#email').val()){
		alert("email을 확인 해주세요");
		return false;
	}
	if(!$('#confirmId').text() || $('#confirmId').text() != 'O'){
		alert("아이디 중복 검사를 해주세요.");
		return false;
	}
	
	$('#loadingImg').show();	
	return true;
}
$(document).ready(function(){
	$("#id").change(function(){
		$.ajax({
			url:"/projectB/beakTest/confirmId.aa",
			data:{ id : $("#id").val() },
			success:function(result) {
				if(result == 1) {
					$("#confirm").html("<label id = 'confirmId' class = 'fail'>X</label>");
				}
				else {
					$("#confirm").html("<label id = 'confirmId' class = 'success'>O</label>");
				}
			}
		})
	});
	/* $("input[name='gender']").change(function(){
		//성별 가져오기!
		//var inputValue = $("input[name='inlineRadioOptions']:checked").val();
	    //alert(inputValue);
	}) */
    
});

</script>

<body>
	<div id = "loadingImg" class="se-pre-con" style ="display:none"></div>
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
        <div class="auth-wrapper d-flex no-block justify-content-center align-items-center position-relative"
            style="background:url(/projectB/resource/bootstrap/assets/images/big/auth-bg.jpg) no-repeat center center;">
            <div class="auth-box row text-center">
                <div class="col-lg-12 bg-white">
                    <div class="p-3">
                        <h2 class="mt-3 text-center">회원 가입</h2>
                        <form class="mt-4" action="sendEmail.aa" onSubmit="return signUpCheck()" method = "post">
                            <div class="row">
                                <!-- ID -->
                                <div class="col-lg-10">
                                   <div class="form-group">
                                   		<input id = "id" name = "id" class="form-control" type="text" placeholder="your id">
                                   </div>                                   
                                	
                                </div>
                                <div class="col-lg-1">
                                	<div class="form-group" id = "confirm">
                                    </div>                                    
                                </div>
                                
                                <!-- PW -->
								<div class="col-lg-12">
									<div class="form-group">
										<input id="pw" name = "password" class="form-control" type="password"	placeholder="password">
									</div>
								</div>
								
								<!-- name -->
								<div class="col-lg-12">
									<div class="form-group">
										<input id="name" name = "name" class="form-control" type="text"	placeholder="your name">
									</div>
								</div>
								
								<!-- contact -->
								<div class="col-lg-12">
									<div class="form-group">
										<input id="contact" name = "contact" class="form-control" type="text"	placeholder="연락처 -를 제외하고 입력하세요.">
									</div>
								</div>

								<div class="col-lg-12">									
									<div class="card-body">
										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio" name="gender" id="inlineRadio1" value="남자">
											<label class="form-check-label" for="inlineRadio1">남자</label>
										</div>
										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio" name="gender" id="inlineRadio2" value="여자">
											<label class="form-check-label" for="inlineRadio2">여자</label>
										</div>
									</div>
								</div>

								<!-- Email -->                                
	                            <div class="col-lg-12">
	                            	<div class="form-group">
	                                	<input id = "email" name = "email" class="form-control" type="email" placeholder="email address">
	                                </div>
	                            </div>
                                
                                
                                <div class="col-lg-12 text-center">
                                    <button type="submit" class="btn btn-block btn-dark">가입</button>
                                </div>
                                <div class="col-lg-12 text-center mt-5">
                                	이미 계정이 있습니까? <a href="#" class="text-danger">로그인</a>
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
	<!--  부트스트랩 js 사용 -->
	<script src="/projectB/resource/bootstrap/assets/libs/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="/projectB/resource/bootstrap/assets/libs/popper.js/dist/umd/popper.min.js"></script>
    <script src="/projectB/resource/bootstrap/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- ============================================================== -->
    <!-- This page plugin js -->
    <!-- ============================================================== -->
    <script>
        $(".preloader ").fadeOut();
    </script>
</body>
</html>