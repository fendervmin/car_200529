<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
 --%><%-- <jsp:forward page="/user/login"/> --%>
<html>
<head>
	<title>Home</title>
</head>
<body>
<div>
<c:import url="/WEB-INF/views/common/menubar.jsp"/>
</div>
<div>
	<h2>${car.p_id }호잇!</h2>
</div>
<div>
<c:import url="/WEB-INF/views/common/main.jsp"/>
</div>
<div>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</div>
</body>
</html>
