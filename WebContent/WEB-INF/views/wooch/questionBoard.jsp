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
    <title>문의 게시판 </title>
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
                        <h4 class="page-title text-truncate text-dark font-weight-medium mb-1">문의 게시판</h4>
                        <div class="d-flex align-items-center">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb m-0 p-0">
                                    <li class="breadcrumb-item"><a href="index.html" class="text-muted">Home</a></li>
                                    <li class="breadcrumb-item text-muted active" aria-current="page">Question Board</li>
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
                                <h4 class="card-title">Zero Configuration</h4>
                                <div class="table-responsive">
                                    <table id="zero_config" class="table table-striped table-bordered no-wrap">
                                        <thead>
                                            <tr>
                                                <th>분류</th>
                                                <th>제목</th>
                                                <th>작성자</th>
                                                <th>답변여부</th>
                                                <th>작성시간</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	
											
											<c:forEach items="${articleList}" var="article">
											</tr>	
													<td>${article.category}</td>
													<td width="500"><a href="/projectB/question/">${article.title}</a></td>
													<td>${article.writer}</td>
													<td>${article.reply}</td>
													<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${article.reg}" /></td>
											</tr>	
											</c:forEach>
												
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th>Category</th>
                                                <th>Title</th>
                                                <th>Writer</th>
                                                <th>Reply</th>
                                                <th>date</th>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        
   </body>
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
    <!-- Bootstrap tether Core JavaScript -->
    <!-- apps -->
    <!-- apps -->
    <script src="/projectB/resource/bootstrap/dist/js/app-style-switcher.js"></script>
    <script src="/projectB/resource/bootstrap/dist/js/feather.min.js"></script>
    <!-- slimscrollbar scrollbar JavaScript -->
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
    <script src="/projectB/resource/bootstrap/extra-libs/prism/prism.js"></script>  
    <script src="/projectB/resource/bootstrap/assets/extra-libs/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="/projectB/resource/bootstrap/js/pages/datatable/datatable-basic.init.js"></script>
	<script>
	    $(document).ready(function () {
	
	        var tag = {};
	        var counter = 0;
	        var count = 0;

	        
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
		                        $("#tag-list").append("<b class='tag-item'>"+tagValue+"<span class='del-btn' style='color:blue' idx='"+counter+"'>(X)&nbsp; </span></b>");
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
			var count = 0;
				
			$('.btnAdd').click(function(){
				if (count == 0 || count == 1 ) {
					count++;
				$('.addInput').append(
						
					'<div class="col-md-8" id="'+count+'+">\
	                	<div class="form-group" id="'+count+'" >\
							<input type="text" name="link" id="'+count+'" class="form-control" value=""\
	                    	   	 placeholder="First Input First Row">\
		                </div>\
		            </div>\
		            <div class="col-md-4" id="'+count+'">\
		                <div class="form-group" id="'+count+'" >\
		                    <button id="btnRemove'+count+'" class=" btn btn-info">삭제</button>\
		                </div>\
		            </div>'
			
				);
		
				$('#btnRemove1').on('click', function(){
					$( 'input' ).remove( '#1' );
					$( 'div' ).remove( '#1' );
					$(this).remove();
					if(count == 1 || count == 2){
						count--;
					}
				});
				
				$('#btnRemove2').on('click', function(){
					$( 'input' ).remove( '#2' );
					$( 'div' ).remove( '#2' );
					$(this).remove();
					if(count == 2){
						count--;
					}
				});
				
				}else {return;}
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
	           	alert("내용을 입력해주세요");
	           	content.focus();
	           	return false;
	       	}
	       	else if(category.value=="선택") {
	           	alert("분류를 선택해주세요");
	           	category.focus();
	           	return false;
	       	}
	    	return true;
	    }
	     
	    function removeCheck() {
			 if (confirm("작성한 내용을 삭제하시겠습니까?") == true){    //확인
			     var el = document.getElementsByClassName('content');
			     for(var i=0; i<el.length; i++){ el[i].value = ''; }
			 }else{ return false; }
		}
    
	    function backCheck() {
	   		 if (confirm("작성하신 내용을 삭제하고 게시판으로 이동합니다.") == true){    //확인
	   			window.location = '/projectB/petition/afootPetition.aa';	
	   		 }else{ return false; }
	   	}
	    
	</script>
	




