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

<script language="javascript">
	function formCheck(frm) {
    if (frm.content.value == "") {
        alert("로그인 후에 동의 가능합니다.");
        frm.content.focus();
        return 로그인폼;
    }
}
	function agreeCheck(agc){
		if(confirm('청원 동의 철회 및 댓글 수정은 불가능하오니 신중하게 참여해주시기 바랍니다')){
			+동의수/지표 / 달성도 증가
		}
	}
	
</script>

<form method="post" action="" onsubmit="return formCheck(this)">
		<input type="hidden" name="petitionNum" value="${dto.petitionNum}" />
		<table style="align-content: center; width: 40%;" border="1">
			<tr>
				<td rowspan="3" style="width: 10%;" >${sessionId}<input
					type="hidden" name="writer" value="${sessionId}"></td>
				
				<td style="width: 20%">
				<input type="submit" VALUE="동의" onclick="Confirm()"/></td>					
			</tr>
		</table>
  
  		<table style="align-content: center; width: 40%;" border="1">
		<tr>
			<td>${dto.num}</td>
			<td>${dto.writer}</td>
			<td style="width: 60%">{dto.content}</td>
			<td>{dto.reg}</td>
		</tr>
	</table>

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
