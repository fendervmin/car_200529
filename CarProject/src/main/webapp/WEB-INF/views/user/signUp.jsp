<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> 
</head>
<body style="background-color:#f0f5f3">
<c:import url="../common/menubar.jsp"/>
<form id="registerform">
        <div class="fieldlabel"><label for="member_UserId">*아이디</label></div>
        <div class="formfield"><input type="text" id="member_UserId" name="member_UserId" maxlength="20" value=""><input type="button" onclick="existId()" value="ID중복확인"><div class="error_box" id="idMsg" style="display: none;"></div></div>
        
        <div class="fieldlabel"><label for="member_Name">*이름</label></div>
        <div class="formfield"><input type="text" id="member_Name" name="member_Name" maxlength="20" autocomplete="off">
</div>

        <div class="fieldlabel"><label for="member_Pwd">*패스워드</label></div>
        <div class="formfield"><input type="password" id="member_Pwd" name="member_Pwd" maxlength="20" autocomplete="off">
</div>

        <div class="fieldlabel"><label for="passwordCheck">패스워드확인</label></div>
        <div class="formfield"><input type="password" id="passwordCheck" name="passwordCheck" maxlength="20" autocomplete="off">
</div>
       
        <div class="fieldlabel"><label for="member_Nicname">*닉네임</label></div>
        <div class="formfield"><input type="text" id="member_Nicname" name="member_Nicname" maxlength="20" value=""></div>

        <div class="fieldlabel"><label for="member_Email">*이메일</label></div>
        <div class="formfield"><input type="text" id="member_Email" name="member_Email" size="20" maxlength="20" 
             value="" autocomplete="off"><span>@</span>
            <input id="domain" list="domains" name="domain" placeholder="도메인입력/선택">
            <datalist id="domains">
                <option value="naver.com">
                <option value="daum.net">
                <option value="gmail.com">
                <option value="yahoo.co.kr">
            </datalist>
        </div>
       
        <div class="btnfield">
            <input type="button" onclick="signUpValidation()" value="회원가입">
        </div>
    </form>
    
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
</body>
</html>