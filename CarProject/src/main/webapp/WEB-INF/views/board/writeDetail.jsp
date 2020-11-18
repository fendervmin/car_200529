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

<title>Insert title here</title>
<script>
	var check = $("#recommand.recomm").val();

	if (check == "Y  ")
		var flag = 1;
	else
		var flag = 0;

	function recomm() {

		var recommand = $("#recommand").val();

		var postId = $("#postId").val();
		var userId = $("#memberUserId").val();

		if (flag == 0) {
			$("#heartImg")
					.attr("src",
							"${pageContext.request.contextPath}/resources/img/heart2.png");
			flag = 1;
			$.ajax({
				url : "recommCheck.do",
				method : "POST",
				data : {
					postId : postId,
					userId : userId,
					flag : flag
				}
			})

		} else if (flag == 1) {
			$("#heartImg")
					.attr("src",
							"${pageContext.request.contextPath}/resources/img/heart.png");
			flag = 0;
			$.ajax({
				url : "recommCheck.do",
				method : "POST",
				data : {
					postId : postId,
					userId : userId,
					flag : flag
				}
			})
		}

		/* if(userId ==null){
			$("recommButton").attr('disabled', true);
		}else{
			if(recommand==null||recommand=="Y"){
				$("img").attr("src","${pageContext.request.contextPath}/resources/img/heart2.png");
			}else{

				$("img").attr("src","${pageContext.request.contextPath}/resources/img/heart.png");
			}
		} */
		/* 	$.ajax({
		
		url:"recommCheck.do",
		method:"POST",
		data: {userId:userId,postId:postId},
		success: function(){
			if(userId ==null){
				$("recommButton").attr('disabled', true);
			}else{
				if(recommand=="Y"){
					$("img").attr("src","${pageContext.request.contextPath}/resources/img/heart2.png");
				}else{

					$("img").attr("src","${pageContext.request.contextPath}/resources/img/heart.png");
				}
			}
		}
		
		})
		 */}
</script>
<style>
th {
	display: inline-block;
}

td {
	text-align: left;
}
</style>
<meta charset="UTF-8">
</head>

<body>
	<header id="header">
		<div id="header_box">
			<c:import url="../common/menubar.jsp" />
		</div>
	</header>

	<section id="container" style="margin-top: 150px">
		<div id="container_box">
			<h2>자유게시판</h2>
			<div class="container my-8">
				<div class="container my-3">
					<div class="row">

						<div class="col-md-4">
							<c:if
								test="${loginUser.member_Id eq detail.member_id || loginUser.member_UserId eq 'MAIN'}">
								<a href='writeView.do?index=${detail.p_id }'>수정하기</a>
								<a href='writeBoard.do?index=${detail.p_id}'>삭제하기</a>
							</c:if>
							<a href='writeBoard.do'>목록으로</a>

						</div>
						<div class="container my-1" style="">
							<div class="row" style="border: solid lightgray 1px;">
								<table class="table" style="height: 300px;">
									<thead class="table-active">
										<colgroup>
											<col width="10%">
											<col width="60%">
											<col width="10%">
											<col width="20%">
										</colgroup>
										<tr>
											<th>제목</th>
											<td colspan="3">${detail.p_title }</td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<th>작성자</th>
											<td>${user_Board.member_Nicname}</td>
											<th>조회수</th>
											<td>${detail.p_view }</td>
												</tr>
									</thead>
									<tbody>
										<tr>
											<td colspan="3" ><pre style="width:1050px;height:300px;">${detail.p_content}</pre></td>
											<!--pre태그는 엔터 쉬프트 같은 키들을 쉽게 사용가능  -->
											<td></td>
											<td></td>
											<td></td>
											
										</tr>
									</tbody>
								</table>
								
							</div>
							<div style="float:right;">
												<c:choose>
													<c:when test="${recommand.recomm=='Y  '}">
														<button type="button" onclick="recomm()" id="recommButton">
															<img
																src="${pageContext.request.contextPath}/resources/img/heart2.png"
																id="heartImg"
																style="width: 30px; height: 30px;" />
														</button>
													</c:when>

													<c:when
														test="${recommand.recomm=='N  '||recommand.recomm==null }">
														<button type="button" onclick="recomm()" id="recommButton">
															<img
																src="${pageContext.request.contextPath}/resources/img/heart.png"
																id="heartImg"
																style="width: 30px; height: 30px;" />
														</button>
													</c:when>
												</c:choose>
											</div>
							<%-- <input type="button" onclick="recomm()" id="recommButton" src="${pageContext.request.contextPath}/resources/img/heart.png"/> </td>--%>
						</div>
						<input type="hidden" id="memberUserId"
							value="${loginUser.member_Id }" /> <input type="hidden"
							id="postId" value="${detail.p_id}" /> <input type="hidden"
							id="recommand" value="${recommand.recomm}" />
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
							 --%>	
						</div>
					</div>
				</div>
			</div>
	</section>

	<footer id="footer">
		<div id="footer_box">
			<c:import url="../common/footer.jsp" />
		</div>
	</footer>

</body>
</html>