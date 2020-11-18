<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type="text/javascript">
	function fn(select) {
		alert("돼 된다고!!");
		if (select == '0') {
			$('#writeForm').attr('action', 'writeBoard.do').submit();
		} else if (select == '1') {
			$('#writeForm').attr('action', 'writeDetail.do').submit();
		}
	}
	function check(){
		if($('#check').prop('checked')==true){
			alert("레벨 2 분들 에게만 이 게시글을 읽는 것이 허용됩니다.");
			
		}	
	}
</script>
<style>
div {
	float: initial;
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
		<section id="container" style="margin-top: 150px;">
			<div id="container">
				<form:form modelAttribute="boardVO" method="post" id="writeForm" enctype="multipart/form-data">
					<!-- 커맨드 객체 생성 -->
					<table border="1" class="table table-hover">
						<tr>
							<td><form:label path="p_title">제목</form:label></td>
							<td><form:input path="p_title" /></td>
						</tr>
						<tr>
							<td><form:label path="member_id">
									<form:hidden path="member_id" value="${loginUser.member_Id}" />
															작성자</form:label></td>
							<td>${loginUser.member_Nicname }</td>
						</tr>
						<tr>
							<td><form:label path="p_content">내용</form:label></td>
							<td><form:textarea cols="50" rows="10" path="p_content" />
							</td>
						</tr>
					</table>
					<%-- <div class="inputArea">
						<label for="boardImg">이미지</label>
						<input type="file" id="p_img" name="file"/>
						<div class="select_img"><img src=""/></div>
						<script>
						$("#gdsImg").change(function(){
							   if(this.files && this.files[0]) {
							    var reader = new FileReader;
							    reader.onload = function(data) {
							     $(".select_img img").attr("src", data.target.result).width(500);        
							    }
							    reader.readAsDataURL(this.files[0]);
							   }
							  });
						</script>
						<%=request.getRealPath("/") %>
					</div> --%>
					<form:hidden path="p_id" value="${boardVO.p_id}" />
					<c:if test="${num=='0'}">
						<input type="button" value="작성" onclick="fn(0)" />
					</c:if>
					<c:if test="${num!='0'}">
						<input type="button" value="수정" onclick="fn(1)" />
					</c:if> 
						<form:label path="p_check">게시글의 공개 범위를 제한하시겠습니까?</form:label>
						<form:checkbox name="check" path="p_check" value="1" onclick="check()"></form:checkbox> 
						
				</form:form>
			</div>

		</section>
	</div>
</body>
</html>
