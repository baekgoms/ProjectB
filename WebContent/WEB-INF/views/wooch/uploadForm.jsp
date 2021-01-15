<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- Custom CSS -->
<link href="/projectB/resource/bootstrap/css/style.css" rel="stylesheet">
<!-- This Page CSS -->
<link href="/projectB/resource/assets/libs/morris.js/morris.css" rel="stylesheet">

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
   
   
        

        
<!-- ============================================================================================================= -->
<!-- Page wrapper -->
<!-- ============================================================================================================== -->
        <div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-7 align-self-center">
                        <h4 class="page-title text-truncate text-dark font-weight-medium mb-1">청원 작성 </h4>
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
                    
                    
		                <div class="row">
		                    <div class="col-12">
		                        <div class="card">
		                            <div class="card-body">
		                                <h4 class="card-title">청원제목 </h4>    
		                                  
<!-- 			<form>				 --> <form method="post" id="tag-form" name="uploadForm" onsubmit="return checkIt()" action="/projectB/petition/uploadPro.aa" >
			                                <div class="form-group">
	                                            
	                                            <input type="text" class="form-control"
	                                                placeholder="제목 입력" id="title" name="title">
	                                        </div>
		                                <hr>
		                              
		                                    <div class="form-body">
		                                        <div class="form-group row">
		                                            <!-- 분류 카테고리 영역  -->
		                   
		                                              <div class="col-md-10">
		                                                <div class="row">
		                                            
				                                            <div class="col-sm-12 col-md-6 col-lg-4">
										                        <div class="card">
										                            <div class="card-body">
										                               
										                                    <div class="form-group mb-1">
										                                        <label class="mr-sm-2" for="inlineFormCustomSelect">청원 분류 </label>
										                                        <select class="custom-select mr-sm-2" id="inputGroupSelect01" name="category" >
										                                            <option selected>선택하기</option>
										                                            
										                                           <!-- DB 컬럼 개수만큼 반복  -->
										                                           <c:forEach var="name" items="${category}" varStatus="status">
																						<option value="${status.count}"><c:out value="${name}" /></option>
																					</c:forEach>

										                                        </select>
										                                    </div>
										                               
										                            </div>
										                        </div>
										                    </div>
		                                            
		                                                    <div class="col-md-8">
		                                                        <div class="form-group">
		                                                            <input type="text" class="form-control" id="tag" name="tag2"
		                                                                placeholder="해시태그 입력(최대 5개)" />
		                                                                
		                                                                <ul id="tag-list"> </ul>
		                                                                
		                                                                
		                                                        </div>
		                                                        <input type="hidden" value="" name="tag" id="rdTag" />
		                                                    </div>
		                                                    
		                                                </div>
		                                            </div>
		                                        </div>
		                                        
		                                        <hr>
		                                        <h4 class="card-title">청원내용  </h4>
		                                         <div data-spy="scroll" data-target="#navbar-example2" data-offset="0"
						                            class="position-relative mt-2" style="height: 700px; overflow: auto;">	
						                            
						                            <textarea class="form-control" rows="3" placeholder="청원내용 작성 " name="content" id="content"
						                            				style="height: 700px; overflow: auto;"></textarea>
						                            					                          
						                        </div>
		                                        
		                                        <hr>
		                                        
		                                        <div class="form-group row">
		                                            <label class="col-md-2">링크 첨부 </label>
		                                            <div class="col-md-10">
		                                            
		                                                <div class="row">
		                                                    <div class="col-md-8">
		                                                        <div class="form-group">
		                                                            <input type="text" class="form-control" name="link"
		                                                                placeholder="First Input &amp; First Row">
		                                                                <!-- 링크 텍스트 박스 추가  -->	
		                                                                
		                                                        </div>
		                                                    </div>
		                                                    <div class="col-md-4">
		                                                        <div class="form-group">
		                                                             <input type="button" class="btnAdd btn btn-info" value="추가" /><br>
		                                                           
		                                                        </div>
		                                                    </div>
		                                                </div>
		                                                
		                                                <div class="row addInput"> </div>
		                                                <!--  
		                                                <div class="row">
		                                                    <div class="col-md-10">
		                                                        <div class="form-group">
		                                                            <input type="text" class="form-control"
		                                                                placeholder="First Input &amp; Second Row">
		                                                        </div>
		                                                    </div>
		                                                    <div class="col-md-4">
		                                                        <div class="form-group">
		                                                            <input type="text" class="form-control"
		                                                                placeholder="Second Input &amp; Second Row">
		                                                        </div>
		                                                    </div>
		                                                </div>
		                                                -->
		                                                
		                                            </div>
		                                        </div>
		                                    </div>
		                                    
		                                    <div class="form-actions">
		                                        <div class="text-right">
		                                            <button type="submit" class="btn btn-info">등록 </button>
		                                            <button type="reset" class="btn btn-dark">취소 </button>
		                                        </div>
		                                    </div>
