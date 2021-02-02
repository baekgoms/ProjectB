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
<title>청원관리</title>
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
	<input type="button" value="전체목록" class="btn waves-effect waves-light btn-outline-dark">
	<input type="button" value="수정요청 청원" class="btn waves-effect waves-light btn-outline-dark">
	<input type="button" value="추상답변 관리" class="btn waves-effect waves-light btn-outline-dark"	>
</div>
<br>
<div class="col-lg-6">
<div class="mb-4">
<p>
<button class="btn btn-secondary dropdown-toggle" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
검색필터 ▼
</button>
</p>
<div class="collapse" id="collapseExample" >
<div class="card card-body" >
<h3>검색필터</h3>
<form>
<table class="table">
<tr>
<td>청원상태</td>
<td>
  <label><input type="radio" name="fDTypes" class="mr0" value="전체">전체</label>
  <label><input type="radio" name="fDTypes" class="mr0" value="청원시작">청원시작</label>
  <label><input type="radio" name="fDTypes" class="mr0" value="청원진행중">청원진행중</label>
  <label><input type="radio" name="fDTypes" class="mr0" value="청원완료">청원완료</label>
</td>
</tr>
<tr>
<td>청원수</td>
<td>    
<input type="range" value="0" min="0" max="300000" step="1000" onchange = "SetValue(this)">
</td>
</tr>
<tr>
<td>일자별</td>
<td>
  <label><input type="radio" name="fDTypes" class="mr0" value="최근1주">최근1주</label>
  <label><input type="radio" name="fDTypes" class="mr0" value="최근1개월">최근1개월</label>
  <label><input type="radio" name="fDTypes" class="mr0" value="최근3개월">최근3개월</label>
</td>
</tr>
<tr>
<td colspan="2" >

<select id="exampleFormControlSelect1" >
<option value="제목">제목</option>
<option value="내용">내용</option>
<option value="작성자">작성자</option>
</select>
<input type="text" id="example-input-normal" name="example-input-normal" class="form-control" style="width:70%;" placeholder="검색어를 입력하세요" >

</td>
</tr>
<tr>
<td colspan="2" align="right">
 <input type="button" value="검색" class="btn waves-effect waves-light btn-outline-dark">
<input type="reset" value="초기화" class="btn waves-effect waves-light btn-outline-dark" >
</td>
</tr>
</table>
</form>
</div>
</div>
</div> 
</div>
  
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
                                      <c:if test="${count > 0 }">
			<c:forEach var="article" items="${ articleList }">
                                            <tr>
                                            <c:set var="number" value="${number-1}" />
                                                <td><input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1"></td>
                                                <td>${article.num}</td>
                                                <td>${ category[article.category].categoryName }</td>
                                                <td>${article.title}</td>
                                                <td>${article.writer}</td>
                                                <td>${article.endDate}</td>
                                                <td>${article.report}</td>
                                                <td>${ state[article.petitionState].state }</td>
                                                <td>${article.petition}</td>
                                                <td>${article.open}</td>
                                           </tr>
                                             </c:forEach>
                                           </c:if>
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
<script language="JavaScript">


function SetValue(this)

{
range_val.value = this.value;
}

</script>
</body>
</html>