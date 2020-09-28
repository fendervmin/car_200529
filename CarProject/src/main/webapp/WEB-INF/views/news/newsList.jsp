<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴스 검색</title>
<title>뉴스 검색하기</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  
</head>
<body>

<div class="container mt-3">
  <h2>뉴스 검색</h2>
  <p>찾고자 하는 뉴스의 키워드를 검색해보세요 :</p>  
  <form action="newsList.do">
  <input class="form-control" id="keyword" name="keyword" type="text" placeholder="Search"/>
  <button type="submit" class="form-control" onclick="location.href='/news/newsList.do'">검색하기</button>
  </form>
  <br>
  <table class="table table-bordered">
    <thead>
      <tr>
        <th>뉴스 제목</th>
        <th>뉴스 내용</th>
        <th>뉴스 링크</th>
        <th>뉴스 오리지널 링크</th>
        <th>뉴스 작성날짜</th>
      </tr>
    </thead>
    
    <c:forEach items="${newsList }" var="news">
    <tbody id="myTable">
      <tr>
        <td>"${news.title }"</td>
        <td>"${news.description }"</td>
        <td>"${news.link }"</td>
        <td>"${news.originallink }"</td>
        <td>"${news.pubDate }"</td>
      </tr>
    </tbody>
    </c:forEach>
  </table>
  
</div>

<script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>

</body>
</html>