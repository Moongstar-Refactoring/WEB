<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멍뭉별 임시보호소 게시글 작성</title>
<style>
body,
    html {
        margin: 0;
        padding: 0;
        font-family: "Pretendard-Regular", sans-serif; /* 전체 글꼴 변경 */
        }
	.text {
		margin: 50px auto;
		width: 1280px;
        font-size: 34px;
        font-family: "JalnanGothic";
      }
      .content_container{
      	margin: 0 auto 50px auto;
      	background-color: #f5f5f5;
      	width: 1280px; height: 620px;
      	display: flex;
   	 	justify-content: center;
      	align-items: center;
      	border-radius: 20px;
  		box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.2);
      }
      .content_box{
      	background-color: white;
      	margin: 0 4% 0 4%;
		height: 85%; width: 92%;
      	border-radius: 20px;
      	overflow: auto;
      }
      .content_box::-webkit-scrollbar{
      	width: 10px;
      	max-height: 460px;
      }
      .content_box::-webkit-scrollbar-thumb{
      	background-color: #D9D9D9;
      	min-height: 10px;
      	border-radius: 10px;
      	background-clip: padding-box;
      }
      .content_box::-webkit-scrollbar-track{
      	background-color: transparent;
      	border-radius: 10px;
      }
      .content_box2{
      	width: 90%; height: 400px;
      	margin: 40px auto 40px;
/*       	background-color: gray;
 */      }
      .write_box{
      	display: inline-block;
/*       	background-color: yellow;
 */      	width: 70%; height: 400px;
      }
      .dogname_box{
      	color: black;
      	font-size: 40px;
      	font-weight: bolder;
      	border: none;
     	outline: none;
      }
      ::placeholder{
      	color: #BDBDBD;
      }
      .address{
      	width: 90%;
      	border: none;
     	outline: none;
     	margin-top:10px;
      	font-size: 20px;
      }
      .deleteButton{
      	background: white;
      	border: none;
      	cursor: pointer;
      }
      .item{
      	padding: 2px 0 2px 0;
      	outline: none;
      }
      .charInput{
      	width: 90%;
      	outline: none;
      	border: none;
      	border-bottom: 1px solid #BDBDBD;
      	margin: 2px 0;
      	font-size: 17px;
      }
      .dateInput{
      	font-size: 17px;
      	color: #BDBDBD;
      	outline: none;
      	border: none;
      	border-bottom: 1px solid #BDBDBD;
      }
      .etc{
      	overflow: hidden;
      	width: 98%; height: 100%;
      	resize: none;
      	outline: none;
      	border: 0;
      	font-size: 17px;
      }
      .hidden {
   		display: none;
		}
      .contents{
      	font-size: 20px; color: black;
      	border-bottom: 1px solid #7E7E7E;
      	margin-bottom:10px; margin-top: 10px;
      	padding-bottom: 3px;
      }
      .tempImg{
      	display: inline-block;
     	width: 25%; height: 328.7px;
 		padding: 10px;
      	float: right;
      	border: 1px solid #7E7E7E;
      	border-radius: 10px;
      	overflow: hidden;
      }
      .img_box{
      	display: inline-block;
     	width: 100%; height:264px;
      	float: right;
      	border-radius: 10px;
      	overflow: hidden;
      }
      .fileImg{
      	display: inline-block;
      	width: 100%; height: 264px;
    	cursor: pointer;
    	background-color: #f9f9f9;
    	border: 1px solid #ccc;
    	border-radius: 4px;
    	font-size: 200px;
    	text-align: center;
    	color: #A3A3A3;
      }
      .fileInput{
      	position: absolute;
    	display: none;
    	overflow: hidden;
    	clip: rect(0,0,0,0);
      }
      .fileImg:hover {
    	background-color: #e0e0e0;
    	}
      .dog_Img{
      	width: 100%; height: 200px;
      	border-radius: 10px;
      }
      .state{
      	color: green;
      	margin-top: 10px;
      	font-size: 30px;
		text-align: center;
      }
      .btn_container{
      	margin-top: 30px;
      	display: flex;
   	 	justify-content: center;
      	align-items: center;
      } 
      .Btn{
      	margin:10px;
		background-color: #FED74B;
  		border: none;
		box-shadow: 0px 2px 0px rgba(0, 0, 0, 0.4);
  		border-radius: 20px;
		padding-left: 20px;
		padding-right: 20px;
		padding-bottom: 5px;
		padding-top: 5px;
		font-size: 15px;
		font-weight: bold;
      }
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(function(){
/* 		$('#tempWrite').submit(async function(e){
			e.preventDefault();

		     
 		    let response = await fetch('tempWrite', {
		      method: 'POST',
		      body: formData
		    });
		    
		    // 전송이 잘 되었다는 응답이 오고 이미지 사이즈가 얼럿창에 출력됩니다.
		    let result = await response.json();
		    alert(result.result); 
		    
		}) */
	})
</script>
</head>
<body>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/main/header.jsp"/>
<div class="text">임시보호소</div>
<!-- <form action="tempWrite" enctype="multipart/form-data" method="post" id="tempWrite" 
	onkeypress="if(event.keyCode === 13) {return false;}"> -->
