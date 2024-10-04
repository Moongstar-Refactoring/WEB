<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멍뭉별 임시보호 게시글 작성</title>
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
      	font-size-adjust: 17px;
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
		$('#tempModify').submit(function(){
			
			var chars='';
			$('input[class=charInput]').map(function(){
				chars +=$(this).val()+'@';
			});
			$("#tempChar").val(chars);
			alert("게시물이 수정되었습니다");
			/* console.log($('#dogName').val());
			console.log($('#address').val());
			console.log(chars);
			console.log($('#protectDate').val());
			console.log($('#etc').val());
			let temp={tempName:$('#dogName').val(), tempAddress:$('#address').val(), tempChar:chars, 
					protectDate:$('#protectDate').val(), tempEtc:$('#etc').val()}
			
			$.ajax({
				url:'tempWrite',
				type:'post',
				async:true,
				data:{temp:JSON.stringify(temp)},
				success:(function(result){
					
				})
			}) */
		})
	})
</script>
</head>
<body>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/main/header.jsp"/>
<div class="text">임시보호</div>
<form action="tempModify" enctype="multipart/form-data" method="post" id="tempModify" 
	onkeypress="if(event.keyCode === 13) {return false;}">
<input type="hidden" name="tempChar" id="tempChar"/>
<input type="hidden" name="tempNum" value="${temp.tempNum}"/>
<div class="content_container">
	<div class="content_box">
		<div class="content_box2">
			<div class="write_box">
				<div class="cgory_container">
					<select class="category" id="category" name="tempCgory" size="1" >
						<c:choose>
							<c:when test="${temp.tempCgory eq 'finding'}">
								<option value="finding" selected>주인이 필요해요</option>
								<option value="finded">주인이 생겼어요</option>	
							</c:when>
							<c:otherwise>
								<option value="finding">주인이 필요해요</option>
								<option value="finded" selected>주인이 생겼어요</option>
							</c:otherwise>
						</c:choose>
					</select>
    			</div>
				<input type="text" placeholder="강아지 이름" class="dogname_box" id="dogName" name="tempName" required="required" value="${temp.tempName}">
				
				<div>
				<img src="${path}/image/place.png">
				<input type="text" placeholder="현재 보호중인 장소" id="address" class="address" name="tempAddress" required="required" value="${temp.tempAddress}">
				</div>
				
				<div class="contents char">특징</div>
				
				<div class="char_box" id="char_box"></div>
				
				<div class="contents">임시보호기간</div>
    			<input class="dateInput" type="date" id="protectDate" name="protectDate" required="required" value="${temp.protectDate}">
    			
				<div class="contents">기타사항</div>
				<textarea id="etc" class="etc" placeholder="기타사항 작성란입니다" name="tempEtc" required="required">${temp.tempEtc}</textarea>
				
			</div>
			<div class="tempImg">
			<div class="img_box">
				<img class="fileImg" id="preview" src="${path}/imageView?num=${temp.tempPhoto }">
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
      	<button class="boardBtn Btn" id="btn">등록</button>
    </div>
</form>
</body>
<script>

const charBox = document.getElementById('char_box');

var charString='${temp.tempChar}';
var chars=charString.split('@');


for (var i = 0; i < chars.length-1; i++) {
	const newItem = document.createElement('div'); // 새로운 div 요소 생성
    
    if(i==0){
    	newItem.textContent = '🐶 ';
    } else{
    	// 삭제 버튼 추가
        const deleteButton = document.createElement('button'); // 새로운 button 요소 생성
        deleteButton.className="deleteButton";
        deleteButton.textContent = '⛔'; // 버튼 텍스트 설정
        deleteButton.onclick = function() {
            removeItem(newItem);
        };
        newItem.appendChild(deleteButton); // 버튼 요소를 항목에 추가
    }
	
    const itemText = document.createElement('input'); // 새로운 input 요소 생성
    itemText.type = 'text'; // input 타입을 text로 지정
    itemText.className = 'charInput';
    itemText.required = true;
    itemText.value = chars[i];
    itemText.id='char'
    //itemText.name = 'tempChar'
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


let preview=document.querySelector("#preview");
let fileInput=document.querySelector("#fileInput");
preview.onclick=function(){
	fileInput.click();
}

fileInput.onchange=function(e){
	let file=e.target.files[0];
	if(file) {
		let reader=new FileReader();
		
		reader.onload=function(data){
			console.log(data);
			preview.src=data.target.result;
		}
			
		reader.readAsDataURL(file);
	} else{
		preview.src="${path}/image/addFile.png";
	}
}


</script>
</html>