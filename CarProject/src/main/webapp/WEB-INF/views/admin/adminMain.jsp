<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<c:import url="/WEB-INF/views/common/menubar.jsp"/>

<div class="container" >
<div class="row" >

<div class="col-lg-3" style="margin-top : 50px;">

<div class="list-group">
  <a href="/user/admin.do" class="list-group-item active">회원 리스트</a>
</div>
</div>
<div style="margin-top : 50px;">
  <h2>회원 리스트  </h2>            
  <table class="table table-hover">
    <thead>
      <tr>
        <th>회원 아이디</th>
        <th>회원 닉네임</th>
        <th>회원 이메일</th>
        <th>회원 가입일</th>
        <th>회원 탈퇴일</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach items="${getAllUser }" var="getAllUser" varStatus="idx">
      <tr>
        <td>${getAllUser.member_UserId }</td>
        <td>${getAllUser.member_Nicname }</td>
        <td>${getAllUser.member_Email }</td>
        <td>${getAllUser.member_In }</td>
        <td>${getAllUser.member_Out }</td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
  </div>
</div>

</div>

<c:import url="/WEB-INF/views/common/footer.jsp"/>		
</body>
</html>