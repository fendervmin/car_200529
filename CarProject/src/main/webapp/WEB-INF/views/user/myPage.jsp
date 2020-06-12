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
<c:import url="../common/menubar.jsp" />
</head>
<body>

	<aside>
		<div id="aside">
			<h3>마이페이지</h3>
			<ul id="aside">
				<li class="myPage_li">위시리스트</li>
				<li class="myPage_li">예약 내역</li>

				<li class="myPage_li"><h3>나의 게시글 보기</h3></li>
				<li class="myPage_li"><h3>개인정보</h3></li>

				<li class="myPage_li">회원정보수정</li>
				<li class="myPage_li">회원탈퇴</li>
			</ul>
		</div>
	</aside>
	

</body>
</html>