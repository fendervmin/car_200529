<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
.container{
margin-bottom:70px;
margin-top:80px;
}
</style>
<title>로그인</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

 
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

<c:import url="/WEB-INF/views/common/menubar.jsp"/>

	<div class="container">
		<form class="signUp" id="signupForm" method="post" style="margin-left:380px;">
         <div class="form-group">
            <label for="member_UserId">아이디:</label>
            <input type="text"
               id="member_UserId" name="member_UserId" class="form-control"
               placeholder="ID" autofocus onkeyup="enterKeyCheck()" style="width:300px;">
         </div>
         <div class="form-group">
            <label for="member_Pwd">비밀번호:</label>
            <input type="password"
               id="member_Pwd" name="member_Pwd" class="form-control"
               placeholder="Password" onkeyup="enterKeyCheck()" style="width:300px;">
         </div>
         <div class="form-group form-check">
            <label class="form-check-label"> 
            <input class="form-check-input" type="checkbox" name="remember"> 이 정보를 저장하겠습니다.
            </label>
         </div>
         <input type="button" value="로그인" onclick="loginValidation()" class="btn btn-primary"> 
         <input type="button" value="회원가입" onclick="location.href='/user/signUpPage.do'" class="btn btn-primary">
         <input type="button" value="아이디/비밀번호찾기" onclick="location.href='/user/userSearchPage.do'" class="btn btn-primary">
      </form>
	</div>
	
	<c:import url="/WEB-INF/views/common/footer.jsp"/>

</body>
