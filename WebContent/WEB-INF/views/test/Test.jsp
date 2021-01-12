<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%
	String strURL = "https://www.youtube.com/embed/hI-re1cnuPs";
	//embed/뒷주소 동일 여기 주소만 가져오면댐
	//https://www.youtube.com/embed/SjP82elMIxg
	//https://youtu.be/SjP82elMIxg
%>
	<h1>video Testing . . .</h1>
	<!-- 유튭꺼 걍 가져오면되네... -->
	<iframe width="800" height="400" src="<%= strURL %>" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	<h1>video Testing . . .</h1>
	
</body>
</html>
<!-- commit테스트해보기  -->
<%
	System.out.println("어거 어렵다...");
%>