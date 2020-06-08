<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<style>

.li_img{
	float:left;
	width:150px;
	display: block;
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
		
		<section id="container">
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
				          <div class="card-body">
				            <h3 class="card-title">Product Name</h3>
				            <h4>$24.99</h4>
				            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente dicta fugit fugiat hic aliquam itaque facere, soluta. Totam id dolores, sint aperiam sequi pariatur praesentium animi perspiciatis molestias iure, ducimus!</p>
				            <span class="text-warning">&#9733; &#9733; &#9733; &#9733; &#9734;</span>
				            4.0 stars
				          </div>
				        </div>
				        <!-- /.card -->
				        <div class="card card-outline-secondary my-4">
				          <div class="card-header">
				            	국산
				          </div>
				          <div class="card-body">
				            <dd class='noLine'>
								<ul class='brandList imageLarge'>
									<li class='li_img'><a href="goodsList" target='_blank'><img src='http://autoimg.danawa.com/photo/brand/303_90.png' alt='현대' style="display:block;"/>현대</a></li>
									<li class='li_img'><a href='/auto/?Work=brand&Brand=307' target='_blank'><img src='http://autoimg.danawa.com/photo/brand/307_90.png' alt='기아' style="display:block;"/>기아</a></li>
									<li class='li_img'><a href='/auto/?Work=brand&Brand=326' target='_blank'><img src='http://autoimg.danawa.com/photo/brand/326_90.png' alt='쌍용' style="display:block;"/>쌍용</a></li>
									<li class='li_img'><a href='/auto/?Work=brand&Brand=321' target='_blank'><img src='http://autoimg.danawa.com/photo/brand/321_90.png' alt='르노삼성' style="display:block;"/>르노삼성</a></li>
									<li class='li_img'><a href='/auto/?Work=brand&Brand=312' target='_blank'><img src='http://autoimg.danawa.com/photo/brand/312_90.png' alt='쉐보레' style="display:block;"/>쉐보레</a></li>
								</ul>
							</dd>
				          </div>
				          
				          <div class="card-header">
				            	일본
				          </div>
				          <div class="card-body">
				            <dd class='noLine'>
								<ul class='brandList imageLarge'>
									<li class='li_img'><a href='/auto/?Work=brand&Brand=491' target='_blank'><img src='http://autoimg.danawa.com/photo/brand/491_90.png' alt='토요타' style="display:block;"/>토요타</a></li>
									<li class='li_img'><a href='/auto/?Work=brand&Brand=486' target='_blank'><img src='http://autoimg.danawa.com/photo/brand/486_90.png' alt='렉서스' style="display:block;"/>렉서스</a></li>
									<li class='li_img'><a href='/auto/?Work=brand&Brand=500' target='_blank'><img src='http://autoimg.danawa.com/photo/brand/500_90.png' alt='혼다' style="display:block;"/>혼다</a></li>
									<li class='li_img'><a href='/auto/?Work=brand&Brand=514' target='_blank'><img src='http://autoimg.danawa.com/photo/brand/514_90.png' alt='닛산' style="display:block;"/>닛산</a></li>
									<li class='li_img'><a href='/auto/?Work=brand&Brand=509' target='_blank'><img src='http://autoimg.danawa.com/photo/brand/509_90.png' alt='인피니티' style="display:block;"/>인피니티</a></li>
								</ul>
							</dd>
				          </div>
				          
				          <div class="card-header">
				            	유럽
				          </div>
				          <div class="card-body">
				            	<dd class=''>
									<ul class='brandList imageLarge'>
										<li class='li_img'><a href='/auto/?Work=brand&Brand=362' target='_blank'><img src='http://autoimg.danawa.com/photo/brand/362_90.png' alt='BMW' style="display:block;"/>BMW</a></li>
										<li class='li_img'><a href='/auto/?Work=brand&Brand=349' target='_blank'><img src='http://autoimg.danawa.com/photo/brand/349_90.png' alt='벤츠' style="display:block;"/>벤츠</a></li>
										<li class='li_img'><a href='/auto/?Work=brand&Brand=376' target='_blank'><img src='http://autoimg.danawa.com/photo/brand/376_90.png' alt='폭스바겐' style="display:block;"/>폭스바겐</a></li>
										<li class='li_img'><a href='/auto/?Work=brand&Brand=381' target='_blank'><img src='http://autoimg.danawa.com/photo/brand/381_90.png' alt='포르쉐' style="display:block;"/>포르쉐</a></li>
										<li class='li_img'><a href='/auto/?Work=brand&Brand=371' target='_blank'><img src='http://autoimg.danawa.com/photo/brand/371_90.png' alt='아우디' style="display:block;"/>아우디</a></li>
										<li class='li_img'><a href='/auto/?Work=brand&Brand=436' target='_blank'><img src='http://autoimg.danawa.com/photo/brand/436_90.png' alt='페라리' style="display:block;"/>페라리</a></li>
										<li class='li_img'><a href='/auto/?Work=brand&Brand=440' target='_blank'><img src='http://autoimg.danawa.com/photo/brand/440_90.png' alt='람보르기니' style="display:block;"/>람보르기니</a></li>
										<li class='li_img'><a href='/auto/?Work=brand&Brand=445' target='_blank'><img src='http://autoimg.danawa.com/photo/brand/445_90.png' alt='마세라티' style="display:block;"/>마세라티</a></li>
										<li class='li_img'><a href='/auto/?Work=brand&Brand=413' target='_blank'><img src='http://autoimg.danawa.com/photo/brand/413_90.png' alt='푸조' style="display:block;"/>푸조</a></li>
										<li class='li_img'><a href='/auto/?Work=brand&Brand=385' target='_blank'><img src='http://autoimg.danawa.com/photo/brand/385_90.png' alt='롤스로이스' style="display:block;"/>롤스로이스</a></li>
										<li class='li_img'><a href='/auto/?Work=brand&Brand=390' target='_blank'><img src='http://autoimg.danawa.com/photo/brand/390_90.png' alt='벤틀리' style="display:block;"/>벤틀리</a></li>
										<li class='li_img'><a href='/auto/?Work=brand&Brand=394' target='_blank'><img src='http://autoimg.danawa.com/photo/brand/394_90.png' alt='재규어' style="display:block;"/>재규어</a></li>
										<li class='li_img'><a href='/auto/?Work=brand&Brand=399' target='_blank'><img src='http://autoimg.danawa.com/photo/brand/399_90.png' alt='랜드로버' style="display:block;"/>랜드로버</a></li>
										<li class='li_img'><a href='/auto/?Work=brand&Brand=459' target='_blank'><img src='http://autoimg.danawa.com/photo/brand/459_90.png' alt='볼보' style="display:block;"/>볼보</a></li>
									</ul>
								</dd>
				          </div>
				         
				          <div class="card-header">
				           		미국
				          </div>
				          <div class="card-body">
				            <dd class=''>
								<ul class='brandList imageLarge'>
									<li class='li_img'><a href='/auto/?Work=brand&Brand=569' target='_blank'><img src='http://autoimg.danawa.com/photo/brand/569_90.png' alt='포드' style="display:block;"/><span class=''>포드</span></a></li>
									<li class='li_img'><a href='/auto/?Work=brand&Brand=587' target='_blank'><img src='http://autoimg.danawa.com/photo/brand/587_90.png' alt='지프' style="display:block;"/><span class=''>지프</span></a></li>
									<li class='li_img'><a href='/auto/?Work=brand&Brand=611' target='_blank'><img src='http://autoimg.danawa.com/photo/brand/611_90.png' alt='테슬라' style="display:block;"/><span class=''>테슬라</span></a></li>
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