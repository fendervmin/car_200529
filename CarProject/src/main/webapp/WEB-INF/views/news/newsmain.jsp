<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1", shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>뉴스 메인</title>


<!-- Bootstrap core CSS -->
<link
	href="${ contextPath }/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link href="${ contextPath }/resources/css/shop-homepage.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="${ contextPath }/resources/vendor/jquery/jquery.min.js"></script>
<script
	src="${ contextPath }/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>
<style>

.paging {
	margin-left: 50%;
} 

</style>


<body>
	<c:import url="../common/menubar.jsp" />
	<!-- Page Content -->
	<div class="container">

		<div class="row">

			<div class="col-lg-3" style="margin-top : 50px;">

				<h5 class="my-4">뉴스 메인 > 모든 뉴스</h5>
				<div class="list-group">
					<a href="/news/newsmainPage.do" class="list-group-item">모든 뉴스</a>
				</div>
				<c:if test="${loginUser.member_Type == '관리자' }">
				<div>
					<button class="btn btn-primary" onclick="location.href='/news/insertnewsPage.do'" style="margin-top:10px; margin-bottom: 10px;">뉴스 추가하기</button>
				</div>
				</c:if>
				<div>
					<nav>
					<button class="btn btn-primary" style="margin-top:10px;" onclick="location.href='/news/newsList.do'">뉴스 검색하기</button>
  				<!-- <form class="form-inline" >
   					 <input class="form-control mr-sm-2" type="text" placeholder="Search" id="keyword" name="keyword">
   					 <button class="btn btn-primary" type="submit" onclick="searchNews()">Search</button>
 			    </form> -->
 			    
					</nav>
				</div>

			</div>
			<!-- /.col-lg-3 -->

			<div class="col-lg-9">

				<div id="carouselExampleIndicators" class="carousel slide my-4"
					data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#carouselExampleIndicators" data-slide-to="0"
							class="active"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
					</ol>
					<div class="carousel-inner" role="listbox">
						<div class="carousel-item active">
							<img class="d-block img-fluid"
								src="https://www.tfi4insurance.com/img/~www.tfi4insurance.com/Blog/900x350/900x350CompanyCars.jpg"
								alt="First slide">
						</div>
						<!-- 
            <div class="carousel-item">
              <img class="d-block img-fluid" src="data:image/jpeg;base64,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" alt="Second slide">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="http://placehold.it/900x350" alt="Third slide">
            </div> -->
					</div>
					<a class="carousel-control-prev" href="#carouselExampleIndicators"
						role="button" data-slide="prev"> <span
						class="carousel-control-prev-icon" aria-hidden="true"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
						role="button" data-slide="next"> <span
						class="carousel-control-next-icon" aria-hidden="true"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>

				<div class="row">

					<!-- c:foreach문 시작 -->
					<c:forEach items="${getNews }" var="getNews" varStatus="idx">
						<c:if test="(idx + 1) % 3 == 0">
							<br>
						</c:if>
						<div class="col-lg-4 col-md-6 mb-4">
							<div class="card h-100">
								<a href=" <c:url value="${getNews.news_Url }"/> ">
								<%-- <img src='${ contextPath }/resources/img/${getNews.news_Img }.jpg' style="width: 250px; height: 140px;"> --%>
								<img src='/path_upload/${getNews.news_Thumb}'/ style="width:254px">
								<%-- <img src="${pageContext.request.contextPath }/${getNews.news_Thumb}" /> --%>
								</a>
								<div class="card-body">
									<h4 class="card-title">
										<a href=" <c:url value="${getNews.news_Url }"/> "><c:out
												value="${getNews.news_Title }" /></a>
									</h4>
									<p class="card-text">
										<c:choose>
											<c:when test="${fn:length(getNews.news_Content) gt 51}">
												<c:out value="${fn:substring(getNews.news_Content,0,50)}" />...
              							    </c:when>
											<c:otherwise>
												<c:out value="${getNews.news_Content}" />
											</c:otherwise>
										</c:choose>
									</p>
								</div>
								<div class="card-footer">
									<small class="text-muted"><c:out
											value="${getNews.news_Date }" /></small>
								</div>
								<c:if test="${loginUser.member_Type == '관리자' }">
								<div class="card-footer">
								  <button class="btn btn-primary" onclick="location.href='/news/updateNewsPage.do?n=${getNews.news_Id}'">수정</button>
								  <button class="btn btn-primary" onclick="location.href='/news/delNews.do?n=${getNews.news_Id}'">삭제</button>
								</div>
								</c:if>
							</div>
						</div>
					</c:forEach>

				</div>
				<!-- /.row -->
				<div>
					<ul class="paging">
						<c:if test="${Maker.prev}">
							<li style="list_style: none; float: left; padding: 6px;"><a
								href="writeBoard.do${Maker.makeQuery(Maker.startPage - 1)}">이전</a></li>
						</c:if>

						<c:forEach begin="${Maker.startPage}" end="${Maker.endPage}"
							var="idx">
							<li style="list_style: none; float: left; padding: 6px;"><a
								href="writeBoard.do${Maker.makeQuery(idx)}">${idx}</a></li>
						</c:forEach>

						<c:if test="${Maker.next && Maker.endPage > 0}">
							<li style="list_style: none; float: left; padding: 6px;"><a
								href="writeBoard.do${Maker.makeQuery(Maker.endPage + 1)}">다음</a></li>
						</c:if>
					</ul>
				</div>
			</div>
			<!-- /.col-lg-9 -->

		</div>
		<!-- /.row -->

	</div>

	<c:import url="../common/footer.jsp" />

</body>
</html>