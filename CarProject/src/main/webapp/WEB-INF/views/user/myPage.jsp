<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<c:import url="/WEB-INF/views/common/menubar.jsp" />
</head>
<body>

	<aside>
		<div id="aside">
			<h3>마이페이지</h3>
			<ul id="aside">
				<li class="myPage_li">위시리스트</li>
				<li class="myPage_li">예약 내역</li>
			</ul>
			<h3>나의 게시글 보기</h3>
			<h3>개인정보</h3>
			<ul>
				<li class="myPage_li"><a href="/user/updateUserPage.do">회원정보수정</a></li>
				<li class="myPage_li"><a href="javascript:removeCheck()">회원탈퇴</a></li>
			</ul>
		</div>
	</aside>
	
	<script type="text/javascript">
		function removeCheck(){
			if(confirm("정말로 탈퇴하시겠습니까?") == true){
				location.href= '/user/removeUser.do';
			}else{
				alert("회원탈퇴를 취소하였습니다.");
			}
		}
	</script>
	

</body>
</html>