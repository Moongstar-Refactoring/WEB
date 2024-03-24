<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-Latest.min.js"></script>
<script>

</script>
<style>
.container{
overflow: visible;
transform: scale(0.75,0.75);
position:relative;
top: -60px;
right: 160px;
width:400px;
margin-right:80px;
float:right;
}
.backWalkDetail {
	width: 750px;
	height: 710px;
	background-color: #F5F5F5;
	border-radius: 10%;
}

.frontWalkDetail {
	position: relative;
	top: 40px;
	width: 700px;
	height: 660px;
	background-color: #F5F5F5;
	margin: 0 auto;
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

</style>
</head>
<body>
<div class="container">
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
</div>
</body>
</html>