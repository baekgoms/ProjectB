<%@page import="projectB.model.login.LoginUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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

<style type="text/css">
.btn-warning {
	color: #212529;
	background-color: #e04643;
	border-color: #e04643;
}

.btn-circle-lg {
	width: 80px;
	height: 80px;
	line-height: 35px;
}

ul {
	list-style: none;
}

.cs_view.cs_vc .cs_comment .co_view .btn.re_com button {
	line-height: 51px;
	letter-spacing: -1px;
	width: 95px;
	top: -6px;
	left: -13px;
	position: relative;
}
/*  .layer {
  position: absolute;
  top: 25%;
  left: 25%;
  width: 1200px;
  margin: -50px 0 0 -50px;
} */
</style>

<script>
	function sendCommentVote(voteState, cmNum, cmvote_state) {
		var writer = '${memId}';
		if (!writer) {
			alert("로그인이 필요합니다.");
			window.location.href = "/projectB/login/loginForm.aa";
			return false;
		}
		//console.log("cmvote_state / " + cmvote_state);
		//console.log("voteState / " + voteState);
		//이건 반대가있을때사용
		if ((cmvote_state > -1) && (cmvote_state != voteState)) {
			alert("이미 공감하셨습니다.");
			return false;			
		}
		
		var intY = document.body.scrollTop;
		setCookie('yPos',intY, 1);
		
		params = new Object();
		params.pageNum = '${pageNum}';
		params.commentPageNum = '${commentPageNum}';
		params.discussionNum = '${article.num}';
		params.commentNum = cmNum;
		params.writer = writer;
		params.state = voteState;
		
		var form = document.createElement('form');
		form.setAttribute('method', 'post');
		form.setAttribute('action', 'commentVote.aa');
		document.charset = "utf-8";
	
		for (var key in params) {
			//console.log("key - " + key + " / val - " + params[key]);
			var hiddenField = document.createElement('input');
			hiddenField.setAttribute('type', 'hidden');
			hiddenField.setAttribute('name', key);
			hiddenField.setAttribute('value', params[key]);
			form.appendChild(hiddenField);
		}
		
		document.body.appendChild(form);
	    form.submit();
	}
	
	
	function replyInsertCheck() {
		var writer = '${memId}';
		if (!writer) {
			alert("로그인이 필요합니다.");
			window.location.href = "/projectB/login/loginForm.aa";
			return false;
		}
		
		//console.log("memId/" + '${memId}');
		//console.log($("#reply_write_content").val());
		if (!$("#reply_write_content").val()  || $("#reply_write_content").val() == "") {
			alert("내용을 입력하세요.");
			return false;
		}
		
		var intY = document.body.scrollTop;
		setCookie('yPos',intY, 1);
		return true;
	}
	function commentInsertCheck(writer) {
		if (!writer) {
			alert("로그인이 필요합니다.");
			window.location.href = "/projectB/login/loginForm.aa";
			return false;
		}
		
		if (!$('#reply_content').val()) {
			alert("내용을 입력하세요.");
			return false;
		}

		var inputRadio = $("input[name='imgState']:checked").val();
		if (!inputRadio) {
			alert("의견을 선택해주세요.");
			return false;
		}
		
		var intY = document.body.scrollTop;
		setCookie('yPos',intY, 1);
		
		return true;
	}

	function voteCheck(discussionNum, voter, voteResult) {
		if (!discussionNum) {
			alert("게시물이 없습니다.");
			return false;
		}

		if (!voter) {
			alert("로그인이 필요합니다.");
			window.location.href = "/projectB/login/loginForm.aa";
			return false;
		}
		if (voteResult != 0) {
			alert("투표는 한번만 가능합니다.");
			return;
		}
		return true;
	}

	function btn_y(discussionNum, voter, voteResult) {
		if (!voteCheck(discussionNum, voter, voteResult)) {
			return;
		}

		update_y(discussionNum, voter);
	}

	function update_y(discussionNum, voter) {
		//alert("찬성 투표 업데이트");
		$.ajax({
			url : "vote_y.aa",
			dataType : "json",
			data : "discussionNum=" + discussionNum + "&writer=" + voter,
			error : function(jqXHR, textStatus, errorThrown) {
				//alert(jqXHR.responseText);
				alert("오류");
			},
			success : function(data) {
				//alert(data);
				if (data == -1) {
					alert("찬성 투표  오류 다시 시도해주세요.");
					location.reload();
				} else if (data == 1) {
					alert("찬성 투표  완료");
					//var intY = document.body.scrollTop;
					//setCookie('yPos',intY, 1);
					location.reload();
				}
			}
		});
	}

	function btn_n(discussionNum, voter, voteResult) {
		if (!voteCheck(discussionNum, voter, voteResult)) {
			return;
		}

		update_n(discussionNum, voter);
	}

	function update_n(discussionNum, voter) {
		//alert("반대 투표 업데이트");
		$.ajax({
			url : "vote_n.aa",
			dataType : "json",
			data : "discussionNum=" + discussionNum + "&writer=" + voter,
			error : function(jqXHR, textStatus, errorThrown) {
				//alert(jqXHR.responseText);
				alert("오류");
			},
			success : function(data) {
				//alert(data);
				if (data == -1) {
					alert("반대 투표  오류 다시 시도해주세요.");
					location.reload();
				} else if (data == 1) {
					alert("반대 투표  완료");
					//var intY = document.body.scrollTop;
					//setCookie('yPos',intY, 1);
					location.reload();
				}
			}
		});
	}

	function btn_movePage(discussionNum, pageIndex, commentPageNum) {
		var url = "content.aa?pageNum=" + pageIndex + "&discussionNum="
				+ discussionNum + "&commentPageNum=" + commentPageNum;

		//댓글 이동 위치바꿀려면, 원하는 태그 ID 넣자
		//var offset = $('#commentPage').offset(); //선택한 태그의 위치를 반환
		var offset = $('#comment_start').offset(); //선택한 태그의 위치를 반환
		setCookie('yPos', offset.top, 1);

		$(location).attr('href', url);
	}

	function setCookie(name, value, exp) {
		var date = new Date();
		date.setTime(date.getTime() + exp * 24 * 60 * 60 * 1000);
		document.cookie = name + '=' + value + ';expires=' + date.toUTCString()
				+ ';path=/';
	}

	function getCookie(name) {
		var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
		return value ? value[2] : null;
	}

	function SetPosition() {
		var strCook = getCookie('yPos');
		if (strCook) {
			console.log(strCook);
			setCookie('yPos', 0, 0);
			$('html, body').animate({
				scrollTop : strCook
			}, 00);
		}
	}

