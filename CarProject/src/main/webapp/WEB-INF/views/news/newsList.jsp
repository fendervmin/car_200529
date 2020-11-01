<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>

<style>
.active-pink-2 input.form-control[type=text]:focus:not([readonly]) {
  border-bottom: 1px solid #f48fb1;
  box-shadow: 0 1px 0 0 #f48fb1;
}
.active-pink input.form-control[type=text] {
  border-bottom: 1px solid #f48fb1;
  box-shadow: 0 1px 0 0 #f48fb1;
}
.active-purple-2 input.form-control[type=text]:focus:not([readonly]) {
  border-bottom: 1px solid #ce93d8;
  box-shadow: 0 1px 0 0 #ce93d8;
}
.active-purple input.form-control[type=text] {
  border-bottom: 1px solid #ce93d8;
  box-shadow: 0 1px 0 0 #ce93d8;
}
.active-cyan-2 input.form-control[type=text]:focus:not([readonly]) {
  border-bottom: 1px solid #4dd0e1;
  box-shadow: 0 1px 0 0 #4dd0e1;
}
.active-cyan input.form-control[type=text] {
  border-bottom: 1px solid #4dd0e1;
  box-shadow: 0 1px 0 0 #4dd0e1;
}
.active-cyan .fa, .active-cyan-2 .fa {
  color: #4dd0e1;
}
.active-purple .fa, .active-purple-2 .fa {
  color: #ce93d8;
}
.active-pink .fa, .active-pink-2 .fa {
  color: #f48fb1;
}
</style>
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

<c:import url="/WEB-INF/views/common/menubar.jsp"/>

<%-- <div class="panel panel-default" style="float:left; margin-top:50px; margin-left:10px;">
  <div class="panel-heading">
    <h3 class="panel-title">인기 검색어</h3>
  </div>
    <ul class="list-group">
      <c:forEach items="${keywordlist }" var="keywordlist" end="10">
        <li class="list-group-item"><a href="#">${keywordlist.keyword }</a></li>
       </c:forEach>
    </ul>
</div>      --%>

<!-- <div style="clear: both;"></div> -->



<div class="container mt-3" style="float: left; margin-left:250px; padding-top:50px;">
  <h2>뉴스 검색</h2>
  <p>찾고자 하는 뉴스의 키워드를 검색해보세요 :</p>  
  <form action="newsList.do">
  <input class="form-control" id="keyword" name="keyword" type="text" placeholder="Search"/>
  <button type="submit" class="form-control" onclick="location.href='/news/newsList.do'" style="margin-top:10px">검색하기</button>
  </form>
  <!-- Search form-->
  
  <br> 
  
  <!-- <table class="table table-bordered"> -->
    <!-- <thead>
      <tr>
        <th>뉴스 제목</th>
        <th>뉴스 내용</th>
        <th>뉴스 작성날짜</th>
      </tr>
    </thead> -->
    
    <tbody id="myTable">
    <c:forEach items="${newsList }" var="news">
      <tr>
        <%-- <td>"${news.title }"</td> --%>
        <td>
        <a href=" <c:url value="${news.link }"/> ">
        <font size="5px">
        <c:out value="${news.title }" />
        </font> </a>
        
        </td>
        <br>
        <td>
        <c:choose>
				<c:when test="${fn:length(news.description) gt 151}">
					<c:out value="${fn:substring(news.description,0,150)}" />...
              	</c:when>
				<c:otherwise>
					<c:out value="${news.description}" />
				</c:otherwise>
		</c:choose>
		</td>
		<br><br><br>
        <%-- <td>"${news.pubDate}"</td> --%>
      </tr>
    </c:forEach>
    </tbody>
  <!-- </table> -->
  
</div>

<div class="panel panel-default" style="float:right; margin-right:200px; padding-top:90px;">
  <div class="panel-heading">
    <h3 class="panel-title">인기 검색어</h3>
  </div>
    <ul class="list-group">
      <c:forEach items="${keywordlist }" var="keywordlist" end="10">
        <li class="list-group-item"><a href="#">${keywordlist.keyword }</a></li>
       </c:forEach>
    </ul>
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

<c:import url="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>