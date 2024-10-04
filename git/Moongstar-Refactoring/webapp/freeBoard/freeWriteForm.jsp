<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>  
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<style type="text/css">	
	body,html {
        margin: 0;
        padding: 0;
        font-family: "Pretendard-Regular", sans-serif; /* 전체 글꼴 변경 */
      }
	.pageContainer {
		width: 100%;
	}
	.freeContainer {
		width : 1280px;
		margin : 0 auto;
 	}
 	#freeCategory{
 		width :1280px;
 		margin: 10px 0;	
 		font-size: 22px;
        font-family: "JalnanGothic";	
  	}
  	.writeContainer {
  		width :1200px;
 		margin : 0 auto;
 		
  	}
  	.writeTitle{
  		background-color: #f5f5f5;
  		width: 1200px;
  		padding: 10px;
  		margin-bottom: 10px;
  		border-radius: 15px;
  		box-shadow: inset 1px 3px 3px rgba(0, 0, 0, 0.1);
  		border: 0; /* input에 border 없애기 */
  	}
  	  	 /* 활성화된 input의 border 없애기 */
    input:focus {
        outline: none;
    }
  	.content {
        background-color: #f5f5f5;
        width: 1200px; 
        height: 560px; 
        padding: 10px;
        margin: 10px auto;
        border-radius: 20px;
        box-shadow: inset 1px 3px 3px rgba(0, 0, 0, 0.1);
    }

    .text-area {
        width: 100%; /* textarea 요소의 가로 너비를 100%로 설정 */
        height: 400px; /* textarea 요소의 세로 높이를 100%로 설정 */
        resize: none; /* textarea 요소의 크기 조정을 비활성화 */
        border: 0; /* textarea 요소의 테두리 제거 */
        outline: none; /* textarea 요소의 포커스 표시 제거 */
        background-color: transparent; /* textarea 요소의 배경색을 투명으로 설정 */
        font-size: 15px; /* textarea 요소의 글꼴 크기 설정 */
        font-weight: normal;
        line-height: 1.5; /* textarea 요소의 줄 간격 설정 */
        padding: 10px;
        margin: 10px auto;
    }
     #imagePreview img {
            max-width: 100%;
            height: auto;
            margin-bottom: 10px;
        }
     #fileInput {
            display: none; /* 파일 선택 input 요소 숨기기 */
    }
    .tag-input {
    	align-item: center;
    	margin-left: 10px;
    	margin-bottom: 3px;
    	border: 0;
  		background-color: transparent;
  		border-radius: 5px;
  		transition: width 0.2s;
  		width: 200px; /* 초기 너비 설정 */
  		max-width: 880px;
	}
    .yellowBtn {
		font-weight: bold;
		margin: 0 auto;
		background-color: #FED74B;
  		width: 65px;
  		padding: 5px;
  		border-radius: 17px;
  		border : 0;
  		box-shadow: 1px 4px 0px rgba(0, 0, 0, 0.1);
	}
	.BtnArray {
  		 text-align: center;
  	}
    .footer {
  		height: 200px;
  	}
  	
</style>
<style>
  /* 스크롤 가능한 상자 스타일 */
    .scroll-box {
        background-color: #f5f5f5;
        width: 900px; 
        overflow: auto;
        padding: 10px;
        margin: 10px auto;
        outline: none;
        border: 0;
        border-radius: 20px;
        overflow-x: hidden; /* 수평 스크롤 제거 */
    }
    .scroll-box::-webkit-scrollbar {
        width: 10px;
    }
    .scroll-box::-webkit-scrollbar-thumb {
    	background-color: #D9D9D9;
    	min-height: 10px; 
    	border-radius: 10px;
    	background-clip: padding-box;
  	}
  
  .scroll-box::-webkit-scrollbar-track {
        background-color: transparent;
        border-radius: 10px;
    }

</style>
<style>
.toolbar {
    background-color: #ffffff;
    width: 800px; 
    height: 20px;
    border-radius: 18px;
    padding: 10px;
    margin: 10px auto;
    margin-bottom: 10px;
    display: flex;
    justify-content: center;
    align-items: center;
}

.toolbar-button {
    background-color: transparent;
    border: none;
    cursor: pointer;
    padding: 5px 10px;
    border-radius: 3px;
    margin-right: 5px;
}

.font-size-select {
	margin-left: 10px;
 	border-radius: 3px;
	border:0;
    padding: 5px;
    outline: none;
}
.imgBtn {
	cursor: pointer;
	margin-left: 8px;
	margin-right: 8px;
	width: 20px;
	height: 20px;
}
.imgBtn2 {
	cursor: pointer;
	margin-left: 8px;
	margin-right: 8px;
	width: 15px;
	height: 15px;
}
.colorPicker{
	text-align: center;
	font-weight: bold;
	font-size: 13px;
 	margin-top: 2px;
	margin-left: 4px;
	margin-right: 4px;
 	padding-bottom:2px;
 	display: flex; 
	flex-direction: column; 
}
.bgcolorPicker{
	color: white;
	background-color: black;
	border-radius: 5px;
 	width: 21px;
}
#colorPicker {
	background-color:transparent;
	width: 28px;
	height: 15px;
    border: 0;
    border-radius: 3px;
    padding: 0px;
    margin: 0px;
  }
#bgColorPicker {
	background-color:transparent;
	width: 28px;
	height: 15px;
    border: 0;
    border-radius: 3px;
    padding: 0px;
    margin: 0px;
  }

</style>
<script  src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
	<%@ include file="../main/header.jsp"%>
