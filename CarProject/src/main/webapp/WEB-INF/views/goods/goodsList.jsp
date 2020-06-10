<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

<style>

.goodsImg{
	float:left;
	display: block;
}

.col-lg-9{
	float:left;
	
}
</style>

<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Shop Item - Start Bootstrap Template</title>
  <!-- Bootstrap core CSS -->
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.min.js"></script>
  <!-- Custom styles for this template -->
  <link href="css/shop-item.css" rel="stylesheet">
  
</head>
<body>
	<div id="root">
		<header id="header">
			<div id="header_box">
				<%@ include file="../common/menubar.jsp" %>
			</div>
		</header>
		
		<section id="container" style="margin-top:150px">
			<div id="container_box">
				<div class="container">
				    <div class="row">
				      <div class="col-lg-3">
				        <h1 class="my-4">자동차백과</h1>
				        <div class="list-group">
				          <a href="#" class="list-group-item">차량정보</a>
				          <a href="#" class="list-group-item">판매실적</a>
				        </div>
				      </div>
				      
				      <!-- /.col-lg-3 -->
				      <div class="col-lg-9">
				        <div class="card mt-4">
	          				<div class="card-img" style="display:inline-block;">
	          					<img class="card-img-top img-fluid" src="http://autoimg.danawa.com/history/brand/303/logo.gif" alt="" style="width:300px;height:200px;">
	          				</div>
					        <div class="card-body" style="display:inline-block;">
					            <h3 class="card-title">
					            <c:forEach items="${list}" var="list" begin="0" end="0">
					            	${list.brand_Name}
					            </c:forEach>
					            </h3>
					            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente dicta fugit fugiat hic aliquam itaque facere, soluta. Totam id dolores, sint aperiam sequi pariatur praesentium animi perspiciatis molestias iure, ducimus!</p>
					            <span class="text-warning">&#9733; &#9733; &#9733; &#9733; &#9734;</span>
					            4.0 stars
					        </div>
				        </div>
				        
				        <!-- /.card -->
				        <div class="card card-outline-secondary my-4">
				          <div class="card-header">
				          <c:forEach items="${list}" var="list" begin="0" end="0">
				            	${list.brand_Name}
				            </c:forEach>	
				          </div>
				          <div class="card-body">
				            <dd class='noLine'>
								<ul class='brandList imageLarge'>
									<c:forEach items="${list}" var="list">
									<li class="goodsImg">
										<div class="goodsImg_box">
											<img src="${pageContext.request.contextPath}/resources/${list.brand_Id}/${list.car_Img}.png">
										</div>
										<div class="goodsName">
											<a href="goodsDetail.do?c=${list.car_ID}" style="display:block;">${list.car_Name}</a>
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
				        <!-- /.card -->
				     </div>
				      <!-- /.col-lg-9 -->
				  </div>
			   </div>
			</div>
		</section>
		
		<footer id="footer">
			<div id="footer_box">
				<%@ include file="../common/footer.jsp" %>
			</div>
		</footer>
	</div>
</body>
</html>