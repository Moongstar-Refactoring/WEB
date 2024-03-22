<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.backWalkDetail {
	width: 750px;
	height: 710px;
	background-color: #F5F5F5;
	border-radius: 10%;
	margin: 0 auto;
}

.frontWalkDetail {
	position: relative;
	top: 40px;
	width: 700px;
	height: 660px;
	background-color: #F5F5F5;
	margin: 0 auto;
	overflow: none;
	border-radius: 10%;
	border-right: 3px solid #D9D9D9;
}

.walkDetail {
	position: relative;
	top: 15px;
	width: 650px;
	height: 630px;
	background-color: white;
	border-radius: 5%;
	margin: 0 auto;
}

#walkContent {
	width: 610px;
	height: 200px;
	margin: 0 auto;
}

#walkPhoto {
	width: 200px;
	height: 200px;
	background-color: lightgray;
	position: relative;
	float: right;
	border-radius: 10%;
}

#walkTopEmpty {
	height: 30px;
	margin: 0;
}

#walkMidEmpty {
	height: 80px;
	margin: 0;
}

#walkComment {
	background-color: #EFEFEF;
	width: 600px;
	height: 250px;
	margin: 0 auto;
	padding-top: 3px; border-radius : 5%;
	box-shadow: 0 2px 3px gray;
	blur-radius: 10%;
	top: 30%;
	border-radius: 5%;
}

.comment {
	height: 340px;
}

#commentFont {
	height: 30px;
	margin: 0;
	padding: 0;
	display: inline-block;
}

h3 {
	margin-left: 25px;
}

#walkLike {
	margin-top: 2px; float : right;
	height: 40px;
	margin-right: 110px;
	width: 15px;
	font-weight: bold;
	font-size: 18px;
	float: right;
}

#walkBottomEmpty {
	height: 30px;
}

#walkSub {
	margin: 0;
	float: left;
}

#walkType {
	height: 30px;
	float: left;
	margin-top: 8px;
	margin-left: 2px;
	color: #545454;
}

.walkSubject {
	width: 400px;
	height: 35px;
	float: left;
	border-bottom: 2px solid gray;
}

.walkAddress {
	margin-top: 2px; float : left;
	width: 400px;
	float: left;
}

#exitBtn {
	position: relative;
	float: right;
	right: 50px; margin-top : 10px;
	width: 20px;
	height: 20px;
	border-radius: 50%;
	background-color: #C91C1C;
	box-shadow: 1px 1px 3px #ECECEC inset;
	margin-top: 10px;
}

a {
	margin-top: 5px;
	margin-left: 5px; text-align : center;
	font-weight: bold;
	text-decoration: none;
	color: black;
	text-align: center;
}

#sticker1 {
	position: relative;
	float: right;
	top: -10px;
}

#sticker2 {
	position: relative;
	float: left;
	top: 20px;
}

#sticker3 {
	position: relative;
	float: right;
	top: 15px;
	left: 50px;
}

.commBtn {
	float: right;
	background-color: gold;
	position: relative;
	border: none;
	box-shadow: 0px 2px 0px rgba(0, 0, 0, 0.4);
	border-radius: 10px;
	font-size: 13px;
	font-weight: bold;
}

.inputComment {
	display: inline-block;
	width: 70%;
	height: 20px;
	margin-left: 5px;
	margin-right: 20px;
	border-style: none;
	outline: none;
	font-size: 15px;
}

.inputDiv {
	position: relative;
	margin: 0 auto;
	top: 45%;
	width: 550px;
	padding: 5px;
	background-color: white;
	border: 4px solid #EFC940;
	border-radius: 20px;
	box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.2);
}

.memComm {
	width: 580px;
	margin: 0 auto;
	padding: 5px;
	overflow: hidden;
}

.commContent {
	text-align: right;
	font-size: 15px;
}

.commNickname {
	text-align: right;
	font-size: 12px;
	font-weight: bold;
	color: gray;
}

.writeComm {
	width: 580px;
	margin: 0 auto;
	padding: 5px;
	overflow: hidden;
}

.mycomm {
	float: right;
}

.comm {
	float: left;
}
</style>
</head>
<body>

	<div class="backWalkDetail">
		<div id="exitBtn">
			<a href="#">X</a>
		</div>
		<div class="frontWalkDetail">
			<div class="walkDetail">
				<div id="walkTopEmpty"></div>
				<div id="walkContent">
					<div class="walkSubject">
						<h1 id="walkSub">카카오오름</h1>
						<h2 id="walkType">기업, 빌딩</h2>
					</div>
					<div id="walkPhoto"></div>
					<div class="walkAddress">
						<div id="detailAddress">
							<img src="<%=request.getContextPath()%>/image/place.png"
								width="15px"> 카카오시 카카오구 카카오동 카카오오름
						</div>
					</div>
				</div>
				<div id="walkLike">

					<img src="<%=request.getContextPath()%>/image/good.png">Like
				</div>
			<div class="comment">
			<%@ include file="mapComment.jsp" %>
			</div>
		</div>
	</div>
</div>
</body>
</html>