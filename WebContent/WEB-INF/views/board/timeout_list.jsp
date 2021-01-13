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

<br />
<br />
<form name="form" method="post">
<table cellSpacing=1 cellPadding=1 width="1200" border=1 align="center" >
<tr>
<td  align="center"> <a href="/projectB/board/ing_list.aa">진행중인 청원</a></td>
<td  align="center"> <a href="/projectB/board/finish_list.aa">완료된 청원</a></td>
</tr>
</table>
<br />
<table cellSpacing=1 cellPadding=1 width="1200" border=1 align="center">
<tr>
<td align="center" width="400"><a href="/projectB/board/finish_list.aa">답변된 청원</a></td>
<td align="center" width="400"><a href="/projectB/board/waiting_list.aa">답변 대기중인 청원</a></td>
<td align="center" width="400"><a href="/projectB/board/timeout_list.aa">기간이 만료된 청원</a></td>
</tr>
</table>
<br />
<br />

<div class="table-responsive">
 <table class="table" >
   <thead>

   <tr>
   <td colspan ="5" align="lift" border=1>기간이 만료된 청원</td>
   </tr>
    <tr>
   		<th scope="col">글번호</th>
    	<th scope="col">분류</th>
    	<th scope="col">제목</th>
    	<th scope="col">청원만료일</th>
    	<th scope="col">참여인원</th>
    </tr>
  </thead>
  <tbody>
    <tr>
   		<th scope="row">1</th>
        	<td>의료보건</td>
            <td>제목</td>
            <td>만료일</td>
            <td>동의수</td>
    </tr>
        <tr>
   		<th scope="row">2</th>
        	<td>의료보건</td>
            <td>제목</td>
            <td>만료일</td>
            <td>동의수</td>
    </tr>
        <tr>
   		<th scope="row">3</th>
        	<td>의료보건</td>
            <td>제목</td>
            <td>만료일</td>
            <td>동의수</td>
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