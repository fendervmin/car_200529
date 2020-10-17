<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style>
.container{
margin-bottom:50px;
margin-top:80px;
}

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<script type="text/javascript">

function goodsAdd(){
	
	var car_Name = $("#car_Name").val();
	var car_Type = $("#car_Type").val();
	var fuel_Type = $("#fuel_Type").val();
	var car_Fuel = $("#car_Fuel").val();
	var car_Price = $("#car_Price").val();
	var car_Img = $("#car_Img").val();
	var brand_Id = $("#brand_Id").val();
	
	if(!car_Name){
		alert("차 이름 입력은 필수입니다.");
		$("#car_Name").focus();
	}else if(!car_Type) {
		alert("차 타입 입력은 필수입니다.");
		$("#car_Type").focus();
	}else if(!fuel_Type){
		alert("연료 타입 입력은 필수입니다.");
		$("#fuel_Type").focus();
	}else if(!car_Fuel){
		alert("차 연비 입력은 필수입니다.");
		$("#car_Fuel").focus();
	}else if(!car_Price){
		alert("차 가격 입력은 필수입니다.");
		$("#car_Price").focus();
	}else {
		alert("상품등록이 완료되었습니다.");
		$('#goodsAdd').attr('action', '/goods/goodsAdd.do').submit();
	}
	
}
</script>
</head>
<body>
	<c:import url="/WEB-INF/views/common/menubar.jsp"/>
	
	<div class="container" >
	<form class="goodsAdd" id="goodsAdd" method="post" style="margin-left:380px;">
        <div class="fieldlabel"><label for="car_Name">차 이름</label></div>
        <div class="formfield"><input type="text" id="car_Name" name="car_Name" maxlength="20" value="" class="form-control" style="width:400px;"></div>
        
        <div class="fieldlabel"><label for="car_Type">차 타입</label></div>
        <div class="formfield"><input type="text" style="width:400px;" id="car_Type" name="car_Type" class="form-control"></div>

        <div class="fieldlabel"><label for="fuel_Type">연료 타입</label></div>
        <div class="formfield"><input type="text" style="width:400px;" id="fuel_Type" name="fuel_Type" maxlength="20" autocomplete="off" class="form-control"></div>
		
		<div class="fieldlabel"><label for="car_Img">차 이미지</label></div>
        <div class="formfield"><input type="text" style="width:400px;" id="car_Img" name="car_Img" maxlength="20" autocomplete="off" class="form-control"></div>
		
        <div class="fieldlabel"><label for="car_Fuel">연비</label></div>
        <div class="formfield"><input type="text" style="width:400px;" id="car_Fuel" name="car_Fuel" maxlength="20" autocomplete="off" class="form-control"></div>
       
        <div class="fieldlabel"><label for="car_Price">가격</label></div>
        <div class="formfield"><input type="text" style="width:400px;" id="car_Price" name="car_Price" maxlength="20" value="" class="form-control"></div>

        <div class="fieldlabel"><label for="brand_Id">브랜드</label></div>
        <div class="formfield"><input type="text" style="width:400px;" id="brand_Id" name="brand_Id" maxlength="20" value="" class="form-control"></div>

       
        <div class="btnfield">
            <input type="button" style="margin-top:10px;margin-bottom:10px;" onclick="goodsAdd()" value="추가" class="btn btn-primary" >
        	<input type="button" style="margin-top:10px;margin-bottom:10px;" onclick="history.back(-1)" value="취소" class="btn btn-primary" >
        </div>
    </form>
</div>
    
    
    <footer id="footer">
		<div id="footer_box">
			<%@ include file="../common/footer.jsp" %>
		</div>
	</footer>
	
</body>
</html>