<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
 <style type="text/css">
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
 	.pageContainer {
		width: 100%;
	}
 	.freeContainer {
		width : 1280px;
		margin : 0 auto;
 	}
 	#freeCategory {
 		width :1280px;
 		margin: 10px 0;	
 		font-size: 22px;
        font-family: "JalnanGothic";
  	}
  	.listContainer{
 		width :1280px;
 		margin: 0 auto;

  	}
  	.wrap{
  		background-color: #f5f5f5;
  		width: 1260px;
		padding: 10px;
  		margin-top: 10px;
  		border-radius: 20px;
  		box-shadow: 1px 3px 3px rgba(0, 0, 0, 0.1);
  	 }
  	 
  	 .ContentBackground{
  		background-color: #ffffff;
  		width: 1160px;
  		margin-top: 5px;
		padding: 20px;
  		margin: 10px auto;
  		border-radius: 20px;
  	 }
  	 .title{
  	 	width: 1000px; 
  	 	padding: 2px;
  		overflow: hidden; 
  		font-size : 17px;
  		font-weight: bold;
  	 }
  	 .titleInfo {
  	 	padding-right: 5px;
  	  	float : right;
  	  	font-size : 14px; 
  	  	position: relative;
    	bottom: 0;
    	color : gray;
  	 }
  	 .writeNick{
  		font-size : 15px;
  	}
  	.context{
  		font-size : 16px;
  	}
  	.contextImg{
  		float : right;
  		padding: 10px;
  	}
  	.yellowBtn {
  		background-color: #FED74B;
  		font-weight: bold;
  		width: 65px;
  		padding: 5px;
  		border-radius: 17px;
  		border : 0;
  		box-shadow: 1px 4px 0px rgba(0, 0, 0, 0.1);
  	}
  	.BtnArray {
  		display: flex;
    	justify-content: center;
    	align-items: center; /* 수직 정렬을 위해 추가 */
    	margin-left: 10px;
  	}
  	.BtnArray button {
    margin: 0 2px; /* 좌우 여백을 10px로 설정 */
}
  	
  	.likeButton {
  		width: 40px;
  		height: 40px;
  		background-image: url('../image/하트(회)수정.png');
  		background-size: cover;
  		background-color: transparent;
  		border: none; /* 기본적인 버튼 스타일 제거 */
  		cursor: pointer; /* 마우스를 올리면 커서 모양 변경 */
	}
	
	.likeButton.active {
  		background-image: url('../image/하트(핑).png'); /* 활성화된 상태의 이미지 */
	}
	
	.likeCount {
    display: inline-block; /* 인라인 요소로 변경하여 텍스트와 버튼이 한 줄에 정렬되도록 변경 */
    vertical-align: middle; /* 수직 정렬을 위해 추가 */
    margin-right: 10px; /* 좌우 여백 추가 */
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
  	.footer {
  		height: 200px;
  	}
  	
</style>
<style>
  /* 스크롤 가능한 상자 스타일 */
    .scroll-box{
        background-color: #ffffff;
        max-height : 500px;
        overflow: hidden; 
        overflow-y: overlay; /* 수직 스크롤만 표시 */
    }
    .scroll-box::-webkit-scrollbar {
        width: 10px;
        max-height: 400px;
    	
    }
    .scroll-box::-webkit-scrollbar-thumb {
    	background-color: #D9D9D9;
    	min-height: 10px; 
    	border-radius: 10px;
    	background-clip: padding-box;
    	
		
  }
  
  .scroll-box::-webkit-scrollbar-track{
		background-color: transparent;
    	border-radius: 10px;
}

</style>
<style type="text/css">
      .cheader{
      	margin: 20px auto 0 auto;
      	width: 1280px;
        font-size: 18px;
        font-family: "JalnanGothic";  	
        }
  	.comment_container{
      	margin: 0 auto 160px auto;
      	width: 1280px;
  		padding-top: 30px; padding-bottom:30px;
      	background-color: #f5f5f5;
      	border-radius: 20px;
  		box-shadow: 1px 3px 3px rgba(0, 0, 0, 0.1)
  	}
  	.comment_box{
  		background-color: white;
  		width: 1160px; max-height: 500px;
  		margin: 0 50px 15px 50px;
  		padding: 10px 10px 10px 10px;
      	border-radius: 20px;
      	display: inline-block;
      	overflow: auto;
  	}
  	.comment_box::-webkit-scrollbar{
      	width: 10px;
      	max-height: 460px;
    }
    .comment_box::-webkit-scrollbar-thumb{
      	background-color: #D9D9D9;
      	min-height: 10px;
      	border-radius: 10px;
      	background-clip: padding-box;
    }
    .comment_box::-webkit-scrollbar-track{
      	background-color: transparent;
      	border-radius: 10px;
    }
  	.writeComm{
  		width: 60%;
  		margin: 5px 0 5px 0; 
  		float: right;
  		padding: 5px;
  		overflow: hidden;
  	}
  	.memComm{
		width: 763.86px; 
  		margin: 5px 365px 5px 0;
  		padding: 5px;
  		overflow: hidden;  	
  	}
  	.commContent{
  		padding-top: 5px; padding-bottom: 5px;
  		padding-left: 10px; padding-right: 7px;
  		background-color: #FED74B;
  		overflow:auto;
  		border-radius: 7px;
  		text-align: left;
		font-size: 15px;
  	}
  	.memcommContent{
        padding-top: 5px; padding-bottom: 5px;
        padding-left: 10px; padding-right: 7px;
        background-color: #f5f5f5;
        overflow:auto;
        border-radius: 7px;
        text-align: left;
      	font-size: 14px;
     }
  	
  	.commNickname{
  		padding-top: 5px; padding-bottom: 5px;
  		padding-left: 10px; padding-right: 7px;
		text-align: right;
		font-size: 12px;
		font-weight: bold;
		color: gray;
  	}
  	
  	
  	
  	.inputDiv{
  		margin: 0 4%;
  		padding: 4px;
  		background-color: white;
  		border-style : solid;
  		border-color: #EFC940;
  		border-width: 4px;
  		border-radius: 20px;
  		box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.2);
  		overflow:auto;
  	}
  	.inputComment{
  		display: inline-block;
  		width: 80%;
  		height: 40px;
   		margin-left: 5px;
  		margin-right: 70px; 
  		border-style: none;
  		outline: none;
  		font-size: 15px;
  		resize: vertical;
  		overflow:auto;
  	}
  	
  	
  	.commBtn{
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
  	
  	.mycomm{
  		float: right;
  	}
  	.comm{
  		float: left;
  	}
  	.delete_img{
  		padding: 5px;
  	}
</style>
</head>


<body>
<jsp:include page="/main/header.jsp"/>
<br>
<div class = "pageContainer">
	<div class="freeContainer">
	<div id="freeCategory">
		<h2 style="margin-bottom: 5px; font-weight: lighter;">자유게시판</h2>
		<br><br>
	</div>
	</div>
	<div class = "listContainer">
<div class="wrap">
	<div>
		<span class= "title" >&nbsp;&nbsp;&nbsp;${board.freeSub }</span>
		<span class = "titleInfo">${board.freeWriteDate}&nbsp;&nbsp;&nbsp;</span>
		<br>
		<span class = "titleInfo">좋아요 : <span id="likecount">${board.freeLike}</span>&nbsp;</span>
		<span class = "titleInfo">조회수 : ${board.freeView}&nbsp;</span>
		<div class = "writeNick">&nbsp;&nbsp;&nbsp;&nbsp;${board.freeNick }</div>
	</div>
</div>
	<br>
<div class="wrap">
	<div class="ContentBackground scroll-box">
		<div class = "context">${board.freeContent}</div>
		<c:if test="${board.freePhoto ne null}">
			<img src="${path}/imageView?num=${board.freePhoto}" width="auto"/>
		</c:if>
	</div>
	<div class="tag-input" style="color: lightgray;">${board.freeTag}</div>
</div>
</div>
<br>
<div class = "BtnArray">
	<button class = "yellowBtn" id="listBtn">목록</button>
 	<c:if test="${board.memId eq user.memId}">
 	<button type = "submit" class = "yellowBtn" id="modifyBtn">수정</button>
 	<button id="deleteBtn" class = "yellowBtn" type = "submit">삭제</button>
 	</c:if>
<%-- 	
 	<button id="likeCount" class="likeButton" onclick="toggleLike(this)"></button>
	<span class="likeCount">${board.freeLike}</span>
 --%>
	<c:if test="${user ne Empty}">
      <c:choose>
         <c:when test="${isLike eq 'true'}">
            <img src="../image/하트(핑).png" width="40px" height="40px" style="margin_top :5px" id="like"/>
         </c:when>
         <c:otherwise>
         
            <img src="../image/하트(회)수정.png" width="40px" height="40px" style="margin_top :5px" id="like"/>
         </c:otherwise>
      </c:choose>
   </c:if>

</div>
<br>
</div>

<div class="cheader">&nbsp;COMMENT</div>
<div class="comment_container">
	<div class="comment_box" id="comment_box">
	<c:forEach items="${comments}" var="comment">
	<c:choose>
	<c:when test="${comment.commNick eq board.freeNick}">
	<div class="writeComm">
		<img src="${path}/image/delete.png" style="width:18px; height:18px" class="delete_img mycomm" id="${comment.commNick}" data-num="${comment.commNum}" onclick="commentDelete(this)">
		<span class="commNickname mycomm"><img src="${path}/image/logo.png" style="width:15px; height:15px">&nbsp;${comment.commNick}&nbsp;&nbsp;</span>
		<span class="commContent mycomm"style="float: left;" >${comment.commContent}</span>
	</div>
	</c:when>
	<c:otherwise>
	<div class="memComm">
		<img src="${path}/image/delete.png" style="width:18px; height:18px" class="delete_img comm" id="${comment.commNick}" data-num="${comment.commNum}" onclick="commentDelete(this)">
		<span class="commNickname comm">&nbsp;&nbsp;<img src="${path}/image/logo.png" style="width:15px; height:15px">&nbsp;${comment.commNick}&nbsp;&nbsp;</span>
		<span class="memcommContent comm" style="float: left;" >${comment.commContent}</span>
	</div>
	</c:otherwise>
	</c:choose>
	</c:forEach>     
	</div>
	<c:if test="${user ne null }">
    <div class="inputDiv" style="overflow: auto;">
    	<input type="text" class="inputComment" id="comment" name="text" placeholder="댓글"/>
		<button class="commBtn" id="commBtn">등록</button>
	</div>
	</c:if>
</div>

<div class="footer"></div>
<script  src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
	$("#modifyBtn").click(function(e) {
		e.preventDefault();
		var freeNum = "${board.freeNum}"; // 게시물의 식별자
		window.location.href = "${path}/freeBoard/freemodify?freeNum=" + freeNum;
		
	})
	$("#listBtn").click(function(e) {
    	e.preventDefault();
    	window.location.href = "${path}/freeBoard/freeboard"; // 브라우저의 이전 페이지로 이동
	});
	/* $('form').submit(function(e) {
		 $('#freeHidden').val('true');
	})	 */
	$('#deleteBtn').click(function(){
		 if (confirm("게시물을 삭제하시겠습니까??") == true){    //확인
		     window.location.href="freeDelete?freeNum=${board.freeNum}"
		 }else{   //취소
		     return false;
		 }
	})
</script>
<script>
$('#commBtn').on("click",function(){
	$.ajax({
		url:"freecomment",
		type:"POST",
		asnyc:true,
		data:{commContent:$('#comment').val(), freeNum:'${board.freeNum}'},
		success:function(result){
			let comment=JSON.parse(result);
			let div = '';
			if(comment.memNick==='${board.freeNick}'){
			let div=`<div class="writeComm">
					<img src="${path}/image/delete.png" style="width:18px; height:18px" class="delete_img mycomm" id=\${comment.memNick} data-num=\${comment.commNum} onclick="commentDelete(this)">
					<span class="commNickname mycomm"><img src="${path}/image/logo.png" style="width:15px; height:15px">&nbsp;\${comment.memNick}&nbsp;&nbsp;</span>
					<span class="commContent mycomm">\${comment.commContent}</span>
				</div>`
				$('#comment_box').append(div);
			$('#comment').val('');
			} else{
				let div=`<div class="memComm">
						<img src="${path}/image/delete.png" style="width:18px; height:18px" class="delete_img comm" id=\${comment.memNick} data-num=\${comment.commNum} onclick="commentDelete(this)">
						<span class="commNickname comm">&nbsp;&nbsp;<img src="${path}/image/logo.png" style="width:15px; height:15px">&nbsp;\${comment.memNick}&nbsp;&nbsp;</span>
						<span class="commContent comm" >\${comment.commContent}</span>
					</div>`
					$('#comment_box').append(div);
				$('#comment').val('');
			}
//			$('#comment_box').append(div);	
			// 스크롤을 가장 하단으로 이동
            $('#comment_box').scrollTop($('#comment_box')[0].scrollHeight);
		},
		error:function(err){
			alert("댓글입력 오류입니다.")
		}	
	})
})

  </script>
  <script type="text/javascript">
//수정 페이지로 이동하는 함수
function goToModifyPage(freeNum) {
        window.location.href = "freemodify?freeNum=" + freeNum;
    }


function toggleLike(button) {
	  button.classList.toggle('active');
	}
</script>
 
<script>
$(function(){
    $('#like').click(function(){
       $.ajax({
          url:'${path}/freelike',
          type:'post',
          async:true,
          data:{like:JSON.stringify({memId:"${user.memId}", freeNum:"${board.freeNum}"})},
          success:function(result){
             if(result=='true'){
                $('#like').attr("src","../image/하트(핑).png")
                $("#likecount").text(+$("#likecount").text()+1)
             } else{
                $('#like').attr("src","../image/하트(회)수정.png")
                $("#likecount").text(+$("#likecount").text()-1)
             }
          },
       })
    })
 })

 function commentDelete(delImage) {
	console.log(delImage)
	var writeDiv = delImage.parentNode;
	console.log(delImage.getAttribute('id'))
	if(delImage.getAttribute('id')!='${user.memNick}') return;
	
	if (confirm("댓글을 삭제하시겠습니까??") == true){    //확인
	     $.ajax({
	    	 url:'${path}/freeBoard/freeCommentDelete',
	    	 type:'get',
	    	 async:true,
	    	 data:{commNum:delImage.dataset.num},
	    	 success:function(result) {
	    		 console.log(result)
	    		 if(result=='true') {
	    			 writeDiv.remove()
	    		 }
	    	 }
	     })
	 }else{   //취소
	     return false;
	 }	
}
</script>

</body>
</html>