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

<div align="center">
<input type="button" value="							진행중인 청원							" class="btn waves-effect waves-light btn-outline-dark"
	onclick="document.location.href='/projectB/petition/afootPetition.aa'" >
<input type="button" value="							완료된 청원								" class="btn waves-effect waves-light btn-outline-dark"
	onclick="document.location.href='/projectB/petition/finish_list.aa'" >
</div>

<br />

<div align="center">
<input type="button" value="				답변된 청원				" class="btn waves-effect waves-light btn-outline-dark"
	onclick="document.location.href='/projectB/petition/finish_list.aa'" >
<input type="button" value="				답변 대기중인 청원				" class="btn waves-effect waves-light btn-outline-dark"
	onclick="document.location.href='/projectB/petition/standbyPetition.aa'" >
<input type="button" value="			기간이 만료된 청원				" class="btn waves-effect waves-light btn-outline-dark"
	onclick="document.location.href='/projectB/petition/terminationPetition.aa'" >
</div>
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