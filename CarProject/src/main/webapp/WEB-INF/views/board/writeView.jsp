<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<html>
<head>

<title>Home</title>
<link href="css/styles.css" rel="stylesheet" />
<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.min.js"></script>

<script type="text/javascript">
			
	function fn(select){
		alert("돼 된다고!!");
		if(select == '0'){
			$('#writeForm').attr('action', 'writeBoard.do').submit();
		}else if(select =='1'){
			$('#writeForm').attr('action', 'writeDetail.do').submit();
		}
	}
</script>
	
<meta charset="UTF-8">
</head>
<body class="pt-5">
	
	<form:form modelAttribute="boardVO" method="post" id="writeForm"><!-- 커맨드 객체 생성 -->
		<table border="1">
			<tr>
				<td><form:label path="post_title">제목</form:label></td>
				<td>
					<form:input path="post_title"/>
				</td>
			</tr>
			<tr>
				<td><form:label path="post_content">내용</form:label></td>
				<td>
					<form:textarea cols="50" rows="10"  path="post_content"/>
				</td>
			</tr>
		</table>			
			<c:if test="${num=='0'}">
				<input type="button" value="작성" onclick="fn(0)"/>
			</c:if>
			<c:if test="${num!='0'}">
				<input type="button" value="수정" onclick="fn(1)"/>
			</c:if>
	</form:form>
</body>
</html>