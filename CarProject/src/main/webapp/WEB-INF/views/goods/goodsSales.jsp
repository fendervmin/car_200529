
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
	.recordSection .left {
    width: 335px;
    float: left;
    position: relative;
}
h2[class=""], h2:not([class]) {
    position: relative;
    padding-left: 5px;
    line-height: 30px;
    font-size: 14px;
    color: #000;
}
h2 {
    display: block;
    font-size: 1.5em;
    margin-block-start: 0.83em;
    margin-block-end: 0.83em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
}
.recordTable.short {
    padding: 5px 0;
    border: 1px solid #e6e6e6;
    border-left: 0;
    border-right: 0;
}
table {
    clear: both;
    border-collapse: collapse;
}
table[Attributes Style] {
    -webkit-border-horizontal-spacing: 0px;
    -webkit-border-vertical-spacing: 0px;
}
.recordTable {
    width: 100%;
    border: 0;
    /* table-layout: fixed; */
}
.recordTable td {
    border-bottom: 1px solid #e6e6e6;
    padding: 7px 0;
    text-align: center;
    height: 35px;
    font-size: 14px;
    font-family: "Century Gothic","Malgun Gothic",Dotum,"돋움","Apple SD Gothic Neo",Helvetica,Sans-serif;
}
.recordTable td.num {
    font-weight: bold;
    color: #2964e0;
    position: relative;
}
td {
    display: table-cell;
    vertical-align: inherit;
}
.recordTable td.share {
    color: #757575;
    font-size: 11px;
}
.recordTable td.title {
    padding-left: 50px;
    text-align: left;
    position: relative;
}
.recordTable.short td {
    border: 0;
}
body, button, input, select, table, textarea {
    font-size: 12px;
    font-family: Dotum,Helvetica,"Apple SD Gothic Neo",sans-serif;
}
a {
    color: inherit;
    text-decoration: none;
}
a:-webkit-any-link {
    color: -webkit-link;
    cursor: pointer;
    text-decoration: underline;
}
.recordTable td.title a {
    display: block;
    color: #000;
    font-weight: bold;
}
.recordSection .cmnt {
    text-align: right;
    padding: 5px 0;
    color: #757575;
    font-size: 11px;
}
</style>
<title>Insert title here</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Shop Item - Start Bootstrap Template</title>
  <!-- Bootstrap core CSS -->
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.min.js"></script>
  <!-- Custom styles for this template -->
  <link href="css/shop-item.css" rel="stylesheet">
  
