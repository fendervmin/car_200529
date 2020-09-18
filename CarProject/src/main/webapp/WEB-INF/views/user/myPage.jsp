<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
<c:import url="/WEB-INF/views/common/menubar.jsp" />
	<aside>
		<div id="aside">
			<h3>마이페이지</h3>
			<ul id="aside">
				<li class="myPage_li">
					<a href="/user/likeItPage.do" class="btn-example">마이페이지</a>
					<a href="#layer2" class="btn-example">예약 내역</a>
				</li>
			</ul>
			<!-- <h3>나의 게시글 보기</h3> -->
			<h3>개인정보</h3>
			<ul>
				<li class="myPage_li"><a href="/user/updateUserPage.do">회원정보수정</a></li>
				<li class="myPage_li"><a href="javascript:removeCheck()">회원탈퇴</a></li>
			</ul>
		</div>
	</aside>
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
	<footer id="footer">
		<div id="footer_box">
			<%@ include file="../common/footer.jsp" %>
		</div>
	</footer>
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

</body>
</html>