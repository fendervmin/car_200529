<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> 
<c:import url="../common/menubar.jsp"/>
<body>
<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<div class="w3-center w3-large w3-margin-top">
				<h3>My Page</h3>
			</div>
			<div style="margin-bottom: 10px;"
					class="custom-control custom-radio custom-control-inline">
					<input type="radio" class="custom-control-input" id="search_1" name="search_total" onclick="search_check(1)" checked="checked">
					<label class="custom-control-label font-weight-bold text-white"	for="search_1">회원정보 변경</label>
				</div>
				<div class="custom-control custom-radio custom-control-inline">
					<input type="radio" class="custom-control-input" id="search_2" name="search_total" onclick="search_check(2)"> 
					<label class="custom-control-label font-weight-bold text-white" for="search_2">비밀번호 변경</label>
				</div>
			<div id="modify">
				<form id="myForm" action="../member/update_mypage.do" method="post">
					<p>
						<label>ID</label> 
						<input class="w3-input" type="text" id="member_UserId" name="member_UserId" value="${ memverVO.member_UserId}" readonly> 
					</p>
					<p>
						<label>Name</label> 
						<input class="w3-input" type="text" id="member_Name" name="member_Name" value="${ memberVO.member_Name }" required>
						<input type="button" value="수정" value="location.href='/user/lModify'" class="modifyButton"> 
					</p>
					<p>
						<label>Email</label> 
						<input class="w3-input" type="text" id="member_Email" name="member_Email" value="${ memberVO.member_Email }" required>
						<input type="button" value="수정" value="location.href='/user/Modify'" class="modifyButton">  
					<p>
						<label>Nickname</label> 
						<input class="w3-input" type="text" id="member_Nicname" name="member_Nicname" value="${ memberVO.member_Nicname }"required> 
						<input type="button" value="수정" value="location.href='/user/Modify'" class="modifyButton"> 
					</p>
					<p>
						<label>이메일 수신</label> 
						<input type="radio" name="email" value="동의">동의
						<input type="radio" name="email" value="비동의">비동의
					</p>
					<p>
						<input type="button" value="정보수정" value="location.href='/user/modify'" class="modifyButton">
						<input type="button" value="취소" onclick="history.back(-1);">
						<input type="button" value="회원탈퇴" value="location.href='/user/out'" class="outButton">
					</p>
				<div id="modifyPwd" style="display: none;">
					<p>
						<label>비밀번호</label> 
						<input class="w3-input" type="password" id="member_Pwd" name="member_Pwd" required> 
						<input type="button" value="수정" value="location.href='/user/pwdModify'" class="pwdmodifyButton"> 
					</p>
					<p>
						<label>비밀번호 확인</label> 
						<input class="w3-input" type="password" id="passwordCheck" name="passwordCheck" required> 
						<input type="button" value="수정" value="location.href='/user/pwdModify'" class="pwdmodifyButton"> 
					</p>
					<p>
						<input type="button" value="정보수정" value="location.href='/user/modify'" class="modifyButton">
						<input type="button" value="취소" onclick="history.back(-1);">
						<input type="button" value="회원탈퇴" value="location.href='/user/out'" class="outButton">
					</p>
				</div>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">

function search_check(num) {
	if (num == '1') {
		document.getElementById("modifyPwd").style.display = "none";
		document.getElementById("modify").style.display = "";	
	} else {
		document.getElementById("modify").style.display = "none";
		document.getElementById("modifyPwd").style.display = "";
	}
}

function existmodify() {
	var member_Name = $("member_Name").val();
	var member_Email = $("member_Email").val();
	var member_Nicname = $("member_Nicname").val();
	
	$.ajax({
		url: "/user/modify.do",
		method: "POST",
		data: {member_Name:member_Name, member_Email:member_Email, member_Nicname:member_Nicname},
		sucess: function(data) {
			if(data == 1) {
				alert("이미 존재하는 이름입니다.");
				return false;
			}
			if(data == 2) {
				alert("이미 존재하는 메일입니다.");
				return false;
			}
			if(data ==3) {
				alert("이미 존재하는 닉네임입니다.");
				return false;
			} else {
				alert("회원정보가 수정되었습니다.");
				location.href="/user/myPage.do";
				console.log('성공');
			}
		}
	});
}

function modifyValidation() {
	
	var member_Pwd = $("member_Pwd").val();
	var passwordCheck = $("passwordCheck").val();
	
	if(member_Pwd != passwordCheck) {
		alert("비밀번호가 맞지 않습니다.");
		$("membmer_Pwd").focus();
	} else {
		modify();
	}
}


</script>
</body>
</html>