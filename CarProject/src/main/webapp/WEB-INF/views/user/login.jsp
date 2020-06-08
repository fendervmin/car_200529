<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> 
<c:import url="../common/menubar.jsp"/>

<script type="text/javascript">
$(document).ready(function(){
   if(${ loginFail != null }){
      alert('${loginFail}');
   }
});

function loginValidation(){
   
   var userId = $("#member_UserId").val();
   var password = $("#member_Pwd").val();
   
   if(!userId){
      alert("아이디를 입력하세요.");
      $("#member_UserId").focus();
      return false;
   }else if(!password){
      alert("비밀번호를 입력하세요.");
      $("#member_Pwd").focus();
      return false;
   }else {
      $('#signupForm').attr('action', '/user/login.do').submit();
   }
   
}

function enterKeyCheck(){
   
 if(event.keyCode == 13)
     {
    loginValidation();
     }
}
</script>
</head>
<body>
<form class="signUp" id="signupForm" method="post">
   <h1 class="signUpTitle">로그인</h1>
   <input type="text" id="member_UserId" name="member_UserId" class="signUpInput" placeholder="ID" autofocus onkeyup="enterKeyCheck()">
   <input type="password" id="member_Pwd" name="member_Pwd" class="signUpInput" placeholder="Password" onkeyup="enterKeyCheck()">
   <input type="button" value="로그인" onclick="loginValidation()" class="loginButton">
   <input type="button" value="회원가입" onclick="location.href='/user/signUp'" class="signUpButton">
   <input type="button" value="아이디/비밀번호찾기" onclick="location.href='/user/userSearch'" class="userSearchButton">
   
</form>
</body>
