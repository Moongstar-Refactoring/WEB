<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>추가정보 수정</title>

<style>
@font-face {
	font-family: "JalnanGothic";
	src:
		url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_231029@1.1/JalnanGothic.woff")
		format("woff");
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: "Pretendard-Regular";
	src:
		url("https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff")
		format("woff");
	font-weight: 400;
	font-style: normal;
}

body, html {
	font-family: "Pretendard-Regular", sans-serif; /* 전체 글꼴 변경 */
}

.content {
	width: 1280px;
	margin: 0 auto;
}

.container {
	margin: 0 30px;
}

.container .field {
	margin: 5px 0;
}

.signup-container {
	border: 1px solid #d1d1d1;
	padding: 30px 200px;
	justify-content: center;
}

.container b {
	display: block;
	margin-bottom: 5px;
}

.container input:not(input[type="radio"]), .container select {
	border: 1px solid #d1d1d1;
	padding: 7px;
	width: 100%;
	margin-bottom: 5px;
}

.container .innner-input input:focus, .container select:focus {
	border: 1px solid #9c9c9c;
	outline: none;
}

.field .tel-number div {
	display: flex;
	flex: 1;
}

.field.tel-number div input:nth-child(1) {
	flex: 1;
}

input:focus {
	outline: none;
}

.field.tel-number div input:nth-child(2) {
	flex: 1;
}

.field {
	display: flex;
	align-items: baseline;
	/* 입력 상자와 텍스트를 같은 기준선에 정렬 */
}

.field .pwd div {
	display: inline;
}

.field input[type="text"], .field input[type="password"], .container select,
	.field input[type="email"], .field input[type="tel"] {
	flex: 1; /* 자동으로 너비를 할당 */
	margin-left: 10px; /* 오른쪽 여백 */
	border-radius: 3px;
}

.container .field input[type="button"] {
	margin-left: 3px;
	width: auto;
	border-radius: 3px;
	font-weight: 500;
	font-size: 12px;
	letter-spacing: 2px;
	background-color: #053cc8;
	color: white;
	border: none;
	margin-left: 5px;
	padding: 7px;
	width: auto;
}

.container input[type="submit"] {
	width: auto;
	border-radius: 3px;
	padding: 20 px 15px;
	font-weight: bold;
	font-size: 13px;
	letter-spacing: 2px;
	background-color: #053cc8;
	color: white;
	border: none;
	margin-left: 5px;
}

.inner-input2 .inner-input button {
	margin-left: 3px;
	width: auto;
	border-radius: 3px;
	background-color: #053cc8;
	color: white;
	border: none;
	font-size: 12px;
	padding: 1px 10px;
}

input::placeholder {
	font-size: 12px;
}

.container>h2 {
	font-family: "JalnanGothic";
	font-size: 24px;
	color: #053cc8;
	margin-bottom: 20px;
	font-size: 48px;
	font-weight: 900;
	text-align: center;
}

.signup-container, .petFormTemplate {
	margin: 15px 250px;
	height: auto;
}

.inner-title {
	font-size: 14px;
	font-weight: 700;
	width: 130px;
	display: flex;
}

.inner-input {
	display: flex;
}

.inner-input2 {
	display: grid;
}

.gender {
	padding: 5px 0;
	display: flex;
}

.gender input[type="radio"] {
	display: none;
}

.gender input[type="radio"]+label {
	display: inline-block;
	cursor: pointer;
	height: 27px;
	width: 85px;
	border: 1px solid #dadada;
	line-height: 27px;
	text-align: center;
	font-weight: bold;
	font-size: 13px;
	border-radius: 3px;
}

.gender input[type="radio"]+label {
	background-color: #fff;
	color: #333;
}

.gender input[type="radio"]:checked+label {
	background-color: #053cc8;
	color: #fff;
}

#warn:hover {
	font-weight: 700;
}

