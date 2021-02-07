<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


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
<link href="/projectB/resource/bootstrap/css/style.min.css" rel="stylesheet">
<!-- This Page CSS -->
<link href="/projectB/resource/bootstrap/assets/libs/morris.js/morris.css" rel="stylesheet">
<link href="/projectB/resource/bootstrap/css/discussion.css" rel="stylesheet">

<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>discussion content</title>


<script type="text/javascript">
$(document).ready(function(){
	
	 var status = false; //수정과 대댓글을 동시에 적용 못하도록
	
	 $(document).on("click","button[name='reply_reply']",function(){
		 if(status){
             alert("수정과 대댓글은 동시에 불가합니다.");
             return false;
         }
         
         status = true;
         
         $("#reply_add").remove();
         
         var reply_id = $(this).attr("reply_id");
         var last_check = false;//마지막 tr 체크
         
         console.log("reply_id/" + reply_id);
         console.log("memId/" + '${memId}');
         console.log("discussionNum/" + '${discussionNum}');
         var replyEditor = 
        	 "<tr id='reply_add'>" +
	        	 "<td colsapn = '1'>" +
	        	 	"<form method='post' id='reply_write1537116' class='co_write reply_write' action='/projectB/discussion/commentInsert.aa'>" +
	        	 	"<textarea name='content' rows='3' cols='50'></textarea>" +
	        	 	"<br>" +
	        	 	"<input type ='hidden' name = 'num' value='" + reply_id + "'/>" +
	        	 	"<input type ='hidden' name = 'discussionNum' value='${ discussionNum }'/>" + 
					"<input type ='hidden' name = 'writer' value='${ memId }'/>" +					
	        	 	"<button type='submit' class='btn waves-effect waves-light btn-outline-dark' id='reply_reply_save' name='reply_reply_save'>" +
	        	 	"등록 </button>" +	        	 	 
	        	 	"<button type='button' class='btn waves-effect waves-light btn-outline-dark' id='reply_reply_cancel' name='reply_reply_cancel'>" +
	        	 	"취소 </button>" +
	        	 	"</form>" + 
	        	 "</td>" +
        	 "</tr>";        	 
        	 //console.log(replyEditor);
        	 
        	 var prevTr = $(this).parent().parent().next();
        	 
        	//부모의 부모 다음이 sub이면 마지막 sub 뒤에 붙인다.
            //마지막 리플 처리
            if(prevTr.attr("reply_type") == undefined) {
            	prevTr = $(this).parent().parent();
            } else {
            	while(prevTr.attr("reply_type")=="sub") {//댓글의 다음이 sub면 계속 넘어감
                    prevTr = prevTr.next();
                }
            	
            	//next뒤에 tr이 없다면 마지막이라는 표시를 해주자
            	if(prevTr.attr("reply_type") == undefined) {
                    last_check = true;
                } else {
                    prevTr = prevTr.prev();
                }
            }
        	
            if(last_check){//마지막이라면 제일 마지막 tr 뒤에 댓글 입력을 붙인다.
                $('#reply_area tr:last').after(replyEditor);    
            }else{
                prevTr.after(replyEditor);
            }
	 });
	 
	 //대댓글 입력창 취소
     $(document).on("click","button[name='reply_reply_cancel']",function(){
         $("#reply_add").remove();
         console.log(123123);
         
         status = false;
     });
});
</script>

</head>
<body>

	<!-- <table class="table"> -->
	<div align="center">
		<!-- comment input -->
		<table class="table">
			<tr>
				<td>
				<form method="post" id="reply_write1537116" class="co_write reply_write"
					action="/projectB/discussion/commentInsert.aa">
						<textarea id="reply_content" name="content"
						 style="width:100%;" 
						rows="3" cols="50" placeholder="댓글을 입력하세요."></textarea>
						<br>
						<input type ="hidden" name = "discussionNum" value="${ discussionNum }"/>
						<input type ="hidden" name = "writer" value="${ memId }"/>
						<button type="submit" class="btn waves-effect waves-light btn-outline-dark"
							id="reply_save" name="reply_save">
							댓글 등록
						</button>
					</form>
				</td>
			</tr>
		</table>
		
		<!-- comments -->
		<table class="table" id="reply_area">
			<c:forEach varStatus="status" var = "comment" items = "${ comments }">
				<tr>
					<c:if test="${ comment.depth == 0 }">
						<td style="text-align: left;">
								${ comment.writer }
						</td>
					</c:if>
					<c:if test="${ comment.depth != 0 }">
						<td style="text-align: left;">
								└  ${ comment.writer }
						</td>
					</c:if>
					<td style="text-align: left;">
						${ comment.content }
					</td>
					<c:if test="${ comment.depth == 0 }">
						<td>
							<button type="button" class="btn waves-effect waves-light btn-outline-dark"
								id="reply_reply" name="reply_reply" reply_id = "${ comment.num }">
								댓글 등록
							</button>
						</td>
					</c:if>
					<c:if test="${ comment.depth != 0 }">
						<td></td>
					</c:if>
				</tr>
			</c:forEach>
			<tr>
				<!-- 뒤에 댓글 붙이기 쉽게 선언 -->
				<td colspan="4"></td>
			</tr>
			<!-- 댓글이 들어갈 공간 -->
		</table>
	</div>
	<!-- </table> -->

	<script src="/projectB/resource/bootstrap/assets/libs/jquery/dist/jquery.min.js"></script>
	<script src="/projectB/resource/bootstrap/assets/libs/popper.js/dist/umd/popper.min.js"></script>
	<script src="/projectB/resource/bootstrap/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="/projectB/resource/bootstrap/js/app-style-switcher.js"></script>
	<script src="/projectB/resource/bootstrap/js/feather.min.js"></script>
	<script	src="/projectB/resource/bootstrap/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
	<script	src="/projectB/resource/bootstrap/assets/extra-libs/sparkline/sparkline.js"></script>
	<script src="/projectB/resource/bootstrap/js/sidebarmenu.js"></script>
	<script src="/projectB/resource/bootstrap/js/custom.min.js"></script>
	<script	src="/projectB/resource/bootstrap/assets/libs/raphael/raphael.min.js"></script>
	<script	src="/projectB/resource/bootstrap/assets/libs/morris.js/morris.min.js"></script>
	<script	src="/projectB/resource/bootstrap/js/pages/morris/morris-data.js"></script>

</body>
</html>