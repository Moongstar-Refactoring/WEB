<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="dto.Member"%>
<%@ page import="dto.Dog"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>마이페이지</title>
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

.container {
	width: 1280px;
	margin: 0 auto;
}

.mypage-container {
	display: flex;
	margin: 5% 0;
	height: 100%;
	justify-content: center;
	align-items: center;
	flex: 1;
}

.mypage-container2 {
	display: flex;
	margin: 2% 0;
	flex: 1;
}

.myactive {
	height: 100%;
}

.inner_profile {
	width: 260px;
	height: 260px;
	padding: 30px;
	border-radius: 50%;
	box-sizing: border-box;
	background-color: #f0f0f0;
	box-shadow: 0 5px 5px rgb(179, 179, 179);
	overflow: hidden;
}

.img_box {
	display: inline-block;
	width: 100%;
	height: 200px;
	border-radius: 50%;
	background-color: #f0f0f0;
	box-shadow: 0 -3px 10px rgb(94, 94, 94);
	overflow: hidden;
}

.img_box img {
	display: inline-block;
	/* width: 100%; height: 264px; */
	cursor: pointer;
	background-color: #f9f9f9;
	border: 1px solid #ccc;
	border-radius: 4px;
	font-size: 200px;
	text-align: center;
	color: #A3A3A3;
}

.gender {
	display: flex;
	align-items: center;
}

.gender input[type="radio"] {
	display: none;
}

.gender input[type="radio"]+label {
	display: inline-block;
	cursor: pointer;
	height: 27px;
	width: 90px;
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
	background-color: #0155b7;
	color: #fff;
}

.wel-txt {
	font-family: "JalnanGothic";
	font-size: 38px;
	font-weight: 700;
	margin-left: 60px;
	position: relative;
}

.hello {
	display: grid;
}

.actGrid {
	display: grid;
	margin: 0 3%;
	height: 100%;
}

.actTitle {
	font-size: 25px;
	font-weight: 700;
	margin: 20px 10px 10px 10px;
	display: flex;
}

.inner-txt {
	text-align: left;
	width: 150px;
	font-size: 16px;
	font-weight: 700;
}

.myinfo {
	font-size: 14px;
}

.field1 {
	display: flex;
	padding: 5px;
	flex: 1;
	margin: 0 10%;
}

.petInfo {
	border-style: solid;
	border-width: 3px 0 1px 0;
	border-color: #c9c9c9;
	padding: 3% 0;
}

.petInfo2 {
	border-style: solid;
	border-width: 3px 0 1px 0;
	border-color: #c9c9c9;
	padding: 3% 0;
}

.field {
	display: flex;
	flex: 1;
	padding: 1% 0;
}

.signup-container {
	margin: 0 10%;
}

.actBtn {
	flex: 1;
	padding: 20px 15px;
	border: 2px solid #c9c9c9;
	border-radius: 5px;
	font-family: "Lato", sans-serif;
	font-weight: 700;
	background: transparent;
	cursor: pointer;
	transition: all 0.3s ease;
	position: relative;
	display: inline-block;
	margin: 5px;
	transition: all 0.3s ease;
	text-align: center;
	align-items: center;
	justify-content: center;
}

.actBtn:hover {
	box-shadow: -7px -7px 20px 0px #fff9, -4px -4px 5px 0px #fff9, 7px 7px
		20px 0px rgba(128, 128, 128, 0.133), 4px 4px 5px 0px #0001;
}

.btnSet {
	margin-top: 10px;
	text-align: center;
}

a.btn-fill, a.btn-empty {
	font-size: 11px;
	text-align: center;
	padding: 5px 15px;
	border-radius: 3px;
	border: 1px solid #404650;
	text-decoration: none;
	/* box-shadow: 0 1px 1px #404650;*/
	text-decoration: none;
	/* 오른쪽, 아래쪽, 번진 정도 */
}

.delBtn {
	font-size: 10px;
	background-color: #fff;
	font-color: black;
	text-align: center;
	padding: 5px 15px;
	border-radius: 3px;
	border: 1px solid #404650;
	text-decoration: none;
	/* box-shadow: 0 1px 1px #404650;*/
	text-decoration: none;
	/* 오른쪽, 아래쪽, 번진 정도 */
}

a.btn-fill {
	background-color: #fff;
	color: #404650;
}

a.btn-empty {
	background-color: #fff;
	color: #404650;
}

.btnSet a:not(:first-child) {
	margin-left: 3px;
}

a:hover {
	cursor: pointer;
}

.delBtn:hover {
	cursor: pointer;
	font-weight: bold;
}

.fileImg {
	width: 40px;
	height: 40px;
}

