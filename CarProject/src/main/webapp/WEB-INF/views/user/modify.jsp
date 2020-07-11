<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> 
<c:import url="/WEB-INF/views/common/menubar.jsp"/>
<body>
<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<div class="w3-center w3-large w3-margin-top">
				<h3>My Page</h3>
			</div>
			<div style="margin-bottom: 10px;"
					class="custom-control custom-radio custom-control-inline">
					<input type="radio"  class="custom-control-input" id="modify" name="modifyContent" onclick="modify_check(1)" checked="checked" value="1">
					<label class="custom-control-label font-weight-bold text-white"	for="modify">회원정보 변경</label>
				</div>
				<div class="custom-control custom-radio custom-control-inline">
					<input type="radio" class="custom-control-input" id="modifyPwd" name="modifyContent" onclick="modify_check(2)" value="2"> 
					<label class="custom-control-label font-weight-bold text-white" for="modifyPwd">비밀번호 변경</label>
				</div>
				<!-- <form id="myForm" action="../member/update_mypage.do" method="post"> -->
				<form id="myForm" method="post">
				<div id="modify2">
					<p>
						<label>ID : </label> 
						<label id="member_UserId">${loginUser.member_UserId }</label>
					</p>
					<p>
						<label>Name</label> 
						<input class="w3-input" type="text" id="member_Name" name="member_Name" value="${ loginUser.member_Name 	}">
					</p>
					<p>
						<label>Email</label> 
						<input class="w3-input" type="text" id="member_Email" name="member_Email" value="${ loginUser.member_Email }" >
					<p>
						<label>Nickname</label> 
						<input class="w3-input" type="text" id="member_Nicname" name="member_Nicname" value="${ loginUser.member_Nicname }"> 
					</p>
				</div>
				<div id="modifyPwd2" style="display: none;">
					<p>
						<label>비밀번호</label> 
						<input class="w3-input" type="password" id="member_Pwd" name="member_Pwd" required> 
					</p>
					<p>
						<label>비밀번호 확인</label> 
						<input class="w3-input" type="password" id="passwordCheck" name="passwordCheck" required> 
					</p>
				</div>
				
					<p>
						<input type="button" id="userUpdateBtn" value="정보수정" onclick="existmodify();" class="modifyButton">
						<input type="button" id="pwdUpdateBtn" value="정보수정" onclick="updatePassword();" class="modifyButton" style="display: none;">
						<input type="button" value="취소" onclick="history.back(-1);">
						<!-- <input type="button" value="회원탈퇴" value="location.href='/user/out'" class="outButton"> -->
					</p>
			</form>
		</div>
	</div>
	<footer id="footer">
		<div id="footer_box">
			<%@ include file="../common/footer.jsp" %>
		</div>
	</footer>
<script type="text/javascript">


function modify_check(num) {
	if (num == 1) {
		$('#modifyPwd2').hide();
		$('#modify2').show();
		$('#userUpdateBtn').show();
		$('#pwdUpdateBtn').hide();
		
	} else {
		$('#modifyPwd2').show();
		$('#modify2').hide();
		$('#userUpdateBtn').hide();
		$('#pwdUpdateBtn').show();
	}
}


function updatePassword(){
	var memberPwd = $('#member_Pwd').val();
	var passwordCheck = $('#passwordCheck').val();
	
	if(memberPwd == passwordCheck){
		$('#myForm').attr('action', '/user/updatePwd.do');
		$('#myForm').submit();
	}else{
		alert("비밀번호 확인을 제대로 해주세요");
	}
}

function existmodify() {
	var member_Name = $("#member_Name").val();
	var member_Email = $("#member_Email").val();
	var member_Nicname = $("#member_Nicname").val();
	
	$.ajax({
		url: "/user/modify.do",
		method: "POST",
		data: {member_Name:member_Name, member_Email:member_Email, member_Nicname:member_Nicname},
		dataType: "text",
		success: function(data) {
			if(data == "1") {
	 			alert("이미 존재하는 메일입니다.");
				return false;
			}
			if(data == "2") {
				alert("이미 존재하는 닉네임입니다.");
				return false;
			} else {
				alert("회원정보가 수정되었습니다.");
				location.href="/user/mypagePage.do";
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