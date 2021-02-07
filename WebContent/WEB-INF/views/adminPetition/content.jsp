<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "java.util.Date" %>


<!DOCTYPE html>
<html>
<head>
   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <meta name="description" content="">
   <meta name="author" content="">
   <link rel="icon" type="image/png" sizes="16x16" href="/projectB/resource/bootstrap/assets/images/favicon.png">
   <link href="/projectB/resource/bootstrap/css/style.min.css" rel="stylesheet">
   <link rel="stylesheet" type="text/css" href="/projectB/resource/bootstrap/assets/extra-libs/prism/prism.css">
   <link rel="stylesheet" type="text/css" href="/projectB/resource/bootstrap/assets/libs/chart.js/dist/Chart.min.css">
   <script type="text/javascript" src="/projectB/resource/bootstrap/assets/libs/chart.js/dist/Chart.min.js"></script>
   <style>
      body {
         text-align: center;
      }
     

   </style>

   <title>청원 상세 보기</title>
</head>

<body>
<jsp:include page="/WEB-INF/views/topbar/admintopbar.jsp" />
<br/><br/><br/><br/>

<div>
<br>
<input type="hidden" name="num" value="${petitionDTO.num}" />
   	<table cellspacing="0" cellpadding="0" align="center" width="900" border=1>
   	
      	<tr height="40">
      		<td align="center" width="200" style="background-color:#D8D8D8;color:#000000" >카테고리</td>
        	<td align="center"  colspan="4" width="800" style="background-color:#D8D8D8;color:#000000">청원제목</td>
        	<td align="center" width="200" style="background-color:#D8D8D8;color:#000000">참여인원 </td>
		</tr>
      	<tr height="70">
      		<td align="center" width="200">${categoryName}</td>
        	<td align="center"  colspan="4" width="800">${petitionDTO.title}</td>
        	<td align="center" width="200">${petitionDTO.petition} 명</td>
		</tr>
 
 
 		<tr height="40">
        	<td align="center" width="200" style="background-color:#BDBDBD;color:#fff">청원상태</td>
        	<td align="center" width="200" style="background-color:#BDBDBD;color:#fff">청원시작</td>
        	<td align="center" width="200" style="background-color:#BDBDBD;color:#fff">청원마감</td>
			<td align="center" width="200" style="background-color:#BDBDBD;color:#fff">청원인</td>
			<td align="center" width="200" style="background-color:#BDBDBD;color:#fff">신고수</td>
			<td align="center" width="200" style="background-color:#BDBDBD;color:#fff">공개여부</td>
    	</tr>
    	<tr height="70">
        	<td align="center" width="200">${petitionState}</td>
        	<td align="center" width="200" ><fmt:formatDate value="${petitionDTO.startDate}"
            	            					pattern = "yyyy-MM-dd" />
        	</td>
        	<td align="center" width="200"><fmt:formatDate value="${petitionDTO.endDate}"
                	        					pattern = "yyyy-MM-dd" /></td>
			<td align="center" width="200">${petitionDTO.writer}</td>
			<td align="center" width="200">${petitionDTO.report}</td>
			<td align="center" width="200">
				<c:if test="${petitionDTO.open == 0}">
					공개</c:if>
				<c:if test="${petitionDTO.open == 1}">
					비공개</c:if>		
			</td>
    	</tr>
		

		<tr height="40">
        	<td align="center" colspan="6" width="1200" style="background-color:#BDBDBD;color:#000000">내용 </td>
        </tr>
        <tr>
         	<td align="left" colspan="6" width="1200"><br/>
         	<pre style="font-family: Ubuntu Mono">${petitionDTO.content}</pre><br/></td>
      	</tr>
      	<tr height="40">
        	<td align="center" width="200" style="background-color:#5f76e8;color:#fff"> 태그 </td>
         	<td width="1000" align="left" width="600" colspan="5">
            	<c:forEach items="${fn:split(petitionDTO.tag, ',') }" var="item">
               		<a href="/projectB/petition/tag?tag=${item}" 
                		aria-haspopup="true">#${item}</a>
            	</c:forEach>
         	</td>
      	</tr>
  
      	<tr height="40">
        	<td align="center" width="200" style="background-color:#5f76e8;color:#fff">관련 링크</td>
        	<td width="1000" align="left" width="600" colspan="5" >
            	<c:forEach items="${fn:split(petitionDTO.link, ',') }" var="item">
               		<a href="${item}" target="_blank">${item}</a>
               		<br/>
            	</c:forEach>
         	</td>
      	</tr>
   </table>
<br/>

<div >
<center>
	<c:if test="${petitionDTO.open == '0'}">
		<input type="button" class="btn waves-effect waves-light btn-outline-dark" align="center" value="비공개"
		onclick="document.location.href='/projectB/adminPetition/changeClose.aa?num=${petitionDTO.num}'">
	</c:if>
	
	<c:if test="${petitionDTO.open == '1'}">
		<input  type="button" class="btn waves-effect waves-light btn-outline-dark" align="center" value="공개"
		onclick="document.location.href='/projectB/adminPetition/changeOpen.aa?num=${petitionDTO.num}'">
	</c:if>
	
	<input  type="button" class="btn waves-effect waves-light btn-outline-dark" align="center" value="수정하기"
	onclick="document.location.href='/projectB/adminPetition/contentUpdate.aa?num=${petitionDTO.num}'">
	                  	
	<input  type="button" class="btn waves-effect waves-light btn-outline-dark" align="center" value="목록보기"
	onclick="document.location.href='/projectB/adminpetition.======.aa?num=${petitionDTO.num}'">      	      	
</center>
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
<script src="/projectB/resource/bootstrap/assets/extra-libs/prism/prism.js"></script>


</body>
</html>      