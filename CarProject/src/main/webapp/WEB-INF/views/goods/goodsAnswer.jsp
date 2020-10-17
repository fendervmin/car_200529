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
	<div class="card card-outline-secondary my-4">

		<div class="card-header">
			<form:form modelAttribute="reply" id="reply" action="goodsAnswer.do">
				<div class="comment">
					<div class="input-group">
						<input type="text" class="form-control" id="content"
							name="content" placeholder="내용을 입력하세요."> <span
							class="input-group-btn">
							<input type="submit" class="btn btn-primary" style="margin-left: 5px;" value="등록" />
						</span>
					</div>
				</div>
			</form:form>
		</div>
		<div class="card-body">
			<dd class='noLine'>
				<ul class='brandList imageLarge'>
					<c:forEach items="${replyList}" var="replyList">
						<tr>
							<td>멤버 번호 : ${replyList.member_id}</td>
							<td>${replyList.reply_content}</td>
						</tr>
					</c:forEach>
				</ul>
			</dd>
		</div>

	</div>
</body>
</html>