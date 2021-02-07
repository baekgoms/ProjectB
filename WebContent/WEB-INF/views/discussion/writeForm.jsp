<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- Custom CSS -->
<link href="/projectB/resource/bootstrap/css/style.css" rel="stylesheet">
<!-- This Page CSS -->
<link rel="stylesheet" type="text/css" href="/projectB/resource/assets/extra-libs/prism/prism.css">
    
<form method="post" name="writeform" action="/projectB/discussion/writePro.aa?pageNum=${pageNum}">

<table>
<tr>
<td>제목</td>
<td>
<input type="text" class="form-control" id="nametext" aria-describedby="name" placeholder="제목">
</td>
</tr>

<tr>
<td>
태그
</td>
<td>
<input type="text" name="tag1"> <input type="text" name="tag2"> <input type="text" name="tag3">
</td>
</tr>

<tr>
<td>
내용
</td>
<td>
<textarea name="content" rows="13" cols="40"></textarea>
</td>
</tr>

</table>
<input type="submit" value="등록">  
<input type="reset" value="내용지우기">
<input type="button" value="취소" OnClick="window.location='/projectB/discussion/main.aa?pageNum=${pageNum}'">
</form>
