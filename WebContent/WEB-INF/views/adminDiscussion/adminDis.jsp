<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- Custom CSS -->
<link href="/projectB/resource/bootstrap/css/style.css" rel="stylesheet">
<link href="/projectB/resource/bootstrap/css/style.min.css" rel="stylesheet">
<!-- This Page CSS -->
<link href="/projectB/resource/assets/libs/morris.js/morris.css" rel="stylesheet">

<script>
var c = 0;
function checkAll() {
	var chBoxArr = document.getElementsByName("chBox");
	if(c == 0){
		for (var i = 0; i < chBoxArr.length; i++) {
			chBoxArr[i].checked = true;
			c = 1;
		
		}
		return;
	}	
	if(c == 1){
		for (var i = 0; i < chBoxArr.length; i++) {
			chBoxArr[i].checked = false;
			c = 0;
		}
		return;
	}
}

function deleteValue(){
	var url = "delete.aa";
	var valueArr = new Array();
	var list = $("input[name='chBox']");
	for(var i = 0; i < list.length; i++){
		if(list[i].checked){
			valueArr.pust(list[i].value);
		}
	}
	if(valueArr.length == 0){
		alert("선택된 글이 없습니다.");
	}else{
		var chk = confirm("정말 삭제하시겠습니까?");
		$.ajax({
			url : url,
			type : 'POST',
			traditional : true,
			data : {
				valueArr : valueArr
			},
			success: function(jdata){
				if(jdata = 1){
					alert("삭제 성공");
					location.href = "adminDis.aa";
				}else{
					alert("삭제 실패");
				}
			}
		})
	}
}

</script>
	<jsp:include page="/WEB-INF/views/topbar/admintopbar.jsp" />
	<br>
	<br>
	<br>
	<br>
<c:if test="${count == 0 }">
<table class="table">
		  <tr>
		    <td align="center">작성된 글이 없습니다.</td>
		  </tr>
</table>
</c:if>
<c:if test="${count > 0}">
	<table class="table">
	<tr align="right"><td>
		<input type="checkbox" id="allCheck" class="form-check-input" style='zoom:1.7;' onclick="checkAll()"/><label for="allCheck" style="margin-right:5px;">모두 선택</label> 
		<button type="button" class="btn waves-effect waves-light btn-outline-dark" onclick="deleteValue();">선택 삭제</button>
	</td></tr>
	</table>
	<c:set var="i" value="0" />
	<c:set var="j" value="3" />
	<table class="table">
		<c:forEach items="${articleList}" var="article">
			<c:if test="${i%j == 0 }">
				<tr align="center" height="300">
			</c:if>
		<td width="450">
		<div id="chBox" style="float:left;padding-left:140;">
			<input type="checkbox" name="chBox" class="form-check-input" value="${article.num}" style='zoom:1.3;' /> <br />
		</div>
		<br/>
		<div id="${article.num}"></div>
		<img src="" id="noimg" height=""> <br />
		<a href="/projectB/discussion/content.aa?pageNum=${pageNum}&discussionNum=${article.num}">
		${article.subject}<br />
		${article.write}<br />
		<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${article.reg}" /><br /></a>
			<div class="delete" style="float:right;padding-right:100;">
				<button type="button" class="btn waves-effect waves-light btn-outline-dark">삭제</button>
			</div>
		</td>
		<c:if test="${i%j == j-1}">
			</tr>
		</c:if>
		<c:set var="i" value="${i+1}" />
		</c:forEach>
	</table>
</c:if>

<c:if test="${count > 0}">
	<fmt:parseNumber var="pageCount" value="${count / pageSize + ( count % pageSize == 0 ? 0 : 1)}" integerOnly="true" />
   <c:set var="pageBlock" value="${10}"/>
   <fmt:parseNumber var="result" value="${currentPage/10}" integerOnly="true" />
   <c:if test="${currentPage % 10 == 0}">
   <c:set var="result" value="${result-1}" />
   </c:if>
   <c:set var="startPage" value="${(result * 10) + 1 }" />
   <c:set var="endPage" value="${startPage + pageBlock-1}"/>
   <c:if test="${endPage > pageCount}">
        <c:set var="endPage" value="${pageCount}"/>
</c:if> 

<div class="col-12">
<br><hr><br>
</div>
                            
<div class="col-lg-4 mb-4">
<nav aria-label="Page navigation example">
<ul class="pagination justify-content-center">
<c:if test="${startPage > 10}">
<li class="page-item">
			<a class="page-link" href="/projectB/admin/adminDis.aa?pageNum=${startPage - 10}"aria-label="Previous">
        	<span aria-hidden="true">&laquo;</span>
			<span class="sr-only">Previous</span>
   			</a>

</li>
</c:if>

<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<li class="page-item"><a class="page-link"
			 	     href="/projectB/admin/adminDis.aa?pageNum=${i}">${i}</a>
			</li>

</c:forEach>

<c:if test="${endPage < pageCount}">
<li class="page-item">
		<a class="page-link" href="/projectB/admin/adminDis.aa?pageNum=${startPage + 10}" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
        <span class="sr-only">Next</span>
		</a>

   
</li>
</c:if>
</ul>
</nav>
</div>
</c:if>

<script src="/projectB/resource/bootstrap/assets/libs/jquery/dist/jquery.min.js"></script>
<script src="/projectB/resource/bootstrap/assets/libs/popper.js/dist/umd/popper.min.js"></script>
<script src="/projectB/resource/bootstrap/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="/projectB/resource/bootstrap/js/app.min.js "></script>
<script src="/projectB/resource/bootstrap/js/app.init-menusidebar.js"></script>
<script src="/projectB/resource/bootstrap/js/app-style-switcher.js"></script>
<script src="/projectB/resource/bootstrap/js/feather.min.js"></script>
<script src="/projectB/resource/bootstrap/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
<script src="/projectB/resource/bootstrap/assets/extra-libs/sparkline/sparkline.js"></script>
<script src="/projectB/resource/bootstrap/js/sidebarmenu.js"></script>
<script src="/projectB/resource/bootstrap/js/custom.min.js"></script>
<script src="/projectB/resource/bootstrap/assets/libs/raphael/raphael.min.js"></script>
<script src="/projectB/resource/bootstrap/assets/libs/morris.js/morris.min.js"></script>
<script src="/projectB/resource/bootstrap/js/pages/morris/morris-data.js"></script>
<script>
<c:forEach items="${articleList}" var="chart">

var a = parseInt('${chart.opposition}');
var b = parseInt('${chart.agreement}');

if (a+b == 0){
	var id = document.getElementById("noimg");
	id.src = "/projectB/resource/images/nochart.jpg";
	id.height = "200";
}else{
	new Morris.Donut({
		element: '${chart.num}',
		data: [{ label: "찬성", value: '${chart.agreement}' }, 
			   { label: "반대", value: '${chart.opposition}'}],
		resize: true,
		colors:['#5f76e8','#e04643']
})
	var id = document.getElementById("${chart.num}");
	id.style.height = "200px";
};
</c:forEach>
</script>


</center>