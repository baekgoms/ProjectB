<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
	<c:when test="${ check == 1 }">
		<script>
			alert("수정이 완료되었습니다.");
			location.href="/projectB/mypage/modify.aa";
		</script>
	</c:when>
	<c:when test="${ check == 0 }">
		<script>
			alert("비밀번호가 틀렸습니다.");
			history.go(-1);
		</script>
	</c:when>
</c:choose>