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
body, h1, h2, h3, h4, h5, h6, button, dd, dl, dt, fieldset, form, input, legend, li, ol, p, select, textarea, th, ul {
    margin: 0;
    padding: 0;
}
ul {
    display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
}
li {
    display: list-item;
    text-align: -webkit-match-parent;
}
ol, ul {
    list-style: none;
}
.modelList.imageType li {
    float: left;
    width: 170px;
    height: 120px;
    margin: 10px;
    text-align: center;
    position: relative;
    padding-top: 5px;
    border: 1px solid #ffffff;
    line-height: 0;
    font-weight: normal;
}
.modelList.imageType li .name {
    display: block;
    text-align: center;
    line-height: 16px;
}
.modelList.imageType li img {
    width: 170px;
    height: 100px;
}S
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
	<c:import url="/WEB-INF/views/common/menubar.jsp"/>
		
		<section id="container" style="margin-top:40px">
			<div id="container_box">
				<div class="container">
				    <div class="row">
				      <div class="col-lg-3">
				        <h1 class="my-4">자동차백과</h1>
				        <div class="list-group">
				          <a href="../goods/brandList.do" class="list-group-item">차량정보</a>
				          <a href="../goods/goodsAll.do" class="list-group-item">전체보기</a>
				        </div>
				      </div>
				      
				      <!-- /.col-lg-3 -->
				      <div class="col-lg-9">
				        <div class="card mt-4">
	          				<div class="card-img" style="display:inline-block;">
                         <c:forEach items="${list}" var="list" begin="0" end="0">
                            <img class="card-img-top img-fluid" src="${pageContext.request.contextPath}/resources/brand/${list.brand_Img}.jpg" style="width:300px;height:200px;" >
                         </c:forEach>
                         </div>
					        <div class="card-body" style="display:inline-block;">
					            <h3 class="card-title">
					            <c:forEach items="${list}" var="list" begin="0" end="0">
					            	${list.brand_Name}
					            </c:forEach>
					            </h3>
					            
					            <p class="card-text">
								<details>
								    <summary>회사 설명 보기</summary>
								    <p>
								    	<c:forEach items="${list}" var="list">
					            			${list.brand_Explain}
					            		</c:forEach>
								    </p>
								</details>
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
				            
					        <c:if test="${loginUser.member_Type == '관리자' }">
					        <div class="add" style="margin-top:20px;">
					        	<input type="button" value="자동차추가" onclick="location.href='goodsAdd.do'" class="btn btn-primary">
					        					        
					        </div>
					        </c:if>
					        
				          </div>
				          <div class="card-body">
				            <dd class='noLine'>
								<ul class='brandList imageLarge'>
									<c:forEach items="${list}" var="list">
									<ul class='modelList imageType clearFix'>
						                <li code='3600' class='stock '>
						                    <a onclick="" href="goodsDetail.do?b=${list.brand_Id}&c=${list.car_ID}" style="display:block;">
						                        <img src="${pageContext.request.contextPath}/resources/${list.brand_Id}/${list.car_Img}.png">
						                        <span class='name'>${list.car_Name}</span>
						                    </a>
						                </li>
						             </ul>
									</c:forEach>
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