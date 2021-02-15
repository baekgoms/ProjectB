<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html dir="ltr" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="/projectB/resource/bootstrap/assets/images/favicon.png">
    <title>신고 관리 페이지</title>
    <!-- Custom CSS -->
    <link href="/projectB/resource/bootstrap/assets/extra-libs/c3/c3.min.css" rel="stylesheet">
    <link href="/projectB/resource/bootstrap/assets/libs/chartist/dist/chartist.min.css" rel="stylesheet">
    <link href="/projectB/resource/bootstrap/assets/extra-libs/jvector/jquery-jvectormap-2.0.2.css" rel="stylesheet" />
    <!-- Custom CSS -->
    <link href="/projectB/resource/bootstrap/css/style.min.css" rel="stylesheet">
    <link href="/projectB/resource/bootstrap/assets/libs/morris.js/morris.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>

<script type="text/javascript">
	var count = 0;
	
	function selectOption(obj) {
		var open = ${open};
		window.location.href = "report.aa?open="+open+"&option="+ obj.value;
	}
	
	function selectAll() {
		var chkbox = document.getElementsByName("checkbox");
		if(count == 0){
			for (var i = 0; i < chkbox.length; i++) {
				chkbox[i].checked = true;
				count = 1;
			
			}
			return;
		}	
		if(count == 1){
			for (var i = 0; i < chkbox.length; i++) {
				chkbox[i].checked = false;
				count = 0;
			}
			return;
		}
	}

	function selectUpdate() {
		var chkbox = document.getElementsByName("checkbox");
		var sort = document.getElementsByName("sort");
		var open = ${open};
		var str = "";
		var sortStr = "";
		
		for (var i = 0; i < chkbox.length; i++) {
			if (chkbox[i].checked) {
				str = str + chkbox[i].value + ",";
				sortStr = sortStr + sort[i].value + ",";
			}
		}
		
		var form = document.createElement('form');
		form.setAttribute('method', 'post');
		form.setAttribute('action', 'selectUpdate.aa?');
		document.charset = "utf-8";
		
		var hiddenField = document.createElement("input");
		hiddenField.setAttribute('type', 'hidden');
		hiddenField.setAttribute('name', 'selects');
		hiddenField.setAttribute('value', str);
		form.appendChild(hiddenField);
		
		var hiddenSort = document.createElement("input");
		hiddenSort.setAttribute('type', 'hidden');
		hiddenSort.setAttribute('name', 'sorts');
		hiddenSort.setAttribute('value', sortStr);
		form.appendChild(hiddenSort);
		
		var hiddenOpen = document.createElement("input");
		hiddenOpen.setAttribute('type', 'hidden');
		hiddenOpen.setAttribute('name', 'open');
		hiddenOpen.setAttribute('value', open);
		form.appendChild(hiddenOpen);

		document.body.appendChild(form);
		form.submit();

	}
	function openNewWindow(url) { 
		open(url,"Mail","toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, width=1000, height=875");
	}
</script>

