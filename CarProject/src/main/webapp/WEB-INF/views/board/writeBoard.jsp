<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

ul ul{display:none;}
ul li:hover > ul{display:block;}
.paging {
	margin-left: 50%;
}

.writeButton {
	float: right;
}

.boardItem {
	list-style: none;
	margin: 0px;
	padding: 0px;
	border: 1px solid;
	border-radius: 90%;
}

.boardContents {
	margin: 100px;
	width: 1300px;
	height: 500px;
}

.row-fluid {
	position: relative;
}

.list-group {
	width: 15%;
	height: 300px;
	float: left;
	text-align: center;
	margin-right: 20px;
}

.list-group list-group-item {
	display: none;
}

.btn:hover>list-group-item {
	display: block;
}
/* .card{
	position:absolute;
	top:0px;
	right:200px;
	width:1000px;
	height:3000px;
} */
.card {
	width: 80%;
	height: 300px;
	float: left;
	text-align: center;
}

#footer_box {
	margin: 30px;
}
</style>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script type="text/javascript">
	function check() {
		var member_level = $("#member_level").val();
		var p_check = $("#p_check").val();

		alert("체크실행" + member_level + "응?" + p_check);

		if (member_level == "1" && p_check == "1") {
			$('a').bind('click', false);

		}

	}
	
</script>
</head>
<body>


	<div class="row-fluid">
		<div id="header_box">
			<c:import url="../common/menubar.jsp" />
		</div>

		<!-- <div class="dropdown">
			<button id="dLabel" type="button" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false">
				<span class="caret">a</span> <span class="caret2">e</span>
			</button>
			<ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
				...
			</ul>
		</div> -->
		<div class="boardContents">
			<input type="hidden" value="${loginUser.member_level }"
				id="member_level" />
			<div class="list-group">
				<ul class="list-group-item" style="padding:3px; background-color:rgb(214,214,214);">
				<div style="border:2px dashed gray;">
					<li style="text-align:left;">${loginUser.member_Name } 님</li>
					<li style="font-size:12px; text-align:left;"><strong>since</strong> ${loginUser.member_In }</li>
					<li style="font-size:12px; text-align:left;"><img alt="새싹" src="${pageContext.request.contextPath}/resources/img/plant1.jpg" style="width:30px;height:30px;"> 새싹단계 </li>
					<li style="font-size:12px; text-align:left;">회원님의 총 게시글 수  <strong>${countPost }</strong> </li>
					<li></li>
				</div>
				</ul>
				<ul class="list-group-item">
				
					<li><a>전체게시판</a>
						<ul>
							<li><a href="writeBoard.do" style="font-size:13px; text-align:right;">자유게시판</a></li>
							<li><a href="writeReview.do"style="font-size:13px; text-align:right;">비밀게시판</a></li>
							<li><a style="font-size:13px; text-align:right;">상담 리뷰판</a></li>
						
						</ul>
					</li>
				</ul>
				<a href="writeBoard.do" class="list-group-item">비밀게시판</a>
				
			</div>
			<div class="card">
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col" class="text-center">게시글번호</th>
							<th scope="col" class="text-center">제목</th>
							<th scope="col" class="text-center">내용</th>
							<th scope="col" class="text-center">조회수</th>
							<th scope="col" class="text-center">날짜</th>
						</tr>
					</thead>

					<c:forEach var="list" items="${list}" varStatus="vs" begin="1"
						step="1">
						<input type="hidden" value="${list.p_check }" id="p_check" />
						<!-- 순서대로 사용할변수명,list객체이름,반복상태(인덱스)변수~.. -->
						<tbody>
							<tr>
								<td scope="col" class="text-center">${vs.index}</td>
								<td scope="col" class="text-center"><a
									href='writeDetail.do?index=${list.p_id}' onclick="check()">${list.p_title}</a></td>
								<td scope="col" class="text-center">${list.p_content}</td>
								<td scope="col" class="text-center">${list.p_view }</td>
								<td scope="col" class="text-center">${list.p_time }</td>
								<td><c:if test="${loginUser.member_UserId eq 'MAIN'}">
										<a href="writeBoard.do?index=${list.p_id }">삭제</a>
									</c:if></td>
							</tr>
						</tbody>
					</c:forEach>
				</table>
				<div>
					<ul class="paging">
						<c:if test="${Maker.prev}">
							<li style="list_style: none; float: left; padding: 6px;"><a
								href="writeReview.do${Maker.makeQuery(Maker.startPage - 1)}">이전</a></li>
						</c:if>

						<c:forEach begin="${Maker.startPage}" end="${Maker.endPage}"
							var="idx">
							<li style="list_style: none; float: left; padding: 6px;"><a
								href="writeReview.do${Maker.makeQuery(idx)}">${idx}</a></li>
						</c:forEach>

						<c:if test="${Maker.next && Maker.endPage > 0}">
							<li style="list_style: none; float: left; padding: 6px;"><a
								href="writeReview.do${Maker.makeQuery(Maker.endPage + 1)}">다음</a></li>
						</c:if>
					</ul>
				</div>

				<div class="writeButton">
					<c:if test="${loginUser != null }">
						<form action="writeView.do" method="GET">

							<input type="submit" value="글작성" /> <input type="hidden"
								value="0" name="index" />
						</form>
					</c:if>
					<c:if test="${loginUser == null }">
						<input type="button" value="글작성" onclick="fn()"
							class="btn btn-primary" />
					</c:if>
				</div>
			</div>

		</div>
		<div id="footer_box">
			<c:import url="../common/footer.jsp" />
		</div>
	</div>
</body>
</html>