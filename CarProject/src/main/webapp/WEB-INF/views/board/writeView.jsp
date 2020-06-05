<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<html>
<head>

<title>Home</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/mainView/common.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.min.js"></script>


</head>
<body class="pt-5">
	<!-- 네비바를 fixed-top으로 설정했을때 컨텐츠 겹치는 문제 방지(그냥 겹침방지) -->
	<!-- div:화면 레이아웃 구분 -->
	<form role="form" method="post" action="board/writeBoard">
	<div class="container"><!-- container:내용물의 가로길이를 제한해주는 박스 -->
		<h2 style="margin-left:45%;">자유 게시판</h2>
		<input type="text" id="title" name="title" class="form-control mt-4 mb-2"
			placeholder="제목을 입력해주세요." required>
		<div class="form-group">
			<textarea class="form-control" rows="10" id="content" name="content"
				placeholder="내용을 입력해주세요" required
			></textarea>
		</div>
		<button type="submit" class="btn btn-secondary mb-3">제출하기</button>
	</div>
	</form>
</body>
</html>