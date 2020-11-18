<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/mainView/common.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.min.js"></script>
<style>
#header .subLyr {
	display: block;
	max-height: 280px;
}

#header .debsss {
	margin-top: 5px;
	font-weight: bold;
	font-size: 15px;
	display: block;
	position: relative;
	line-height: 30px;
	padding: 0 30px;
}

#header a:not ([href] ):not ([tabindex] ):hover, a:not ([href] ):not ([tabindex]
	):focus {
	color: white;
	text-decoration: none;
}

#header .header {
	transition: All 0.2s ease;
}

#header .temp.debs>li:hover {
	cursor: pointer;
}

#header .menubar_li>a {
	display: block;
	position: relative;
	padding: 0 20px;
	font-size: 14px;
	line-height: 43px;
	color: #ffffff;
	z-index: 2;
	cursor: pointer;
	text-decoration: none;
}

#header dd {
	position: relative;
	float: left;
	margin-inline-start: 1px;
}

#header.menubar_li {
	padding: 0 50px;
}

#hd_gnb li a:hover:not (.active ) {
	background-color: #111;
}

#hd_gnb .active {
	background-color: #4CAF50;
}
.search
{
	text-align:right;
	padding-right:20px;
}
</style>
<script>
	var lastScrollTop = 0, delta = 15;
	$(window).scroll(function(event) {
		var st = $(this).scrollTop();
		if (Math.abs(lastScrollTop - st) <= delta)
			return;
		if ((st > lastScrollTop) && (lastScrollTop > 0)) {
			$(".header").css({
				"top" : "-110px"
			});
		} else {
			$(".header").css({
				"top" : "0"
			});
		}
		lastScrollTop = st;
	});
	

</script>
</head>
<body>

   <div id="header" class="header" style="outline: none;">
   <!-- 오른쪽 맨 위 상단에 로그인, 회원가입, 등등 버튼있는 부분입니다... -->
   	<div class="contain"  style="margin-top:10px;">
      <dl class="hd_my">
         <dt class="ir">마이메뉴</dt>
         
         <c:if test="${ empty sessionScope.loginUser }">
         <dd id="header_loginbtn">
            <a href='/user/loginPage.do' style="font-size:15px">로그인</a>
         </dd>
         <dd id="header_joinbtn">
            <a href='/user/signUpPage.do' style="font-size:15px">회원가입</a>
         </dd>
         </c:if>
         <c:if test="${ !empty sessionScope.loginUser && loginUser.member_Type != '관리자' }">
         <dd>
            <a style="font-size:12px;" style="font-size:15px"> ${ loginUser.member_Name }님 환영합니다.</a>
         </dd>
         <dd class="arw">
            <a href='/user/mypagePage.do' style="font-size:15px">마이페이지</a>
         </dd>
         <dd>
            <a href='/user/logout.do' style="font-size:15px">로그아웃</a>
         </dd>
         </c:if>
         
         <!-- 관리자 로그인시 -->
         <c:if test="${loginUser.member_Type == '관리자' }">
         <dd>
            <a style="font-size:12px;" style="font-size:15px"> ${ loginUser.member_Name }님 환영합니다.</a>
         </dd>
         <dd class="arw">
            <a href='/user/mypagePage.do' style="font-size:15px">마이페이지</a>
         </dd>
         <dd>
            <a href='/user/logout.do' style="font-size:15px">로그아웃</a>
         </dd>
         <dd>
            <a href='/user/admin.do' style="font-size:15px">관리자</a>
         </dd>
         </c:if>
         <dd class="arw">
            <!-- <a href="">고객센터<em class="ir">메뉴보기</em></a> -->
            <div class="lys" style="display: none;"></div>
         </dd>
      </dl>
   </div>
   
   <!-- 상단 로고입니다 (로고 이미지 임시) -->
      <div class="hd_top" style="margin-top:30px;">
         <h1 class="sd">
            <a><img src="/resources/logo.jpg" style="width:300px; heigth:500px;"></a>
         </h1>
      </div>
      
	<div class="search" style="margin-bottom:15px;">
				<form name="search" method="get" action="../goods/goodsSearch.do">
					<td><input type="text" style="width:150px; heigth:50px;" name="keyword"></td>
					<td><input type="submit" value="search"></td>
				</form>
	</div>
   <!-- 메뉴바  -->
   <div class="hd_gnb">
      <h3 class="ir">카테고리메뉴</h3>
	      <ul id="menubar">
	
	         <li class="menubar_li" style="color:white;"><a href="../goods/goodsSales.do">판매실적</a></li>
	         
	         <li class="menubar_li" style="color:white;"><a href="../goods/brandList.do">자동차백과</a></li>
	
	         <li class="menubar_li" style="color:white;"><a href="../board/writeBoard.do">커뮤니티</a></li>
	
	         <li class="menubar_li" style="color:white;"><a href="../news/newsmainPage.do">뉴스</a></li>
	      </ul>
	   </div>
	</div>

   <!-- 코드 끝!! -->
   <div style="margin-top:170px"></div>
   <br clear="all">
   <!-- 메뉴바 슬라이드 옵션 관련 스크립트 -->
   <script>
      /* 메인 메뉴바 슬라이드 옵션 */
      /* $('.menubar_li').hover(function() {
         $(this).children('.subLyr').slideDown({
            'display' : 'block',
            'height' : '280px',
            '-webkit-transition' : 'height 0.3s',
            'transition' : 'height 0.3s'
         });
      }, function(){
         $(this).children('.subLyr').slideUp(0);
      });
       */
       $('.menubar_li').hover(function() {
            $(this).children('.subLyr').css({
               'display' : 'block',
               'height' : '280px'
            });
         }, function(){
            $(this).children('.subLyr').css({
               'display' : 'none',
               'height' : '280px'
            });
         });
      
      /*맨 오른쪽 상단 메뉴바 슬라이드 옵션*/
      $('.arw').hover(function() {
         $(this).find('.lys').css({
            'display' : 'block',
            'max-height' : '260px'
         });
      }, function() {
         $(this).find('.lys').css({
            'display' : 'none',
            'max-height' : ''
         });
      });
   </script>
</body>
</html>