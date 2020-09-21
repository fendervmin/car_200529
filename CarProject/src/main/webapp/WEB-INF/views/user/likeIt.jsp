<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <c:set var="root" value="${pageContext.request.contextPath }/"/> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>마이 페이지</title>

  <!-- Bootstrap core CSS -->
  <link href="${pageContext.request.contextPath }/resources/resources.user.css/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="${pageContext.request.contextPath }/resources/resources.user.css/css/heroic-features.css" rel="stylesheet" >

  <!-- Bootstrap core JavaScript -->
  <script src="${pageContext.request.contextPath }/resources/resources.user.css/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/resources.user.css/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

	<script type="text/javascript">
		function removeCheck(){
			if(confirm("정말로 탈퇴하시겠습니까?") == true){
				location.href= '/user/removeUser.do';
			}else{
				alert("회원탈퇴를 취소하였습니다.");
			}
		}
		
		$('.btn-example').click(function(){
		    var $href = $(this).attr('href');
		    layer_popup($href);
		});
		function layer_popup(el){
		
		    var $el = $(el);        //레이어의 id를 $el 변수에 저장
		    var isDim = $el.prev().hasClass('dimBg');   //dimmed 레이어를 감지하기 위한 boolean 변수
		
		    isDim ? $('.dim-layer').fadeIn() : $el.fadeIn();
		
		    var $elWidth = ~~($el.outerWidth()),
		        $elHeight = ~~($el.outerHeight()),
		        docWidth = $(document).width(),
		        docHeight = $(document).height();
		
		    // 화면의 중앙에 레이어를 띄운다.
		    if ($elHeight < docHeight || $elWidth < docWidth) {
		        $el.css({
		            marginTop: -$elHeight /2,
		            marginLeft: -$elWidth/2
		        })
		    } else {
		        $el.css({top: 0, left: 0});
		    }
		
		    $el.find('a.btn-layerClose').click(function(){
		        isDim ? $('.dim-layer').fadeOut() : $el.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
		        return false;
		    });
		
		    $('.layer .dimBg').click(function(){
		        $('.dim-layer').fadeOut();
		        return false;
		    });
		
		}
	</script>
<style>
	.pop-layer .pop-container {
	  padding: 20px 25px;
	}
	
	.pop-layer p.ctxt {
	  color: #666;
	  line-height: 25px;
	}
	
	.pop-layer .btn-r {
	  width: 100%;
	  margin: 10px 0 20px;
	  padding-top: 10px;
	  border-top: 1px solid #DDD;
	  text-align: right;
	}
	
	.pop-layer {
	  display: none;
	  position: absolute;
	  top: 50%;
	  left: 50%;
	  width: 550px;
	  height: auto;
	  background-color: #fff;
	  border: 5px solid #3571B5;
	  z-index: 10;
	}
	
	.dim-layer {
	  display: none;
	  position: fixed;
	  _position: absolute;
	  top: 0;
	  left: 0;
	  width: 100%;
	  height: 100%;
	  z-index: 100;
	}
	
	.dim-layer .dimBg {
	  position: absolute;
	  top: 0;
	  left: 0;
	  width: 100%;
	  height: 100%;
	  background: #000;
	  opacity: .5;
	  filter: alpha(opacity=50);
	}
	
	.dim-layer .pop-layer {
	  display: block;
	}
	
	a.btn-layerClose {
	  display: inline-block;
	  height: 25px;
	  padding: 0 14px 0;
	  border: 1px solid #304a8a;
	  background-color: #3f5a9d;
	  font-size: 13px;
	  color: #fff;
	  line-height: 25px;
	}
	
	a.btn-layerClose:hover {
	  border: 1px solid #091940;
	  background-color: #1f326a;
	  color: #fff;
	}
</style>
</head>

<body>

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="../">메인화면</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="#">즐겨찾기
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#layer2">예약 내역</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/user/updateUserPage.do">회원정보수정</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="javascript:removeCheck()">회원탈퇴</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  
  <div class="dim-layer">
	    <div class="dimBg"></div>
	    <div id="layer2" class="pop-layer">
	        <div class="pop-container">
	            <div class="pop-conts">
	                <p class="ctxt mb20">
	                	<c:if test="${ !empty reserveList }">
	                		<c:forEach items="${ reserveList }" var="reserve">
	                			지점 : ${ reserve.store_name }, 시간 : ${ reserve.reserve_time }<br>
	                		</c:forEach>
	                	</c:if>
	                	<c:if test="${ empty reserveList }">
	                		현재 예약된 내역이 없습니다.
	                	</c:if>
	                </p>
	                <div class="btn-r">
	                    <a href="#" class="btn-layerClose">Close</a>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
	
  <!-- Page Content -->
  <div class="container">

    <!-- Jumbotron Header -->
    <header class="jumbotron my-4">
		
    </header>
    
    

    <!-- Page Features -->
    <div class="row text-center">
	<c:forEach items="${resultList }" var="resultList" varStatus="idx">
		<c:if test="(idx +1) % 4 == 0">
			<br>
		</c:if>
      <div class="col-lg-3 col-md-6 mb-4" style="height : 300px;">
        <div class="card h-100">
          <img class="card-img-top" src="${pageContext.request.contextPath }/resources/all/${resultList.car_Img}.png" alt="">
          <div class="card-body">
            <h4 class="card-title">${resultList.car_Name } </h4>
          </div>
          <div class="card-footer">
            <a class="btn btn-primary" href="/user/delwish.do?c=${resultList.car_ID }">즐겨찾기 해제</a>
          </div>
        </div>
      </div>
     </c:forEach>

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

  <!-- Footer -->
  <c:import url="../common/footer.jsp"/>
  
</body>

</html>