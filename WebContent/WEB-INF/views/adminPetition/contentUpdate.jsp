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
	#title{
		text-align: center;
	    height: 100%;
	    width: 100%;
	    border: none;	
	}
	#content{
	    width: 100%;
	    height: 400px;
	    border: none;
	}
   </style>

   <title>청원 상세 보기</title>
</head>

<body>
<div>
<br>

<form action="/projectB/adminPetition/contentUpdatePro.aa" method="POST">
	<input type="hidden" name="num" value="${petitionDTO.num}" />

   	<table cellspacing="0" cellpadding="0" align="center" width="900" border=1>
      	<tr height="40">
      		<td align="center" width="200" style="background-color:#E1E1E1;color:#7C8798" >카테고리</td>
        	<td align="center"  colspan="4" width="800" style="background-color:#E1E1E1;color:#7C8798">청원제목</td>
        	<td align="center" width="200" style="background-color:#E1E1E1;color:#7C8798">참여인원 </td>
		</tr>
      	<tr height="70">
      		<td align="center" width="200">${categoryName}</td>
        	<td align="center"  colspan="4" width="800"> 

        		<input type="text" id="title" name="title" value="${petitionDTO.title}" autocomplete="off">

        	</td>
        	<td align="center" width="200">${petitionDTO.petition} 명</td>
		</tr>
 
 
 		<tr height="40">
        	<td align="center" width="200" style="background-color:#E1E1E1;color:#7C8798">청원상태</td>
        	<td align="center" width="200" style="background-color:#E1E1E1;color:#7C8798">청원시작</td>
        	<td align="center" width="200" style="background-color:#E1E1E1;color:#7C8798">청원마감</td>
			<td align="center" width="200" style="background-color:#E1E1E1;color:#7C8798">청원인</td>
			<td align="center" width="200" style="background-color:#E1E1E1;color:#7C8798">신고수</td>
			<td align="center" width="200" style="background-color:#E1E1E1;color:#7C8798">공개여부</td>
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
        	<td align="center" colspan="6" width="1200" style="background-color:#E1E1E1;color:#7C8798">내용 </td>
        </tr>
        <tr>
         	<td align="left" colspan="6" width="1200">
         		<textarea name="content" id="content">${petitionDTO.content}</textarea>
         	</td>
      	</tr>
      	<tr height="40">
        	<td align="center" width="200" style="background-color:#E1E1E1;color:#7C8798"> 태그 </td>
         	<td width="1000" align="left" width="600" colspan="5">
            	<c:forEach items="${fn:split(petitionDTO.tag, ',') }" var="item">
               		<a href="/projectB/petition/tag?tag=${item}" 
                		aria-haspopup="true">#${item}</a>
            	</c:forEach>
         	</td>
      	</tr>
  
      	<tr height="40">
        	<td align="center" width="200" style="background-color:#E1E1E1;color:#7C8798">관련 링크</td>
        	<td width="1000" align="left" width="600" colspan="5" >
            	<c:forEach items="${fn:split(petitionDTO.link, ',') }" var="item">
               		<a href="${item}" target="_blank">${item}</a>
               		<br/>
            	</c:forEach>
         	</td>
      	</tr>
   </table>

<div>
				
	<input type="submit" class="btn waves-effect waves-light btn-outline-dark" align="center" value="수정 하기">
	                  	
	<input type="button" class="btn waves-effect waves-light btn-outline-dark" align="center" value="취소"
	onclick="document.location.href='/projectB/adminPetition/content.aa?num=${petitionDTO.num}'">      	      	

</div>	

</form>


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