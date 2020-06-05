<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%-- <jsp:forward page="/user/login"/> --%>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	아녕
</h1>
<c:import url="common/menubar.jsp"/>
<c:import url="board/writeBoard.jsp"/>
<c:import url="common/footer.jsp"/>
</body>
</html>