</head>
<body>
	<div id="root">
		<header id="header">
			<div id="header_box">
				<%@ include file="../common/menubar.jsp" %>
			</div>
		</header>
		
		<section id="container" style="margin-top:40px">
			<div id="container_box">
				<div class="container">
				
				
				
				<div class="row">
				      <div class="col-lg-3">
				        <h1 class="my-4">자동차백과</h1>
				        <div class="list-group">
				          <a href="#" class="list-group-item">판매실적</a>
				          <a href="../goods/goodsAll.do" class="list-group-item">전체보기</a>
				        </div>
				      </div>
				      <!-- /.col-lg-3 -->
				      <div class="col-lg-9" style="margin-top:15px">
				        <div class="card mt-4">
				          <div class="card-body">
				          <div class='clearFix'>
			                <div class='left'>
			                    <h2><span class='screen_out' style="margin-top:30px;">2020년  5월 </span>국산 브랜드 Top5</h2>
			                    <table cellspacing='0' class='recordTable short' style="margin-top:15px">
			                        <colgroup>
			                            <col class='rank'>
			                            <col width='*'>
			                            <col class='count'>
			                            <col class='rate'>
			                        </colgroup>
				                    <tr style="margin-top:15px;">
				                        <td class='rank'>1</td>
				                        <td class='title'>
				                            <a href="goodsList.do?b=1">
				                            <img src='http://autoimg.danawa.com/photo/brand/303_40.png' alt='현대'>현대
				                            </a>
				                        </td>
				                        <td class='num'>57,850</td>
				                        <td class='share'>39.6%</td>
				                    </tr>
				                    <tr style="margin-top:15px;">
				                        <td class='rank'>2</td>
				                        <td class='title'>
				                            <a href="goodsList.do?b=2">
				                            <img src='http://autoimg.danawa.com/photo/brand/307_40.png' alt='기아'>기아
				                            </a>
				                        </td>
				                        <td class='num'>51,181</td>
				                        <td class='share'>35.0%</td>
				                    </tr>
				                    <tr style="margin-top:15px;">
				                        <td class='rank'>3</td>
				                        <td class='title'>
				                            <a href="goodsList.do?b=3">
				                            <img src='http://autoimg.danawa.com/photo/brand/304_40.png' alt='제네시스'>제네시스
				                            </a>
				                        </td>
				                        <td class='num'>12,960</td>
				                        <td class='share'>8.9%</td>
				                    </tr>
				                    <tr style="margin-top:1px;">
				                        <td class='rank'>4</td>
				                        <td class='title'>
				                            <a href='/newcar/?Work=record&amp;Brand=321,322&Month=2020-05-00'>
				                            <img src='http://autoimg.danawa.com/photo/brand/321_40.png' alt='르노삼성'>르노삼성
				                            </a>
				                        </td>
				                        <td class='num'>10,571</td>
				                        <td class='share'>7.2%</td>
				                    </tr>
				                    <tr style="margin-top:15px;">
				                        <td class='rank'>5</td>
				                        <td class='title'>
				                            <a href='/newcar/?Work=record&amp;Brand=326&Month=2020-05-00'>
				                            <img src='http://autoimg.danawa.com/photo/brand/326_40.png' alt='쌍용'>쌍용
				                            </a>
				                        </td>
				                        <td class='num'>7,575</td>
				                        <td class='share'>5.2%</td>
				                    </tr>
			                    </table>
			                </div>
			                
			                
			                <div class='right' style="margin-top:20px;">
			                    <h2><span class='screen_out'>2020년  5월 </span>해외 브랜드 Top5</h2>
			                    <table cellspacing='0' class='recordTable short' style="margin-top:15px">
			                        <colgroup>
			                            <col class='rank'>
			                            <col width='*'>
			                            <col class='count'>
			                            <col class='rate'>
			                        </colgroup>
			                        <tr style="margin-top:15px;">
			                            <td class='rank'>1</td>
			                            <td class='title'>
			                                <a href='/newcar/?Work=record&amp;Brand=349&Month=2020-05-00'>
			                                    <img src='http://autoimg.danawa.com/photo/brand/349_40.png' alt='벤츠'>벤츠
			                                </a>
			                            </td>
			                            <td class='num'>6,551</td>
			                            <td class='share'>29.6%</td>
			                        </tr>
			                        <tr style="margin-top:15px;">
			                            <td class='rank'>2</td>
			                            <td class='title'>
			                                <a href='/newcar/?Work=record&amp;Brand=362&Month=2020-05-00'>
			                                    <img src='http://autoimg.danawa.com/photo/brand/362_40.png' alt='BMW'>BMW
			                                </a>
			                            </td>
			                            <td class='num'>4,907</td>
			                            <td class='share'>22.2%</td>
			                        </tr>
			                        <tr style="margin-top:15px;">
			                            <td class='rank'>3</td>
			                            <td class='title'>
			                                <a href='/newcar/?Work=record&amp;Brand=371&Month=2020-05-00'>
			                                    <img src='http://autoimg.danawa.com/photo/brand/371_40.png' alt='아우디'>아우디
			                                </a>
			                            </td>
			                            <td class='num'>2,178</td>
			                            <td class='share'>9.8%</td>
			                        </tr>
			                        <tr style="margin-top:15px;">
			                            <td class='rank'>4</td>
			                            <td class='title'>
			                                <a href='/newcar/?Work=record&amp;Brand=376&Month=2020-05-00'>
			                                    <img src='http://autoimg.danawa.com/photo/brand/376_40.png' alt='폭스바겐'>폭스바겐
			                                </a>
			                            </td>
			                            <td class='num'>1,217</td>
			                            <td class='share'>5.5%</td>
			                        </tr>
			                        <tr style="margin-top:15px;">
			                            <td class='rank'>5</td>
			                            <td class='title'>
			                                <a href='/newcar/?Work=record&amp;Brand=459&Month=2020-05-00'>
			                                    <img src='http://autoimg.danawa.com/photo/brand/459_40.png' alt='볼보'>볼보
			                                </a>
			                            </td>
			                            <td class='num'>1,096</td>
			                            <td class='share'>5.0%</td>
			                        </tr>
			                    </table>
			                </div>
			                </div>
				          
				          </div>
				        </div>
				        <!-- /.card -->
				      </div>
				      <!-- /.col-lg-9 -->
				   </div>
				
				</div>
			</div>
		</section>
		
		
		<footer id="footer" style="margin-top:20px;">
			<div id="footer_box">
				<%@ include file="../common/footer.jsp" %>
			</div>
		</footer>
	</div>
</body>
</html>