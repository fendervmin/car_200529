<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container my-1">
		<div class="row">
			<table border="1" class="table table-hover">
				<form:form modelAttribute="answer" method="post" id="replyForm" action="answerWrite.do">
					<tr>
						<td><form:input path="a_content" /></td>
						<td><form:input path="member_id" /></td>
						<td><input type="submit" value="답글달기"  /></td>
					</tr>
					<tr><form:hidden path="p_id" value="${detail.p_id }"/></tr>
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
	</div>
</body>
</html>