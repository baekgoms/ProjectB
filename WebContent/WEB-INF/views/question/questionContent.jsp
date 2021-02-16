<%@page import="projectB.model.login.LoginUtils"%>
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

<script type="text/javascript">
	    
		function checkIt()
	    {
	        var content = document.getElementById("content");
	        
	       	if(content.value=="") {
	           	alert("내용을 입력해주세요");
	           	content.focus();
	           	return false;
	       	}
	       
	    	return true;
	    }
	    
	</script>

<body>
<%
	String url = "/WEB-INF/views/topbar/top.jsp";
	if(LoginUtils.isAdmin(session)) {
		url = "/WEB-INF/views/topbar/admintopbar.jsp";
	} else if (LoginUtils.isAnswer(session)) {
		url = "/WEB-INF/views/topbar/anwerTopbar.jsp";
	}
%>
<jsp:include page="<%= url %>" /><br><br><br><br>
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
                                <!--  <h4 class="card-title">Zero Configuration</h4>-->
                                <div class="table-responsive">
                                    <table id="zero_config" class="table table-striped table-bordered no-wrap">
                                   	  <c:if test="${ admin == 1 }">
                                        <input class="btn btn-dark" type="button" value="목록" onclick="document.location.href='/projectB/admin/question.aa'" />
                                      </c:if>
                                      <c:if test="${ admin == 0 }">
                                        <input class="btn btn-dark" type="button" value="목록" onclick="document.location.href='/projectB/question/board.aa'" />
                                      </c:if>
                                    	<c:if test="${same == 1}">
                                   			&nbsp;<input class="btn btn-dark" type="button" value="삭제" onclick="document.location.href='/projectB/question/delete.aa?num=${num}'"/>
								        </c:if>
                                        <hr>
                                        <tbody>
                                        	<tr>
                                        	<c:forEach items="${articleList}" var="article">
                                                <td width="60">분류</td><td>${category[article.category-1]}</td>
                                                <td width="60">제목</td><td><c:out value="${article.title}" /></td>
                                                 <td width="80">작성자</td><td>${article.writer}</td>
                                            </c:forEach>
											</tr>	
											<c:forEach items="${articleList}" var="article">
											<td colspan="6">${article.content}</td>
											 </c:forEach>
                                        </tbody>
                                    </table>
                                    
                                </div>
                                
                                <c:forEach items="${comment}" var="article">
                                 <tr>
	                               <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                               	   ${article.writer}&nbsp;|&nbsp;</td>
	                               <td>${article.content}&nbsp;|&nbsp;</td>
	                               <td>${article.reg}</td><br>
	                             </tr>   
	                            </c:forEach>
                                
                                 <div class="form-actions">
                                <div class="text-right">
                                <c:if test="${ same == 1 }">
                               		<form method="post" id="tag-form" name="uploadForm" onsubmit="return checkIt()" action="/projectB/question/comment.aa?num=${num}" >
	                                  <textarea class="form-control content" rows="3" placeholder="댓글 입력 " name="content" id="content"
							                            				style="height: 150px; overflow: auto; resize: none;"></textarea>
									  <button type="submit" class="btn btn-info">등록 </button>
									</form>
								</c:if>
								</div>  
								</div>   
								                      
                            </div>
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
  	<script src="/projectB/resource/bootstrap/js/pages/datatable/datatable-basic.init.js"></script> 
   
			       