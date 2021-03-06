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
<td width="200">전체</td> <td width="200">정치개혁</td> <td width="200">외교/통일/국방</td> <td width="200">일자리</td> <td width="200">미래</td> <td width="200">성장동력</td> <br />
</tr>
<tr>
<td>농산어촌</td> <td>보건복지</td> <td>육아교육</td> <td>안전환경</td> <td>저출산/고령화대책</td> <td>행정</td> <br />
</tr>
<tr>
<td>교통/건축/국토</td> <td>경제민주화</td> <td>인권/성평등</td> <td>문화/예술/체육/언론</td> <td>반려동물</td> <td>기타</td>
</tr>
<tr>
<td colspan ="6" align="right">
<select name="option">
	<option value="">조회순</option>
	<option value="">동의순</option>
</select>
</td>
</tr>
</table>
<br />
<br />

<div class="table-responsive">
 <table class="table" >
   <thead>
   <tr>
   <td colspan ="5" align="right">
        <button type="button" class="btn waves-effect waves-light btn-outline-dark">지금 청원하기</button>
	</td>
   </tr>
   <tr>
   <td colspan ="5" align="lift" border=1>청원 목록</td>
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
                                
<input type="text" name="keyword" id="keyword"><button type="submit" class="btn waves-effect waves-light btn-outline-dark" value="검색">


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