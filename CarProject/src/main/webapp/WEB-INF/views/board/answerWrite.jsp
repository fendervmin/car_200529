<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container my-1">
		<div class="row">
			<table class="table table-hover">
				<form modelAttribute="answer" method="post" id="replyForm"
					action="answerWrite.do">
					<tr>
						<td colspan="2"><input type="text" path="a_content"
								style="width:1000px;height:30px" /></td>
						<td><input type="submit" value="답글달기" /></td>
					</tr>
					<tr><input type="hidden" path="p_id" value="${a.p_id }" />
					<input type="hidden" path="member_id" value="${loginUser.member_Id }"/></tr>
				</form>
				<!-- 답변리스트 폼 -->
				<c:if test="${!empty reply }">
					<c:forEach var="a" items="${reply }">
						<tr>
							<td>${a.member_id }</td>
							<td>${a.a_content}</td>
							
								<td><a href="answerWrite.do?a_id=${a.a_id }&&id=${a.p_id}">삭제</a></td>
								
						</tr>
					</c:forEach>
				</c:if>
			</table>

		</div>
	</div>
</body>
</html>