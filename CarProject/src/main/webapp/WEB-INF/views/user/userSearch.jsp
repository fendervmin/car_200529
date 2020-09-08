<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>아이디/비밀번호 찾기</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<c:import url="../common/menubar.jsp"/>
<script type="text/javascript">
$(document).ready(function(){
	if( ${ changePwd != null } ){
      alert('${changePwd}');
   }
});

function search_check(num) {
	if (num == '1') {
		document.getElementById("searchP").style.display = "none";
		document.getElementById("searchI").style.display = "";	
	} else {
		document.getElementById("searchI").style.display = "none";
		document.getElementById("searchP").style.display = "";
	}
}

//아이디 & 스토어 값 저장하기 위한 변수
/* var idV = ""; */
// 아이디 값 받고 출력하는 ajax
var idSearch_click = function(){
	$.ajax({
		type:"POST",
		url: "/user/IdSearch.do",
		data : $("#searchform").serialize(),
		success:function(data){
			if(data == "fail"){
				alert("회원정보를 다시 확인해주세요");
			} else {
				alert("회원님의 아이디는 " + data + "입니다.");
			}
		}
	});
}

</script>
</head>
<body>
<div class="container">
<form id="searchform" method="post">
		<div class="container">
			<div class="area_inputs wow fadeIn">
				<div class="sub_title font-weight-bold text-white">
					<h3>아이디/비밀번호 찾기</h3>
				</div>
				<div style="margin-bottom: 10px;"
					class="custom-control custom-radio custom-control-inline">
					<input type="radio" id="search_1" name="search_total" onclick="search_check(1)" checked="checked">
					<label for="search_1">아이디 찾기</label>
				</div>
				<div class="custom-control custom-radio custom-control-inline">
					<input type="radio" id="search_2" name="search_total" onclick="search_check(2)"> 
					<label for="search_2">비밀번호 찾기</label>
				</div>
				<div id="searchI">
					<div class="form-group">
						<label for="inputName_1">이름</label>
						<div>
							<input type="text" class="form-control" id="member_Name" name="member_Name"  placeholder="이름">
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail_1">이메일</label>
						<div>
							<input type="text" class="form-control" id="member_Email" name="member_Email" placeholder="이메일">
						</div>
					</div>
					<div class="form-group">
						<button id="searchBtn" type="button" onclick="idSearch_click()" class="btn btn-primary btn-block">확인</button>
					<a class="btn btn-danger btn-block"	href="${pageContext.request.contextPath}">취소</a>
					</div>
				</div>
				<div id="searchP" style="display: none;">
					<div class="form-group">
						<label for="inputId">아이디</label>
						<div>
							<input type="text" class="form-control" id="member_UserId2" name="member_UserId2" placeholder="아이디">
						</div>
					</div>
					<div class="form-group">
						<label for="inputName_2">이름</label>
						<div>
							<input type="text" class="form-control" id="member_Name2" name="member_Name2" placeholder="이름">
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail_2">이메일</label>
						<div>
							<input type="email" class="form-control" id="member_Email2" name="member_Email2" placeholder="이메일">
						</div>
					</div>
					<div class="form-group">
						<input type="submit" class="btn btn-primary btn-block" onclick="javascript: form.action= '/user/PwdSearch.do'" value="확인">
					<a class="btn btn-danger btn-block"	href="${pageContext.request.contextPath}">취소</a>
				</div>
				</div>
			</div>
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