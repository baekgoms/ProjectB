<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<!-- Custom CSS -->
<link href="/projectB/resource/bootstrap/css/style.css" rel="stylesheet">
<link href="/projectB/resource/bootstrap/css/style.min.css"
   rel="stylesheet">
<!-- This Page CSS -->
<link
   href="/projectB/resource/bootstrap/assets/libs/morris.js/morris.css"
   rel="stylesheet">
<link href="/projectB/resource/bootstrap/css/discussion.css"
   rel="stylesheet">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>admin petitioner</title>
<style>
a:visited {
   color: green;
   text-decoration: none;
}
</style>

<script type="text/javascript">
   function selectAll() {
      var chkbox = document.getElementsByName("member_checkbox");
      for (var i = 0; i < chkbox.length; i++) {
         chkbox[i].checked = true;
      }
   }

   function selectDel() {
      var chkbox = document.getElementsByName("member_checkbox");
      var str = "";
      for (var i = 0; i < chkbox.length; i++) {
         if (chkbox[i].checked) {
            str = str + chkbox[i].value + ",";
         }
      }

      var form = document.createElement('form');
      form.setAttribute('method', 'post');
      form.setAttribute('action', 'selectAnswerDel.aa');
      document.charset = "utf-8";
      var hiddenField = document.createElement("input");
      hiddenField.setAttribute('type', 'hidden');
      hiddenField.setAttribute('name', 'selects');
      hiddenField.setAttribute('value', str);
      form.appendChild(hiddenField);

      document.body.appendChild(form);
      form.submit();
   }
   function openSignup() {
	  var url = "/projectB/admin/signUp.aa";
      open(url,"Mail","toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, width=1000, height=600");
   }
