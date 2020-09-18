<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }/"/>
<script>
	if(confirm("즐겨찾기에 추가되었습니다. 바로 이동 하시겠습니까?")) {
		location.href="/user/likeItPage.do";
	} else {
		history.go(-1);
	}
</script>