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
    <title>관리자 페이지</title>
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
   
   
 	<jsp:include page="test.jsp" flush="true"/>
 	  
   
   
   
 <!-- ================================================================================================================== -->            
            
            
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
                <!-- *************************************************************** -->
                <!-- Start First Cards -->
                <!-- *************************************************************** -->
                <div class="card-group">
                    <div class="card border-right">
                        <div class="card-body">
                            <div class="d-flex d-lg-flex d-md-block align-items-center">
                                <div>
                                    <div class="d-inline-flex align-items-center">
                                        <h2 class="text-dark mb-1 font-weight-medium">${todayPetitioner}</h2>
                                        <span
                                            class="badge bg-primary font-12 text-white font-weight-medium badge-pill ml-2 d-lg-block d-md-none">+${todayPercent}%</span>
                                    </div>
                                    <h6 class="text-muted font-weight-normal mb-0 w-100 text-truncate">새로운 회원 </h6>
                                </div>
                                <div class="ml-auto mt-md-3 mt-lg-0">
                                    <span class="opacity-7 text-muted"><i data-feather="user-plus"></i></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card border-right">
                        <div class="card-body">
                            <div class="d-flex d-lg-flex d-md-block align-items-center">
                                <div>
                                    <div class="d-inline-flex align-items-center">
                                        <h2 class="text-dark mb-1 font-weight-medium">7</h2>
                                        <span
                                            class="badge bg-danger font-12 text-white font-weight-medium badge-pill ml-2 d-md-none d-lg-block">+18.33%</span>
                                    </div>
                                    <h6 class="text-muted font-weight-normal mb-0 w-100 text-truncate">새로운 신고 </h6>
                                </div>
                                <div class="ml-auto mt-md-3 mt-lg-0">
                                    <span class="opacity-7 text-muted"><i data-feather="alert-triangle"></i></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card border-right">
                        <div class="card-body">
                            <div class="d-flex d-lg-flex d-md-block align-items-center">
                                <div>
                                    <div class="d-inline-flex align-items-center">
                                        <h2 class="text-dark mb-1 font-weight-medium">${todayPetition}</h2>
                                        <span
                                            class="badge bg-primary font-12 text-white font-weight-medium badge-pill ml-2 d-lg-block d-md-none">+${todayPetitionPercent}%</span>
                                    </div>
                                    <h6 class="text-muted font-weight-normal mb-0 w-100 text-truncate">새로운 청원 </h6>
                                </div>
                                <div class="ml-auto mt-md-3 mt-lg-0">
                                    <span class="opacity-7 text-muted"><i data-feather="file-plus"></i></span>
                                </div>
                            </div>
                        </div>
                    </div>
                     <div class="card">
                        <div class="card-body">
                            <div class="d-flex d-lg-flex d-md-block align-items-center">
                                <div>
                                    <div class="d-inline-flex align-items-center">
                                        <h2 class="text-dark mb-1 font-weight-medium">${todayDiscussion}</h2>
                                        <span
                                            class="badge bg-primary font-12 text-white font-weight-medium badge-pill ml-2 d-lg-block d-md-none">+${todayDiscussionPercent}%</span>
                                    </div>
                                    <h6 class="text-muted font-weight-normal mb-0 w-100 text-truncate">새로운 토론 </h6>
                                </div>
                                <div class="ml-auto mt-md-3 mt-lg-0">
                                    <span class="opacity-7 text-muted"><i data-feather="file-plus"></i></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- *************************************************************** -->
                <!-- End First Cards -->
                <!-- *************************************************************** -->
