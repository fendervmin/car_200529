<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%-- 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> --%>
<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/styles.css" rel="stylesheet" />
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<title>Insert title here</title>
<script>
	
</script>
</head>
<body>
	<header id="header">
	<div id="header_box">
		<c:import url="../common/menubar.jsp" />
	</div>
	</header>

	<section id="container" style="margin-top:150px">
	<div id="container_box">
		<h2>자유게시판</h2>
		<div class="container my-8">
			<div class="container my-3">
				<div class="row">

					<div class="col-md-4">
						<a href='writeView.do?index=${detail.p_id }'>수정하기</a> <a
							href='writeBoard.do?index=${detail.p_id}'>삭제하기</a> <a
							href='writeBoard.do'>목록으로</a>

					</div>
					<div class="container my-1" style="">
						<div class="row" style="border: solid lightgray 1px;">
							<table class="table" style="height: 300px;">
								<thead class="table-active">
									<tr>
										<th>제목</th>
										<td>${detail.p_title }</td>
										<th>조회수</th>
										<td>${detail.p_view }</td>
									</tr>
									<tr>
										<th>작성자</th>
										<td>${detail.member_id }</td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><pre>${detail.p_content}</pre></td>
										<!--pre태그는 엔터 쉬프트 같은 키들을 쉽게 사용가능  -->
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<c:import url="../board/answerWrite.jsp">
						<c:param name="id" value="${detail.p_id }" />
						<c:param name="answer" value="${answer }" />
					</c:import>
					<!-- 답변 전송 폼 -->
					<%-- <div class="container my-1">
						<div class="row">
						<table border="1" class="table table-hover">
							<form:form modelAttribute="answer" method="post" id="replyForm">
									<tr>
										<td><form:input path="a_content" /></td>
										<td><form:input path="member_id" /></td>
										<td><input type="button" value="답글달기"/></td>
									</tr>
							</form:form>
									<!-- 답변리스트 폼 -->
									<c:if test="${!empty reply }">
										<c:forEach var="a" items="${reply }">
											<tr>
												<td>${a.member_id }</td>
												<td>${a.a_content}</td>
												<td></td>
											</tr>
										</c:forEach>
									</c:if>
								</table>
							
						</div>
					</div>
				</div> --%>
	</section>

	<footer id="footer">
	<div id="footer_box">
		<c:import url="../common/footer.jsp" />
	</div>
	</footer>

</body>
</html>