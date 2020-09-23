<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
.container{
margin-bottom:50px;
margin-top:80px;
}

</style>
<title>회원가입</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script type="text/javascript">

function signUpValidation(){
	
	var member_UserId = $("#member_UserId").val();
	var member_Name = $("#member_Name").val();
	var member_Pwd = $("#member_Pwd").val();
	var passwordCheck = $("#passwordCheck").val();
	var member_Nicname = $("#member_Nicname").val();
	var member_Email = $("#member_Email").val();
	
	if(!member_UserId){
		alert("아이디 입력은 필수입니다.");
		$("#member_UserId").focus();
	}else if(!member_Name) {
		alert("이름 입력은 필수입니다.");
		$("#member_Name").focus();
	}else if(!member_Pwd){
		alert("비밀번호 입력은 필수입니다.");
		$("#member_Pwd").focus();
	}else if(!passwordCheck){
		alert("비밀번호 확인 입력은 필수입니다.");
		$("#passwordCheck").focus();
	}else if(member_Pwd != passwordCheck){
		alert("비밀번호가 맞지 않습니다.");
		$("#member_Pwd").focus();	
	}else if(!member_Nicname){
		alert("닉네임 입력은 필수입니다.");
		$("#member_Nicname").focus();
	}else if(!member_Email){
		alert("이메일 입력은 필수입니다.");
		$("#member_Email").focus();
	}else {
		signUp();
	}
	
}

function existId(){
	var member_UserId = $("#member_UserId").val();
	var oMsg = $('#idMsg');
	
	$.ajax({
		url: "/user/checkUserId.do",
		method: "POST",
		data: {member_UserId:member_UserId},
		success: function(data){
			if(data == "success"){
				showErrorMsg(oMsg, "이미 사용중이거나 탈퇴한 회원의 아이디입니다.");
				userIdFlag = false;
			}else{
				showErrorMsg(oMsg, "사용 가능한 아이디 입니다.");
				oMsg.css('color', 'green');
				userIdFlag = true;
			}
		}
		
	});
}

function showErrorMsg(oMsg, msg){
	oMsg.attr('style', '');
	oMsg.text(msg);
}



function signUp(){
	
	$.ajax({
		
		url : "/user/signUp.do",
		type:'POST',
		data :  $("#registerform").serialize(),
		success:function(data){
			if(data == 1){
				alert("회원가입이 완료됐습니다");
				location.href = "/user/loginPage.do";
			}else if(data == 2){
				alert("회원가입이 실패했습니다.");
				return false;
			}
		}
		
	})
}

$(document).ready(function(){
	if(${ signUpFail != null }){
		alert('${signUpFail}');
	}
});

</script>
</head>
<body>
<c:import url="../common/menubar.jsp"/>

<div class="container" >
	<form id="registerform" style="margin-left:380px;">
        <div class="fieldlabel"><label for="member_UserId">*아이디</label></div>
        <div class="formfield"><input type="text" id="member_UserId" name="member_UserId" maxlength="20" value="" class="form-control" style="width:400px;"><input type="button" style="margin-top:10px;margin-bottom:10px;" onclick="existId()" value="ID중복확인" class="btn btn-primary"><div class="error_box" id="idMsg" style="display: none;"></div></div>
        
        <div class="fieldlabel"><label for="member_Name">*이름</label></div>
        <div class="formfield"><input type="text" style="width:400px;" id="member_Name" name="member_Name" maxlength="20" autocomplete="off" class="form-control">
</div>

        <div class="fieldlabel"><label for="member_Pwd">*패스워드</label></div>
        <div class="formfield"><input type="password" style="width:400px;" id="member_Pwd" name="member_Pwd" maxlength="20" autocomplete="off" class="form-control">
</div>

        <div class="fieldlabel"><label for="passwordCheck">패스워드확인</label></div>
        <div class="formfield"><input type="password" style="width:400px;" id="passwordCheck" name="passwordCheck" maxlength="20" autocomplete="off" class="form-control">
</div>
       
        <div class="fieldlabel"><label for="member_Nicname">*닉네임</label></div>
        <div class="formfield"><input type="text" style="width:400px;" id="member_Nicname" name="member_Nicname" maxlength="20" value="" class="form-control"></div>

        <div class="fieldlabel"><label for="member_Email">*이메일</label></div>
        <div class="formfield"><input type="text" style="width:400px;" id="member_Email" name="member_Email" size="20" maxlength="20" class="form-control"
             value="" autocomplete="off"><p>@</p>
            <input id="domain" style="width:400px;" list="domains" name="domain" placeholder="도메인입력/선택" class="form-control" >
            <datalist id="domains">
                <option value="naver.com">
                <option value="daum.net">
                <option value="gmail.com">
                <option value="yahoo.co.kr">
            </datalist>
        </div>
       
        <div class="btnfield">
            <input type="button" style="margin-top:10px;margin-bottom:10px;" onclick="signUpValidation()" value="회원가입" class="btn btn-primary" >
        </div>
    </form>
</div>
    
    
    <footer id="footer">
		<div id="footer_box">
			<%@ include file="../common/footer.jsp" %>
		</div>
	</footer>

</body>
</html>