</script>
</head>
<body>
   <jsp:include page="/WEB-INF/views/topbar/admintopbar.jsp" />
   <br>
   <br>
   <br>
   <br>

   <div class="card">
      <div class="card-body">
         <input type="button" value="회원 관리" class="btn waves-effect waves-light btn-outline-dark"
            onclick="document.location.href='/projectB/admin/petitioner.aa'">
         <input type="button" value="블랙리스트 관리" class="btn waves-effect waves-light btn-outline-dark"   
            onclick="document.location.href='/projectB/admin/petitionerblack.aa'">
            <input type="button" value="답변자 관리" class="btn waves-effect waves-light btn-outline-dark"   
            onclick="document.location.href='/projectB/admin/answers.aa'">
            
         
         <!-- <div style="width: 300px; float: left;">
         <input type="text" class="form-control" name="keyword" id="keyword" placeholder="검색어를 입력하세요."/>
            <button type="button" class="btn waves-effect waves-light btn-outline-dark" onClick="inputCheck()"
            style="float: left;">
               검색
            </button>
         </div> -->
         <%-- <select class="form-control" id="exampleFormControlSelect1" style="width: 150px; float: right;"
            onchange = "selectOption(this)">
            <option value="1" <c:if test="${ '1' == sort }">selected</c:if>>전체(최신순)</option>
            <option value="2" <c:if test="${ '2' == sort }">selected</c:if>>최신순</option>
            <option value="3" <c:if test="${ '3' == sort }">selected</c:if>>신고순</option>
         </select> --%>
         
         <input type="button" value="답변자 생성" class="btn waves-effect waves-light btn-outline-dark"   
            onclick="openSignup()" style="float: right;">
      </div>
      
      
      <div class="table-responsive">
         <table class="table">
            <thead class="thead-light">
               <tr>
                  <th scope="col">
                     #
                  </th>
                  <th scope="col">ID</th>
                  <th scope="col">이름</th>
                  <!-- <th scope="col">성별</th> -->
                  <!-- <th scope="col">생년월일</th> -->
                  <th scope="col">연락처</th>
                  <th scope="col">이메일</th>
                  <th scope="col">부서</th>
                  <!-- <th scope="col">회원 상태</th> -->
                  <!-- <th scope="col">가입일</th> -->
                  <!-- <th scope="col"> 차단마감일 </th> -->
               </tr>
            </thead>
            <tbody>
                
               <c:forEach var = "petitioner" items="${ petitioners }" varStatus="status">
                  <tr>
                      <th scope="row">
                      <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" name = "member_checkbox"
                           id="customCheck_${ status.index }" value = "${ petitioner.num }"/> 
                        <label class="custom-control-label" for="customCheck_${ status.index }"></label>
                     </div>
                     </th>
                     <td>
                        <a href="javascript:openNewWindow('/projectB/admin/memberDetail.aa?num=${ petitioner.num }')"> 
                           ${ petitioner.id }
                        </a>
                     </td>
                     <td>${ petitioner.name }</td>
                     <%-- <td>${ petitioner.gender }</td> --%>
                     <%-- <td>${ petitioner.birthday }</td> --%>
                     <td>${ petitioner.contact }</td>
                     <td>${ petitioner.email }</td>
                     <td>${ petitioner.department }</td>
                     <%-- <td>
                        <c:if test="${ petitioner.state == 6 }">
                          	 답변자
                        </c:if>
                        <c:if test="${ petitioner.state == 7 }">
                         	 관리자
                        </c:if>
                     </td> --%>
                     <%-- <td>${ petitioner.reg }</td> --%>
                     <!-- <td>
                        <script type="text/javascript">
                           var dt = new Date();
                           var blockReg = '${ petitioner.blockReg }';
                           var blockDt = new Date(blockReg);
                           
                           var nowYear = dt.getFullYear();
                           var blockYear = blockDt.getFullYear();
                           
                           if (nowYear <= blockYear) {
                              document.write(blockReg)
                           }
                        </script>
                     </td> -->
                  </tr>
                </c:forEach>
            </tbody>            
         </table>
      </div>
   </div>
   
   <div>
      <button class="btn waves-effect waves-light btn-outline-dark"
         onclick="selectAll()">
         전체 선택
      </button>
      
      <button class="btn waves-effect waves-light btn-outline-dark"
         onclick="selectDel()">
         선택 삭제
      </button>
   </div>


   <c:if test="${ petitionerCount > 0 }">
      <ul id="commentPage" class="pagination justify-content-center">
         <!-- << -->
         <c:if test="${ startPageIndex > 10 }">
            <li class="page-item">
               <button class="page-link" onclick="document.location.href='petitioner.aa?pageNum=${ startPageIndex - 10 }&sort=${ sort }'">
                  «
               </button>
            </li>
         </c:if>

         <c:forEach var="i" begin="${ startPageIndex }"
            end="${ endPageIndex }">
            <li class="page-item">               
               <button class="page-link" onclick="document.location.href='petitioner.aa?pageNum=${ i }&sort=${ sort }'">
                  ${i}
               </button>
            </li>
         </c:forEach>

         <!-- >> -->
         <c:if test="${ endPageIndex < pageTotalCount }">
            <li class="page-item">
               <button class="page-link" onclick="document.location.href='petitioner.aa?pageNum=${ startPageIndex + 10 }&sort=${ sort }'">
                  »
               </button>
            </li>
         </c:if>
      </ul>
   </c:if>

   <!--  부트스트랩 js 사용 -->
   <script
      src="/projectB/resource/bootstrap/assets/libs/jquery/dist/jquery.min.js"></script>
   <!-- Bootstrap tether Core JavaScript -->
   <script
      src="/projectB/resource/bootstrap/assets/libs/popper.js/dist/umd/popper.min.js"></script>
   <script
      src="/projectB/resource/bootstrap/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
   <!-- apps -->
   <!-- apps -->
   <script src="/projectB/resource/bootstrap/js/app-style-switcher.js"></script>
   <script src="/projectB/resource/bootstrap/js/feather.min.js"></script>
   <!-- slimscrollbar scrollbar JavaScript -->
   <script
      src="/projectB/resource/bootstrap/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
   <script
      src="/projectB/resource/bootstrap/assets/extra-libs/sparkline/sparkline.js"></script>
   <!--Wave Effects -->
   <!-- themejs -->
   <!--Menu sidebar -->
   <script src="/projectB/resource/bootstrap/js/sidebarmenu.js"></script>
   <!--Custom JavaScript -->
   <script src="/projectB/resource/bootstrap/js/custom.min.js"></script>

</body>
</html>