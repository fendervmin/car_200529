<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<c:import url="/WEB-INF/views/common/menubar.jsp"/>

<div class="container" >
<div class="row" >

<div class="col-lg-3" style="margin-top : 50px;">

<div class="list-group">
  <a href="/user/admin.do" class="list-group-item active">회원 리스트</a>
</div>
</div>
<div style="margin-top : 50px;">
         
  
  <div class="dropdown">
    <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
      	회원정렬
    </button>
    <div class="dropdown-menu">
      <a class="dropdown-item" id="dropdown" onclick="dropdown(1)" value="1">현재 회원</a>
      <a class="dropdown-item" id="dropdown" onclick="dropdown(2)" value="2">탈퇴한 회원</a>
    </div>
  </div>

  
         
  <table class="table table-hover" style="margin-top : 30px;">
    <thead>
      <tr>
        <th>회원 아이디</th>
        <th>회원 닉네임</th>
        <th>회원 이메일</th>
        <th>회원 가입일</th>
        <th>회원 탈퇴일</th>
      </tr>
    </thead>
    <tbody>
    
    <c:forEach items="${getAllUser }" var="getAllUser" varStatus="idx">
      <tr class="basic">
        <td>${getAllUser.member_UserId }</td>
        <td>${getAllUser.member_Nicname }</td>
        <td>${getAllUser.member_Email }</td>
        <td>${getAllUser.member_In }</td>
        <td>${getAllUser.member_Out }</td>
      </tr>
    </c:forEach>
    
    <c:forEach items="${currentMember }" var="currentMember" varStatus="idx">
      <tr class="current" >
        <td>${currentMember.member_UserId }</td>
        <td>${currentMember.member_Nicname }</td>
        <td>${currentMember.member_Email }</td>
        <td>${currentMember.member_In }</td>
        <td>${currentMember.member_Out }</td>
      </tr>
    </c:forEach>
    
    <c:forEach items="${notcurrentMember }" var="notcurrentMember" varStatus="idx">
      <tr class="notcurrent">
        <td>${notcurrentMember.member_UserId }</td>
        <td>${notcurrentMember.member_Nicname }</td>
        <td>${notcurrentMember.member_Email }</td>
        <td>${notcurrentMember.member_In }</td>
        <td>${notcurrentMember.member_Out }</td>
      </tr>
    </c:forEach>
    
    <c:forEach items="${getUserSearch }" var="getUserSearch" varStatus="idx">
      <tr class="getUserSearch">
        <td>${getUserSearch.member_UserId }</td>
        <td>${getUserSearch.member_Nicname }</td>
        <td>${getUserSearch.member_Email }</td>
        <td>${getUserSearch.member_In }</td>
        <td>${getUserSearch.member_Out }</td>
      </tr>
    </c:forEach>
    
   
    </tbody>
  </table>
  
  
  
  <div class="form-group row justify-content-center">
			<div class="w100" style="padding-right:10px">
				<select class="form-control form-control-sm" name="searchType" id="searchType">
					<option value="member_UserId">아이디</option>
					<option value="member_Nicname">닉네임</option>
					<option value="member_Email">이메일</option>
				</select>
			</div>
			<div class="w300" style="padding-right:10px">
				<input type="text" class="form-control form-control-sm" name="keyword" id="keyword">
			</div>
			<div>
				<button class="btn btn-sm btn-primary" name="btnSearch" id="btnSearch">검색</button>
			</div>
		</div>
  </div>
</div>

</div>

<script type="text/javascript">

$(document).ready(function(){
	$('.current').hide();
	$('.notcurrent').hide();
});


function dropdown(num) {
	if (num==1) {
		$('.basic').hide();
		$('.current').show();
		$('.notcurrent').hide();
	} else if (num==2){
		$('.basic').hide();
		$('.current').hide();
		$('.notcurrent').show();
	}
}

$(document).on('click', '#btnSearch', function(e){
	e.preventDefault();
	var url = "/user/getUserSearch.do";
	url = url + "?searchType=" + $('#searchType').val();
	url = url + "&keyword=" + $('#keyword').val();
	location.href = url;
	console.log(url);
});	

</script>
<c:import url="/WEB-INF/views/common/footer.jsp"/>		
</body>
</html>