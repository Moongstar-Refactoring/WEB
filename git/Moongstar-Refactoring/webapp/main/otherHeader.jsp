<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="icon" href="image/logo.png" />
    <title>멍뭉별</title>
    <style>
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

      body,
      html {
        margin: 0;
        padding: 0;
        font-family: "Pretendard-Regular", sans-serif; /* 전체 글꼴 변경 */
      }

      .header {
        margin: 0 auto;
        width: 1280px;
        height: 95px;
        display: flex;
        align-items: center;
        justify-content: space-between;
        color: white;
        position: relative; /* 로고 중앙 정렬을 위해 position 설정 */
      }

      .logo {
        height: 100%;
        max-height: 100%;
        width: auto;
        justify-content: center;
        display: flex; /* 추가: 로고를 수직으로 중앙 정렬하기 위해 */
        align-items: center; /* 추가: 로고를 수직으로 중앙 정렬하기 위해 */
      }

      .nav_menu {
        display: flex;
        font-size: 20px;
       
        gap: 30px;
        margin-right: 400px;
      }
      img {
        vertical-align: middle;
        border-style: none;
      }
      .nav_menu a {
        margin-top: 40px;
      }

      .user-info {
        display: flex;
        justify-content: center;
        margin-left: 10px;
        font-size: 12px;
      }

      .user-info a {
        margin: 5px 5px 0 5px;
      }

      .user-info img {
        height: 100%;
        border-radius: 100%;
      }

      /* 하단 선 스타일 */
      .header-line {
        border-top: 2px solid rgb(221, 224, 224);
      }

      a:link {
        color: black;
        text-decoration: none;
      }
      a:hover {
        color: black;
        font-weight: 700;
      }
      .userPro {
        display: grid;
        margin: 2px 0 1px 0;
      }
      a:visited {
        color: black;
      }
    </style>
  </head>
  <body>
    <div class="header">
      <div class="logo">
      <a href="../main/main.jsp"> <img src="../image/logo.png" alt="Logo" width="90px" /></a> 
      </div>
      <div class="nav_menu">
        <a href="../walking/walkingBoard.jsp">산책로</a>
        <a href="../hospital/hospitalBoard.jsp">24시 동물병원</a>
        <a href="../freeBoard/freeBoard.jsp">자유게시판</a>
        <a href="../lost/lostBoard.jsp">미멍보호소</a>
        <a href="../temp/tempBoard.jsp">임시 보호해요</a>
      </div>
      <div class="userPro">
        <div class="user-info">
        	<c:choose>
					<c:when test="${user eq Empty} ">
				<img src="../image/blue.png" alt="Profile" width="50px"
					height="50px" />
					</c:when>
					<c:otherwise>
						<img src="../image/프로필01.jpg" alt="Profile" width="50px"height="50px" />
					</c:otherwise>
					</c:choose>
					</div>
        <div class="user-info">
       <c:choose>
					<c:when test="${user eq Empty} ">
						<a href="../main/login.jsp">로그인</a>
											<a href="../main/signup.jsp">회원가입</a>
					</c:when>
					<c:otherwise>
						<a href="../main/myPage.jsp">마이페이지</a>
											<a href="logout">로그아웃</a>
					</c:otherwise>
				</c:choose>
        </div>
    </div>
    <div class="header-line"></div>
  </body>
</html>