.fileInput {
	position: absolute;
	display: none;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
}
</style>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(function() {
		$(".delBtn").click(function() {
			var petInfo = $(this).parents(".petInfo");
			if (confirm('정말 삭제하시겠습니까?')) {
				$.ajax({
					url : "${path}/dogdelete",
					type : "post",
					async : true,
					data : {
						dogNum : $(this).data('num')
					},
					success : function(result) {
						if (result == "true") {
							petInfo.remove();
						} else {
							alert(result)
						}
					}
				})
			} else {

			}
		})
	})
	
/* 	async function submit() {
		let formData = new FormData();

    	formData.append("file", imageBlob, "image.webp");
    	let response = await fetch('/MoongStar/temp/tempWrite', {
      		method: 'POST',
      		body: formData
    }); */
</script>

</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="container">
		<!-- 인삿말 -->
		<div class="mypage-container">

			<div class="wel-Img">
				<div class="inner_profile">
					<div class="img_box">
						<img class="btn-open-modal" id="preview"
							src="${path}/imageView?num=${user.memProfile}"> --%> <input
							type="file" id="fileInput" class="fileInput" name="file"
							accept="image/*">
					</div>
				</div>
			</div>

			<div class="wel-txt">
				<div class="hello">
					<span
						style="display: flex; text-decoration: underline; text-underline-offset: 10px; text-decoration-thickness: 5%; font-family: 'JalnanGothic';">
						${user.memNick}<span
						style="text-decoration: none; font-weight: 900">&nbsp;님</span>
					</span>
					<div style="margin-top: 10px; font-weight: 900">다녀오셨어요?</div>
				</div>
			</div>
		</div>

		<hr />
		<!-- 내 활동 -->

		<div class="mypage-container2">
			<div class="myactive"
				style="width: 100%; height: 100%; padding: 0 5%">
				<div class="actGrid">
					<div class="actTitle">내 활동</div>
					<div class="petInfo">
						<div style="margin: 5% 5%">
							<c:forEach items="${myFrees}" var="free">
								<div style="margin-bottom: 10px;">
									<a href="${path}/freeBoard/boarddetail?freeNum=${free.freeNum}"><span style="color: #053cc8">${free.freeTag}</span>
										<c:set var="shortContent" value="${fn:substring(free.freeSub, 0, 25)}" /> 
												<span style="font-size: 16px;"> <c:out value="${shortContent}" escapeXml="true" />      <span style="font-size: 12px; color: #D3D3D3">${free.freeWriteDate}</span> </a>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<div class="actGrid">
					<div class="actTitle">내 댓글</div>
					<div class="petInfo">
						<div style="margin: 5% 7%">
							<c:forEach items="${myFreeComments}" var="comment">
								<div>
									<a href="${path}/freeBoard/boarddetail?freeNum=${comment.freeNum}"> 
										<c:set var="shortContent" value="${fn:substring(comment.commContent, 0, 45)}" /> 
												<span style="font-size: 14px;"> <c:out value="${shortContent}" escapeXml="true" /></a>
								</div>
							</c:forEach>


							<!-- <div class="act-btn" style="display: flex">
								<button class="actBtn" value="walk">산책로 추천</button>
								<button class="actBtn" id="" value="free">자유게시판</button>
							</div>
							<div class="act-btn" style="display: flex">
								<button value="temp" id="" class="actBtn">임시 보호소</button>
								<button value="lost" id="" class="actBtn">미멍 보호소</button>
							</div> -->
						</div>
					</div>
				</div>
			</div>
			<div class="myactive"
				style="width: 100%; padding: 0 5%; border-left: 2px solid rgb(199, 199, 199);">
				<div class="actGrid">
					<div class="actTitle">개인 정보</div>
					<div class="petInfo" style="text-align: center">
						<!-- <hr /> -->
						<input type="hidden" name="memid" value="${dog.memId}" />
						<div class="field1">
							<div class="inner-txt">아이디</div>
							<div class="myinfo">${user.memId}</div>
						</div>
						<div class="field1">
							<div class="inner-txt">닉네임</div>
							<div class="myinfo">${user.memNick}</div>
						</div>
						<div class="field1">
							<div class="inner-txt">이메일</div>
							<div class="myinfo">
								<span id="tel1">${user.memEmail}</span>
							</div>
						</div>
						<div class="field1">
							<div class="inner-txt">전화번호</div>
							<div class="myinfo">${user.memPhone}</div>
						</div>
						<div class="field1">
							<div class="inner-txt">주소</div>
							<div class="myinfo">${user.memAddress1}<br>${user.memAddress2}
							</div>
						</div>
					</div>

					<!-- 펫 정보(추가/ 삭제) -->
					<!-- <div class="actTitle">반려동물 정보</div> -->
					<div class="actTitle">
						<span>추가 프로필</span>
						<div
							style="font-size: 12px; margin-top: 15px; margin-left: 290px;">
							<a class="btn-fill" href="${path}/doginsert?id=${user.memId }">추가</a>
						</div>
						<div class="header-line"></div>
					</div>
					<c:forEach items="${dogs}" var="dog">
						<div class="petInfo" id="${dog.dogNum}"
							style="text-align: center; border-width: 3px 0 0 0">
							<div class="signup-container">
								<!-- 아이디 -->
								<div class="field">
									<div class="inner-txt">반려동물 이름</div>
									<div class="inner-input">${dog.dogName}</div>
								</div>

								<!-- 닉네임 -->
								<div class="field">
									<div class="inner-txt">반려견 나이</div>
									<div class="inner-input">${dog.dogAge}</div>
								</div>

								<div class="field">
									<div class="inner-txt">성별</div>
									<div class="inner-input">${dog.dogGender}</div>
								</div>

								<div class="field">
									<div class="inner-txt">프로필 사진</div>
									<div class="inner-input">
										<img src="${path}/imageView?num=${dog.dogProfile}"
											style="width: 100px; height: 100px" />
									</div>
								</div>
							</div>
							<div class="btnSet">
								<a class="btn-fill"
									href="${path}/dogmodify?dogNum=${dog.dogNum}">수정</a>
								<button class="btn-fill delBtn" data-num="${dog.dogNum}">삭제</button>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>

			<!--왜 안먹어 이시키야
        -->
		</div>
	</div>
