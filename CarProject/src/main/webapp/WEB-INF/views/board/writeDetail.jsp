<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mainView/common.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.min.js"></script>
<title>Insert title here</title>

</head>
<body>
	<h2 style="margin-left:45%;">자유게시판</h2>
	<div class="container my-8">
	<div class="container my-3">
		<div class="row" >
			<div class="col"></div>
			<div class="col-md-auto">
				<button type="submit" class="btn btn-secondary btn-sm" onclick="f_modify">수정하기</button>
				<button type="submit" class="btn btn-secondary btn-sm" onclick="f_boardList">글목록</button>
			</div>
		</div>
	</div>
	<div class="container my-1">
		<div class="row" style="border: solid lightgray 1px;">
			<table class="table" style="height:300px; ">
				<thead class="table-active">
					<tr>
						<th scope="col" style="width: 60%">${detail.post_title }</br>
						${detail.member_id}</th>
						<th scope="col" style="width: 100%" class="text-right">${detail.post_time}</br>조회 &nbsp;2</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><pre>${detail.post_content}</pre></td><!--pre태그는 엔터 쉬프트 같은 키들을 쉽게 사용가능  -->
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="container my-1">
		<div class="row">
			<div class="col-md-auto"><input type="text" placeholder="답글을 작성하시오." style="width:780px; height:40px;"/></div>	
			<div class="col"><button type="submit" class="btn btn-secondary btn-sm">답글쓰기</button></div>
		
		</div>
	</div>
</div>	
</body>
</html>