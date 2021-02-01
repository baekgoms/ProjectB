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
	<!-- Custom CSS -->
	<link href="/projectB/resource/bootstrap/css/style.css" rel="stylesheet">
	<!-- This Page CSS -->
	<link href="/projectB/resource/assets/libs/morris.js/morris.css" rel="stylesheet">
   <link rel="stylesheet" type="text/css" href="/projectB/resource/petition/petition.css">
   <script type="text/javascript" src="/projectB/resource/bootstrap/assets/libs/chart.js/dist/Chart.min.js"></script>
   <script src="https://d3js.org/d3.v2.js"></script>
   <script src="/projectB/resource/bootstrap/assets/libs/jquery/dist/jquery.min.js"></script>
  
  
   <style>
	iframe {
         width: 100%;
         border: none;
         height: 700px;
         margin: 20px auto;
      }

   </style>

   <title>답변 보기</title>
</head>

<body>

<iframe src="/projectB/petition/petContent.aa?num=${petitionDTO.num}&commentYn=N" style="display: block; width: 100vw; height: 100vh;"></iframe>


</body>
</html>      