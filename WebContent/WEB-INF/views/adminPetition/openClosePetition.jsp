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
<title>공개/비공개</title>
<style>
  table {
    width: 100%;
    border: 1px solid #BDBDBD;
    text-aglin:center;
    color: #7c8798;
  }
.table td, .table th {
    padding: 1rem;
    vertical-align: top;
    border-top: 1px solid #e8eef3;
}
  th {
    background-color: #E1E1E1;
  }

</style>
</head>
<body>
<form>
<table class="table">
<tr align="center">
<td colspan ="2"><h3>공개/비공개</h3></td>
</tr>
<tr>                           
<th>
	제목	  
</th>
<td>
${list.title}
</td>
</tr>
<br>
<tr>
<th>
공개/비공개 여부
</th>
<td>
<c:choose>
<c:when test="${list.open == 0}">
	                	공개
</c:when>
<c:otherwise>
	                	비공개
</c:otherwise>
</c:choose>
</td>
</tr>
<tr align="center"><td colspan ="2">
<c:choose>
<c:when test="${list.open == 0}">
<input type="button" value="비공개로 전환" class="btn waves-effect waves-light btn-outline-dark" onClick="document.location.href='/projectB/admin/updatePrivate.aa?num=${list.num}'">	                	
</c:when>
<c:otherwise>
<input type="button" value="공개로 전환" class="btn waves-effect waves-light btn-outline-dark" onClick="document.location.href='/projectB/admin/updatePublicly.aa?num=${list.num}'">	                	
</c:otherwise>
</c:choose>
<input type="button" value="취소" class="btn waves-effect waves-light btn-outline-dark" onclick="self.close();">
</td></tr>
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
<script src="/projectB/resource/bootstrap/assets/libs/raphael/raphael.min.js"></script>
<script src="/projectB/resource/bootstrap/assets/libs/morris.js/morris.min.js"></script>
<script src="/projectB/resource/bootstrap/js/pages/morris/morris-data.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
</body>
</html>