<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script type="text/javascript">
<c:import url="common/menubar.jsp"/>
function signUpValidation(){
	
	var userId = $("#member_UserId").val();
	var userPw = $("#member_Pwd").val();
	var userPwCheck = $("#passwordCheck").val();
	var nickName = $("#member_Nicname").val();
	var email = $("#member_Email").val();
	
	if(!member_UserId){
		alert("아이디 입력은 필수입니다.");
		$("#member_UserId").focus();
	}else if(!member_Pwd){
		alert("비밀번호 입력은 필수입니다.");
		$("#member_Pwd").focus();
	}else if(!userPwCheck){
		alert("비밀번호 확인 입력은 필수입니다.");
		$("#passwordCheck").focus();
	}else if(member_Pwd != userPwCheck){
		alert("비밀번호가 맞지 않습니다.");
		$("#member_Pwd").focus();		
	}else if(!member_Nicname){
		alert("닉네임 입력은 필수입니다.");
		$("#member_Nicname").focus();
	}else if(!member_Email){
		alert("이메일 입력은 필수입니다.");
		$("#member_Email").focus();
	}else {
		signUp()
	}
	
}

function signUp(){
	
	$.ajax({
		
		url : "/jquery/signUp",
		type:'POST',
		data :  $("#registerform").serialize(),
		success:function(data){
			if(data == 1){
				alert("회원가입이 완료됐습니다/");
				location.href = "/user/login"
			}else if(data == 2){
				alert("이미 존재하는 아이디입니다.");
				return false;
			}else if(data == 3){
				alert("이미 존재하는 닉네임입니다.");
				return false;
			}
		}
		
	})
}

</script>
</head>
<body style="background-color:#f0f5f3">
<form id="registerform">
        <div class="fieldlabel"><label for="member_UserId">*아이디</label></div>
        <div class="formfield"><input type="text" id="member_UserId" name="member_UserId" maxlength="20" value=""></div>
        
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
</body>
</html>