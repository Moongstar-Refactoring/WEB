<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>댓글</title>
 <style>
  	.cheader{
      	margin: 20px auto 0 auto;
        font-size: 18px;
        font-family: "JalnanGothic";  	
        }
  	.comment_container{
      	margin: 0 auto 160px auto;
  		padding-top: 30px; padding-bottom:30px;
      	background-color: #f5f5f5;
      	border-radius: 20px;
  		box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.2);
  	}
  	.comment_box{
  		background-color: white;
  		margin: 0 4%; margin-bottom: 15px;
  		padding: 20px 10px 20px 10px;
      	border-radius: 20px;
  	}
  	.writeComm{
  		width: 70%; 
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
  	.commContent{
  		padding-top: 5px; padding-bottom: 5px;
  		padding-left: 10px; padding-right: 7px;
  		background-color: #f5f5f5;
  		border-radius: 7px;
  		text-align: right;
		font-size: 15px;
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
<div class="cheader">&nbsp;COMMENT</div>
<div class="comment_container">
	<div class="comment_box">
	<div class="writeComm">
		<img src='<c:url value="/image/delete.png"/>' style="width:18px; height:18px" class="delete_img mycomm">
		<span class="commNickname mycomm"><img  src='<c:url value="/image/logo.png"/>' style="width:15px; height:15px">&nbsp;닉네임이들어가는곳&nbsp;&nbsp;</span>
		<span class="commContent mycomm">aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa댓글내용이 들어가는 곳입니다.</span>
	</div>
	<div class="writeComm">
		<img src='<c:url value="/image/delete.png"/>' style="width:18px; height:18px" class="delete_img mycomm">
		<span class="commNickname mycomm"><img  src='<c:url value="/image/logo.png"/>' style="width:15px; height:15px">&nbsp;닉네임이들어가는곳&nbsp;&nbsp;</span>
		<span class="commContent mycomm" >댓글내용이 들어가는 곳입니다.</span>
	</div>
	<div class="memComm">
		<img src='<c:url value="/image/delete.png"/>' style="width:18px; height:18px" class="delete_img comm">
		<span class="commNickname comm">&nbsp;&nbsp;<img  src='<c:url value="/image/logo.png"/>' style="width:15px; height:15px">&nbsp;닉네임이들어가는곳&nbsp;&nbsp;</span>
		<span class="commContent comm" >댓글내용이 들어가는 곳입니다.</span>
	</div>     
	</div>
    <div class="inputDiv">
    <form action="">
    	<input type="text" class="inputComment" id="comment" name="text" placeholder="댓글"/>
		<button type="submit" class="commBtn">등록</button>
	</form>
	</div>
</div>
</html>
