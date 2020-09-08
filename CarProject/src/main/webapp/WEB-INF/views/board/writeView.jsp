<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<html>
<head>

<title>Home</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
	function fn(select) {
		alert("작성되었습니다.");
		if (select == '0') {
			$('#writeForm').attr('action', 'writeBoard.do').submit();
		} else if (select == '1') {
			$('#writeForm').attr('action', 'writeDetail.do').submit();
		}
	}
</script>
<style>
	div{
		float:initial;
	}
</style>

<meta charset="UTF-8">
</head>
<body class="pt-5">
	<div>
		<header id="header">
			<div id="header_box">
				<c:import url="../common/menubar.jsp" />
			</div>
		</header>
		<section id="container">
			<div id="container">
				<form modelAttribute="boardVO" method="post" id="writeForm">
					<!-- 커맨드 객체 생성 -->
					<table border="1" class="table table-hover">
						<tr>
							<td><input type="label" path="p_title">제목</input></th>
							<td><input path="p_title" /></td>
						</tr>
						<tr>
							<td><input type="label" path="p_content">내용</input></td>
							<td><textarea cols="50" rows="10" path="p_content"> </textarea>
							</td>
						</tr>
					</table>
					<input type="hidden" path="p_id" value="${boardVO.p_id}" />
					<c:if test="${num=='0'}">
						<input type="button" value="작성" onclick="fn(0)" />
					</c:if>
					<c:if test="${num!='0'}">
						<input type="button" value="수정" onclick="fn(1)" />
					</c:if>
				</form>
			</div>

		</section>
	</div>
</body>
</html>