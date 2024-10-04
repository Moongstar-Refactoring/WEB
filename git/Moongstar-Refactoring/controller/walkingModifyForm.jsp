<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
.container {
	transform: scale(0.9, 0.9);
	position: relative;
	right: 280px;
	width: 400px;
	float: right;
}

.backWalkDetail {
	width: 750px;
	height: 750px;
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

#walkPhotoBtn {
	display: none;
}

#walkPhoto h2 {
	text-align: center;
	color: #82827F;
	margin: 0;
}

.walkPhotoButton {
	float: right;
	width: 200px;
	text-align: center;
	color: #82827F;
	font-size: 130px;
}

#walkTopEmpty {
	height: 60px;
	margin: 0;
}

#walkMidEmpty, #walkBottomEmpty {
	height: 30px;
	margin: 0;
}

#walkEndEmpty {
	height: 30px;
}

h3 {
	margin-left: 25px;
}

#walkSub {
	margin: 0;
	float: left;
}

.walkSubject input {
	border-width: 0;
	font-size: 25px;
	font-weight: bold;
	color: #5B5B5B;
	margin: 0;
}

.walkType {
	height: 30px;
	float: left;
	margin-top: 8px;
	color: #545454;
	width: 400px;
	border-bottom: 2px solid #C5C5C5;
}

.walkType select {
	font-size: 20px;
	border-width: 0;
	color: #C5C5C5;
}

.walkSubject {
	width: 400px;
	height: 35px;
	float: left;
	border-bottom: 3px solid #A9A9A9;
}

.walkAddress {
	margin-top: 2px;
	float: left;
	width: 400px;
	float: left;
	border-bottom: 2px solid #C5C5C5;
}

.walkAddress input {
	width: 370px;
	border-width: 0;
	font-size: 20px;
	color: #C5C5C5;
}

#exitBtn {
	position: relative;
	float: right;
	right: 50px;
	margin-top: 10px;
	width: 20px;
	height: 20px;
	border-radius: 50%;
	background-color: #C91C1C;
	box-shadow: 1px 1px 3px #ECECEC inset;
}

a {
	display: inline-block;
	margin-left: 5px;
	margin-top: 3px;
	text-align: center;
	font-weight: bold;
	text-decoration: none;
	color: black;
	text-align: center;
}

.walkReason, .walkEtc {
	width: 400px;
	margin-left: 20px;
}

.walkReason h2, .walkEtc h2 {
	width: 400px;
	border-bottom: 3px solid #A9A9A9;
	color: #5B5B5B;
}

.walkReason input, .walkEtc input {
	width: 400px;
	border-width: 0;
	color: #C5C5C5;
	font-size: 20px;
	border-bottom: 2px solid #C5C5C5;
}

#modify, #list {
	width: 70px;
	height: 30px;
	border: 0;
	border-radius: 30px;
	background-color: #FED74B;
	font-weight: bold;
	font-size: 15px;
	text-align: center;
	box-shadow: 0 2px 1px gray;
}

.walkBtn {
	top: 5px;
	width: 400px;
	float: right;
}
</style>
</head>
<body>
<c:set var="path" value="${pageContext.request.contextPath}"/>   
	<div class="container">
		<div class="backWalkDetail">
			<div id="exitBtn">
				<a href="#">X</a>
			</div>
			<div class="frontWalkDetail">
				<form id="walkModifyForm" method="post">
					<div class="walkDetail">
						<div id="walkTopEmpty"></div>
						<input type="hidden" name="walkWriter">
						<div id="walkContent">
							<div class="walkSubject">
								<input type="text" name="walkName" placeholder="장소 이름을 입력해 주세요">
							</div>
							<div id="walkPhoto">
								<label class="walkPhotoButton" for="walkPhotoBtn"> + </label> <input
									type="file" id="walkPhotoBtn" name="walkPhoto">
								<h2>선택 사항</h2>
							</div>
							<br> <br>
							<div class="walkType">
								<img src="<%=request.getContextPath()%>/image/place.png"
									width="20px"> <select>
									<option>장소 분류</option>
									<option>장소 분류</option>
									<option>장소 분류</option>
									<option>장소 분류</option>
								</select>
							</div>

							<div class="walkAddress">
								<div id="detailAddress">
									<img src="<%=request.getContextPath()%>/image/place.png"
										width="20px"> <input type="text" name="walkAddress3" placeholder="주소를 입력하세요">
								</div>
							</div>
						</div>
						<div id="walkMidEmpty"></div>
						<div class="walkReason">
							<h2>추천 이유</h2>
							<input type="text" name="walkReason" placeholder="해당 장소를 추천하는 이유를 적어 주세요">
						</div>
						<div id="walkBottomEmpty"></div>
						<div class="walkEtc">
							<h2>기타 사항</h2>
							<input type="text" name="walkEtc" placeholder="기타 사항">
						</div>
					</div>
				</form>
				<div id="walkEndEmpty"></div>
				<div class="walkBtn">
					<button id="list" name="list">목록</button>
					<button id="modify" name="modify" >수정</button>
				</div>
			</div>
		</div>
	</div>

</body>

<script src="http://code.jquery.com/jquery-Latest.min.js"></script>
<script>
	$('#exitBtn')
			.on(
					"click",
					function() {
						$
								.ajax({
									url : 'walkBoard.jsp',
									success : function(response) {
										$('#leftDiv').empty();
										$('#leftDiv')
												.append(
														`<img id="helpMessage" src="./image/help.png"/>`);
									}

								})
					})
</script>
</html>