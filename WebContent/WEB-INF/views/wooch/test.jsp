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
	function selectOption(obj) {
		window.location.href = "report.aa?option="+ obj.value;
	}
	function selectAll() {
		var chkbox = document.getElementsByName("member_checkbox");
		for (var i = 0; i < chkbox.length; i++) {
			chkbox[i].checked = true;
		}
	}

	function selectDel() {
		var chkbox = document.getElementsByName("member_checkbox");
		var str = "";
		for (var i = 0; i < chkbox.length; i++) {
			if (chkbox[i].checked) {
				str = str + chkbox[i].value + ",";
			}
		}

		var form = document.createElement('form');
		form.setAttribute('method', 'post');
		form.setAttribute('action', 'selectDel.aa');
		document.charset = "utf-8";
		var hiddenField = document.createElement("input");
		hiddenField.setAttribute('type', 'hidden');
		hiddenField.setAttribute('name', 'selects');
		hiddenField.setAttribute('value', str);
		form.appendChild(hiddenField);

		document.body.appendChild(form);
		form.submit();

	}
	function openNewWindow(url) { 
		open(url,"Mail","toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, width=550, height=875");
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
			<input type="button" value="공개" class="btn waves-effect waves-light btn-outline-dark"
				onclick="document.location.href='/projectB/admin/reportOpened.aa'">
			<input type="button" value="비공개" class="btn waves-effect waves-light btn-outline-dark"	
				onclick="document.location.href='/projectB/admin/reportClosed.aa?open=1'">
		
			
			<select class="form-control" id="exampleFormControlSelect1" style="width: 150px; float: right;"
				onchange = "selectOption(this)">
				<option value="1" <c:if test="${ option == '0' }">selected</c:if>>전체</option>
				<option value="1" <c:if test="${ option == '1' }">selected</c:if>>청원</option>
				<option value="2" <c:if test="${ option == '2' }">selected</c:if>>토론</option>
				<option value="2" <c:if test="${ option == '3' }">selected</c:if>>토론 댓글</option>
			</select>

		</div>
		
		<!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                <!-- basic table -->
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                            
                            
                                <div class="table-responsive">
                                    <table id="zero_config" class="table table-striped table-bordered no-wrap">
                                        <thead>
                                            <tr>
                                                <th>num</th>
                                                <th>신고 분류 </th>
                                                <th>신고글</th>
                                                <th>작성자</th>
                                                <th>신고수</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var = "petition" items="${ petition }" varStatus="status">
												<tr align="center">
												 	<th scope="row">
													 	<div class="custom-control custom-checkbox">
															<input type="checkbox" class="custom-control-input" name = "member_checkbox"
																id="customCheck_${ status.index }" value = "${ petition.num }"/> 
															<label class="custom-control-label" for="customCheck_${ status.index }"></label>
														</div>
													</th>
												 	<td>청원</td>
													<td>${ petition.title }</td>
													<td>${ petition.writer }</td>
													<td>${ petition.report }</td>							
												</tr>
											</c:forEach>
                                            <c:forEach var = "discussion" items="${ discussion }" varStatus="status">
												<tr align="center">
												 	<td>*</td>
												 	<td>토론</td>
													<td>${ discussion.subject }</td>
													<td>${ discussion.write }</td>
													<td>${ discussion.report }</td>							
												</tr>
											</c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
	
	
	
	
	
	
	<div>
		<button class="btn waves-effect waves-light btn-outline-dark"
			onclick="selectAll()">
			전체 선택
		</button>
		
		<button class="btn waves-effect waves-light btn-outline-dark"
			onclick="selectDel()">
			비공개하기
		</button>
	</div>

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
     
    <script src="/projectB/resource/bootstrap/assets/extra-libs/datatables.net/js/jquery.dataTables.js"></script>
    <script src="/projectB/resource/bootstrap/js/pages/datatable/datatable-basic.init.js"></script>
    
</body>

			       