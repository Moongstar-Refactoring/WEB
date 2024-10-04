<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>댓글</title>
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
 
     .comment{
        width: 1024px;
       	margin:0 auto;
        font-size: 18px;
        font-family: "Pretendard";    
        }
     .comment_container{
        background-color: #f5f5f5;
  		width: 990px;
		padding: 10px;
  		margin: 10px auto;
  		border-radius: 20px;
  		box-shadow: 1px 3px 3px rgba(0, 0, 0, 0.1);
     }
     .comment_box{
        background-color: #ffffff;
  		width: 900px;
		padding: 10px;
  		margin: 10px auto;
  		border-radius: 20px;
     }
     .writeComm{
        width: 60%; 
        float: right;
        margin-bottom: 10px;
        padding: 5px;
        overflow: hidden;
     }
     .memComm{
        width: 763.86px; 
        margin-right: 365px;
        margin-bottom: 10px;
        padding: 5px;
        overflow: hidden;     
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
     .commContent{
        padding-top: 5px; padding-bottom: 5px;
        padding-left: 10px; padding-right: 7px;
        background-color: #FED74B;
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
     }
     
     
     .commBtn{
        margin:10px;
      	background-color: #FED74B;
        border: none;
      	box-shadow: 1px 2px 0px rgba(0, 0, 0, 0.4);
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
<div class="comment">
<div style="font-weight: bold" >&nbsp;COMMENT</div>
<div class="comment_container">

   <div class="comment_box">
   <div class="writeComm">
      <img src='<c:url value="/image/delete.png"/>' style="width:18px; height:18px" class="delete_img mycomm" onclick="deleteComment(event)">
      <span class="commNickname mycomm"><img  src='<c:url value="/image/logo.png"/>' style="width:15px; height:15px">&nbsp;닉네임이들어가는곳&nbsp;&nbsp;</span>
      <span class="commContent mycomm">aaaaaaaaaadfsdfsdfsdfsdfsdfsdfsdfsdfsdfsdfsdfdsfaaaaaaaaaaaaaaaaaaaaa댓글내용이 들어가는 곳입니다.</span>
   </div>
   <div class="writeComm">
      <img src='<c:url value="/image/delete.png"/>' style="width:18px; height:18px" class="delete_img mycomm" onclick="deleteComment(event)">
      <span class="commNickname mycomm"><img  src='<c:url value="/image/logo.png"/>' style="width:15px; height:15px">&nbsp;닉네임이들어가는곳&nbsp;&nbsp;</span>
      <span class="commContent mycomm" >댓글내용이 들어가는 곳입니다.</span>
   </div>
   <div class="memComm">
      <img src='<c:url value="/image/delete.png"/>' style="width:18px; height:18px" class="delete_img comm" onclick="deleteComment(event)">
      <span class="commNickname comm">&nbsp;&nbsp;<img  src='<c:url value="/image/logo.png"/>' style="width:15px; height:15px">&nbsp;닉네임이들어가는곳&nbsp;&nbsp;</span>
      <span class="memcommContent comm" >댓글내용이 들어가는 곳입니다.</span>
   </div>     
   </div>
    <div class="inputDiv">
    <form action="">
       <input type="text" class="inputComment" id="comment" name="text" placeholder="댓글"/>
      <button type="submit" class="commBtn">등록</button>
   </form>
   </div>
</div>
</div>
<script>

// 이미지를 클릭하여 댓글 삭제 기능을 처리하는 함수
function deleteComment(event) {
    // 클릭한 이미지의 부모 요소를 찾아냅니다. 여기서는 댓글을 감싸는 div의 클래스가 'writeComm' 또는 'memComm' 입니다.
    var comment = event.target.closest('.writeComm, .memComm');
    // 부모 요소가 존재하는지 확인합니다.
    if (comment) {
        // 부모 요소를 삭제합니다.
        comment.remove();
    }
}
/*
    // 이미지를 클릭하여 댓글 삭제 기능을 처리하는 함수
    function deleteComment(event) {
        // 클릭한 이미지의 부모 요소를 찾아냅니다. 여기서는 댓글을 감싸는 div의 클래스가 'comment_box' 입니다.
        var commentBox = event.target.closest('.comment_box');
        // 부모 요소가 존재하는지 확인합니다.
        if (commentBox) {
            // 댓글 작성자와 현재 로그인한 사용자를 비교합니다.
            var author = commentBox.querySelector('.commNickname').innerText.trim();
            var currentUser = "현재 로그인한 사용자"; // 현재 로그인한 사용자의 정보를 가져와야 합니다.
            
            // 댓글 작성자와 현재 로그인한 사용자가 일치하는 경우에만 삭제합니다.
            if (author === currentUser) {
                // 부모 요소를 삭제합니다.
                commentBox.remove();
            } else {
                alert("본인이 작성한 댓글만 삭제할 수 있습니다.");
            }
        }
    }
 */
</script>
</html>