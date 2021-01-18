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
</style>

</head>

<body>
	<div class="cs_area">
		<div class="cs_body">
			<div class="wrap">
				<div class="cs_view cs_vc wrap text left re_view">
					<div class="cs_viewhead cw">
						<h2 class="sound_only">토론방 토론글 상세</h2>
						<h3 class="title bold motion fadeInDown visible"
							data-animation="fadeInDown">국민들 분노 文 부부 둘만 살텐데, 퇴임후 사저 6평으로
							해달라" 국민청원</h3>
						<div class="motion fadeInUp visible" data-animation="fadeInUp">
							<span>추천 : <span class="agenda-upvote-count">2,393</span></span>
							<span>vs</span> <span>비추천 : <span
								class="agenda-downvote-count">65</span></span>
						</div>
						
						<div class="cs_writer motion text small fadeInRight visible"
							data-animation="fadeInRight">
							<span class="cs_date">2020-12-12 21:33:28</span> <span>작성자
								: naver - ***</span>
						</div>						
					</div>
					<div
						class="text left cb text_wrap motion agenda-body display-idle fadeIn visible"
						data-animation="fadeIn" style="word-break: break-all">
						12일 오전 청와대 국민청원 게시판에는 "대통령이 13평 임대주택에 가서 부부가 애 둘 키우고 반려동물까지 키울 수
						있겠다는 말을 했다고 한다"며 "대통령이 애를 키우는 것도 아니고 두 부부만 함께 살테니 퇴임 후 사저 크기는 6평으로
						충분하다고 생각한다"고 적었다.<br> 이 청원은 문 대통령이 지난 11일 경기 화성 동탄신도시에 있는
						행복주택단지를 찾았다가 방 2개가 있는 13평형 넓이의 임대주택에서 "신혼부부에 아이 1명이 표준이고, 어린아이 같은
						경우에는 2명도 가능하겠다"고 한 말을 비판한 것으로 보인다.<br> <br> 당시 문 대통령은
						임대주택을 둘러보며 "공간 배치가 진짜 아늑하다"고 말하기도 했다.<br> <br> 해당 발언을 두고
						비판 여론이 이어지자 청와대는 “문 대통령은 ‘(거주 인원은) 신혼부부에 아이 1명이 표준이고, 어린아이 같은 경우에는
						2명도 가능하겠다’고 ‘질문’을 한 것”이라며, 대통령의 말이 질문임은 변 사장이 바로 다음에 ‘네’라고 답변한
						것에서도 알 수 있다”는 해명을 내놨다.<br> <br> 그러나 청원글 작성자는 "청와대는 이 말을
						대통령이 한 게 아니라 질문했고, 국토부 장관인 변 장관이 대답한 거라고 해명하는데 그 사람도 대통령이 임명한 사람이니
						상관없는 것 아니냐"면서 "자신과 장관의 발언에 책임지고 솔선수범하는 모습을 보여주시기 바란다"고 주장했다<br>
						<br> 글쓴이가 누구인지 몰라도 분통이 터졌나보네 청원까지 <input type="hidden"
							name="wv_token" id="wv_token">
					</div>
					
					<!-- Tag -->
					<div>
						<button type="button"
							class="btn waves-effect waves-light btn-rounded btn-outline-dark">
							태그1</button>

						<button type="button"
							class="btn waves-effect waves-light btn-rounded btn-outline-dark">
							태그2</button>

						<button type="button"
							class="btn waves-effect waves-light btn-rounded btn-outline-dark">
							태그3</button>

						<button type="button"
							class="btn waves-effect waves-light btn-rounded btn-outline-dark">
							태그4</button>

						<button type="button"
							class="btn waves-effect waves-light btn-rounded btn-outline-dark">
							태그5</button>
					</div>
					
					<!-- btn_yn -->
					<div class="btn_yn" style="position: sticky;">
						<div id="graph" style= "height: 200px"></div>
						
						<button type="button" class="btn btn-info btn-circle-lg"
							style="position: relative; left: 210px; top: -200;">
							<i class="fa fa-check"></i>
						</button>
						<button type="button" class="btn btn-danger btn-circle-lg"
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
										name="inlineRadioOptions" id="radio_y" value="option1">
									<label class="form-check-label" for="inlineRadio1">찬성</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio"
										name="inlineRadioOptions" id="radio_n" value="option2">
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
							<c:forEach var="i" begin="0" end="3">								
								<div class="co_view co_v1">
									<span class="">
										백승환님은
										<c:if test="${ true }">
											<img src="/projectB/resource/bootstrap/assets/images/custom-select.png">
										</c:if>
										
										<c:if test="${ false }">
											<img src="/projectB/resource/bootstrap/assets/images/logo-light-text.png">
										</c:if>										
									</span>
									<div class="co_text display-idle">
										의견 내용 샬라샬라샬라샤랄라라라라라라
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
				value : 2393
			}, {
				label : "반대",
				value : 265
			} ],
			resize : true,
			colors : [ '#5f76e8', '#e04643' ]
		});
	</script>

</body>
