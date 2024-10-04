<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="icon" href="../image/logo.png" />
<title>멍뭉별</title>
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
	margin: 0;
	padding: 0;
	font-family: "Pretendard-Regular", sans-serif; /* 전체 글꼴 변경 */
}

.content {
	width: 1280px;
	margin: 0 auto;
	padding-bottom: 100px;
}

.container {
	display: flex;
	justify-content: center;
}

.slider {
	width: 100%;
	height: 250px;
	border-radius: 40px;
	overflow: hidden;
	position: relative;
	margin-top: 15px;
}

.slider img {
	width: 100%;
	height: 250px;
	position: absolute;
	transition: left 3s ease-in-out;
	border-radius: 10px; /* 왼쪽에도 border-radius 적용 */
}

.dots-container {
	text-align: center;
	margin-top: 5px;
}

.dot {
	display: inline-block;
	width: 11px;
	height: 11px;
	background-color: #c5c5c5;
	border-radius: 50%;
	margin: 5px;
	cursor: pointer;
}

.dot.active {
	background-color: #fed74b;
}

.menu_container {
	display: flex;
	justify-content: center;
	margin-top: 20px;
	height: 100px;
}

.menu {
	width: 235px;
	height: 90px;
	border-radius: 20px;
	background-color: #ffffff;
	box-shadow: 0px 4px 8px #c5c5c5;
	margin-left: 10px;
	text-align: center;
	line-height: 95px;
	font-weight: 500;
	overflow: hidden;
}

.menu:hover {
	background-color: #fdc600;
	font-weight: 700;
	color: #ffffff;
}

.place {
	margin-top: 52px;
	display: grid;
}

.text_h {
	font-size: 40px;
	font-family: "JalnanGothic";
	text-align: center;
	color: #053cc8;
}

.loc {
	margin: 20px 0 40px 0;
	display: flex;
	justify-content: center;
	gap: 20px; /* plac 사이의 간격 설정 */
}

.plac {
	width: 277px; /* plac의 고정 너비 */
	height: 270px; /* plac의 고정 높이 */
	border-radius: 10px;
	background-color: #053cc8;
	text-align: center;
	font-weight: 500;
	overflow: hidden;
	position: relative;
	color:white;
	box-shadow: 0 0 0 1px gray;
}

.plac img {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 66.67%; /* 이미지가 보더의 3분의 2에 맞춰지도록 설정 */
}

.plac .text {
	font-family: "JalnanGothic";
	position: absolute;
	bottom: 0;
	left: 0;
	width: 100%;
	height: 33.33%; /* 텍스트가 보더의 나머지 1/3에 맞춰지도록 설정 */
	padding: 25px;
	box-sizing: border-box; /* 내부 패딩이 보더 크기에 포함되도록 설정 */
	overflow: hidden;
	font-size: 20px;
	text-align: center;
}

.plac:hover {
	transform: scale(1.1);
}

.free {
	widht: 1280px;
	gap: 20px;
	display: flex;
	gap: 20px;
}

.free_b {
	width: 1280px; /* .free_b를 반씩 차지하도록 설정 */
	display: flex;
	margin: 70px 100px 30px 100px;
}
/*box-sizing
border-box
; /* padding, border를 요소의 크기에 포함 */
/* 좌우 여백 추가 */
.free_box {
	width: 700px;
	height: 300px;
	border: none;
	border-radius: 10px;
	background-color: #fdc600;/* #053cc8; */
/* 	box-shadow: 0 3px 0 #c5c5c5; */
	marin: 0;
	display: flex;
	width: 700px;
}

.headline-container {
	display: grid;
	padding: 20px;
	margin-top:40px;
}

.more {
	text-align: right;
	background-color: white;
	border: none;
}

.headline {
	font-family: "JalnanGothic";
	font-size: 28px;
/* 	padding-left: 10px; */
}

.archive {
	display: flex;
	flex-wrap: wrap;
	gap: 10px;
	justify-content: space-between;
	margin-top: 20px;
}

