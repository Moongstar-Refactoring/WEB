<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>댓글 JSP</title>

  <style type="text/css">
 @font-face {
        font-family: "JalnanGothic";
        src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_231029@1.1/JalnanGothic.woff")
          format("woff");
        font-weight: normal;
        font-style: normal;
      }
      @font-face {
        font-family: "Pretendard-Regular";
        src: url("https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff")
          format("woff");
        font-weight: 400;
        font-style: normal;
      }
body,html{
margin:0;
padding:0;
 font-family: "Pretendard-Regular", sans-serif; /* 전체 글꼴 변경 */

}
.containers{
position:relative;
width:1280px;
top: 30px;
margin: 0 auto;
}
#hosComment {
	background-color: #EFEFEF;
	width: 1250px;
	height: 250px;
	padding: 20px; border-radius : 5%;
	box-shadow: 0 2px 3px gray;
	blur-radius: 30px;
	border-radius: 20px;
}

.comment {
	height: 340px;
}

.commentFont {
	height: 30px;
	padding: 0;
	display: inline-block;
}
h3 {
	margin-left: 25px;
}


#sticker1 {
	position: relative;
	float: right;
	top: -10px;
}

#sticker2 {
	position: relative;
	float: left;
	top: 20px;
}

#sticker3 {
	position: relative;
	float: right;
	top: 15px;
	left: 50px;
}

.commBtn {
	float: right;
	background-color: gold;
	position: relative;
	border: none;
	box-shadow: 0px 2px 0px rgba(0, 0, 0, 0.4);
	border-radius: 10px;
	font-size: 13px;
	font-weight: bold;
}

.inputComment {
	display: inline-block;
	width: 70%;
	height: 20px;
	margin-left: 5px;
	margin-right: 20px;
	border-style: none;
	outline: none;
	font-size: 15px;
}

.inputDiv {
	position: relative;
	margin: 0 auto;
	top: 45%;
	width: 1200px;
	padding: 5px;
	background-color: white;
	border: 4px solid #EFC940;
	border-radius: 20px;
	box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.2);
}

.memComm {
	width: 1200px;
	margin: 0 auto;
	padding: 5px;
	overflow: hidden;
}

.commContent {
	text-align: right;
	font-size: 15px;
}

.commNickname {
	text-align: right;
	font-size: 12px;
	font-weight: bold;
	color: gray;
}

.writeComm {
	width: 1200px;
	margin: 0 auto;
	padding: 5px;
	overflow: hidden;
}

.mycomm {
	float: right;
}

.comm {
	float: left;
}

  </style>
</head>
<body>
<c:set var="path" value="${pageContext.request.contextPath}"/>   
					<div class="containers">
					<div class="commentFont">
						<img id="sticker2"
							src="${path }/image/mung.png">
							<img
							id="sticker1" src="${path }/image/mung.png">
						<img id="sticker3"
							src="${path }/image/mung.png">
						<h3>COMMENTS</h3>
					</div>
					<div id="hosComment">
						<div class="writeComm">
							<img src='<c:url value="${path }/image/delete.png"/>'
								style="width: 18px; height: 18px" class="mycomm"> <span
								class="commNickname mycomm"><img
								src='<c:url value="${path }/image/logo.png"/>'
								style="width: 15px; height: 15px">&nbsp;닉네임이들어가는곳&nbsp;&nbsp;</span>
							<span class="commContent mycomm">댓글내용이 들어가는
								곳입니다.&nbsp;&nbsp;</span>
						</div>
						<div class="writeComm">
							<img src='<c:url value="/image/delete.png"/>'
								style="width: 18px; height: 18px" class="mycomm"> <span
								class="commNickname mycomm"><img
								src='<c:url value="/image/logo.png"/>'
								style="width: 15px; height: 15px">&nbsp;닉네임이들어가는곳&nbsp;&nbsp;</span>
							<span class="commContent mycomm">댓글내용이 들어가는
								곳입니다.&nbsp;&nbsp;</span>
						</div>
						<div class="memComm">
							<img src='<c:url value="${path }/image/delete.png"/>'
								style="width: 18px; height: 18px" class="comm"> <span
								class="commNickname comm">&nbsp;&nbsp;<img
								src='<c:url value="${path }/image/logo.png"/>'
								style="width: 15px; height: 15px">&nbsp;닉네임이들어가는곳&nbsp;&nbsp;
							</span> <span class="commContent comm">&nbsp;&nbsp;댓글내용이 들어가는
								곳입니다.</span>
						</div>
						<div class="inputDiv">
							<form action="">
								<input type="text" class="inputComment" id="comment" name="text"
									placeholder="댓글" />
								<button type="submit" class="commBtn">등록</button>
							</form>
						</div>
					</div>
			</div>
		
</body>
</html>
