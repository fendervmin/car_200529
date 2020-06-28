<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
   <title>Home</title>
</head>
<body>
<div id="root">
	<header id="header">
		<div id="header_box">
		<c:import url="/WEB-INF/views/common/menubar.jsp"></c:import>
		</div>
	</header>
	
	<section id="container" >
		<div id="container_box">
		<c:import url="/WEB-INF/views/common/main.jsp"/>
		</div>
	</section>
	
	<footer id="footer">
		<div id="footer_box">
			<c:import url="/WEB-INF/views/common/footer.jsp"/>
		</div>
	</footer>
</div>
<%-- <h1>
	아녕
</h1>
<c:import url="common/menubar.jsp"/>
<c:import url="board/writeBoard.jsp"/>
<c:import url="common/footer.jsp"/> --%>
</body>
</html>