.photo {
	width: calc(( 100% - 80px)/5);
	height: 270px;
	border-radius: 10px;
	background-color: #ffffff;
	border: 1px solid #969090;
}

.inner_photo {
	width: 100%;
	height: 210px;
	padding: 10px;
	box-sizing: border-box;
	border-radius: 10px;
}

.inner_photo img {
	width: 100%;
	height: 100%;
	border-radius: 10px;
}

.inner_title {
	margin: 7px 0 0 5px;
	font-weight: 700;
	font-size: 16px;
}

.inner_text {
	margin-top: 5px;
	font-size: 12px;
	margin-left: 5px;
}

a:link {
	color: black;
	text-decoration: none;
}

a:hover {
	color: black;
	font-weight: 700;
}

.freeBox_De {
	height: 100%;
	background-color: white;
/* 	margin: 0 15px; */
	padding: 0 30px 0 20px;
}

.freeBox_De a:hover {
	/* hover 효과 제거 */
	pointer-events: none; /* 링크 클릭 이벤트 비활성화 */
	cursor: pointer; /* 마우스 커서를 기본 값으로 변경 */
	/* 그 외 다른 스타일 적용 가능 */
	font-weight: 500;
}
.imgg img{
	hight:100%;
	border-radius: 0 10px 10px 0;
}
</style>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="content">
		<div class="container">
			<div class="slider">
				<div class="img">
					<img src="${path }/image/banner1.png" alt="이미지 1" />
				</div>
				<div class="img">
					<img src="${path }/image/banner2.png" alt="이미지 2" />
				</div>
				<div class="img">
					<img src="${path }/image/banner3.png" alt="이미지 3" />
				</div>
			</div>
		</div>
		<div class="dots-container">
			<span class="dot active"
				onclick="currentSlide = 0; showSlide(currentSlide);"></span> <span
				class="dot" onclick="currentSlide = 1; showSlide(currentSlide);"></span>
			<span class="dot"
				onclick="currentSlide = 2; showSlide(currentSlide);"></span>
		</div>

		<div class="menu_container">
			<div class="menu"
				onclick="location.href='${path}/walking/walkBoard';"
				style="cursor: pointer;">산책로 추천</div>
			<div class="menu"
				onclick="location.href='${path}/hospital/hospitalBoard';"
				style="cursor: pointer;">24시 동물병원</div>
			<div class="menu"
				onclick="location.href='${path}/freeBoard/freeboard';"
				style="cursor: pointer;">자유게시판</div>
			<div class="menu" onclick="location.href='${path}/lost/lostBoard';"
				style="cursor: pointer;">찾습니다</div>
			<div class="menu" onclick="location.href='${path}/temp/tempBoard';"
				style="cursor: pointer;">임시보호</div>
		</div>

		<div class="place">
			<div class="text_h">오늘은 어디로 걷개?</div>
			<div class="text_h"
				style="margin-top: 10px; font-size: 18px; font-family: 'Pretendard-Regular'; font-weight: bold; color: #7b7b7b; line-height: 1.13;">
				새로운 산책로 어디있을까?🌸</div>
			<span class="more"> <a href="${path}/walking/walkBoard"
				style="font-size: 12px; margin-right: 60px;">더보기</a></span>
		</div>
		<div class="loc">
			<c:forEach items="${walks}" var="walk">
				<div class="plac">
					<a href="${path}/walking/walkingDetail?walkNum=${walk.walkNum}"><img
						src="${path}/image/loc_${walk.walkNum}.png" alt="Image 1" /></a>
					<div class="text">
						${walk.walkName}<br />
						<div style="font-size: 14px; font-family: 'Pretendard-Regular'">
							${walk.walkAddress3}</div>
					</div>
				</div>
			</c:forEach>
		</div>


		<div class="free" style="display: flex;">
			<div class="free_b">
				<div class="free_box">
					<div class="headline-container"
						style="display: flex; justify-content: center; flex: 1;">
						<span class="headline" style="justify-content: center;	color: white;">최신글</span>
					</div>
					<div class="freeBox_De">
						<div class="row" style="margin-bottom: 10px;">
							<div class="more">
								<a href="${path}/freeBoard/freeboard" style="font-size: 12px">더보기</a>
							</div>
							<div style="background-color: white;">
								<c:forEach items="${frees}" var="free" varStatus="loop">
									<div class="col-md-6" style="margin-bottom: 5px;">
										<a
											href="${path}/freeBoard/boarddetail?freeNum=${free.freeNum}"
											class="dogName"> <span style="font-size: 16px;"> <span
												style="color: #63C1D2;">[ ${free.freeTag} ]</span> <c:set
													var="shortContent"
													value="${fn:substring(free.freeSub, 0, 15)}" /> <c:out
													value="${shortContent}" escapeXml="true" /> <span
												style="font-size: 14px; color: gray;">${free.freeWriteDate}</span>
										</span><br /> <c:set var="contentWithoutTags"
												value="${fn:replace(free.freeContent, '<[^>]*>', '')}" /> <c:set
												var="shortContent"
												value="${fn:substring(free.freeContent, 0, 20)}" /> <span
											style="font-size: 12px; color: gray;"> <c:out
													value="${shortContent}" escapeXml="true" />
										</span>
										</a>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
				<span class="imgg" style="margin-left:10px; border-radius: 10px;"> <img
					src="${path}/image/mainDog.jpg" alt="이미지 1" style="height: 300px;" />
				</span>
			</div>
		</div>
		<br>

		<div class="headline-container">
			<span class="headline"> 임시보호해요 </span> <span class="more"> <a
				href='${path}/temp/tempBoard' style="font-size: 12px">더보기</a>
			</span>
		</div>
		<div class="header-line"></div>
		<div class="archive">
			<c:forEach items="${temps}" var="temp">
				<div class="photo">
					<div class="inner_photo">
						<img class="photo" src="${path}/imageView?num=${temp.tempPhoto}">
						<div class="inner_title">
							<a href="${path}/temp/tempDetail?tempNum=${temp.tempNum}"
								class="dogName">${temp.tempName}</a>
						</div>

						<div class="inner_text">
							<a href="${path}/temp/tempDetail?tempNum=${temp.tempNum}"
								class="address">${temp.tempAddress}</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>

		<div class="headline-container">
			<span class="headline"> 미멍보호소 </span> <span class="more"> <a
				href="${path}/lost/lostBoard" style="font-size: 12px">더보기</a></span>
		</div>
		<div class="header-line"></div>
		<div class="archive">
			<c:forEach items="${losts}" var="lost">
				<div class="photo">
					<div class="inner_photo">
						<img class="photo" src="${path}/imageView?num=${lost.lostPhoto}">
						<div class="inner_title">
							<a href="${path}/lost/lostDetail?lostNum=${lost.lostNum}"
								class="dogName">${lost.lostName}</a>
						</div>

						<div class="inner_text">
							<a href="${path}/lost/lostDetail?lostNum=${lost.lostNum}"
								class="address">${lost.lostAddress}</a>
						</div>
					</div>
				</div>
			</c:forEach>

		</div>
		<div class="footer"></div>
	</div>

	<script>
      let currentSlide = 0;
      const slides = document.querySelectorAll(".img");
      const dots = document.querySelectorAll(".dot");
      const slideCount = slides.length;

      function showSlide(n) {
        slides.forEach((slide) => (slide.style.display = "none"));
        slides[n].style.display = "block";
        dots.forEach((dot) => dot.classList.remove("active"));
        dots[n].classList.add("active");
      }

      function nextSlide() {
        currentSlide = (currentSlide + 1) % slideCount;
        showSlide(currentSlide);
      }

      function prevSlide() {
        currentSlide = (currentSlide - 1 + slideCount) % slideCount;
        showSlide(currentSlide);
      }

      document.addEventListener("DOMContentLoaded", () => {
        showSlide(currentSlide);
        setInterval(nextSlide, 5000); // 3초마다 자동 슬라이드
      });
    </script>
</body>
</html>