<body>
    <!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
    <div class="preloader">
        <div class="lds-ripple">
            <div class="lds-pos"></div>
            <div class="lds-pos"></div>
        </div>
    </div>
   
   
 	<jsp:include page="/WEB-INF/views/topbar/admintopbar.jsp" flush="true"/>
   <br><br><br><br>
   
 <!-- ================================================================================================================== -->            

	<div class="card">
		<div class="card-body">
			<input type="button" value="공개 보기" class="btn waves-effect waves-light btn-outline-dark"
				onclick="document.location.href='/projectB/admin/report.aa?option=${option}'">
			<input type="button" value="비공개 보기" class="btn waves-effect waves-light btn-outline-dark"	
				onclick="document.location.href='/projectB/admin/report.aa?open=1&option=${option}'">
		
			<select class="form-control" id="exampleFormControlSelect1" style="width: 150px; float: right;"
				onchange = "selectOption(this)">
				<option value="0" <c:if test="${ option == 0 }">selected</c:if>>최신순</option>
				<option value="1" <c:if test="${ option == 1 }">selected</c:if>>신고순</option>
			</select>
			
			<h2 class="text-dark mb-1 font-weight-medium">
				<c:if test="${ open == 0 }">공개 </c:if>
				<c:if test="${ open == 1 }">비공개 </c:if>
			목록</h2>
			
		</div>
	
	<div>
		&nbsp;&nbsp;&nbsp;
		<input type="checkbox" class="btn waves-effect waves-light btn-outline-dark" 
				onclick="selectAll()" > 전체 선택 
		&nbsp;&nbsp;	
	</div>	
		<div class="table-responsive">
			<table class="table">
				<thead class="thead-light">
					<tr>
						<th scope="col"> <!-- 체크 번호 -->
							#
						</th>
						<th scope="col">분류</th> <!-- 1:청원, 2:토론, 3:토론 댓글 -->
						<th scope="col">신고 글(제목 또는 내용) </th>
						<th scope="col">신고 글 작성자 </th>
						<th scope="col">신고수</th>
					</tr>
				</thead>
				<tbody>
					 
					<c:forEach var = "totalList" items="${ totalList }" varStatus="status">
						<tr>
						 	<th scope="row">
							 	<div class="custom-control custom-checkbox">
									<input type="checkbox" class="custom-control-input" name = "checkbox"
										id="customCheck_${ status.index }" value = "${ totalList.num }"/> 
									<label class="custom-control-label" for="customCheck_${ status.index }"></label>
								</div>
							</th>
							<td>
								<input type="hidden" name = "sort" id="customCheck_${ status.index }" value = "${ totalList.sort }"/>
								<c:if test="${ totalList.sort == 1 }">청원</c:if>
								<c:if test="${ totalList.sort == 2 }">토론</c:if>
								<c:if test="${ totalList.sort == 3 }">토론 댓글</c:if>
							</td>
							<td>
								<c:if test="${ totalList.sort == 1 }">
									<a href="javascript:openNewWindow('/projectB/petition/petContent.aa?num=${ totalList.num }')"> 
										${ totalList.title }
									</a>
								</c:if>	
								<c:if test="${ totalList.sort == 2 }">
									<a href="javascript:openNewWindow('/projectB/discussion/content.aa?discussionNum=${ totalList.num }')"> 
										${ totalList.title }
									</a>
								</c:if>	
								<c:if test="${ totalList.sort == 3 }">
									<a href="javascript:openNewWindow('/projectB/discussion/content.aa?discussionNum=${ totalList.num }')"> 
										${ totalList.title }
									</a>
								</c:if>	
							</td>
							<td>${ totalList.writer }</td>
							<td>${ totalList.report }</td>
						</tr>
					 </c:forEach>
				</tbody>				
			</table>
		</div>
	</div>
	
	<div>
		&nbsp;
		<button class="btn waves-effect waves-light btn-outline-dark"
			onclick="selectUpdate()">
			<c:if test="${ open == 0 }">비공개하기</c:if>
			<c:if test="${ open == 1 }">공개하기</c:if>
		</button>
		
	</div>

	<c:if test="${ totalListCount > 0 }">
		<ul id="commentPage" class="pagination justify-content-center">
			<!-- << -->
			<c:if test="${ totalListCount > 10 }">
				<li class="page-item">
					<button class="page-link" onclick="document.location.href='report.aa?pageNum=${ startPageIndex - 10 }&option=${ option }&open=${ open }'">
						«
					</button>
				</li>
			</c:if>

			<c:forEach var="i" begin="${ startPageIndex }"
				end="${ endPageIndex }">
				<li class="page-item">					
					<button class="page-link" onclick="document.location.href='report.aa?pageNum=${ i }&option=${ option }&open=${ open }'">
						${i}
					</button>
				</li>
			</c:forEach>

			<!-- >> -->
			<c:if test="${ endPageIndex < pageTotalCount }">
				<li class="page-item">
					<button class="page-link" onclick="document.location.href='report.aa?pageNum=${ startPageIndex + 10 }&option=${ option }&open=${ open }'">
						»
					</button>
				</li>
			</c:if>
		</ul>
	</c:if>
 
 <!-- ================================================================================================================== -->                      
            
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
            <footer class="footer text-center text-muted">
                All Rights Reserved by Adminmart. Designed and Developed by <a
                    href="https://wrappixel.com">WrapPixel</a>.
            </footer>
            <!-- ============================================================== -->
            <!-- End footer -->
            <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
    <script src="/projectB/resource/bootstrap/assets/libs/jquery/dist/jquery.min.js"></script>
    <script src="/projectB/resource/bootstrap/assets/libs/popper.js/dist/umd/popper.min.js"></script>
    <script src="/projectB/resource/bootstrap/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- apps -->
    <!-- apps -->
    <script src="/projectB/resource/bootstrap/js/app-style-switcher.js"></script>
    <script src="/projectB/resource/bootstrap/js/feather.min.js"></script>
    <script src="/projectB/resource/bootstrap/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
    <script src="/projectB/resource/bootstrap/assets/extra-libs/sparkline/sparkline.js"></script>
    <script src="/projectB/resource/bootstrap/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="/projectB/resource/bootstrap/js/custom.min.js"></script>
    <!--This page JavaScript -->
    <script src="/projectB/resource/bootstrap/assets/extra-libs/c3/d3.min.js"></script>
    <script src="/projectB/resource/bootstrap/assets/extra-libs/c3/c3.min.js"></script>
    <script src="/projectB/resource/bootstrap/assets/libs/chartist/dist/chartist.min.js"></script>
    <script src="/projectB/resource/bootstrap/assets/libs/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js"></script>
    <script src="/projectB/resource/bootstrap/assets/extra-libs/jvector/jquery-jvectormap-2.0.2.min.js"></script>
    <script src="/projectB/resource/bootstrap/assets/extra-libs/jvector/jquery-jvectormap-world-mill-en.js"></script>
	 <!--Morris JavaScript -->
    <script src="/projectB/resource/bootstrap/assets/libs/raphael/raphael.min.js"></script>
    <script src="/projectB/resource/bootstrap/assets/libs/morris.js/morris.min.js"></script>
    <script src="/projectB/resource/bootstrap/assets/extra-libs/knob/jquery.knob.js"></script>    
    
    
</body>

			       