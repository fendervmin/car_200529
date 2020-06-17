<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>	
	<h2 style="margin-left:45%;">자유게시판</h2>
	<div class="row-fluid">
			<div id="header_box">
				<c:import url="../common/menubar.jsp"/>
			</div>
		<div class="card" style="margin-top:150px">
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col" class="text-center">게시글번호</th>
							<th scope="col" class="text-center">제목</th>
							<th scope="col" class="text-center">이름</th>
						</tr>
					</thead>
					<c:forEach var="list" items="${list}" varStatus="vs" begin="1" step="1">
						<tbody>
							
							<tr>
								<th scope="col" class="text-center">${vs.index}</th>
								<th scope="col" class="text-center"><a href='writeDetail.do?index=${list.post_id}'>${list.post_title}</a></th>
								<th scope="col" class="text-center">${list.post_content}</th>
							</tr>							
						</tbody>
					</c:forEach>
				</table>
				<a href="writeView.do?index=0">글작성</a>
		</div>
	<div id="footer_box">
		<c:import url="../common/footer.jsp"/>
	</div>
	</div>
</body>
</html>