</body>
<script>
	let imageBox=document.querySelector(".img_box");
	let preview = document.querySelector("#preview");
	let fileInput = document.querySelector("#fileInput");
	preview.onload = () => {
		const widthDiff = (preview.clientWidth - imageBox.offsetWidth) / 2;
    	const heightDiff = (preview.clientHeight - imageBox.offsetHeight) / 2;
		console.log(widthDiff)
		console.log(heightDiff)
    	preview.style.transform = "translate("+ -widthDiff + "px,"+ -heightDiff +"px)";
	};  
	
	imageBox.onclick = function() {
		fileInput.click();
	}
	const resizeImage = (settings) => {
		const file = settings.file;
		const maxSize = settings.maxSize;
		const reader = new FileReader();
		const image = new Image();
		const canvas = document.createElement("canvas");

		const resize = () => {
			let width = image.width;
		    let height = image.height;
		    if (width > height) {
		        if (width > maxSize) {
		        	height *= maxSize / width;
		        	width = maxSize;
		      	}
		    } else {
		        if (height > maxSize) {
		        	width *= maxSize / height;
		        	height = maxSize;
		        }
		    }
		    canvas.width = width;
		    canvas.height = height;
		    canvas.getContext("2d").drawImage(image, 0, 0, width, height);
		 	return canvas
		};

		return new Promise((ok, no) => {
			if (!file) {
		      return;
		    }
		    if (!file.type.match(/image.*/)) {
		      no(new Error("Not an image"));
		      return;
		    }
		    reader.onload = (readerEvent) => {
		      image.onload = () => {
		        return ok(resize());
		      };
		      image.src = readerEvent.target.result;
		    };
		    reader.readAsDataURL(file);
		});
	};
	let imageBlob = null;
	fileInput.onchange = function(e) {
		let file = e.target.files[0];
		const config = {
				file: e.target.files[0],
				maxSize: 330,
			};
			resizeImage(config)
				.then((resizedImage) => {
				    resizedImage.toBlob( blob=> {
						const url = window.URL.createObjectURL(blob);
						/* const img = document.createElement("img"); */
						preview.setAttribute("src", url);
						preview.className = "profile-img";
						preview.style.display = "block";
					    	      
						imageBox.innerHTML = "";
						imageBox.appendChild(preview);
						imageBlob = blob;
						console.log(imageBlob)
						submit();
					}, 'image/webp')
				})
				.catch((err) => {
					console.log(err);
				});	 
	}
	
	async function submit() {
		let formData = new FormData();
	    formData.append("file", imageBlob, "image.webp");
	    let response = await fetch('${path}/memberProfileUpdate', {
	      method: 'POST',
	      body: formData
	    });

	    // 전송이 잘 되었다는 응답이 오고 이미지 사이즈가 얼럿창에 출력됩니다.
	    let result = await response.json();
	    console.log(result.res);
	    if(result.res=="true") {
			console.log("사진등록");
	    } else {
	    	console.log("사진등록 실패");
	    }
	  }	
	
</script>


</html>