<br>
<div class="pageContainer">
<%-- 	<form id="freeWrite" method="post" enctype="multipart/form-data" action="${path}/freeBoard/freeWriteForm"> --%>
	<form id="freeWrite" method="post" action="${path}/freeBoard/freeWriteForm">
<div class = "freeContainer">
	<div id = "freeCategory">
		<h2 style="margin-bottom: 5px; font-weight: lighter; ">자유게시판</h2>
		<h4 style = "font-family: Pretendard-Regular; margin-top: -5px;">게시물작성</h4>
	</div>
<div class="writeContainer">
    <input class="writeTitle" id="freeSub" name="freeSub" type="text" placeholder="  제목  "  required="required"/>
    <br>    
    <div class="content">
        <div class="toolbar">
        	<select class="toolbar-select font-size-select" onchange="document.execCommand('fontSize', false, this.value);">
        		<option value="1">Small</option>
        		<option value="2">Normal</option>
        		<option value="3">Large</option>
        		<option value="4">Very Large</option>
    		</select>
    		<div class="imgBtn"></div>
    		<img src="${path}/image/b.png" class="imgBtn2 " onclick="document.execCommand('bold', false, null);">
    		<img src="${path}/image/italic.png" class="imgBtn2 " onclick="document.execCommand('italic', false, null);">
    		<img src="${path}/image/underline.png" class="imgBtn2 " onclick="document.execCommand('underline', false, '');">
    		<img src="${path}/image/line.png" class="imgBtn2 " onclick="document.execCommand('strikeThrough', false, '');">
    		<img src="${path}/image/quote.png" class = "imgBtn" onclick="quoteText()">
    		<!-- 파일선택 -->
    		<img src="${path}/image/image.png" class="imgBtn" id="fileBtn">
			<script>
				$("#fileBtn").click(function(e) {
					var fileInput = $('<input type="file" id="fileInput" id="freePhoto" name="file" style="display: none;" accept="image/*">');
					fileInput.change(function(ef) {
						var file = event.target.files[0];
					    if (file) {
					        var reader = new FileReader();
					        reader.onload = function(event) {
					            var imgElement = document.createElement('img');
					            imgElement.src = event.target.result;
					            imgElement.style.width = 'auto';
								$("#editor").append(imgElement);
					        };
					        reader.readAsDataURL(file);						
						}
					})
					fileInput.click();

				})
			
			
			</script>    		
   
    		<img src="${path}/image/link-icon.png" class="imgBtn" style="width:auto;hight:50%;" onclick="addLink()">
    		<div class="imgBtn"></div>
    		<img src="${path}/image/왼쪽정렬.png" class = "imgBtn" onclick="document.execCommand('justifyLeft', false, '');">
    		<img src="${path}/image/가운데정렬.png" class = "imgBtn" onclick="document.execCommand('justifyCenter', false, '');">
    		<img src="${path}/image/오른쪽정렬.png" class = "imgBtn" onclick="document.execCommand('justifyRight', false, '');">
  			<div class="imgBtn"></div>
  			<div class="colorPicker">
        		<label class="colorPicker" for="colorPicker">A</label>
        		<input type="color" id="colorPicker" onchange="changeTextColor(event)">
    			</div>
    		<div class="colorPicker">
    			<label class = "bgcolorPicker colorPicker" for="bgColorPicker">A</label>
    				<input type="color" id="bgColorPicker" onchange="changeBackgroundColor(event)">
    		</div>
        </div>
        <div class="scroll-box">
            
            <input type="hidden" id="freeContent" name="freeContent"/> 
            <div id="editor" class="text-area" contenteditable="true" style="overflow: hidden; width: 100%;">

            </div>
        </div>
        <input type="text" class="tag-input" id="tag" name="freeTag" placeholder="#태그를 입력하세요">
    </div>
</div>
	<br>
	<div class = "BtnArray">
	<button name="submit" class="yellowBtn" type="submit">저장</button>
	</div>
</div>
</form>
 <script>
  // 인용구 추가 함수
function quoteText() {
    var selection = window.getSelection();
    var range = selection.getRangeAt(0);
    var selectedText = range.toString();
    
    // 인용구로 감싸기
    var quoteElement = document.createElement('blockquote');
    quoteElement.textContent = selectedText;

    // 선택 영역 교체
    range.deleteContents();
    range.insertNode(quoteElement);
}
// 파일 업로드 함수
function handleFiles(event) {
    var file = event.target.files[0];
    var content = document.getElementById('imagePreview'); // 이미지가 추가될 위치를 변경

    if (file) {
        var reader = new FileReader();
        reader.onload = function(event) {
            var imgElement = document.createElement('img');
            imgElement.src = event.target.result;
            imgElement.style.width = '100%';
            content.appendChild(imgElement); // 이미지 추가
        };
        reader.readAsDataURL(file);
    }
}

 //이거는 하이퍼링크 스크립트에옹
    function addLink() {
      var url = prompt("Enter the URL:");
      document.execCommand('createLink', false, url);
    }
 // 글자 색상 변경 함수
    function changeTextColor(event) {
        var color = event.target.value;
        document.execCommand('foreColor', false, color);
    }
    function changeBackgroundColor(event) {
        var color = event.target.value;
        document.execCommand('hiliteColor', false, color);
    }
  </script>
<script>


</script>
<script>
	$('form').submit(function(e) {
		$('#freeContent').val($("#editor").html())
		
	})	
</script>
</div>
<div class="footer"></div>	
</body>
</html>