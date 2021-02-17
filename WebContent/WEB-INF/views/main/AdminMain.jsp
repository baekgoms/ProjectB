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
   
   
 	<jsp:include page="/WEB-INF/views/topbar/admintopbar.jsp" flush="true"/>
   <br><br><br><br>
   
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
                                        <h2 class="text-dark mb-1 font-weight-medium">${todayQuestion}</h2>
                                        <span
                                            class="badge bg-danger font-12 text-white font-weight-medium badge-pill ml-2 d-md-none d-lg-block">+${todayQuestionPercent}%</span>
                                    </div>
                                    <h6 class="text-muted font-weight-normal mb-0 w-100 text-truncate">새로운 문의 </h6>
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
                                            class="badge bg-success font-12 text-white font-weight-medium badge-pill ml-2 d-lg-block d-md-none">+${todayPetitionPercent}%</span>
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
                                            class="badge bg-warning font-12 text-white font-weight-medium badge-pill ml-2 d-lg-block d-md-none">+${todayDiscussionPercent}%</span>
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
                                        data-fgColor="#01caf1" value="${petitionPercent}" data-skin="tron" data-angleOffset="180"
                                        data-readOnly=true data-thickness=".2" />
                                </div>
                                
                                <div style="height:35px; width:100%;"></div>
                                
                                <ul class="list-style-none mb-0">
                                    <li>
                                        <a href="/projectB/petition /petContent.aa?num=${topPetition[0].num}" style="color: brown; 
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
                                        <span class="text-dark float-right font-weight-medium"><fmt:formatNumber value="${topPetition[0].petition}" pattern="#,###" /></span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-lg-4 col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="table-responsive" >
                                <div style="height : 6px;"></div>
                                    <table class="table">
                                        <thead class="bg-primary text-white">
                                            <tr>
                                                <th colspan="2"><h2 class="mb-1 font-weight-medium">누적 청원</h2></th>
                                                <th style="text-align: right;"><h2 class="mb-1 font-weight-medium">${totalPetition}</h2></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<tr>
                                                <th colspan="3"></th>
                                            </tr>
                                            <tr>
                                                <th><i data-feather="loader"></i></th>
                                                <td>진행중인 청원</td>
                                                <th style="text-align: right;">${ongoingPetition}</th>
                                            </tr>
                                            <tr>
                                                <th><i data-feather="more-horizontal"></i></th>
                                                <td>답변 대기 청원</td>
                                                <th style="text-align: right;">${WaitingAnswerPetition}</th>
                                            </tr>
                                            <tr>
                                                <th><i data-feather="award"></i></th>
                                                <td>최다 청원 분야</td>
                                                <th style="text-align: right;">"${bestCategory}"</th>
                                            </tr>
                                            <tr>
                                                <th><i data-feather="users"></i></th>
                                                <td>누적 회원</td>
                                                <th style="text-align: right;">${TotalPetitioner}</th>
                                            </tr>
                                            <tr>
                                                <th><i data-feather="user-x"></i></th>
                                                <td>신규 블랙리스트</td>
                                                <th style="text-align: right;">${newBlacklist}</th>
                                            </tr>
                                        </tbody>
                                        
                                      
                                    </table>
                                    
                                </div>
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
                                    	<c:if test="${ topDiscussion[0].subject != null }">
                                        <a href="/projectB/discussion/content.aa?discussionNum=${topDiscussion[0].num}" style="color: brown; 
											display: inline-block; width: 90%; 
											white-space: nowrap; overflow: hidden; 
											text-overflow: ellipsis;">
												"${topDiscussion[0].subject}"</a>
										</c:if>
										<c:if test="${ topDiscussion[0].subject == null }">
											표시할 토론이 없습니다.
										</c:if>
                                    </li>
                                    <li class="mt-3">
                                        <i class="fas fa-circle text-cyan font-10 mr-2"></i>
                                        <span class="text-muted">찬성 수</span>
                                        <span class="text-dark float-right font-weight-medium"><fmt:formatNumber value="${topDiscussion[0].agreement}" pattern="#,###" /></span>
                                    </li>
                                    <li class="mt-3">
                                        <i class="fas fa-circle text-danger font-10 mr-2"></i>
                                        <span class="text-muted">반대 수 </span>
                                        <span class="text-dark float-right font-weight-medium"><fmt:formatNumber value="${topDiscussion[0].opposition}" pattern="#,###" /></span>
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
                                <h4 class="card-title">요약</h4>
                                <div id="morris-bar-chart"></div>
                                <div style="height : 16px;"></div>
                                <ul class="list-style-none mb-0">
                                    <li>
                                       	<b  style="color: brown; 
										display: inline-block; width: 90%; color: black;
										white-space: nowrap; overflow: hidden; 
										text-overflow: ellipsis; text-align: center;">
										3년간 등록된 청원, 회원 수 요약 그래프 </b>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- column -->
                    <!-- column -->
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">이슈 답변</h4>
                                <div id="morris-donut-chart"></div>
                                <ul class="list-style-none mb-0">
                                    <li>
                                        <a href="/projectB/answer/answerContent.aa?petitionNum=${topAnswer[0].petitionNum}" style="color: brown; 
											display: inline-block; width: 90%; 
											white-space: nowrap; overflow: hidden; 
											text-overflow: ellipsis;">
											"${topAnswer[0].content}"</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- column -->
                   
                </div>
                <!-- ============================================================== -->
                <!-- End PAge Content -->
                <!-- ============================================================== -->
               
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
	 <!--Morris JavaScript   -->
    <script src="/projectB/resource/bootstrap/assets/libs/raphael/raphael.min.js"></script>
    <script src="/projectB/resource/bootstrap/assets/libs/morris.js/morris.min.js"></script>
    <script src="/projectB/resource/bootstrap/assets/extra-libs/knob/jquery.knob.js"></script>
        <script src="/projectB/resource/bootstrap/js/pages/morris/morris-data.js"></script>
  
    
    <script>
        $(function () {
            $('[data-plugin="knob"]').knob();
        });
        
        
        $(function () {

        	var agree = ${agreePer};
        	var oppo = ${oppoPer};
        	if(agree == null){ agree=0; };
        	if(oppo == null){ oppo=0; };
        	
            // ============================================================== 
            // income
            // ============================================================== 
            var data = {
                labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jun'],
                series: [
                    [5, 4, 3, 7, 5, 10, 10]
                ]
            };

            var options = {
                axisX: {
                    showGrid: false
                },
                seriesBarDistance: 1,
                chartPadding: {
                    top: 15,
                    right: 15,
                    bottom: 5,
                    left: 0
                },
                plugins: [
                    Chartist.plugins.tooltip()
                ],
                width: '100%'
            };

            var responsiveOptions = [
                ['screen and (max-width: 640px)', {
                    seriesBarDistance: 5,
                    axisX: {
                        labelInterpolationFnc: function (value) {
                            return value[0];
                        }
                    }
                }]
            ];
            new Chartist.Bar('.net-income', data, options, responsiveOptions);

         // ==============================================================
            // Campaign
            // ==============================================================

            var chart2 = c3.generate({
                bindto: '#campaign-v3',
                data: {
                    columns: [
                        ['', 0],
                        ['찬성', agree],
                        ['반대', oppo]
                    ],

                    type: 'donut',
                    tooltip: {
                        show: true
                    }
                },
                donut: {
                    label: {
                        show: false
                    },
                    title: '찬성/반대',
                    width: 18
                },

                legend: {
                    hide: true
                },
                color: {
                    pattern: [
                        '#edf2f6',
                        '#5f76e8',
                        '#ff4f70',
                        '#01caf1'
                    ]
                }
            });

            d3.select('#campaign-v3 .c3-chart-arcs-title').style('font-family', 'Rubik');
            
        });
        
        $(function () {
            "use strict";
        
	        var recommendPer = ${recommendPer};
	        var oppositePer = ${oppositePer};
	        var additionPer = ${additionPer};
	        
	        var thisYearPetitionCount = ${thisYearPetitionCount};
	        var beforeYearPetitionCount = ${beforeYearPetitionCount};
	        var beforeTwoYearPetitionCount = ${beforeTwoYearPetitionCount};
	        
	        var thisYearPetitionerCount = ${thisYearPetitionerCount};
	        var beforeYearPetitionerCount = ${beforeYearPetitionerCount};
	        var beforeTwoYearPetitionerCount = ${beforeTwoYearPetitionerCount};
	        
	        let today = new Date();   
	        let year = today.getFullYear(); // 년도
	        var A = 2021;
	
	     	// Morris bar chart
	        Morris.Bar({
	            element: 'morris-bar-chart',
	            data: [{
	                y: year-2,
	                a: beforeTwoYearPetitionerCount,
	                b: beforeTwoYearPetitionCount
	            }, {
	                y: year-1,
	                a: beforeYearPetitionerCount,
	                b: beforeYearPetitionCount
	            }, {
	                y: year,
	                a: thisYearPetitionerCount,
	                b: thisYearPetitionCount
	            }],
	            xkey: 'y',
	            ykeys: ['a', 'b'],
	            labels: ['회원', '청원'],
	            barColors:['#01caf1', '#5f76e8'],
	            hideHover: 'auto',
	            gridLineColor: '#eef0f2',
	            resize: true
	        });
	        
	         // Morris donut chart        
	         Morris.Donut({
	             element: 'morris-donut-chart',
	             data: [{
	                 label: "추천 ",
	                 value: recommendPer,
	
	             }, {
	                 label: "추가 답변 희망",
	                 value: additionPer
	             }, {
	                 label: "반대",
	                 value: oppositePer
	             }],
	             resize: true,
	             colors:['#5f76e8', '#01caf1', '#8fa0f3']
	         });

         });    
        
    </script>
</body>

			       