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

</head>
<body>
	<c:import url="/WEB-INF/views/common/menubar.jsp"/>
	
	<div class="container" >
	<form class="goodsModify" id="goodsModify" method="post" style="margin-left:380px;">
	
		<input type="hidden" name="b" value="${detail.brand_Id }" />
		<input type="hidden" name="c" value="${detail.car_ID }" />
		<input type="hidden" name="car_ID" value="${detail.car_ID }" />
        <div class="fieldlabel"><label for="car_Name">차 이름</label></div>
        <div class="formfield"><input type="text" id="car_Name" name="car_Name" maxlength="20" value="${detail.car_Name }" class="form-control" style="width:400px;"></div>
        
        <div class="fieldlabel"><label for="car_Type">차 타입</label></div>
        <div class="formfield"><input type="text" style="width:400px;" id="car_Type" name="car_Type" value="${detail.car_Type }" class="form-control"></div>

        <div class="fieldlabel"><label for="fuel_Type">연료 타입</label></div>
        <div class="formfield"><input type="text" style="width:400px;" id="fuel_Type" name="fuel_Type" value="${detail.fuel_Type }" maxlength="20" autocomplete="off" class="form-control"></div>
		
		<div class="fieldlabel"><label for="car_Img">차 이미지</label></div>
        <div class="formfield"><input type="text" style="width:400px;" id="car_Img" name="car_Img" value="${detail.car_Img }" maxlength="20" autocomplete="off" class="form-control"></div>
		
        <div class="fieldlabel"><label for="car_Fuel">연비</label></div>
        <div class="formfield"><input type="text" style="width:400px;" id="car_Fuel" name="car_Fuel" value="${detail.car_Fuel }" maxlength="20" autocomplete="off" class="form-control"></div>
       
        <div class="fieldlabel"><label for="car_Price">가격</label></div>
        <div class="formfield"><input type="text" style="width:400px;" id="car_Price" name="car_Price" value="${detail.car_Price }" maxlength="20" class="form-control"></div>

        <div class="fieldlabel"><label for="brand_Id">브랜드</label></div>
        <div class="formfield"><input type="text" style="width:400px;" id="brand_Id" name="brand_Id" value="${detail.brand_Id }" maxlength="20" class="form-control"></div>

       
        <div class="btnfield" style="margin-top:10px;">
			 <input type="button" id="update_Btn" onclick="goodsModify()" class="btn btn-primary" value="수정" />
			 <button type="button" id="back_Btn" onclick="history.back(-1)" class="btn btn-warning">취소</button>
        
        	 <script type="text/javascript">

				function goodsModify(){
					
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
						alert("상품수정이 완료되었습니다.");
						/* location.href="/goods/brandList.do"; */
						$('#goodsModify').attr('action', '/goods/modify.do').submit();
					}
					
				}
				</script>
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