.title {
	font-size: 24px;
	font-weight: 900;
	margin-top: 10px;
	text-align: center;
}

.centerForm {
	display: flex;
	justify-content: center;
	margin: 10px 0;
}

a:link {
	color: black;
	text-decoration: none;
}

a:hover {
	color: black;
	font-weight: 700;
}

a:visited {
	color: black;
}

hr {
	border-top: 2px solid rgb(221, 224, 224);
	margin-top: 10px; /* 선과 헤더 사이의 여백 조정 */
}

.btnSet {
	margin-top: 15px;
	text-align: center;
}

a.btn-fill, a.btn-empty {
	text-align: center;
	padding: 5px 15px;
	/*<!--border:1px solid #3367d6;-->*/
	border-radius: 3px;
	box-shadow: 2px 2px 3px #022d72;
	/* 오른쪽, 아래쪽, 번진 정도 */
}

a.btn-fill {
	background-color: #3367d6;
	color: #fff;
}

a.btn-empty {
	background-color: #fff;
	color: #3367d6;
}

.btnSet a:not(:first-child) {
	margin-left: 3px;
}

a:hover {
	cursor: pointer;
}

.fileImg {
	width: 90px;
	height: 90px;
}

.fileInput {
	position: absolute;
	display: none;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
}
</style>
</head>

<body>
	<%@ include file="../main/header.jsp"%>
	<div class="content">
		<div class="container">
			<h2>추가정보 수정</h2>
			<div class="title">
				<span style="color: blue;">${user.memNick}</span>님 정보 수정
			</div>

			<!-- 개인정보 입력 폼 -->
			<form action="dogmodify" method="post" id="form"
				enctype="multipart/form-data">
				<input type="hidden" name="dogNum" value="${dog.dogNum}" id="dogNum" />
				<div class="signup-container">
					<!-- 아이디 -->
					<div class="field">
						<div class="inner-title">반려동물 이름</div>

						<div class="inner-input">
							<input type="text" name="dogName" id="dogName"
								placeholder="${dog.dogName}" value="${dog.dogName}" />
						</div>
					</div>

					<!-- 닉네임 -->
					<div class="field">
						<div class="inner-title">반려견 나이</div>
						<div class="inner-input">
							<input type="text" name="dogAge" id="dogAge"
								value="${dog.dogAge}" />
						</div>
					</div>

					<div class="field">
						<div class="inner-title">성별</div>
						<div class="gender" style="margin-left: 10px">
							<input type="radio" id="male" name="dogGender" value="남"
								${dog.dogGender == '남' ? "checked" : ''} /> <label for="male">남</label>
							<input type="radio" id="female" name="dogGender" value="여"
								${dog.dogGender == '여' ? "checked" : ''} /> <label for="female">여</label>
						</div>
					</div>
					<div class="field">
						<div class="inner-title">반려견 사진</div>
						<div class="img_box" style="margin: 10px;">
							<img class="fileImg" id="preview"
								src="${path}/imageView?num=${dog.dogProfile }"> <input
								type="file" id="fileInput" class="fileInput" name="file"
								accept="image/*">
						</div>
					</div>
				</div>
			</form>
			<div class="btnSet">
				<a class="btn-fill" onclick="$('form').submit()">저장</a> <a
					class="btn-empty" href="${path}/mypage">취소</a>
			</div>
		</div>
	</div>
</body>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<script>
	let preview = document.querySelector("#preview");
	let fileInput = document.querySelector("#fileInput");
	preview.onclick = function() {
		fileInput.click();
	}

	fileInput.onchange = function(e) {
		let file = e.target.files[0];
		if (file) {
			let reader = new FileReader();

			reader.onload = function(data) {
				console.log(data);
				preview.src = data.target.result;
				/* preview.width= 250;
				preview.height= 250; */
			}

			reader.readAsDataURL(file);
		} else {
			preview.src = "${path}/image/blue.png";
		}
	}
</script>
</html>
