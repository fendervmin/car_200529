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
.modelSummary {
    padding: 30px 0 20px 0;
    position: relative;
}
.screen_out, legend, caption {
    display: block;
    overflow: hidden;
    position: absolute;
    left: -9999px;
    width: 1px;
    height: 1px;
    font-size: 0;
    line-height: 0;
    text-indent: -9999px;
    clear: both;
}
.modelSummary .photo {
    float: left;
    position: relative;
    width: 320px;
    text-align: center;
    max-height: 205px;
}
.modelColor {

    line-height: 0;
    position: relative;
}
.modelSummary .modelColor {
    margin-top: 15px;
    text-align: center;
}
.modelColor .this {
    font-size: 11px;
    margin-top: -12px;
    text-align: center;
    line-height: 12px;
}
.modelColor button {
    margin: 7px 1px 3px 1px;
    width: 16px;
    height: 12px;
    border: 1px solid #cccccc;
    position: relative;
}
.screen_out, legend, caption {
    display: block;
    overflow: hidden;
    position: absolute;
    left: -9999px;
    width: 1px;
    height: 1px;
    font-size: 0;
    line-height: 0;
    text-indent: -9999px;
    clear: both;
}
.modelSummary .info {
    float: right;
    width: 380px;
    position: relative;
}
.modelSummary .title {
    position: relative;
    margin: 5px 0 0 -3px;
    color: #000;
    letter-spacing: -2px;
    line-height: 27px;
    font-weight: bold;
    font-size: 28px;
    font-family: "Malgun Gothic",Dotum,"돋움","Apple SD Gothic Neo",Helvetica,Sans-serif;
}
.modelSummary .date {
    margin-top: 6px;
    font-size: 14px;
    font-family: "Malgun Gothic",Dotum,"돋움","Apple SD Gothic Neo",Helvetica,Sans-serif;
}
.modelSummary .price .price_title .num {
    font-size: 18px;
    vertical-align: 1px;
    padding: 0;
}
.modelSummary .price {
    margin-top: 7px;
    color: #2964e0;
    font-weight: bold;
    font-size: 16px;
    font-family: "Malgun Gothic",Dotum,"돋움","Apple SD Gothic Neo",Helvetica,Sans-serif;
}
.modelSummary .spec:after {
    content: "";
    display: block;
    height: 0;
    clear: both;
    visibility: hidden;
}
.modelSummary .spec span:after {
    content: "·";
    position: absolute;
    left: 5px;
}
.modelSummary .spec {
    margin-top: 8px;
    color: #666;
    font-size:12px;
}
.modelSummary .save {
    margin-top: 8px;
    line-height: 19px;
    color: #666;
}
.clearFix:after {
    content: "";
    display: block;
    height: 0;
    clear: both;
    visibility: hidden;
}
.location .list li {
    display: inline-block;
    position: relative;
    line-height: 30px;
    color: #333;
}
.modelSummary .photo img {
    width: 320px;
    height: 160px;
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
				      <div class="col-lg-9" style="margin-bottom:150px">
				        <div class="card mt-4">
					        <div class="card-body" style="display:inline-block;">
						        <div class='location clearFix'>
							        <ul class='list' style="float: left;">
							            <li><a href="../">홈</a><a> > </a></li>
							            <li><a href="brandList.do">자동차 백과</a><a> > </a></li>
							            <li><a href="brandList.do?b=${detail.brand_Id}">${detail.brand_Name}</a><a> > </a></li>
							            <li>${detail.car_Type}<a> > </a></li>
							            <li>${detail.car_Name}<a> > </a></li>
							            <li>종합정보</li>
							        </ul>
						       </div>
					        	<div class='modelSummary auto stock'>
					                <h2 class='screen_out'>현대 아반떼 소개</h2>
					                <div class='photo'>
					                    <img src="${pageContext.request.contextPath}/resources/${detail.brand_Id}/${detail.car_Img}.png">
					            	</div>
						            <div class='info'>
						                <div class='title'>
						            			${detail.car_Name}
						                </div>
						                <div class='price_title'><span class='num'>${detail.car_Price}</span>만 원</div>
						                <div class='spec'>
						                    <span>복합연비 <span class='num'>${detail.car_Fuel}㎞/ℓ</span></span><br>
						                    <span>${detail.car_Type}</span><br>
						                    <span>${detail.fuel_Type}</span>
						                </div>
						                <div class='save'>
						                    <button title='관심모델로 저장' class='' type='button'>
						                        <span class='screen_behind'>관심모델로 저장</span>
						                    </button>
						                    <button title='매장예약' class='' type='button' onclick="location.href='../reserve/reservemainPage.do'">
						                        <span class='screen_behind'>매장 예약하러 가기</span>
						                    </button>
						                </div>
						            </div>
								</div>
				        	</div>
					                    
							</div>
					                    
		</div>
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