$(document).ready(function(){
	$(document).on("click","button[name='reply_up']",function(){
		alert("추천");
	});
	
	$(document).on("click","button[name='reply_down']",function(){
		alert("반대");
	});
})
$(document).ready(function(){
	var status = false; //수정과 대댓글을 동시에 적용 못하도록
		
	 $(document).on("click","button[name='reply_reply']",function(){
		var writer = '${memId}';
		if (!writer) {
			alert("로그인이 필요합니다.");
			window.location.href = "/projectB/login/loginForm.aa";
			return false;
		}
			
		 if(status){
			 $("#reply_add").remove();
	         status = false;
	         
	         return false;
	     }
	
		 status = true;
	   
		 $("#reply_add").remove();
		 var reply_id = $(this).attr("reply_id");
		 var last_check = false;//마지막 tr 체크
		 //var memId = '${memId}';
		 //console.log("reply_id/" + reply_id);
		 //console.log("memId/" + memId);
		 
	        // console.log("discussionNum/" + '${discussionNum}');
	         var replyEditor = 
	        	 "<tr id='reply_add'>" +
	        	 	"<td></td>" + 
		        	 "<td>" +
		        	 	"<form method = 'post' id='reply_write' class='co_write reply_write' action='commentInsert.aa' onsubmit='return replyInsertCheck()'>" +
		        	 	"<textarea id = 'reply_write_content' name='content' rows='3' cols='50'></textarea>" +
		        	 	"<br>" +
		        	 	"<input type ='hidden' name = 'num' value='" + reply_id + "'/>" +
		        	 	"<input type ='hidden' name = 'discussionNum' value='${ discussionNum }'/>" + 
						"<input type ='hidden' name = 'writer' value='${ memId }'/>" +
						"<input type ='hidden' name = 'pageNum' value='${ pageNum }'/>" +
						"<input type ='hidden' name = 'commentPageNum' value='${ commentPageNum }'/>" +
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
	         status = false;
	     });
});
</script>

