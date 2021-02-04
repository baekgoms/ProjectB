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
    <title>답변 작성폼</title>
    <link href="/projectB/resource/bootstrap/css/style.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link rel="stylesheet" type="text/css" href="/projectB/resource/bootstrap/assets/extra-libs/prism/prism.css">

	<style>
		#nametext1{
			width : 45%;
		} 
		.form-control{
			display: inline-grid;
		}
		.card-title{
			margin-top: 50px;
		}
	</style>


</head>

<body>

<div class="page-wrapper">
	<div class="container-fluid">
		<div class="row">
			<div class="col-12">
			

<form method="post" action="/projectB/answer/addAnswerContentUpdatePro.aa" >
<input type="hidden" name="petitionNum" value="${petitionNum}" />
<input type="hidden" name="state" value="${petitionDTO.petitionState}" />
<input type="hidden" name="name" value="${petitionerDTO.name}" />
<input type="hidden" name="department" value="${petitionerDTO.department}" />
<input type="hidden" name="id" value="${petitionerDTO.id}" />


<div class="card">
	<div class="card-body">
		   <h4 class="card-title">청원/기존 답변정보</h4>
		<div class="form-group">
			<a href="/projectB/answer/answerContent.aa?petitionNum=${petitionDTO.num}" target="_blank">${petitionDTO.title}</a>
		</div>
			<br/><hr>
				
		<div class="form-group" style="color:black; font-size:14pt">
			부서<input type="text" class="form-control" id="nametext1" placeholder="${petitionerDTO.department}" readOnly>
			이름<input type="text" class="form-control" id="nametext1" placeholder="${petitionerDTO.name}" readOnly>
		</div>
				

			<h4 class="card-title">관련 영상 링크 </h4>    
		<div class="form-group">
			<input type="text" class="form-control" placeholder="URL입력" name="answerLink" id="answerLink" value="${answerDTO.answerLink}">
		</div>


			<h4 class="card-title">추가답변내용</h4>
		<div data-spy="scroll" data-target="#navbar-example2" data-offset="0"
		 class="position-relative mt-2" style="height: 700px; overflow: auto;">	
			                            
		<textarea class="form-control content" rows="3" placeholder="추가답변 내용 작성 " name="content2" id="content2"
		style="height: 700px; overflow: auto;">${answerDTO.content2}</textarea>
			                            					                          
		</div>
                                       
		<hr>
		                                        
		                            
                                   
		<div class="form-actions">
			<div class="text-right">
   				<button type="submit" class="btn btn-info">등록 </button>
       				<input id="tblbutton" class="btn btn-dark" type="button" value="다시 작성" onclick="removeCheck()">
           			<input id="backButton" class="btn btn-dark" type="button" value="목록" onclick="backCheck()">
   			</div>
		</div>
		
		</div>
	</div>	
</form>
	      
      
          
			</div>
        </div>
    </div>
</div>


   </body>

    <script src="/projectB/resource/bootstrap/dist/js/app-style-switcher.js"></script>
    <script src="/projectB/resource/bootstrap/dist/js/feather.min.js"></script>
    <script src="/projectB/resource/bootstrap/dist/js/sidebarmenu.js"></script>
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


	<script type="text/javascript">
	    
	
	     
	    function removeCheck() {
			 if (confirm("작성한 내용을 삭제하시겠습니까?") == true){    //확인
			     var el = document.getElementsByClassName('content');
			     for(var i=0; i<el.length; i++){ el[i].value = ''; }
			 }else{ return false; }
		}
	    
	    function backCheck() {
	    	history.back();	
	    }
	</script>
	


