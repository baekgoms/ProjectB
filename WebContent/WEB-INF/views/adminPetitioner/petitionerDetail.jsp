<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<!-- Custom CSS -->
<link href="/projectB/resource/bootstrap/css/style.css" rel="stylesheet">
<link href="/projectB/resource/bootstrap/css/style.min.css"
	rel="stylesheet">
<!-- This Page CSS -->
<link
	href="/projectB/resource/bootstrap/assets/libs/morris.js/morris.css"
	rel="stylesheet">
<link href="/projectB/resource/bootstrap/css/discussion.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>문의 관리</title>
<style>
a:visited {
	color: green;
	text-decoration: none;
}
</style>

<script type="text/javascript">
	function selectOption(obj) {
		window.location.href = "question.aa?sort=" + obj.value;
	}
</script>
</head>
<body>
	<div class="card">
		<br>
		<h4 class="card-title" align="center">회원 상세보기</h4>
		<br>
		<div class="table-responsive">
			<form action="/projectB/admin/memberModify.aa" method="post">
				<input type = "hidden" name = "num" value = "${ dto.num }"/>
				<input type = "hidden" name = "warning" value = "${ dto.warning }"/>
				<input type = "hidden" name = "emailArg" value = "${ dto.emailArg }"/>
			<table class="table">
				<tbody align="center">
					<tr>
						<td>ID</td>
						<td>${ dto.id }</td>						
					</tr>
					
					<tr>
						<td>비밀번호</td>
						<td>
							<input type="password" name = "password" value="${ dto.password }" style="text-align: center;"/>
						</td>
					</tr>
					
					<tr>
						<td>이름</td>
						<td>${ dto.name }</td>
					</tr>
					
					<tr>
						<td>성별</td>
						<td>${ dto.gender }</td>
					</tr>
					
					<tr>
						<td>연락처</td>
						<td>
							<input type="text" name = "contact" value="${ dto.contact }" style="text-align: center;"/>
						</td>
					</tr>
					
					<tr>
						<td>이메일</td>
						<td>
							<input type="email" name = "email" value="${ dto.email }" style="text-align: center;"/>
						</td>
					</tr>
					
					<tr>
						<td>신고 횟수</td>
						<td>
							<input type="number" name = "report" value="${ dto.report }" style="text-align: center;"/>
						</td>
					</tr>
					
					<tr>
						<td>상태</td>
						<td>
							<c:if test="${ dto.state == 1 }">
								일반 회원
							</c:if>
							
							<c:if test="${ dto.state == 2 }">
								1단계 경고
							</c:if>
							
							<c:if test="${ dto.state == 3 }">
								2단계 경고
							</c:if>
							
							<c:if test="${ dto.state == 4 }">
								블랙리스트
							</c:if>					
						</td>
					</tr>
					
					<tr>
						<td>생년월일</td>
						<td>${ dto.birthday }</td>
					</tr>					
					
					<%-- <tr>
						<td>마지막 접속 시간</td>
						<td>${ dto.loginTime }</td>
					</tr> --%>
					
					<tr>
						<td>가입일</td>
						<td>${ dto.reg }</td>
					</tr>
					
					<tr>
						<td>접속 차단일</td>
						<td>
							${ dto.blockReg }
							<%-- <input type="datetime-local" name = "blockReg" value="${ dto.blockReg }" style="text-align: center;"/> --%>
						</td>
					</tr>
					<!-- 
					<tr>
						<td rowspan="4">등록한 청원</td>						
					</tr>
					<tr><td>청원 제목1</td></tr>
					<tr><td>청원 제목2</td></tr>
					<tr><td>청원 제목3</td></tr> -->
					
					<tr>
					<!-- <td rowspan="4">등록한 댓글</td>						
					</tr>
					<tr><td>댓글 내용1</td></tr>
					<tr><td>댓글 내용2</td></tr>
					<tr><td>댓글 내용3</td></tr> -->
				</tbody>
			</table>
			
			<div align="center">
				<button class="btn waves-effect waves-light btn-outline-dark" type="submit">
					수정
				</button>
				<button class="btn waves-effect waves-light btn-outline-dark" type="button"
				onclick="document.location.href='/projectB/admin/memberDel.aa?num=${dto.num}'">
					삭제
				</button>				
			</div>
			</form>
		</div>
	</div>

	<!--  부트스트랩 js 사용 -->
	<script
		src="/projectB/resource/bootstrap/assets/libs/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap tether Core JavaScript -->
	<script
		src="/projectB/resource/bootstrap/assets/libs/popper.js/dist/umd/popper.min.js"></script>
	<script
		src="/projectB/resource/bootstrap/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- apps -->
	<!-- apps -->
	<script src="/projectB/resource/bootstrap/js/app-style-switcher.js"></script>
	<script src="/projectB/resource/bootstrap/js/feather.min.js"></script>
	<!-- slimscrollbar scrollbar JavaScript -->
	<script
		src="/projectB/resource/bootstrap/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
	<script
		src="/projectB/resource/bootstrap/assets/extra-libs/sparkline/sparkline.js"></script>
	<!--Wave Effects -->
	<!-- themejs -->
	<!--Menu sidebar -->
	<script src="/projectB/resource/bootstrap/js/sidebarmenu.js"></script>
	<!--Custom JavaScript -->
	<script src="/projectB/resource/bootstrap/js/custom.min.js"></script>

</body>
</html>