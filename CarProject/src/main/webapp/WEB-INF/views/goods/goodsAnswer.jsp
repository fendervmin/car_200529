<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
									<div class="comment" style="margin-top: 50px;">
										<form name="commentInsertForm">
											<div class="input-group" style="margin-top: 50px;">
												<%-- <input type="hidden" name="bno" value="${detail.bno}"/> --%>
												<input type="text" class="form-control" id="content"
													name="content" placeholder="내용을 입력하세요."> <span
													class="input-group-btn">
													<button class="btn btn-primary" style="margin-left: 5px;"
														type="button" name="commentInsertBtn">등록</button>
												</span>
											</div>
										</form>
									</div>
</body>
</html>