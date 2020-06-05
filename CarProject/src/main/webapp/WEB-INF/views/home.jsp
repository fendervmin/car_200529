<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<%-- <jsp:forward page="/user/login"/> --%>
<html>
<head>
   <title>Home</title>
</head>
<body>
<div id="root">
	<header id="header">
		<div id="header_box">
			<c:import url="common/menubar.jsp"/>
		</div>
	</header>
	
	<section id="container">
		<div id="container_box">본문영역
		</div>
	</section>
	
	<footer id="footer">
		<div id="footer_box">
			<c:import url="common/footer.jsp"/>
		</div>
	</footer>
</div>
</body>
</html>