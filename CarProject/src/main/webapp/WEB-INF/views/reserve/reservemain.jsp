<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=55fa8e62d9539c2a862fa8409f6e5608"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=55fa8e62d9539c2a862fa8409f6e5608&libraries=LIBRARY"></script>
<!-- services 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=55fa8e62d9539c2a862fa8409f6e5608&libraries=services"></script>
<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=55fa8e62d9539c2a862fa8409f6e5608&libraries=services,clusterer,drawing"></script>

</head>
<body>
<c:import url="../common/menubar.jsp"/>

<div id="map" style="width:500px;height:400px;"></div>

<script>
var container = document.getElementById('map');
var options = { //지도를 생성할 때 필요한 기본 옵션
	center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
	level: 3 //지도의 레벨(확대, 축소 정도)
};

var map = new kakao.maps.Map(container, options);
//지도 생성 및 객체 리턴
</script>

<c:import url="../common/footer.jsp"/>
</body>
</html>