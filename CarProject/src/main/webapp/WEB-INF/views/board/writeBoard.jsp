<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.paging {
	margin-left: 50%;
} 
.writeButton{
	float: right;
	
}
</style>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script type="text/javascript">
	function fn() {
		alert("로그인 해야 이용 할 수 있는 기능입니다.");
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
		<div class="card" >
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
					<!-- 순서대로 사용할변수명,list객체이름,반복상태(인덱스)변수~.. -->
					<tbody>
						<tr>
							<th scope="col" class="text-center">${vs.index}</th>
							<th scope="col" class="text-center"><a
								href='writeDetail.do?index=${list.p_id}'>${list.p_title}</a></th>
							<th scope="col" class="text-center">${list.p_content}</th>
							<th scope="col" class="text-center">${list.p_view }</th>
							<th scope="col" class="text-center">${list.p_time }</th>
						</tr>
					</tbody>
				</c:forEach>
			</table>
			<div>
				<ul class="paging">
					<c:if test="${Maker.prev}">
						<li style="list_style: none; float: left; padding: 6px;"><a
							href="writeBoard.do${Maker.makeQuery(Maker.startPage - 1)}">이전</a></li>
					</c:if>

					<c:forEach begin="${Maker.startPage}" end="${Maker.endPage}"
						var="idx">
						<li style="list_style: none; float: left; padding: 6px;"><a href="writeBoard.do${Maker.makeQuery(idx)}">${idx}</a></li>
					</c:forEach>

					<c:if test="${Maker.next && Maker.endPage > 0}">
						<li style="list_style: none; float: left; padding: 6px;"><a
							href="writeBoard.do${Maker.makeQuery(Maker.endPage + 1)}">다음</a></li>
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
					<input type="button" value="글작성" onclick="fn()" />
				</c:if>
			</div> 
		</div>
		<div id="footer_box">
			<c:import url="../common/footer.jsp" />
		</div>
	</div>
</body>
</html>