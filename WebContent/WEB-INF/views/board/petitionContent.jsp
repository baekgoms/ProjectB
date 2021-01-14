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

<title>청원 보기</title>
</head>

<body>  
<br>
<form>
<table width="500" border="1" cellspacing="0" cellpadding="0"  align="center">  
  <tr height="30">
  	<td align="center" width="500" colspan="4">청원제목 ${petDTO.title}</td> 
  </tr>
  <tr height="30">
  	<td align="center" width="500" colspan="4">참여인원 : [ ${petDTO.petition} 명]</td>
  </tr>
  <tr height="30">
  	<td align="center" width="125" >카테고리 ${petDTO.category}</td>
  	<td align="center" width="125" >청원시작 : ${petDTO.startDate}</td>
  	<td align="center" width="125" >청원마감 : ${petDTO.endDate}</td>
  	<td align="center" width="125" >청원인 : ${petDTO.writer}</td>
  </tr>
  
  <tr height="30">
  	<td align="center" width="500" colspan="4">청원진행도</td> 
  </tr>
  
  <tr height="30"> 
    <td align="left" width="500" colspan="4"><pre>내용 ${petDTO.content}</pre></td>
  </tr>
  <tr height="30">
  	<td align="center" width="500" colspan="4">태그</td>
  </tr>
  <tr height="100">
  	<td align="center" width="250" colspan="2">지표</td>
  	<td align="center" width="250" colspan="2">달성도차트</td>
  </tr>
    <tr height="30">      
    <td colspan="4" align="center" > 	
	<!-- 비공개 관리자만 -->	
	  <input type="button" value="비공개" 
       onclick="document.location.href='deleteForm.jsp'">
	   &nbsp;&nbsp;&nbsp;&nbsp;
	   <input type="button" value="신고" 
       onclick="document.location.href='deleteForm.jsp'">
	   &nbsp;&nbsp;&nbsp;&nbsp;
    </td>
  </tr>
  <!-- 댓글폼 인크루드  -->
  
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
