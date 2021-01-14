<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- Custom CSS -->
<link href="/projectB/resource/bootstrap/css/style.css" rel="stylesheet">
<!-- This Page CSS -->
<link href="/projectB/resource/assets/libs/morris.js/morris.css" rel="stylesheet">
                
<title>토론게시판</title>
<input type="button" value="최신순">
<input type="button" value="베스트순">

<br />

<c:if test="${count == 0}">
<table>
  <tr>
    <td align="center">
      게시판에 저장된 글이 없습니다.
    </td>
  </tr>
</table>
</c:if>

<div class="col-lg-6">
	<div class="card">
        <div class="card-body">
            <h4 class="card-title">Donute Chart</h4>
            <div id="morris-donut-chart"></div>
        </div>
    </div>
</div>

<c:if test="${count > 0}">
<c:forEach var="article" items="${articleList}">

${article.subject}
${article.write}
${article.reg}
</c:forEach>
<table>


<tr>
...5번반복
<td>
</td>
....여기까지
</tr>
4번반복 끝
</table>
</c:if>

<input type="button" class="btn waves-effect waves-light btn-outline-dark" 
	onclick="document.location.href='/projectB/discussion/writeForm.aa?pageNum=${pageNum}'" value="토론글 작성하기">
<div class="col-lg-4 mb-4">
<nav aria-label="Page navigation example">
<ul class="pagination justify-content-center">
<li class="page-item">
    <a class="page-link" href="javascript:void(0)"
        aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
        <span class="sr-only">Previous</span>
    </a>
</li>
<li class="page-item"><a class="page-link"
        href="javascript:void(0)">1</a></li>
<li class="page-item"><a class="page-link"
        href="javascript:void(0)">2</a></li>
<li class="page-item"><a class="page-link"
        href="javascript:void(0)">3</a></li>
<li class="page-item">
    <a class="page-link" href="javascript:void(0)" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
        <span class="sr-only">Next</span>
    </a>
</li>
</ul>
</nav>
</div>

	<script src="/projectB/resource/bootstrap/assets/libs/raphael/raphael.min.js"></script>
    <script src="/projectB/resource/bootstrap/assets/libs/morris.js/morris.min.js"></script>
    <script src="/projectB/resource/bootstrap/js/pages/morris/morris-data.js">
    $(function () {
    	"use strict"
    	 Morris.Donut({
    	        element: 'morris-donut-chart',
    	        data: [{
    	            label: "Download Sales",
    	            value: 12,

    	        }, {
    	            label: "In-Store Sales",
    	            value: 30
    	        }, {
    	            label: "Mail-Order Sales",
    	            value: 20
    	        }],
    	        resize: true,
    	        colors:['#5f76e8', '#01caf1', '#8fa0f3']
    	    });
    });    </script>