<!-- ================================================================================================================== -->                
                <!-- *************************************************************** -->
                <!-- Start Sales Charts Section -->
                <!-- *************************************************************** -->
                <div class="row">
                
                    <div class="col-lg-4 col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">인기 청원</h4>
                                
                                <div class="text-center">
                                    <input data-plugin="knob" data-width="220" data-height="220" data-linecap=round
                                        data-fgColor="#01caf1" value="${petitioPercent}" data-skin="tron" data-angleOffset="180"
                                        data-readOnly=true data-thickness=".2" />
                                </div>
                                
                                <div style="height:35px; width:100%;"></div>
                                
                                <ul class="list-style-none mb-0">
                                    <li>
                                        <a href="/projectB/question/content.aa" style="color: brown; 
											display: inline-block; width: 90%; 
											white-space: nowrap; overflow: hidden; 
											text-overflow: ellipsis;">
											"${topPetition[0].title}"</a>
                                    </li>
                                    <li class="mt-3">
                                        <i class="fas fa-circle text-danger font-10 mr-2"></i>
                                        <span class="text-muted">마감일까지 남은 일</span>
                                        <span class="text-dark float-right font-weight-medium">D-${restDay}</span>
                                    </li>
                                    <li class="mt-3">
                                        <i class="fas fa-circle text-cyan font-10 mr-2"></i>
                                        <span class="text-muted">청원 동의 수</span>
                                        <span class="text-dark float-right font-weight-medium">${topPetition[0].petition}</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-lg-4 col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Net Income</h4>
                                <div class="net-income mt-4 position-relative" style="height:294px;"></div>
                                <ul class="list-inline text-center mt-5 mb-2">
                                    <li class="list-inline-item text-muted font-italic">Sales for this month</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-lg-4 col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">인기 토론글</h4>
                                <div id="campaign-v3" class="mt-2" style="height:260px; width:100%;"></div>
                                <ul class="list-style-none mb-0">
                                    <li>
                                        <a href="/projectB/question/content.aa" style="color: brown; 
											display: inline-block; width: 90%; 
											white-space: nowrap; overflow: hidden; 
											text-overflow: ellipsis;">
											"${topDiscussion[0].subject}"</a>
                                    </li>
                                    <li class="mt-3">
                                        <i class="fas fa-circle text-cyan font-10 mr-2"></i>
                                        <span class="text-muted">Referral Sales</span>
                                        <span class="text-dark float-right font-weight-medium">2108</span>
                                    </li>
                                    <li class="mt-3">
                                        <i class="fas fa-circle text-danger font-10 mr-2"></i>
                                        <span class="text-muted">Affiliate Sales</span>
                                        <span class="text-dark float-right font-weight-medium">1204</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    
                </div>
                <!-- *************************************************************** -->
                <!-- End Sales Charts Section -->
                <!-- *************************************************************** -->
               
               
               
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                <div class="row">
                    <!-- column -->
                    
                    <!-- column -->
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Line Chart</h4>
                                <div id="morris-line-chart"></div>
                            </div>
                        </div>
                    </div>
                    <!-- column -->
                    <!-- column -->
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Donute Chart</h4>
                                <div id="morris-donut-chart"></div>
                            </div>
                        </div>
                    </div>
                    <!-- column -->
                   
                   
                </div>
                <!-- ============================================================== -->
                <!-- End PAge Content -->
                <!-- ============================================================== -->
               
               
               
                 <div class="row">
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Primary Table</h4>
                                <h6 class="card-subtitle">To use add class <code>.bg-primary .text-white</code> in the
                                    <code>&lt;thead&gt;</code>.</h6>
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead class="bg-primary text-white">
                                            <tr>
                                                <th>#</th>
                                                <th>First Name</th>
                                                <th>Last Name</th>
                                                <th>Username</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td>Nigam</td>
                                                <td>Eichmann</td>
                                                <td>@Sonu</td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>Deshmukh</td>
                                                <td>Prohaska</td>
                                                <td>@Genelia</td>
                                            </tr>
                                            <tr>
                                                <td>3</td>
                                                <td>Roshan</td>
                                                <td>Rogahn</td>
                                                <td>@Hritik</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Success Table</h4>
                                <h6 class="card-subtitle">To use add class <code>.bg-success .text-white</code> in the
                                    <code>&lt;thead&gt;</code>.</h6>
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead class="bg-success text-white">
                                            <tr>
                                                <th>#</th>
                                                <th>First Name</th>
                                                <th>Last Name</th>
                                                <th>Username</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td>Nigam</td>
                                                <td>Eichmann</td>
                                                <td>@Sonu</td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>Deshmukh</td>
                                                <td>Prohaska</td>
                                                <td>@Genelia</td>
                                            </tr>
                                            <tr>
                                                <td>3</td>
                                                <td>Roshan</td>
                                                <td>Rogahn</td>
                                                <td>@Hritik</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- row -->
                                
                            </div>
                        </div>
                    </div>
                </div>
                <!-- *************************************************************** -->
                <!-- End Top Leader Table -->
                <!-- *************************************************************** -->
            </div>
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
        </div>
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
    </div>
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
    <script src="/projectB/resource/bootstrap/js/pages/dashboards/dashboard1.js?ver=4"></script>
	 <!--Morris JavaScript -->
    <script src="/projectB/resource/bootstrap/assets/libs/raphael/raphael.min.js"></script>
    <script src="/projectB/resource/bootstrap/assets/libs/morris.js/morris.min.js"></script>
    <script src="/projectB/resource/bootstrap/js/pages/morris/morris-data.js?ver=1"></script>
    <script src="/projectB/resource/bootstrap/assets/extra-libs/knob/jquery.knob.js"></script>
    <script>
        $(function () {
            $('[data-plugin="knob"]').knob();
        });
    </script>
</body>

			       