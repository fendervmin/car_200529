<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <style>
	    #nav ul {
		    list-style-type: none;
		    margin: 0;
		    padding: 0;
		    background-color: #fff;
		}
		#nav ul:after{
		    content:'';
		    display: block;
		    clear:both;
		}
		#nav li {
		    float: left;
		}
		#nav li a {
		    display: block;
		    color: black;
		    text-align: center;
		    padding: 14px 16px;
		    text-decoration: none;
		}
		#nav li a:hover:not(.active) {
		    background-color: #111;
		}
		#nav .active {
		    background-color: #4CAF50;
		}
    </style>
</head>
<body>
	<div id="nav">
	    <ul>
	      <li><a href="#news">News</a></li>
	      <li><a href="carList">자동차백과</a></li>
	      <li><a href="#about">커뮤니티</a></li>
	    </ul>
	</div>
</body>
</html>
