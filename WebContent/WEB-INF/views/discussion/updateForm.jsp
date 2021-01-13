<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<form method="post" name="updateform" action="/projectB/discussion/updatePro.aa?pageNum=${pageNum}&num=${num}" >

<table>
<tr>
<td>
제목
</td>
<td>
<input type="text" name="subject">
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
<input type="submit" value="수정">  
<input type="reset" value="내용지우기">
<input type="button" value="취소" OnClick="window.location='/projectB/discussion/main.aa?pageNum=${pageNum}'">
</form>