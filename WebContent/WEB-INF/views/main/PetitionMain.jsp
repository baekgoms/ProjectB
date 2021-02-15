<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<!-- Custom CSS -->
<link href="/projectB/resource/bootstrap/css/style.css" rel="stylesheet">
<!-- This Page CSS -->
<link href="/projectB/resource/assets/libs/morris.js/morris.css" rel="stylesheet">
<title>청원메인페이지</title>

<style>
     
      .jb-600 {
        font-weight: 600;
      }

 
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/topbar/top.jsp" />
<br>
<br>
<div align="center">
	<table style="text-align: center;">
	<br>
	<br>
	
		<%-- <tr>
			<td colspan="2" align="right">
				<c:choose>
					<c:when test ="${memId == null}">
								<button type="button"class="btn waves-effect waves-light btn-outline-dark"
								onclick="document.location.href='/projectB/login/loginForm.aa'" >로그인 </button>
								<button type="button"class="btn waves-effect waves-light btn-outline-dark"
								onclick="document.location.href='/projectB/petitioner/signUp.aa'" >회원가입 </button>
					</c:when>
					<c:when test ="${memId != null}">
						${memId}님 환영합니다.
								<button type="button" class="btn waves-effect waves-light btn-outline-dark">내 정보 보기</button>
					</c:when>
				</c:choose>		
				<hr>
			</td>
		</tr> --%>
		
	</table>
	</div>
	
<div align="center">
	<table style="text-align: center;">
		<tr>
			<td width="1500" colspan="2"><br>
				<div class="table-responsive">
                	<table class="table" style="text-align: center;">
                	<h3><font color="#295f9e">청와대의 직접 소통</font>은</h3><br>
					<h2><font color="#112057">'국민이 물으면 정부가 답한다'</font>는 철학을 지향합니다.</h2>
					<br>
					<br>
					<br>
					<h5>국정 현안 관련, 국민들 다수의 목소리가 모여<br>
					30일 동안 100명 이상 추천 청원에 대해서는<br>
					<font color="#295f9e">정부 및 청와대 책임자(각 부처 및 기관의 장, 대통령 수석·비서관, 보좌관 등)가</font> 답하겠습니다.</h5>
					<br>
					<button type="button" class="btn waves-effect waves-light btn-outline-dark"
					onClick="document.location.href='/projectB/petition/upload.aa'">지금 청원하러 가기</button>
           
					</table>
				</div>
			</td>
		</tr>
	
		<tr>
			<td width="750"><br>
				<div class="table-responsive">
                	<table class="table">
                    	 <tr>
                        	<th scope="col" colspan="2"><h3 class="jb-600">마감임박 청원</h3></th>
                         </tr>
                         <tr>
                         	<th scope="col">제목</th>
                            <th scope="col">종료일</th>
   						</tr>
                        <c:forEach var="enddate" items="${enddateList}" begin="0" end="5" step="1" varStatus="status">
	                        <tr>
	                        	<td>
	                            	<a href ="/projectB/petition/petContent.aa?num=${enddate.num}">${enddate.title}</a>
	                            </td>
	                            <td>
	                            	<font color="red"><fmt:formatDate value="${enddate.endDate}" pattern = "yyyy-MM-dd" /></font>
	                            </td>
	                        </tr>
                        </c:forEach>
					</table>
				</div>
			</td>
			
			<td width="750"><br>
				<div class="table-responsive">
	                	<table class="table">
	                    	 <tr>
	                        	<th scope="col" colspan="2"><h3 class="jb-600">동의수 높은 청원</h3></th>
	                         </tr>
	                         <tr>
	                         	<th scope="col">제목</th>
	                            <th scope="col">동의수</th>
	   						</tr>
	                        <c:forEach var="petition" items="${petitionList}" begin="0" end="5" step="1" varStatus="status">
		                        <tr>
		                        	<td>
		                            	<a href ="/projectB/petition/petContent.aa?num=${petition.num}">${petition.title}</a>
		                            </td>
		                            <td>
		                            	<font color="red"><fmt:formatNumber value="${petition.petition}" pattern="#,###" /></font>
		                            </td>
		                        </tr>
	                        </c:forEach>
						</table>
					</div>
			</td>
		</tr>
		
		<tr>
			<td width="750"><br>
				<div class="table-responsive">
                	<table class="table">
                     	<tr>
                        	<th scope="col"><h3 class="jb-600">추가답변 원해요</h3></th>
                        </tr>
                        <tr>
                           	<th scope="col">제목</th>
	                        <th scope="col">동의수</th>
                        </tr>
                        <c:if test="${ count > 0 }">
							<c:forEach var="article" items="${articleList}" begin="0" end="5" step="1" varStatus="status">
								<tr>
                                	<td>
	                                	<a href ="/projectB/petition/petContent.aa?num=${article.num}">${article.title}</a><br>
									</td>
									<td>
		                            	<font color="red"><fmt:formatNumber value="${article.petition}" pattern="#,###" /></font>
		                            </td>
								</tr>
							</c:forEach>
						</c:if>
					</table>
                  </div>
				</td>
				<td width="750"><br>
					<div class="table-responsive">
	                	<table class="table">
	                    	<tr>
	                           <th scope="col"><h3 class="jb-600">가장 많이 사용된 태그</h3></th>
	                        </tr>
	                       	<c:forEach var="tag" items="${tagList}" begin="0" end="5" step="1" varStatus="status">
	                        <tr>
	                             <td> ${tag.name} </td>
							</tr>
	                        </c:forEach>
	                     </table>
	                </div>
				</td>
		</tr>
	<br>
	<br>
	</table>
	<iframe src="/projectB/qan/qna.aa"
	style="position: relative; float: right;"></iframe>
</div>

<script src="/projectB/resource/bootstrap/assets/libs/jquery/dist/jquery.min.js"></script>
<script src="/projectB/resource/bootstrap/assets/libs/popper.js/dist/umd/popper.min.js"></script>
<script src="/projectB/resource/bootstrap/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="/projectB/resource/bootstrap/js/app-style-switcher.js"></script>
<script src="/projectB/resource/bootstrap/js/feather.min.js"></script>
<script src="/projectB/resource/bootstrap/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
<script src="/projectB/resource/bootstrap/assets/extra-libs/sparkline/sparkline.js"></script>
<script src="/projectB/resource/bootstrap/js/sidebarmenu.js"></script>
<script src="/projectB/resource/bootstrap/js/custom.min.js"></script>
<script src="/projectB/resource/bootstrap/assets/libs/raphael/raphael.min.js"></script>
<script src="/projectB/resource/bootstrap/assets/libs/morris.js/morris.min.js"></script>
<script src="/projectB/resource/bootstrap/js/pages/morris/morris-data.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>


</body>
</html>