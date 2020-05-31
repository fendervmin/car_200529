<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>
<c:import url="common/menubar.jsp"/>
<P>  The time on the server is ${serverTime}. </P>
<c:import url="common/footer.jsp"/>
</body>
</html>