<!-- 				<form>			 --></form>
		                            </div>
		                        </div>
		                    </div>
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
	
	<script>
	    $(document).ready(function () {
	
	        var tag = {};
	        var counter = 0;
	
	        // 태그를 추가한다.
	        function addTag (value) {
	            tag[counter] = value; // 태그를 Object 안에 추가
	            if(counter < 5){
	            counter++; // counter 증가 삭제를 위한 del-btn 의 고유 id 가 된다.
	        	}
	        }
	
	        // 최종적으로 서버에 넘길때 tag 안에 있는 값을 array type 으로 만들어서 넘긴다.
	        function marginTag () {
	            return Object.values(tag).filter(function (word) {
	                return word !== "";
	            });
	        }
	    
	        // 서버에 넘기기
	        $("#tag-form").on("submit", function (e) {
	            var value = marginTag(); // return array
	            $("#rdTag").val(value); 
	
	            $(this).submit();
	        });
	
	        $("#tag").on("keypress", function (e) {
	            var self = $(this);
	
	            // input 에 focus 되있을 때 엔터 및 스페이스바 입력시 구동
	            if (e.key === "Enter" || e.keyCode == 32) {
	
	                var tagValue = self.val(); // 값 가져오기
	
	                // 값이 없으면 동작 ㄴㄴ
	                if (tagValue !== "") {
	
	                    // 같은 태그가 있는지 검사한다. 있다면 해당값이 array 로 return 된다.
	                    var result = Object.values(tag).filter(function (word) {
	                        return word === tagValue;
	                    })
	                
	                    // 태그 중복 검사
	                     if (counter <= 4) { //5개 제
	                    
		                    if (result.length == 0) { 
		                        $("#tag-list").append("<li class='tag-item'>"+tagValue+"<span class='del-btn' style='color:blue' idx='"+counter+"'>(X)</span></li>");
		                        addTag(tagValue);
		                        self.val("");
	
		                        
		                    } else {
		                        alert("태그값이 중복됩니다.");
		                    }
	              		} else {
                        alert("최대 5개까지 입력 가능합니다.");
                   		 }
	                }
	                e.preventDefault(); // SpaceBar 시 빈공간이 생기지 않도록 방지
	            }
	        });
	
	        // 삭제 버튼 
	        // 삭제 버튼은 비동기적 생성이므로 document 최초 생성시가 아닌 검색을 통해 이벤트를 구현시킨다.
	        $(document).on("click", ".del-btn", function (e) {
	            var index = $(this).attr("idx");
	            tag[index] = " ";
	            $(this).parent().remove();
	            counter--;
	        });
	})
	</script>
	
	<script>
		$(document).ready(function () {
			var counter = 0;
				
			$('.btnAdd').click(function(){
				if (counter <= 1 || counter > 2 ) {
					counter++;
				$('.addInput').append(
						
					'<div class="col-md-8">\
	                	<div class="form-group">\
							<input type="text" name="link" class="form-control counter" value=""\
	                    	   	 placeholder="First Input &amp; First Row">\
		                </div>\
		            </div>\
		            <div class="col-md-4">\
		                <div class="form-group">\
		                    <button type="button" class="btnRemove btn btn-info">삭제</button>\
		                </div>\
		            </div>'
			
				);
		
				
				
				$('.btnRemove').on('click', function(){
					$( 'input' ).remove( '.counter' );
					$(this).remove();
					if(counter >= 1){
						counter--;
					}
				});
				}
			});		
			
		});
	</script>
	
	<script type="text/javascript">
    function checkIt()
    {
    	
        var title = document.getElementById("title");
        var content = document.getElementById("content");
        var category = document.getElementById("inputGroupSelect01");
        
       if(title.value=="") {
           alert("제목을 입력해주세요");
           title.focus();
           return false;
       }
       
       else if(content.value=="") {
           alert("청원 내용을 입력해주세요");
           content.focus();
           return false;
       }
       
       else if(category.value=="선택하기") {
           alert("청원 분류를 선택해주세요");
           category.focus();
           return false;
       }
     
    return true;
    }
     
     
	</script>
	