</head>

<body onload="SetPosition()">
<%
	String url = "/WEB-INF/views/topbar/top.jsp";
	if(LoginUtils.isAdmin(session)) {
		url = "/WEB-INF/views/topbar/admintopbar.jsp";
	} else if (LoginUtils.isAnswer(session)) {
		url = "/WEB-INF/views/topbar/anwerTopbar.jsp";
	}
%>
	<jsp:include page="<%= url %>" />
	<br><br>
	
	<div class="layer">
	<c:if test = "${ article == null }">
		<div class="text left cb text_wrap motion agenda-body display-idle fadeIn visible"
			data-animation="fadeIn" style="word-break: break-all">
			선택한 게시물은 존재하지 않습니다.			 
		</div>
	</c:if>
	
	<c:if test = "${ article != null }">
	<div class="cs_area">
		<div class="cs_body">
			<div class="wrap">
				<div class="cs_view cs_vc wrap text left re_view">
					<div class="cs_viewhead cw">
						<h3 class="title bold motion fadeInDown visible" data-animation="fadeInDown">
							${ article.subject }
						</h3>
						<div class="motion fadeInUp visible" data-animation="fadeInUp">
							<span> 추천 : 
								<span class="agenda-upvote-count">${ article.agreement }</span>
							</span>
							
							<span>vs</span>
							
							 <span>비추천 : 
								 <span class="agenda-downvote-count">
								 	${ article.opposition }
								 </span>
							 </span>
						</div>
						
						<div class="cs_writer motion text small fadeInRight visible"
							data-animation="fadeInRight">
							<span class="cs_date">${ article.reg }</span>
							<br>
							<span>
								작성자 : ${ article.write }
							</span>
						</div>						
					</div>
					
					<div class="text left cb text_wrap motion agenda-body display-idle fadeIn visible"
						data-animation="fadeIn" style="word-break: break-all">
						<pre style="font-size:14px; font-family: Ubuntu Mono">${article.content}</pre>
						<input type="hidden" name="wv_token" id="wv_token">
					</div>
					
					<!-- Tag -->
					<div>
						<c:forEach var = "tag" items = "${ tags }">
						<button type="button" class="btn waves-effect waves-light btn-rounded btn-outline-dark">
							<c:out value="${tag}" />
						</button>
						</c:forEach>						
					</div>
					
					<!-- btn_yn -->
					<div class="btn_yn" style="position: sticky;">
						<div id="graph" style= "height: 200px"></div>
						
						<button id = "btn_y" type="button" class="btn btn-info btn-circle-lg" 
						onclick="btn_y('${article.num}', '${ memId }', '${ voteResult }')"
							style="position: relative; left: 190px; top: -160px;">
							<i class="fa fa-check"></i>
						</button>
						<button type="button" class="btn btn-danger btn-circle-lg" 
						onclick="btn_n('${article.num}', '${ memId }', '${ voteResult }')"
							style="position: relative; left: 125px; top: -80px;">
							<i class="fa fa-times"></i>
						</button>
					</div>		
					
					<div id ="reportBtm"
					style="float: right; top: -25px; position: relative;">
						<button type="button" class="btn waves-effect waves-light btn-outline-dark">
							신고하기
						</button>
					</div>

					<!-- <table class="table"> -->
					<div align="center">
						<!-- comment input -->
						<table class="table" id = "comment_start">
							<tr>
								<td>
									<form method="post" id="reply_write1537116" class="co_write reply_write"
										action="commentInsert.aa" onsubmit="return commentInsertCheck('${ memId }')">
										<input class="form-check-input" type="radio" name="imgState"
										name="inlineRadioOptions" id="radio_y" value="0"
										style="position: relative; left: 25px">
										<label class="form-check-label" for="inlineRadio1"
										style="position: relative; left: 25px">
											찬성
										</label>
										
										<input class="form-check-input" type="radio"  name="imgState"
										name="inlineRadioOptions" id="radio_n" value="1"
										style="position: relative; left: 50px">
										<label class="form-check-label" for="inlineRadio2"
										style="position: relative; left: 50px">
											반대
										</label>
									
										<textarea id="reply_content" name="content"
											style="width: 100%;" rows="3" cols="50"
											placeholder="댓글을 입력하세요."></textarea>
										
										<br>
										 
										<input type="hidden" name="discussionNum" value="${ discussionNum }" />
										<input type="hidden" name="commentPageNum" value="${ commentPageNum }" />
										<input type="hidden" name="pageNum" value="${ pageNum }" />
										<input type="hidden" name="writer" value="${ memId }" />
										<button type="submit"
											class="btn waves-effect waves-light btn-outline-dark"
											id="reply_save" name="reply_save">
											댓글 등록
										</button>
									</form>
								</td>
							</tr>
						</table>

						<!-- comments -->
						<table class="table" id="reply_area">
							<c:forEach varStatus="status" var="comment" items="${ comments }">
								<tr>
									<td style="text-align: left; width: 10%">
										<c:if test="${ comment.depth == 0 }">
											${ comment.writer }
										</c:if>
										
										<c:if test="${ comment.depth != 0 }">
											└> ${ comment.writer }
										</c:if>
										
										<c:if test="${ comment.imgState != -1 }">
											<c:if test="${ comment.imgState == 0 }">
												<label style="color: blue;">[찬성]</label>												
											</c:if>
												
											<c:if test="${ comment.imgState == 1 }">
												<label style="color: red;">[반대]</label>
											</c:if>
										</c:if>									
									</td>
											
									<td style="text-align: left; width: 50%">${ comment.content }</td>
																		
									<c:set var="cmvote_state" value="-1"/>
									<c:set var="cmvote_up" value="♡"/>
									<c:set var="cmvote_down" value="♡"/>
									<td style= "width: 10%">
									<c:if test="${ comment.depth == 0 }">										
										<button type="button"
											class="btn waves-effect waves-light btn-outline-dark"
											id="reply_reply" name="reply_reply" reply_id="${ comment.num }">
											댓글 등록
										</button>
									<br>									
									</c:if>
									
									<c:forEach var="cmv" items="${ cmvs }">
										<c:if test="${ comment.num == cmv.commentNum }">
											<c:if test="${ cmv.state == 0 }">
												<c:set var="cmvote_up" value="♥"/>
												<c:set var="cmvote_state" value="0"/>
											</c:if>
											
											<c:if test="${ cmv.state == 1 }">
												<c:set var="cmvote_down" value="♥"/>
												<c:set var="cmvote_state" value="1"/>
											</c:if>					
										</c:if>								
									</c:forEach>
									<button type="button" id="comment_up" name="comment_up"
											class="btn waves-effect waves-light btn-outline-dark"
											style="font-size: 10px; border: 0; outline: 0"
											onclick="sendCommentVote(0, '${comment.num}', '${cmvote_state}')">
												추천 ${ comment.up } ${ cmvote_up }
										</button>
											
										<button type="button" id="comment_down" name="comment_down"
											class="btn waves-effect waves-light btn-outline-dark"
											style="font-size: 10px; border: 0; outline: 0"
											onclick="sendCommentVote(1, '${comment.num}', '${cmvote_state}')">
												반대 ${ comment.down } ${ cmvote_down }
										</button>
									</td>
									<!-- <td></td>
									<td></td> -->
									<%-- <c:if test="${ comment.depth != 0 }">
										<td></td>
									</c:if> --%>
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

							<!-- <iframe src="/projectB/discussion/discussionComment.aa"></iframe> -->	
					<%-- <div class="cs_comment">
						<!-- comment input -->
						<c:if test="${ memId != null}">						
						<form method="post" id="co_write" class="co_write"
							action="commentInsert.aa" onsubmit="return commentInsertCheck('${ memId }')">
							<div class="cw_wrap">
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="imgState"
										name="inlineRadioOptions" id="radio_y" value="0">
									<label class="form-check-label" for="inlineRadio1">찬성</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio"  name="imgState"
										name="inlineRadioOptions" id="radio_n" value="1">
									<label class="form-check-label" for="inlineRadio2">반대</label>
								</div>
								<textarea name="content" id="cwd_comentBody"								 	
									placeholder="댓글을 입력해 주세요." required=""></textarea>
							</div>
							<input type ="hidden" name = "discussionNum" value="${ article.num }"/>
							<input type ="hidden" name = "writer" value="${ memId }"/>
							<button type="submit" id="comment_add" style="top: 45px; position: absolute;">
								등록
							</button>
						</form>
						<iframe src="/projectB/petition/petComment.aa?petitionNum=${petDTO.num }"></iframe>
						</c:if>
						<div id = "comment_start">
						
						<table class="table">
							<!-- <tr>
								<th scope="col" style="width: 80px; text-align: left;">작성자</th>
								<th scope="col" style="width: 300px; text-align: left;">내용</th>
							</tr> -->
							<c:forEach varStatus="status" var = "comment" items = "${ comments }">
								<tr>
									<td style="width: 80px; text-align: left;"
									data-toggle="collapse" data-target="#collapseExample${ status.index }" aria-expanded="false" aria-controls="collapseExample">
										${ comment.writer }
									</td>
									
									<td style="width: 80px;"
									data-toggle="collapse" data-target="#collapseExample${ status.index }" aria-expanded="false" aria-controls="collapseExample">
										<c:if test="${ comment.imgState == 0 }">
											<img src="/projectB/resource/bootstrap/assets/images/custom-select.png">
										</c:if>
										
										<c:if test="${ comment.imgState == 1 }">
											<img src="/projectB/resource/bootstrap/assets/images/logo-light-text.png">
										</c:if>		
									</td>
									
									<td style="text-align: left;"
									data-toggle="collapse" data-target="#collapseExample${ status.index }" aria-expanded="false" aria-controls="collapseExample">
										${ comment.content }
									</td>
									
									<td>
										<button type="button" class="btn waves-effect waves-light btn-outline-dark"
										data-toggle="collapse" data-target="#collapseExample${ status.index }" aria-expanded="false" aria-controls="collapseExample">
											댓글 달기
										</button>
										<div class="collapse" id="collapseExample${ status.index }" style="">
										<div class="co_r_reply" style="display: block; top: 20px; position: relative;">
											<form method="post" id="reply_write1537116" class="co_write reply_write"
												action="commentInsert.aa">
												<div class="cw_wrap">
													<label class="hide" for="cwd_comentBody571854">댓글입력</label>
													<textarea name="content" id="cwd_comentBody571854"
														placeholder="댓글을 입력해 주세요." required=""></textarea>
												</div>
												<input type ="hidden" name = "discussionNum" value="${ article.num }"/>
												<input type ="hidden" name = "num" value="${ comment.num }"/>
												<input type ="hidden" name = "writer" value="${ memId }"/>
												<button type="submit" class="reply_btn" data-id="" style="top: 52px; position: absolute;">
													등록
												</button>
											</form>
										</div>
									</div>
									</td>									
								</tr>								
							</c:forEach>
						</table>
							<label>댓글 목록</label>
							<c:forEach varStatus="status" var = "comment" items = "${ comments }">
							<c:if test="${ comment.grouping == 0 }">									
								<div id = "comment_${ comment.num }" class="co_view co_v1${ comment.num }">
									<span class="">
										${ comment.writer }
										<c:if test="${ comment.imgState == 0 }">
											<img src="/projectB/resource/bootstrap/assets/images/custom-select.png">
										</c:if>
										
										<c:if test="${ comment.imgState == 1 }">
											<img src="/projectB/resource/bootstrap/assets/images/logo-light-text.png">
										</c:if>										
									</span>
									<div class="co_text display-idle">
										${ comment.content }
									</div>
									
									<div id ="reportBtn">
										<c:if test="${ memId != comment.writer }">
											<button type="button" class="btn waves-effect waves-light btn-outline-dark"								
											style="position: relative; top: 15px; width: 80px; height: 25px;font-size: 5px;">
												신고하기
											</button>
										</c:if>
										
										<c:if test="${ memId == comment.writer }">		
											<button type="button" class="btn waves-effect waves-light btn-outline-dark"
												style="position: relative; top: 15px; width: 80px; height: 25px;font-size: 5px;">
													삭제
											</button>
										</c:if>
										
										
									</div>	
									
									<span class="btn small display-idle re_com">
										<button type="button" class="btn waves-effect waves-light btn-outline-dark"
										data-toggle="collapse" data-target="#collapseExample${ status.index }" aria-expanded="false" aria-controls="collapseExample">
											댓글 달기
										</button>
									</span>
									<div class="collapse" id="collapseExample${ status.index }" style="">
										<div id="co_r_reply1537116" class="co_r_reply" style="display: block; top: 20px; position: relative;">
											<form method="post" id="reply_write1537116" class="co_write reply_write"
												action="commentInsert.aa">
												<div class="cw_wrap">
													<label class="hide" for="cwd_comentBody571854">댓글입력</label>
													<textarea name="content" id="cwd_comentBody571854"
														placeholder="댓글을 입력해 주세요." required=""></textarea>
												</div>
												<input type ="hidden" name = "discussionNum" value="${ article.num }"/>
												<input type ="hidden" name = "num" value="${ comment.num }"/>
												<input type ="hidden" name = "writer" value="${ memId }"/>
												<button type="submit" class="reply_btn" data-id="" style="top: 52px; position: absolute;">
													등록
												</button>
											</form>
										</div>
									</div>
																		
 									<div id="co_r_reply1537116" class="co_r_reply" style="display: block; top: 20px; position: relative;">
											<span class="">
												${ comment.writer }
												<c:if test="${ comment.imgState == 0 }">
													<img src="/projectB/resource/bootstrap/assets/images/custom-select.png">
												</c:if>
												
												<c:if test="${ comment.imgState == 1 }">
													<img src="/projectB/resource/bootstrap/assets/images/logo-light-text.png">
												</c:if>										
											</span>
											<div class="co_text display-idle">
												${ comment.content }
											</div>
										</div>	
														
								</div>
								</c:if>
							</c:forEach>
						</div>--%>
						<c:if test="${ commentCount > 0 }">						
							<ul id = "commentPage" class="pagination justify-content-center">
								<!-- << -->
								<c:if test="${ startPageIndex > 10 }">
									<li class="page-item">
										<button class="page-link" onclick="btn_movePage('${ article.num }', '${ pageNum }', '${ startPageIndex - 10 }')">
											«
										</button>
									</li>
								</c:if>
								
								<c:forEach var="i" begin="${ startPageIndex }" end="${ endPageIndex }">
									<li class="page-item">
										<%-- <a class="page-link"  href="/projectB/discussion/content.aa?pageNum=${i}&discussionNum=${ article.num }">
											${i}
										</a> --%>
										<button class="page-link"
										onclick="btn_movePage('${ article.num }', '${ pageNum }', '${ i }')">
											${i}
										</button>
									</li>
								</c:forEach>
								
								<!-- >> -->								
								<c:if test="${ endPageIndex < pageTotalCount }">
									<li class="page-item">
										<button class="page-link" onclick="btn_movePage('${ article.num }', '${ pageNum }', '${ startPageIndex + 10 }')">
											»
										</button>
									</li>
								</c:if>
							</ul>
						</c:if>
					</div> 
				</div>
			</div>
		</div>
		</c:if>
	</div>
	
	
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
	<script>	
		Morris.Donut({
			element : 'graph',
			data : [ {
				label : "찬성",
				value : '${ article.agreement }'
			}, {
				label : "반대",
				value : '${ article.opposition }'
			} ],
			resize : true,
			colors : [ '#5f76e8', '#e04643' ]
		});		
	</script>

</body>
