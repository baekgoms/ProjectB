<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


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
    <title>청원 올리기 </title>
    <link href="/projectB/resource/bootstrap/css/style.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link rel="stylesheet" type="text/css" href="/projectB/resource/bootstrap/assets/extra-libs/prism/prism.css">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>






<body>
    
        
        <jsp:include page="/resource/wooch/woochanTest.jsp" flush="true"/>

        
        
        
        
        
        
        <!-- ============================================================== -->
        <!-- Page wrapper -->
        <!-- ============================================================== -->
        <div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-7 align-self-center">
                        <h4 class="page-title text-truncate text-dark font-weight-medium mb-1">청원 올리기 </h4>
                        <div class="d-flex align-items-center">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb m-0 p-0">
                                    <li class="breadcrumb-item"><a href="index.html" class="text-muted">Home</a></li>
                                    <li class="breadcrumb-item text-muted active" aria-current="page"> Upload Petition</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                    <div class="col-5 align-self-center">
                        <div class="customize-input float-right">
                            <select class="custom-select custom-select-set form-control bg-white border-0 custom-shadow custom-radius">
                                <option selected>Aug 19</option>
                                <option value="1">July 19</option>
                                <option value="2">Jun 19</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            
            
            
            
            
            
            <!-- ============================================================== -->
            <!-- Container fluid 첫번째꺼  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Start Page Content(본문) -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- First Card with Navbar -->
                <!-- ============================================================== -->
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">Scrollspy with Navbar</h4>
                        <nav id="navbar-example2" class="navbar navbar-light bg-light">
                            <a class="navbar-brand text-muted" href="#">Navbar</a>
                            <ul class="nav nav-pills">
                                <li class="nav-item">
                                    <a class="nav-link" href="#fat">First</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#mdo">Second</a>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button"
                                        aria-haspopup="true" aria-expanded="false">Third with Dropdown</a>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="#one">one</a>
                                        <a class="dropdown-item" href="#two">two</a>
                                        <div role="separator" class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="#three">three</a>
                                    </div>
                                </li>
                            </ul>
                        </nav>
                        <div data-spy="scroll" data-target="#navbar-example2" data-offset="0"
                            class="position-relative mt-2" style="height: 200px; overflow: auto;">
                            <h4 id="fat">@fat</h4>
                            <p>Ad leggings keytar, brunch id art party dolor labore. Pitchfork yr enim lo-fi before they
                                sold out qui. Tumblr farm-to-table bicycle rights whatever. Anim keffiyeh carles
                                cardigan. Velit seitan mcsweeney's photo booth 3 wolf moon irure. Cosby sweater lomo
                                jean shorts, williamsburg hoodie minim qui you probably haven't heard of them et
                                cardigan trust fund culpa biodiesel wes anderson aesthetic. Nihil tattooed accusamus,
                                cred irony biodiesel keffiyeh artisan ullamco consequat.</p>
                            <h4 id="mdo">@mdo</h4>
                            <p>Veniam marfa mustache skateboard, adipisicing fugiat velit pitchfork beard. Freegan beard
                                aliqua cupidatat mcsweeney's vero. Cupidatat four loko nisi, ea helvetica nulla carles.
                                Tattooed cosby sweater food truck, mcsweeney's quis non freegan vinyl. Lo-fi wes
                                anderson +1 sartorial. Carles non aesthetic exercitation quis gentrify. Brooklyn
                                adipisicing craft beer vice keytar deserunt.</p>
                            <h4 id="one">First item</h4>
                            <p>Occaecat commodo aliqua delectus. Fap craft beer deserunt skateboard ea. Lomo bicycle
                                rights adipisicing banh mi, velit ea sunt next level locavore single-origin coffee in
                                magna veniam. High life id vinyl, echo park consequat quis aliquip banh mi pitchfork.
                                Vero VHS est adipisicing. Consectetur nisi DIY minim messenger bag. Cred ex in,
                                sustainable delectus consectetur fanny pack iphone.</p>
                            <h4 id="two">Second item</h4>
                            <p>In incididunt echo park, officia deserunt mcsweeney's proident master cleanse thundercats
                                sapiente veniam. Excepteur VHS elit, proident shoreditch +1 biodiesel laborum craft
                                beer. Single-origin coffee wayfarers irure four loko, cupidatat terry richardson master
                                cleanse. Assumenda you probably haven't heard of them art party fanny pack, tattooed
                                nulla cardigan tempor ad. Proident wolf nesciunt sartorial keffiyeh eu banh mi
                                sustainable. Elit wolf voluptate, lo-fi ea portland before they sold out four loko.
                                Locavore enim nostrud mlkshk brooklyn nesciunt.</p>
                            <h4 id="three">Third item</h4>
                            <p>Ad leggings keytar, brunch id art party dolor labore. Pitchfork yr enim lo-fi before they
                                sold out qui. Tumblr farm-to-table bicycle rights whatever. Anim keffiyeh carles
                                cardigan. Velit seitan mcsweeney's photo booth 3 wolf moon irure. Cosby sweater lomo
                                jean shorts, williamsburg hoodie minim qui you probably haven't heard of them et
                                cardigan trust fund culpa biodiesel wes anderson aesthetic. Nihil tattooed accusamus,
                                cred irony biodiesel keffiyeh artisan ullamco consequat.</p>
                            <p>Keytar twee blog, culpa messenger bag marfa whatever delectus food truck. Sapiente synth
                                id assumenda. Locavore sed helvetica cliche irony, thundercats you probably haven't
                                heard of them consequat hoodie gluten-free lo-fi fap aliquip. Labore elit placeat before
                                they sold out, terry richardson proident brunch nesciunt quis cosby sweater pariatur
                                keffiyeh ut helvetica artisan. Cardigan craft beer seitan readymade velit. VHS chambray
                                laboris tempor veniam. Anim mollit minim commodo ullamco thundercats.
                            </p>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                
                
                
                
                <!-- ============================================================== -->
                <!-- End PAge Content -->
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- footer 마지막 문구  -->
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
    <!-- Bootstrap tether Core JavaScript -->
    <script src="/projectB/resource/bootstrap/assets/libs/popper.js/dist/umd/popper.min.js"></script>
    <script src="/projectB/resource/bootstrap/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- apps -->
    <!-- apps -->
    <script src="/projectB/resource/bootstrap/dist/js/app-style-switcher.js"></script>
    <script src="/projectB/resource/bootstrap/dist/js/feather.min.js"></script>
    <!-- slimscrollbar scrollbar JavaScript -->
    <script src="/projectB/resource/bootstrap/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
    <script src="/projectB/resource/bootstrap/assets/extra-libs/sparkline/sparkline.js"></script>
    <!--Wave Effects -->
    <!-- themejs -->
    <!--Menu sidebar -->
    <script src="/projectB/resource/bootstrap/dist/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="/projectB/resource/bootstrap/dist/js/custom.min.js"></script>
    <script>
        $(".preloader ").fadeOut();
    </script>
    
       	<script src="/projectB/resource/bootstrap/assets/libs/jquery/dist/jquery.min.js"></script>
    <script src="/projectB/resource/bootstrap/assets/libs/popper.js/dist/umd/popper.min.js"></script>
    <script src="/projectB/resource/bootstrap/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="/projectB/resource/bootstrap/js/app-style-switcher.js"></script>
    <script src="/projectB/resource/bootstrap/js/feather.min.js"></script>
    <script src="/projectB/resource/bootstrap/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
    <script src="/projectB/resource/bootstrap/assets/extra-libs/sparkline/sparkline.js"></script>
    <script src="/projectB/resource/bootstrap/js/sidebarmenu.js"></script>
    <script src="/projectB/resource/bootstrap/js/custom.min.js"></script>
    <script src="/projectB/resource/bootstrap/assets/extra-libs/prism/prism.js"></script>  
    
</body>

</html>


