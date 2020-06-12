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
	src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.min.js">
/* 		
	int index =function url(){
		var url = unescape(location.href);
		int param = Integer.parseInt(url.substring(url.indexOf("=")+1,url.length));
		return param;
}
 if(index!=0)
	 location.href='writeView.do';
 else
	 location.href='writeSuccess.do'; */

		
	</script>
	

</head>
<body class="pt-5">
	
	<form:form modelAttribute="boardVO" method="post" id="boardVO" name="write">
		<table border="1">
			<tr>
				<th><form:label path="post_title">제목</form:label></th>
				<td>
					<form:input path="post_title" value="${boardVO.post_title}" id="title"/>
				</td>
			</tr>
			<tr>
				<th><form:label path="post_content">내용</form:label></th>
				<td>
					<form:textarea path="post_content" value="${boardVO.post_content}" id="title"/>
				</td>
			</tr>
		</table>
		<div>
			<a href="#" onclick="fn_update()">수정</a>
		</div>
	</form:form>
	<script>
		function fn_update(){
			var form = document.getElementById("write");
			form.action="<c:url value='writeView.do'/>";
			form.submit();
		}
		
		function fn_write(){
			var form = document.getElementById(write);
			form.action="<c:url value='writeSuccess.do'/>";
			form.submit();
		}
	</script>
</body>
</html>