<input type="hidden" name="tempChar" id="tempChar"/>
<div class="content_container">
	<div class="content_box">
		<div class="content_box2">
			<div class="write_box">
				<div class="cgory_container">
					<select class="category" id="category" name="tempCgory" size="1">
						<option value="finding">주인을 찾고있어요</option>
						<option value="finded">주인을 찾았어요</option>
					</select>
    			</div>
				<input type="text" placeholder="강아지 이름" class="dogname_box" id="dogName" name="tempName">
				
				<div>
				<img src="<%=request.getContextPath()%>/image/place.png">
				<input type="text" placeholder="현재 보호중인 장소" id="address" class="address" name="tempAddress">
				</div>
				
				<div class="contents char">특징</div>
				
				<div class="char_box" id="char_box">
					<div class="item">
					🐶 <input id="char" class="charInput" type="text" placeholder="강아지 특징을 써주세요">
					</div></div>
				
				<div class="contents">임시보호기간</div>
    			<input class="dateInput" type="date" id="protectDate" name="protectDate">
    			
				<div class="contents">기타사항</div>
				<textarea id="etc" class="etc" placeholder="기타사항 작성란입니다" name="tempEtc"></textarea>
				
			</div>
			<div class="tempImg">
			<div class="img_box">
				<img class="fileImg" id="preview" src="${path}/image/addFile.png">
				<input type="file" id="fileInput" class="fileInput" name="file" accept="image/*">
			</div>
			</div>
		</div>
	</div>
</div>
	<div style="display: flex;
   	 	justify-content: center;
      	align-items: center;
      	margin-bottom: 150px;">
      	<button class="boardBtn Btn" id="btn" onclick="submit()">등록</button>
    </div>
<!-- </form> -->
</body>
<script>
const charBox = document.getElementById('char_box');

/* function handleKeyPress(event) {
    if (event.key === 'Enter') {
        addNewItem();
    }
} */


$(".charInput").on('keypress', (function(e) {
	console.log("charInput");
	 if (event.key === 'Enter') {
		 console.log(this.parentNode)
		 console.log(charBox.childNodes[charBox.childNodes.length - 1])
		 if(this.parentNode == charBox.lastChild) {
			 addNewItem();
		 }
	 }
})) 

function appendItem(target) {
	
}

function addNewItem() {
    const newItem = document.createElement('div'); // 새로운 div 요소 생성
    
    // 삭제 버튼 추가
    const deleteButton = document.createElement('button'); // 새로운 button 요소 생성
    deleteButton.className="deleteButton";
    deleteButton.textContent = '⛔'; // 버튼 텍스트 설정
    deleteButton.onclick = function() {
        removeItem(newItem);
    };
    newItem.appendChild(deleteButton); // 버튼 요소를 항목에 추가
    
    /* newItem.textContent = '▶ ';
    newItem.className = 'item'; */
    
    const itemText = document.createElement('input'); // 새로운 input 요소 생성
    itemText.type = 'text'; // input 타입을 text로 지정
    itemText.className = 'charInput';
    itemText.placeholder = '강아지 특징을 써주세요';
    itemText.onkeypress = function(e) {
   	 	if (event.key === 'Enter') {
   		 console.log(this.parentNode)
   		 console.log(charBox.childNodes[charBox.childNodes.length - 1])
   		 if(this.parentNode ==   charBox.lastChild) {
   			 addNewItem();
   		 }
  		}
	}
    newItem.appendChild(itemText); // input 요소를 항목에 추가

    charBox.appendChild(newItem); // 부모 요소에 새로운 항목 추가
    itemText.focus()	
}

function removeItem(item) {
    item.parentNode.removeChild(item); // 부모 요소에서 해당 항목 제거
}

// 입력 가능한 상자에 이벤트 리스너 추가하여 키보드 입력 이벤트 감지
//charBox.addEventListener('keypress', handleKeyPress);

let imageBox=document.querySelector(".img_box");
let preview=document.querySelector("#preview");
let fileInput=document.querySelector("#fileInput");
preview.onclick=function(){
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
		console.log(width)
		console.log(height)
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
fileInput.onchange=function(e){
 	const config = {
		file: e.target.files[0],
		maxSize: 390,
	};
	resizeImage(config)
		.then((resizedImage) => {
		    resizedImage.toBlob( blob=> {
				const url = window.URL.createObjectURL(blob);
				/* const img = document.createElement("img"); */
				preview.setAttribute("src", url);
				preview.className = "profile-img";
				preview.style.display = "block";
				preview.onload = () => {
					const widthDiff = (preview.clientWidth - imageBox.offsetWidth) / 2;
			    	const heightDiff = (preview.clientHeight - imageBox.offsetHeight) / 2;

			    	preview.style.transform = "translate("+ -widthDiff + "px,"+ -heightDiff +"px)";
				};    	      
			    	      
				imageBox.innerHTML = "";
				imageBox.appendChild(preview);
				imageBlob = blob;
				console.log(imageBlob)
			}, 'image/webp')
		})
		.catch((err) => {
			console.log(err);
		});	 
}

async function submit() {
	var chars='';		
	$('input[class=charInput]').map(function(){
		chars +=$(this).val()+'@';
	});

	let formData = new FormData();
    formData.append("tempName", $("#dogName").val());
    formData.append("tempChar", chars);
    formData.append("tempAddress",$("#address").val());
    formData.append("protectDate",$("#protectDate").val());
    formData.append("tempEtc", $("#etc").val());
    formData.append("tempCgory", $("select[name=tempCgory]").val());

    formData.append("file", imageBlob, "image.webp");
    let response = await fetch('/MoongStar/temp/tempWrite', {
      method: 'POST',
      body: formData
    });

    // 전송이 잘 되었다는 응답이 오고 이미지 사이즈가 얼럿창에 출력됩니다.
    let result = await response.json();
    console.log(result.res);
    if(result.res=="true") {
		alert("게시물이 등록되었습니다");
    	document.location.href="/MoongStar/temp/tempBoard";
    } else {
    	alert("등록 실패");
    }
  }



</script>
</html>