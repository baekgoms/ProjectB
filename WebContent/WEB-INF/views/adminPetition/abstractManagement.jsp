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
<script type="text/javascript">
	$(function(){
		var chkObj = document.getElementsByName("RowCheck");
		var rowCnt = chkObj.length;
		
		$("input[name='allCheck']").click(function(){
			var chk_listArr = $("input[name='RowCheck']");
			for (var i=0; i<chk_listArr.length; i++){
				chk_listArr[i].checked = this.checked;
			}
		});
		$("input[name='RowCheck']").click(function(){
			if($("input[name='RowCheck']:checked").length == rowCnt){
				$("input[name='allCheck']")[0].checked = true;
			}
			else{
				$("input[name='allCheck']")[0].checked = false;
			}
		});
	});
	function deleteValue(){
		var url = "abstractManagement.aa";    // Controller로 보내고자 하는 URL
		var valueArr = new Array();
	    var list = $("input[name='RowCheck']");
	    for(var i = 0; i < list.length; i++){
	        if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
	            valueArr.push(list[i].value);
	        }
	    }
	    if (valueArr.length == 0){
	    	alert("선택된 글이 없습니다.");
	    }
	    else{
			var chk = confirm("정말 삭제하시겠습니까?");				 
			$.ajax({
			    url : url,                    // 전송 URL
			    type : 'POST',                // POST 방식
			    traditional : true,
			    data : {
			    	valueArr : valueArr        // 보내고자 하는 data 변수 설정
			    },
                success: function(jdata){
                    if(jdata = 1) {
                        alert("삭제를 완료했습니다.");
                        location.replace("abstractManagement.aa") //페이지 새로고침
                    }
                    else{
                        alert("삭제를 실패했습니다.");
                    }
                }
			});
		}
	}
</script>
<title>청원관리-추상답변요청청원</title>
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
        	<th scope="col" style="vertical-align:middle; display:inline-block; margin-bottom:2px;" >&nbsp;<input id="allCheck" type="checkbox" name="allCheck" class="form-check-input"/></th>
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
        <c:if test="${count == 0}">
        <tr>
        <td colspan ="10">추가답변을 원하는 청원이 없습니다.</td>
        </tr>
        </c:if>
        <c:if test="${count > 0 }">
		<c:forEach var="article" items="${ articleList }">
         <tr>
         	<c:set var="number" value="${number-1}" />
            	<td style="vertical-align:middle; display:inline-block; margin-bottom:2px;">&nbsp;<input name="RowCheck" type="checkbox" value="${article.num}" class="form-check-input"/></td>
                <td>${article.num}</td>
                <td>${ category[article.category].categoryName }</td>
                <td>	<a href ="/projectB/admin/petitionDetail.aa?num=${article.num}&pageNum=${currentPage}">${article.title}</td>
                <td>${article.writer}</td>
                <td><fmt:formatDate pattern="yyyy-MM-dd" value="${article.endDate}" /></td>
                <td>${article.report}</td>
                <td>${ state[article.petitionState].state }</td>
                <td>${article.petition}</td>
                <td>
                <c:choose>
	                <c:when test="${article.open == 0}">
	                	공개
	                </c:when>
	                <c:otherwise>
	                	비공개
	                </c:otherwise>
                </c:choose>
                </td>
          </tr>
          </c:forEach>
          </c:if>
          <tr>
          	<td colspan="10" align="right">
            	<input type="button" value="선택삭제" class="btn waves-effect waves-light btn-outline-dark" onclick="deleteValue();">
			</td>
          </tr>
	</table>
	<c:if test="${count > 0}">
			<c:set var="pageCount" value="${count / pageSize +(count % pageSize == 0 ? 0: 1)}" />
			<c:set var="pageBlock" value="${10}" />
			<fmt:parseNumber var="result" value="${ currentPage/10 }" integerOnly="true" />
			<c:set var ="startPage" value="${ result * 10 + 1 }" />
			<c:set var="endPage" value="${startPage + pageBlock-1 }" />
			<c:if test="${ endPage > pageCount }">
				<c:set var="endPage" value="${ pageCount }" />
			</c:if>
		
			<ul class="pagination justify-content-center">
		  		 <c:if test="${startPage > 10}">
					 <li class="page-item">
		      			<a class="page-link" href="/projectB/admin/petitionManagement.aa?pageNum=${startPage - 10}" aria-label="Previous">
		     				<span aria-hidden="true">«</span>
		      				<span class="sr-only">Previous</span>
		      	  		</a>
		    		</li>
				</c:if>
				<c:forEach var="i" begin="${ startPage }" end="${ endPage }">    
					<li class="page-item"><a class="page-link" href="/projectB/admin/petitionManagement.aa?pageNum=${i}">${i}</a></li>
				</c:forEach>
				<c:if test="${endPage < pageCount}">
					<li class="page-item">
						<a class="page-link" href="/projectB/admin/petitionManagement.aa?pageNum=${startPage + 10}" aria-label="Next">
						  	<span aria-hidden="true">»</span>
						  	<span class="sr-only">Next</span>
			  			</a>
					</li>
				</c:if>
			</ul>
		</c:if>      
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