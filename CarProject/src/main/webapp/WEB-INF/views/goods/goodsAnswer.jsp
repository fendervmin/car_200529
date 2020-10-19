<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.min.js"></script>

</head>
<body>
	<div class="card card-outline-secondary my-4">
		<div class="card-header">
			<div class="comment">
				<div class="input-group">
					<form:form modelAttribute="replyVO" method="post"
						action="goodsAnswer.do">
						<script type="text/javascript">
							
						function insert(){
									if (${loginUser eq null}) {
										alert('로그인 후 이용해주세요');
										return false;
									}
									
							    }
							
						</script>
						<form:input path="reply_content" style="width:715px;height:40px" />
						<form:button class="btn btn-primary"   onclick="return insert();" >등록</form:button>
						<form:hidden path="car_ID" value="${detail.car_ID}" />
						<form:hidden path="member_id" value="${loginUser.member_Id }" />
					</form:form>
				</div>
			</div>

		</div>
		<div class="card-body">
			<dd class='noLine'>
				<ul class='brandList imageLarge'>
					<c:if test="${!empty replyList }">
						<c:forEach items="${replyList}" var="replyList">
							<tr>
								<td>${replyList.reply_id }</td>
								<td>${replyList.member_Nicname}</td>
								<td>${replyList.reply_content}</td>
							</tr>
							<br />
						</c:forEach>
					</c:if>
				</ul>
			</dd>
		</div>

	</div>
</body>
</html>