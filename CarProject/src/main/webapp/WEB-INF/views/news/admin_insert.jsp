<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<title>뉴스 추가하기</title>
</head>
<body>


<c:import url="/WEB-INF/views/common/menubar.jsp"/>


	<div class="container">
		<form class="insertNews" id="insertNewsForm" method="post" style="margin-left:380px; margin-top:50px;"
				enctype="multipart/form-data" action='/news/insNews.do' method='post'>
         <div class="form-group">
            <label for="news_Title">뉴스 제목 : </label>
            <input type="text"
               id="news_Title" name="news_Title" class="form-control"
               placeholder="TITLE" autofocus onkeyup="enterKeyCheck()" style="width:300px;">
         </div>
         <div class="form-group">
            <label for="news_Content">뉴스 내용 : </label>
            <input type="text"
               id="news_Content" name="news_Content" class="form-control"
               placeholder="CONTENT" onkeyup="enterKeyCheck()" style="width:300px;">
         </div>
         <div class="form-group">
            <label for="news_Url">뉴스 URL : </label>
            <input type="text"
               id="news_Url" name="news_Url" class="form-control"
               placeholder="URL" onkeyup="enterKeyCheck()" style="width:300px;">
         </div>
         <div class="form-group">
            <label for="news_Upload">첨부 이미지 : </label>
            <input type="file"
               id="news_Upload" name="news_Upload" class="form-control"
               placeholder="IMAGE" onkeyup="enterKeyCheck()" accept="image/*" style="width:300px;">
         </div>
         
         <input type="submit" value="추가" class="btn btn-primary"> 
         <input type="button" value="취소" onclick="location.href='history.go(-1)'" class="btn btn-primary">
      </form>
	</div>
	
<c:import url="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>