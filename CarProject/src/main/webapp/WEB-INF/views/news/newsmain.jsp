<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" , shrink-to-fit=no">
<meta name="description" content="">
  <meta name="author" content="">
  
  <title>뉴스 메인</title>
  
  
  <!-- Bootstrap core CSS -->
  <link href="${ contextPath }/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="${ contextPath }/resources/css/shop-homepage.css" rel="stylesheet">
  
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="${ contextPath }/resources/vendor/jquery/jquery.min.js"></script>
  <script src="${ contextPath }/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> 

</head>


<body>
<c:import url="../common/menubar.jsp"/>
  <!-- Page Content -->
  <div class="container">

    <div class="row">

      <div class="col-lg-3">

        <h5 class="my-4"> 뉴스 메인 > 모든 뉴스</h5> 
        <div class="list-group">
          <a href="/news/newsmainPage.do" class="list-group-item">모든 뉴스</a>
          <a href="/news/hotnewsPage.do" class="list-group-item">주요 뉴스</a>
        </div>

      </div>
      <!-- /.col-lg-3 -->

      <div class="col-lg-9">

        <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner" role="listbox">
            <div class="carousel-item active">
              <img class="d-block img-fluid" src="http://placehold.it/900x350" alt="First slide">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="http://placehold.it/900x350" alt="Second slide">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="http://placehold.it/900x350" alt="Third slide">
            </div>
          </div>
          <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>

        <div class="row">
        
        <!-- c:foreach문 시작 -->
        <c:forEach items="${getNews }" var="getNews" begin="0" end="0">
          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href=" <c:url value="${getNews.news_Url }"/> "><img src='${ contextPath }/resources/img/allnews_1.jpg' style="width:250px; height:140px;"></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href=" <c:url value="${getNews.news_Url }"/> "><c:out value="${getNews.news_Title }"/></a>
                </h4>
                <p class="card-text">
                <c:choose>
                <c:when test="${fn:length(getNews.news_Content) gt 51}">
                <c:out value="${fn:substring(getNews.news_Content,0,50)}"/>...
                </c:when>
                <c:otherwise>
       			 <c:out value="${getNews.news_Content}"/>
       			 </c:otherwise>
                </c:choose>
                </p>
              </div>
              <div class="card-footer">
                <small class="text-muted"><c:out value="${getNews.news_Date }"/></small>
              </div>
            </div>
          </div>
   		</c:forEach>
   		
   		<c:forEach items="${getNews }" var="getNews" begin="1" end="1">
          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href=" <c:url value="${getNews.news_Url }"/> "><img src='${ contextPath }/resources/img/allnews_2.jpg' style="width:250px; height:140px;"></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href=" <c:url value="${getNews.news_Url }"/> "><c:out value="${getNews.news_Title }"/></a>
                </h4>
                <p class="card-text">
                <c:choose>
                <c:when test="${fn:length(getNews.news_Content) gt 51}">
                <c:out value="${fn:substring(getNews.news_Content,0,50)}"/>...
                </c:when>
                <c:otherwise>
       			 <c:out value="${getNews.news_Content}"/>
       			 </c:otherwise>
                </c:choose>
                </p>
              </div>
              <div class="card-footer">
                <small class="text-muted"><c:out value="${getNews.news_Date }"/></small>
              </div>
            </div>
          </div>
          </c:forEach>
 	
          <c:forEach items="${getNews }" var="getNews" begin="2" end="2">
          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href=" <c:url value="${getNews.news_Url }"/> "><img src='${ contextPath }/resources/img/allnews_3.jpg' style="width:250px; height:140px;"></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href=" <c:url value="${getNews.news_Url }"/> "><c:out value="${getNews.news_Title }"/></a>
                </h4>
                <p class="card-text">
                <c:choose>
                <c:when test="${fn:length(getNews.news_Content) gt 51}">
                <c:out value="${fn:substring(getNews.news_Content,0,50)}"/>...
                </c:when>
                <c:otherwise>
       			 <c:out value="${getNews.news_Content}"/>
       			 </c:otherwise>
                </c:choose>
                </p>
              </div>
              <div class="card-footer">
                <small class="text-muted"><c:out value="${getNews.news_Date }"/></small>
              </div>
            </div>
          </div>
          </c:forEach>

          <c:forEach items="${getNews }" var="getNews" begin="3" end="3">
          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href=" <c:url value="${getNews.news_Url }"/> "><img src='${ contextPath }/resources/img/allnews_4.jpg' style="width:250px; height:140px;"></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href=" <c:url value="${getNews.news_Url }"/> "><c:out value="${getNews.news_Title }"/></a>
                </h4>
                <p class="card-text">
                <c:choose>
                <c:when test="${fn:length(getNews.news_Content) gt 51}">
                <c:out value="${fn:substring(getNews.news_Content,0,50)}"/>...
                </c:when>
                <c:otherwise>
       			 <c:out value="${getNews.news_Content}"/>
       			 </c:otherwise>
                </c:choose>
                </p>
              </div>
              <div class="card-footer">
                <small class="text-muted"><c:out value="${getNews.news_Date }"/></small>
              </div>
            </div>
          </div>
          </c:forEach>

          <c:forEach items="${getNews }" var="getNews" begin="4" end="4">
          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href=" <c:url value="${getNews.news_Url }"/> "><img src='${ contextPath }/resources/img/allnews_5.jpg' style="width:250px; height:140px;"></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href=" <c:url value="${getNews.news_Url }"/> "><c:out value="${getNews.news_Title }"/></a>
                </h4>
                <p class="card-text">
                <c:choose>
                <c:when test="${fn:length(getNews.news_Content) gt 51}">
                <c:out value="${fn:substring(getNews.news_Content,0,50)}"/>...
                </c:when>
                <c:otherwise>
       			 <c:out value="${getNews.news_Content}"/>
       			 </c:otherwise>
                </c:choose>
                </p>
              </div>
              <div class="card-footer">
                <small class="text-muted"><c:out value="${getNews.news_Date }"/></small>
              </div>
            </div>
          </div>
          </c:forEach>

          <c:forEach items="${getNews }" var="getNews" begin="5" end="5">
          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href=" <c:url value="${getNews.news_Url }"/> "><img src='${ contextPath }/resources/img/allnews_6.jpg' style="width:250px; height:140px;"></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href=" <c:url value="${getNews.news_Url }"/> "><c:out value="${getNews.news_Title }"/></a>
                </h4>
                <p class="card-text">
                <c:choose>
                <c:when test="${fn:length(getNews.news_Content) gt 51}">
                <c:out value="${fn:substring(getNews.news_Content,0,50)}"/>...
                </c:when>
                <c:otherwise>
       			 <c:out value="${getNews.news_Content}"/>
       			 </c:otherwise>
                </c:choose>
                </p>
              </div>
              <div class="card-footer">
                <small class="text-muted"><c:out value="${getNews.news_Date }"/></small>
              </div>
            </div>
          </div>
          </c:forEach>

        </div>
        <!-- /.row -->

      </div>
      <!-- /.col-lg-9 -->

    </div>
    <!-- /.row -->

  </div>
  
  <c:import url="../common/footer.jsp"/>

</body>
</html>