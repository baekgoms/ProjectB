<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- Custom CSS -->
<link href="/projectB/resource/bootstrap/css/style.css" rel="stylesheet">
<!-- This Page CSS -->
<link href="/projectB/resource/assets/libs/morris.js/morris.css" rel="stylesheet">

<script>
$("#allCheck").click(function(){
	var chk = $("#allCheck").prop("checked");
	if(chk) {
		$(".chBox").prop("checked", true);
	} else {
		$(".chBox").prop("checked", false);
	}
});

$(".selectDelete_btn").click(function(){
	var confirm_val = confirm("정말 삭제하시겠습니까?");  
	if(confirm_val) {
		var checkArr = new Array();
		$("input[class='chBox']:checked").each(function(){
			checkArr.push($(this).attr("data-num"));
		});
		$.ajax({
			url : "/admin/delete.aa",
			type : "post",
			data : { chbox : checkArr },
			success : function(result){
				if(result == 1){
					location.href = "/admin/adminDis.aa";
				}else{
					alert("삭제 실패");
				}
			}
		});
	}
});

$(".chBox").click(function(){
	  $("#allCheck").prop("checked", false);
});
</script>
<c:if test="${count == 0 }">
<table class="table">
		  <tr>
		    <td align="center">작성된 글이 없습니다.</td>
		  </tr>
</table>
</c:if>
<c:if test="${count > 0}">
	<div class="allCheck">
		<input type="checkbox" name="allCheck" id="allCheck" /><label for="allCheck">모두 선택</label> 
	</div>
  
	<div class="delBtn">
		<button type="button" class="selectDelete_btn">선택 삭제</button>
	</div>
<c:forEach items="${articleList}" var="article">
<div class="col-lg-6">
	<div class="card">
		<div class="card-body">
			<input type="checkbox" name="chBox" class="chBox" data-num="${article.num}" />
			<div id="${article.num}"></div>
			<img src="" id="noimg" height=""> <br />
			<h4 class="card-title">
				<a href="/projectB/discussion/content.aa?pageNum=${pageNum}&discussionNum=${article.num}">
				${article.subject}<br />
				${article.write}<br />
				<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${article.reg}" /><br />
				</a>
			</h4>
		</div>
		<div class="delete">
			<button type="button" class="delete_btn" data-cartNum="${cartList.cartNum}">삭제</button>
		</div>
	</div>
</div>

	
	
</c:forEach>

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
			<a class="page-link" href="/projectB/discussion/main.aa?keyword=${keyword}&pageNum=${startPage - 10}"aria-label="Previous">
        	<span aria-hidden="true">&laquo;</span>
			<span class="sr-only">Previous</span>
   			</a>

</li>
</c:if>

<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<li class="page-item"><a class="page-link"
			 	     href="/projectB/discussion/main.aa?pageNum=${i}">${i}</a>
			</li>

</c:forEach>

<c:if test="${endPage < pageCount}">
<li class="page-item">
		<a class="page-link" href="/projectB/discussion/main.aa?keyword=${keyword}&pageNum=${startPage + 10}" aria-label="Next">
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