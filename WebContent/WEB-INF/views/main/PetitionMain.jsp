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
	<table width="1300" style="text-align: center;">
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
		<tr>
			<td width="650"><br>
				<div class="table-responsive">
                	<table class="table">
                     	<tr>
                        	<th scope="col"><h3 class="jb-600">추가답변 원해요</h3></th>
                        </tr>
                        <tr>
                           	<th scope="col">제목</th>
                        </tr>
                        <c:if test="${ count > 0 }">
							<c:forEach var="article" items="${articleList}" begin="0" end="5" step="1" varStatus="status">
								<tr>
                                	<td>
	                                	<a href ="projectB/petition/petContent.aa?num=${article.num}">${article.title}</a><br>
									</td>
								</tr>
							</c:forEach>
						</c:if>
					</table>
                  </div>
				</td>
				<td width="650"><br>
					<div class="table-responsive">
	                	<table class="table">
	                    	<tr>
	                           <th scope="col"><h3 class="jb-600">가장 많이 사용된 태그</h3></th>
	                        </tr>
	                       	<c:forEach var="tagList" items="${tagList}" begin="0" end="5" step="1" varStatus="status">
	                        <tr>
	                             <td> ${tagList} </td>
							</tr>
	                        </c:forEach>
	                     </table>
	                </div>
				</td>
		</tr>
	</table>
	</div>
<div align="center">
	<table width="1300" style="text-align: center;">
	<br>
	<br>
		<tr>
			<td width="650"><br>
				<div class="table-responsive">
                	<table class="table">
                    	 <tr>
                        	<th scope="col" colspan="2"><h3 class="jb-600">마감임박 청원</h3></th>
                         </tr>
                         <tr>
                         	<th scope="col">제목</th>
                            <th scope="col">청원 종료일</th>
   						</tr>
                        <c:forEach var="enddate" items="${enddateList}" begin="0" end="5" step="1" varStatus="status">
	                        <tr>
	                        	<td>
	                            	<a href ="projectB/petition/petContent.aa?num=${enddate.num}">${enddate.title}</a>
	                            </td>
	                            <td>
	                            	<font color="red"><fmt:formatDate value="${enddate.endDate}" pattern = "yyyy-MM-dd" /></font>
	                            </td>
	                        </tr>
                        </c:forEach>
					</table>
				</div>
			</td>
			
			<td width="650"><br>
				<div class="table-responsive">
	                	<table class="table">
	                    	 <tr>
	                        	<th scope="col" colspan="2"><h3 class="jb-600">동의수 높은 청원</h3></th>
	                         </tr>
	                         <tr>
	                         	<th scope="col">제목</th>
	                            <th scope="col">청원 동의수</th>
	   						</tr>
	                        <c:forEach var="petition" items="${petitionList}" begin="0" end="5" step="1" varStatus="status">
		                        <tr>
		                        	<td>
		                            	<a href ="projectB/petition/petContent.aa?num=${petition.num}">${petition.title}</a>
		                            </td>
		                            <td>
		                            	<font color="red">${petition.petition}</font>
		                            </td>
		                        </tr>
	                        </c:forEach>
						</table>
					</div>
			</td>
		</tr>
	<br>
	<br>
	</table>
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