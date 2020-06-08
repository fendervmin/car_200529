<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
	<form:form modelAttribute="boardVO" action="writeView">
		<table border="1">
			<tr>
				<th><form:label path="post_title">제목</form:label></th>
				<td>
					<form:input path="post_title"/>
				</td>
			</tr>
			<tr>
				<th><form:label path="post_content">내용</form:label></th>
				<td>
					<form:textarea path="post_content"/>
				</td>
			</tr>
		</table>
		<div>
			<input type="submit" value="글작성">
		</div>
	</form:form>
</body>
</html>