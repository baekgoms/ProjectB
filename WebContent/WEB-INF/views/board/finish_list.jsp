<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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

<title>Insert title here</title>
</head>
<body>
<%String strURL ="https://www.youtube.com/embed/-2FH8bq06mw";%>
<br />
<br />
<form name="form" method="post">
<table cellSpacing=1 cellPadding=1 width="1200" border=1 align="center" >
<tr>
<td  align="center"> <a href="/projectB/petition/ing_list.aa">진행중인 청원</a></td>
<td  align="center"> <a href="/projectB/petition/finish_list.aa">완료된 청원</a></td>
</tr>
</table>
<br />
<table cellSpacing=1 cellPadding=1 width="1200" border=1 align="center">
<tr>
<td align="center" width="400"><a href="/projectB/petition/finish_list.aa">답변된 청원</a></td>
<td align="center" width="400"><a href="/projectB/petition/waiting_list.aa">답변 대기중인 청원</a></td>
<td align="center" width="400"><a href="/projectB/petition/timeout_list.aa">기간이 만료된 청원</a></td>
</tr>
</table>
<br />
<br />

<div class="table-responsive">
 <table class="table" >
  
  <tbody>

    <tr>
    	<td colspan ="4">청원번호<br /> <br /> 
    		제목<br /><br /> <br /> 
    		시작일- 마감일- 인원-답변일
    	 </td>
    	<td align="center"> 
			<iframe width="300" height="200" src="<%= strURL %>" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		</td>
	</tr>

    <tr>
    	<td colspan ="4">청원번호<br /> <br /> 
    		제목<br /><br /> <br /> 
    		시작일- 마감일- 인원-답변일
    	 </td>
    	<td align="center"> 
			<iframe width="300" height="200" src="<%= strURL %>" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		</td>
	</tr>
	
	     <tr>
    	<td colspan ="4">청원번호<br /> <br /> 
    		제목<br /><br /> <br /> 
    		시작일- 마감일- 인원-답변일
    	 </td>
    	<td align="center"> 
			<iframe width="300" height="200" src="<%= strURL %>" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		</td>
	</tr>
    
    
          <tr>
    	<td colspan ="4">청원번호<br /> <br /> 
    		제목<br /><br /> <br /> 
    		시작일- 마감일- 인원-답변일
    	 </td>
    	<td align="center"> 
			<iframe width="300" height="200" src="<%= strURL %>" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		</td>
	</tr>


   </tbody>
  </table>
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