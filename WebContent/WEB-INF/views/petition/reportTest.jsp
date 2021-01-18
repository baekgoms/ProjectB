<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function openReport(form){
	
	
	url = "declareArticle.aa?num=" + form.id.value;
	
	open(url, "confirm", 
    "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=600, height=400");
}
</script>
</head>
<body>
<form id="form" name="dd" >
<input type="hidden" id="id" name="id" value="846">
<input type="button" name="report" value="신고하기" Onclick="openReport(this.form)"> 

</form>



</body>
</html>