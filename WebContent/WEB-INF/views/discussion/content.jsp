<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
-토론 상세페이지

  신고버튼
  댓글창
     - 전체 댓글의 찬성/반대 내용을 도넛그래프로 표시
     - 찬/반 선택하고 댓글내용 입력
  댓글리스트
     - **님의 '찬/반' 의견 작성일
       내용  
       추천/반대 버튼
       신고버튼
-->

<table width="700">
<tr width="200">
<td>제목</td>
</tr>
<tr>
<td>찬성수 1: 반대수1</td>
</tr>
<tr>
<td>2020-02-31, 작성자 :id</td>
</tr>
<tr>
<td>내용</td>
</tr>
</table>
<input type="button" value="신고">
<input type="button" value="찬성">
<input type="button" value="반대">
<br />
<form method="post" name="commentWriteForm" action="/projectB/discussion/commentWritePro.aa">
<input type="radio" name="agreement" value="0">찬성
<input type="radio" name="agreement" value="1">반대
<input type="text" class="form-control" id="comment" aria-describedby="name" placeholder="댓글을 입력해주세요">

<input type="hidden" id="bNum" value="${num}">
<input type="submit" value="댓글 입력" >
</form>


<input type="button" value="수정" OnClick="window.location='/projectB/discussion/updateForm.aa?pageNum=${pageNum}&num=${num}'">
<input type="button" value="삭제" OnClick="window.location='/projectB/discussion/deletePro.aa?pageNum=${pageNum}&num=${num}'">
<input type="button" value="목록" OnClick="window.location='/projectB/discussion/main.aa?pageNum=${pageNum}'">
