<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약하기</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=55fa8e62d9539c2a862fa8409f6e5608&libraries=services,clusterer,drawing"></script>
<script>
var $j = $.noConflict(true);
$j(function(){
	$j('#date1').datepicker({
	  changeYear:true,
	  changeMonth:true,
	  dateFormat : "yy-mm-dd",
	  showMonthAfterYear: true,
	  dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
	  monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
	});
});

</script>
</head>
<body>
<c:import url="../common/menubar.jsp"/>

<div id="map" style="width:500px;height:400px;"></div>

<form action="/reserve/reserve.do" method="post">
	<input type="text" id="selectJijum" name="selectJijum" style="width: 200px;" readonly="readonly"/>
	<input type="hidden" id="brand_id" name="brand_id" value="${brand_id}"/>
	<input type="text" name="date_select" id="date1" size="12" style="" placeholder="날짜를 선택하세요." readonly="readonly"/>
	<label for="time-select">방문할 시간을 선택해주세요.</label>
	
	<select id="time-select" name="time_select">
		<option value="10:00">10:00</option>
		<option value="11:00">11:00</option>
		<option value="12:00">12:00</option>
		<option value="14:00">14:00</option>
		<option value="15:00">15:00</option>
		<option value="16:00">16:00</option>
	</select>
	
	<input type="submit" value="예약하기"/>
</form>
<script>
//마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

var mapContainer = document.getElementById('map'),
	mapOption = { //지도를 생성할 때 필요한 기본 옵션
	center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
	level: 3 //지도의 레벨(확대, 축소 정도)
};

var map = new kakao.maps.Map(mapContainer, mapOption);
var ps = new kakao.maps.services.Places(); 

//키워드로 장소를 검색합니다
ps.keywordSearch("${ brand }자동차", placesSearchCB); 

//키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        var bounds = new kakao.maps.LatLngBounds();

        for (var i=0; i<data.length; i++) {
            displayMarker(data[i]);    
            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
        }       

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    } 
}

//지도에 마커를 표시하는 함수입니다
function displayMarker(place) {
    
    // 마커를 생성하고 지도에 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: new kakao.maps.LatLng(place.y, place.x) 
    });
    
 // 마커에 클릭이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'click', function() {
        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
        infowindow.open(map, marker);
        $('#selectJijum').val(place.place_name);
    });
}
</script>

<c:import url="../common/footer.jsp"/>
</body>
</html>