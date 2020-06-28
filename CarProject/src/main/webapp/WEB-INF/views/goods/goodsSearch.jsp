<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.min.js"></script>
  <!-- Custom styles for this template -->
  <link href="css/shop-item.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
	<c:import url="/WEB-INF/views/common/menubar.jsp" />
	<div class="card card-outline-secondary my-4" style="width:300px ; height:300px">
		<div class="card-body">
		<h2>dawef</h2>
			<dd class='noLine'>
				<ul class='brandList imageLarge'>
				
					<c:forEach items="${searchList}" var="searchList">
					
						<li class="goodsImg">
							<div class="goodsImg_box">
								<img
									src="${pageContext.request.contextPath}/resources/${searchList.brand_Id}/${searchList.car_Img}.png">
							</div>
							<div class="goodsName">
								<a href="goodsDetail.do?b=${searchList.brand_Id}&c=${searchList.car_ID}"
									style="display: block;">${searchList.car_Name}</a>
							</div>
						</li>
					</c:forEach>
					<%-- <a href="goodsDetail.do">
									<% for(int i=1; i<=5; i++) 
										{%>
									   		<li class='li_img'><img src="/resources/hyundai/<%=i %>.png" style="display:block;"/></li>
									  	<% }
									%></a> --%>
				</ul>
			</dd>
		</div>
	</div>
	<div><c:import url="/WEB-INF/views/common/footer.jsp" /></div>
	
</body>
</html>