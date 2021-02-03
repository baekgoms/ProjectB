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

<title>청원 상세보기</title>
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
<br>
<br>
<div class="table-responsive" align="center">
<form >
<table class="table">
<tr align="center">
<td colspan ="4"><h3>청원 상세보기</h3></td>
</tr>
<tr align="center" >
<th scope="col">청원번호</th>
<th scope="col">작성일</th>
<th scope="col">만료일</th>
<th scope="col">제목</th>
</tr>
<tr align="center">
<td>${list.num}</td>
<td><fmt:formatDate pattern="yyyy-MM-dd" value="${list.startDate}" /></td>
<td><fmt:formatDate pattern="yyyy-MM-dd" value="${list.endDate}" /></td>
<td>${list.title}</td>
</tr>
<tr align="center">
<th scope="col">신고수</th>
<th scope="col">공개여부</th>
<th scope="col">청원동의수</th>
<th scope="col">청원상태</th>
</tr>
<tr align="center">
<td>${list.report}</td>
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
<td>${list.petition}</td>
<td>${ state[list.petitionState].state }</td>
</tr>
<tr align="center">
<th scope="col" colspan ="4">내용</th>
</tr>
<tr align="center">
<td colspan ="4">${list.content}</td>
</tr>
<tr align="center">
<td >관련링크</td>
<td colspan ="3" >${list.link}</td>
</tr>
<tr align="center">
<td >키워드</td>
<td colspan ="3">${list.tag}</td>
</tr>
<tr>
<td colspan ="4" align="right">
<input type="button" value="비공개처리" class="btn waves-effect waves-light btn-outline-dark">
<input type="button" value="수정" class="btn waves-effect waves-light btn-outline-dark">
<input type="button" value="삭제" class="btn waves-effect waves-light btn-outline-dark">
<input type="button" value="닫기" class="btn waves-effect waves-light btn-outline-dark" onclick="history.back();">
</td>
</tr>
</table>
</form>
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