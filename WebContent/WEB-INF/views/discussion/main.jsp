<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- Custom CSS -->
<link href="/projectB/resource/bootstrap/css/style.css" rel="stylesheet">
<!-- This Page CSS -->
<link rel="stylesheet" type="text/css" href="/projectB/resource/assets/extra-libs/prism/prism.css">
    
<input type="button" value="최신순">
<input type="button" value="베스트순">

<br />
글 리스트...
<!-- 
<c:if test="${count == 0}">
<table>
  <tr>
    <td align="center">
      게시판에 저장된 글이 없습니다.
    </td>
  </tr>
</table>
</c:if>
-->
<c:if test="${count > 0}">
<table>
그리고 이게 4번반복
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
	onclick="document.location.href='/projectB/discussion/writeForm.aa'" value="토론글 작성하기">
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