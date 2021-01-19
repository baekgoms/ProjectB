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
/* .layer {
  position: absolute;
  top: 25%;
  left: 25%;
  width: 1200px;
  margin: -50px 0 0 -50px;
} */
</style>

<script>
function voteCheck(discussionNum, voter, voteResult){
	if(!discussionNum){
		alert("게시물이 없습니다.");
		return false;
	}
	
	if(!voter){
		alert("로그인이 필요합니다.");
		return false;
	}
	if(voteResult != 0){
		alert("투표는 한번만 가능합니다.");
		return;
	}
	return true;
}

function btn_y(discussionNum, voter, voteResult){
	if(!voteCheck(discussionNum, voter, voteResult)){
		return;
	}
	
	update_y(discussionNum, voter);
}

function update_y(discussionNum, voter){
	//alert("찬성 투표 업데이트");
	$.ajax({
		 url : "vote_y.aa",       
         dataType : "json",   
         data : "discussionNum=" + discussionNum + "&writer="+voter,
         error: function(jqXHR, textStatus, errorThrown) {
             //alert(jqXHR.responseText);
        	 alert("오류");
         },
         success : function(data) {
        	 //alert(data);
              if(data == -1){
            	  alert("찬성 투표  오류 다시 시도해주세요.");
            	  location.reload();
             }
             else if(data == 1){                  
               	alert("찬성 투표  완료");               
               	location.reload();
             }
         }
	});
}

function btn_n(discussionNum, voter, voteResult){
	if(!voteCheck(discussionNum, voter, voteResult)){
		return;
	}
	
	update_n(discussionNum, voter);
}

function update_n(discussionNum, voter){
	//alert("반대 투표 업데이트");
	$.ajax({
		 url : "vote_n.aa",       
         dataType : "json",   
         data : "discussionNum=" + discussionNum + "&writer="+voter,
         error: function(jqXHR, textStatus, errorThrown) {
             //alert(jqXHR.responseText);
        	 alert("오류");
         },
         success : function(data) {
        	 //alert(data);
              if(data == -1){
            	  alert("반대 투표  오류 다시 시도해주세요.");
            	  location.reload();
             }
             else if(data == 1){                  
               	alert("반대 투표  완료");               
               	location.reload();
             }
         }
	});
}
</script>
</head>

<body>
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
						${ article.content }
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
							style="position: relative; left: 210px; top: -200;">
							<i class="fa fa-check"></i>
						</button>
						<button type="button" class="btn btn-danger btn-circle-lg" 
						onclick="btn_n('${article.num}', '${ memId }', '${ voteResult }')"
							style="position: relative; left: 125px; top: -80;">
							<i class="fa fa-times"></i>
						</button>
						

					</div>					
					<br>				
	
					
					<div class="cs_comment">
						<!-- comment input -->
						<form method="post" id="co_write" class="co_write"
							action="" onsubmit="return false">
							<div class="cw_wrap">
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio"
										name="inlineRadioOptions" id="radio_y" value="1">
									<label class="form-check-label" for="inlineRadio1">찬성</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio"
										name="inlineRadioOptions" id="radio_n" value="2">
									<label class="form-check-label" for="inlineRadio2">반대</label>
								</div>
								<textarea name="commentbody" id="cwd_comentBody"
									placeholder="댓글을 입력해 주세요." required=""></textarea>
							</div>
							<button type="submit" id="comment_add" style="top: 45px; position: absolute;">
								등록
							</button>
						</form>
						
						<div>
							<label>댓글 목록</label>
							<c:forEach var = "comment" items = "${ comments }">							
								<div class="co_view co_v1">
									<span class="">
										${ comment.write }
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
									<span class="btn small display-idle re_com">
										<button type="button" class="btn waves-effect waves-light btn-outline-dark">
											삭제
										</button>
									</span>
									<%-- <span class="btn small display-idle re_com">
										<button type="button" class="btn waves-effect waves-light btn-outline-dark" data-toggle="collapse" data-target="#collapseExample${ i }" aria-expanded="false" aria-controls="collapseExample">
											댓글 달기
										</button>
									</span>
									<div class="collapse" id="collapseExample${ i }" style="">
										<div id="co_r_reply1537116" class="co_r_reply" style="display: block; top: 20px; position: relative;">
											<form method="post" id="reply_write1537116"
												class="co_write reply_write" action="" onsubmit="return false">
												<div class="cw_wrap">
													<label class="hide" for="cwd_comentBody571854">댓글입력</label>
													<textarea name="body" id="cwd_comentBody571854"
														placeholder="댓글을 입력해 주세요." required=""></textarea>
												</div>
												<button type="submit" class="reply_btn" data-id="" style="top: 52px; position: absolute;">
													등록
												</button>
											</form>
										</div>
									</div> --%>
									<!-- <br>
									<div class="co_text display-idle">
										1의견 내용 샬라샬라샬라샤랄라라라라라라
									</div>		
									<div class="co_text display-idle">
										2의견 내용 샬라샬라샬라샤랄라라라라라라
									</div>		 -->
								</div>
							</c:forEach>
						</div>				
					</div>
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
