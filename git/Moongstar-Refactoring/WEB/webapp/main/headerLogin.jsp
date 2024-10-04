<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
        padding:0;
        font-family: "Pretendard-Regular", sans-serif;
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

      /* 중앙 로고 스타일 */
      .center-logo {
        position: absolute;
        left: 50%;
        transform: translateX(-50%);
      }
img {
  vertical-align: middle;
  border-style: none;
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
        margin: 2px 0  1px 0;
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
      <div class="center-logo">
        <img src="../image/cen_logo.png" alt="Cen Logo" width="90px" />
      </div>
      <div class="userPro">
        <div class="user-info">
          <img src="../image/프로필01.jpg" alt="Profile" width="50px" height="50px" />
        </div>
        <div class="user-info">
          <a href="../main/myPage.jsp">마이페이지</a>
          <a href="logout">로그아웃</a>
        </div>
      </div>
    </div>
    <div class="header-line"></div>
  </body>
</html>
