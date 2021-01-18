<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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

<title>신고하기</title>
</head>
<body>

<form>
<div class="card-body">






                                <h4 class="card-title" border="1">신고하기</h4>
                                <br />
<tr>                           
<td>
	작성자	:	
</td>
<td>
${report.writer}
</td>
</tr>
<br />
<tr>
<td >
	내용		:	
</td>
<td>
${report.content}
</td>
</tr>
<br/>
<hr>
<tr>
<td >
	사유선택	:	
</td>
<td>	
여러 사유에 해당될 경우, 대표적인 사유 1개를 선택해 주세요.<br />
<br />	
                                <div class="form-check form-check-inline">
                                    <div class="custom-control custom-radio">
                                        <input type="radio" class="custom-control-input" id="customControlValidation2" name="radio-stacked">
                                        <label class="custom-control-label" for="customControlValidation2">부적절한 홍보 게시물</label>
                                    </div>
                                </div>
                                <br />
                                <div class="form-check form-check-inline">
                                    <div class="custom-control custom-radio">
                                        <input type="radio" class="custom-control-input" id="customControlValidation3" name="radio-stacked">
                                        <label class="custom-control-label" for="customControlValidation3">음란성 또는 청소년에게 부적합한 내용</label>
                                    </div>
                                </div>
                                <br/>
                                <div class="form-check form-check-inline">
                                    <div class="custom-control custom-radio">
                                        <input type="radio" class="custom-control-input" id="customControlValidation4" name="radio-stacked" >
                                        <label class="custom-control-label" for="customControlValidation4">명예회손/사생활 침해 및 저작권 침해 등</label>
                                    </div>
                                </div>
                                <br />
                                 <div class="form-check form-check-inline">
                                    <div class="custom-control custom-radio">
                                        <input type="radio" class="custom-control-input" id="customControlValidation5" name="radio-stacked" >
                                        <label class="custom-control-label" for="customControlValidation5">불법촬영물등 신고</label>
                                    </div>
                                </div>
                            </div>
</td>
</tr>
<div align="center">
<input type="button" value="신고하기" class="btn waves-effect waves-light btn-outline-dark">
<input type="button" value=" 취소   " class="btn waves-effect waves-light btn-outline-dark">
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


	