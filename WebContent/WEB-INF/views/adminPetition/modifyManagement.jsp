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

<title>청원관리-수정요청 청원</title>
<style>
.card, .card-group {
    margin-bottom: 30px;
}
.card-body {
    flex: 1 1 auto;
    padding: 25px;
     width: 100%;
}
.mr0 {
  margin-right: 0px;
}
.table-responsive{text-aglin:center}

</style>
</head>

<body>
<br>
<br>
<h3>청원 관리</h3>
<hr>

<div align="left">
<input type="button" value="전체목록" class="btn waves-effect waves-light btn-outline-dark" onclick="document.location.href='/projectB/admin/petitionManagement.aa'">
	<input type="button" value="수정요청 청원" class="btn waves-effect waves-light btn-outline-dark" onclick="document.location.href='/projectB/admin/modifyManagement.aa'">
	<input type="button" value="추상답변 관리" class="btn waves-effect waves-light btn-outline-dark"	onclick="document.location.href='/projectB/admin/abstractManagement.aa'">
</div>
<br>

  
<div class="table-responsive"  >
	<table class="table" style="text-align:center;">
    	<tr>
        	<th scope="col">#</th>
            <th scope="col">청원번호</th>
            <th scope="col">카테고리</th>
            <th scope="col">제목</th>
            <th scope="col">작성자</th>
            <th scope="col">만료일</th>
            <th scope="col">신고수</th>
            <th scope="col">청원상태</th>
            <th scope="col">청원동의수</th>
           	<th scope="col">글상태</th>
        </tr>
         <tr>
            	<td><input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1"></td>
                <td>111</td>
                <td>ㅋㅋㅋ</td>
                <td>ㅋㅋㅋ</td>
                <td>ㅋㅋ</td>
                <td>210203</td>
                <td>4</td>
                <td>4</td>
                <td>4</td>
                <td>4</td>
          </tr>
          <tr>
          	<td colspan="10" align="right">
            	<input type="button" value="선택삭제" class="btn waves-effect waves-light btn-outline-dark">
			</td>
          </tr>
	</table>
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
</body>
</html>