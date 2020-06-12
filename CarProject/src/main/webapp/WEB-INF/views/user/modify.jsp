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
<script type="text/javascript">
function search_check(num) {
	if (num == '1') {
		document.getElementById("searchP").style.display = "none";
		document.getElementById("searchI").style.display = "";	
	} else {
		document.getElementById("searchI").style.display = "none";
		document.getElementById("searchP").style.display = "";
	}
}
</script>
<body>
<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<div class="w3-center w3-large w3-margin-top">
				<h3>My Page</h3>
			</div>
			<div>
				<form id="myForm" action="../member/update_mypage.do" method="post">
					<p>
						<label>ID</label> 
						<input class="w3-input" type="text" id="member_UserId" name="member_UserId" value="${ memverVO.member_UserId}" readonly> 
					</p>
					<p>
						<label>Name</label> 
						<input class="w3-input" type="text" id="member_Name" name="member_Name" value="${ memberVO.member_Name }" required>
						<input type="button" value="수정" value="location.href='/user/smallModify'" class="smallmodifyButton"> 
					</p>
					<p>
						<label>Email</label> 
						<input class="w3-input" type="text" id="member_Email" name="member_Email" value="${ memberVO.member_Email }" required>
						<input type="button" value="수정" value="location.href='/user/smallModify'" class="smallmodifyButton">  
					<p>
						<label>Nickname</label> 
						<input class="w3-input" type="text" id="member_Nicname" name="member_Nicname" value="${ memberVO.member_Nicname }"required> 
						<input type="button" value="수정" value="location.href='/user/smallModify'" class="smallmodifyButton"> 
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
				
				</form>
			</div>
		</div>
	</div>
</body>
</html>