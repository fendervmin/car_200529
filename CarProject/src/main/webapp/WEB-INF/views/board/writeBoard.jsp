<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mainView/common.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.min.js"></script>

</head>
<body>	
	<h2 style="margin-left:45%;">자유게시판</h2>
	<div class="container">
		<form method="POST" action="board/writeView">
			<table class="table table-hover">
				<thead>
					<tr>
						<th scope="col" class="text-center">게시글번호</th>
						<th scope="col" class="text-center">제목</th>
						<th scope="col" class="text-center">이름</th>
						<th scope="col" class="text-center">작성일</th>
					</tr>
				</thead>
			</table>
			<button type="submit">작성하기</button>
		</form>
	</div>
</body>
</html>