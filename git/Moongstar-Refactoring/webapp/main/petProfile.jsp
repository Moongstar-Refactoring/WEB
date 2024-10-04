<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>프로필 업로더</title>
  </head>
  <style>
    :root {
      --main-color: #0155b7;
    }
    /* Google web font CDN*/
    @import url("https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap");
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

    .header {
      margin: 0 16.6%;
      height: 10%;

      display: flex;
      align-items: center;
      justify-content: space-between;
      color: white;
      padding: 0 20px;
      position: relative; /* 로고 중앙 정렬을 위해 position 설정 */
    }

    .logo {
      height: auto;
      max-height: 100%;
      width: auto;
      margin-top: 20px;
    }

    .user-info {
      display: flex;
      align-items: center;
      margin-left: 10px;
      font-size: 12px;
      margin-top: 10px;
    }

    .user-info a {
      margin-right: 10px;
      margin-top: 50px;
    }

    .user-info img {
      height: 100%;
      border-radius: 100%;
      margin-top: 10px;
    }

    /* 하단 선 스타일 */
    .header-line {
      border-top: 2px solid rgb(221, 224, 224);
      margin-top: 10px; /* 선과 헤더 사이의 여백 조정 */
    }

    /* 중앙 로고 스타일 */
    .center-logo {
      position: absolute;
      left: 50%;
      transform: translateX(-50%);
      margin-top: 20px;
    }
    .content {
      margin: 0 16.6%;
    }
    .container {
      display: flex;
      justify-content: center;
    }
    a:link {
      color: black;
      text-decoration: none;
    }
    a:hover {
      color: black;
      font-weight: 700;
    }

    /*member sign in*/
    .member {
      width: calc(
        100% - (20% * 2)
      ); /* 콘텐츠 영역의 너비에서 양쪽 여백을 뺀 크기로 설정 */
      margin: 0 20%; /* 양쪽 여백을 16.6%로 설정 */
      margin-bottom: 20px;
      margin-top: 20px;
    }

    .member .logo {
      /*로고는 이미지라 인라인 블록이니까 마진 오토 안됨 블록요소만 됨 */
      display: block;
      margin: 50px auto;
    }

    /* 중복되는 스타일은 .field 내부에서만 사용 */
    .member .field {
      margin: 5px 0; /*상하로 좀 띄워주기*/
    }

    .member b {
      /* border: 1px solid #000; */
      display: block; /*수직 정렬하기 */
      margin-bottom: 5px;
    }

    .member input:not(input[type="radio"]),
    .member select {
      border: 1px solid #d1d1d1;
      padding: 7px;
      width: 100%;
      margin-bottom: 5px;
    }

    .member input[type="button"],
    .member input[type="submit"] {
      background-color: #0155b7;
      color: #fff;
      padding: 10px 20px; /* 상하 10px, 좌우 20px */
      margin-right: 10px;
      font-weight: 500;
      font-size: 12px;
    }

    .member input:focus,
    .member select:focus {
      border: none;
    }

    .field.birth div {
      /*field 이면서 birth*/
      display: flex;
      gap: 10px; /*간격 벌려줄때 공식처럼 사용핟나 */
    }

    .field.tel-number div {
      display: flex;
    }

    .field.tel-number div input:nth-child(1) {
      flex: 2;
    }
    input:focus {
      outline: none;
    }

    .field.tel-number div input:nth-child(2) {
      flex: 1;
    }

    .field {
      display: flex;
      align-items: baseline; /* 입력 상자와 텍스트를 같은 기준선에 정렬 */
    }

    .field input[type="text"],
    .field input[type="password"],
    .field input[type="number"],
    .field select,
    .field input[type="email"],
    .field input[type="tel"] {
      flex: 1; /* 자동으로 너비를 할당 */
      margin-left: 10px; /* 오른쪽 여백 */
      border-radius: 3px;
      padding: 7px 15px;
    }

    .field button {
      background-color: #0155b7;
      color: white;
      border: none;
      margin-left: 5px;
    }
    .member .field input[type="button"] {
      margin-left: 5px;
      width: auto;
      /* 버튼 너비를 내용에 맞게 자동 조정 */
      /* 버튼 내용에 따라 적절한 패딩 적용 */
      border-radius: 3px;
      padding: 6px 15px;
      font-weight: bold;
      font-size: 13px;
      letter-spacing: 2px;
    }
    input::placeholder {
      font-size: 12px;
    }

    .placehold-text {
      display: block; /*span 으로 감싸서 크기영역을 블록요소로 만들어ㅜ저야한다*/
      position: relative;
      /* border: 1px solid #000; */
    }

    .placehold-text:before {
      position: absolute; /*before은 inline 요소이기 때문에 span으로 감싸줌 */
      right: 20px;
      top: 13px;
      pointer-events: none; /*자체가 가지고 있는 pointer event 를 없애준다 */
    }

    .userpw {
      background: url(./images/images2/icon-01.png) no-repeat center right 15px;
      background-size: 20px;
      background-color: #fff;
    }

    .userpw-confirm {
      background: url(./images/images2/icon-02.png) no-repeat center right 15px;
      background-size: 20px;
      background-color: #fff;
    }

    @media (max-width: 768px) {
      .member {
        width: 100%;
      }
    }
    .title {
      text-align: center;
      font-family: "JalnanGothic";
      font-size: 34px;
    }
    .member > h2 {
      font-family: "JalnanGothic";
      font-size: 24px;
      color: #0155b7;
      margin-bottom: 40px;
      font-size: 48px;
      font-weight: 900;
      text-align: center;
    }
    .signup {
      margin: 3% 13%;
      height: auto;
    }
    .little_title {
      font-size: 14px;
      font-weight: 700;
      width: 120px;
    }
    .row-field {
      display: flex;
      align-items: center;
    }
    .userInput {
      font-size: 14px;
      text-align: center;
      margin: 20px 0;
    }
    a:visited {
      color: black;
    }
    .agree {
      display: flex;
      justify-content: center;
    }
    .email-a {
      margin-left: 10px;
    }
    .inputw {
      width: 30%;
    }
    .email-com {
      display: flex;
    }
    .select {
      padding: 5px;
      outline: none;
    }
    .stitle {
      font-size: 24px;
      font-weight: 900;
    }

    .gender {
      padding: 5px 10px;
    }
    .gender input[type="radio"] {
      display: none;
    }
    .gender input[type="radio"] + label {
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
    .gender input[type="radio"] + label {
      background-color: #fff;
      color: #333;
    }
    .gender input[type="radio"]:checked + label {
      background-color: var(--main-color);
      color: #fff;
    }
    #warn:hover {
      font-weight: 700;
    }


  </style>
  <body>
    <div
      class="stitle"
      style="
        margin-top: 50px;
        display: flex;
        justify-content: space-between;
        align-items: center;
      "
    >
      <span>반려동물정보 입력<span style="font-size: 14px"> (선택)</span></span>
      <div class="header-line"></div>
      <div class="button-group">
        <!-- 추가 버튼 -->
        <button class="add-btn" onclick="addPetInfo()">
          반려동물 정보 추가
        </button>
      </div>
    </div>
    <div class="header-line"></div>

    <div class="signup-container"></div>

    <script>
      // 추가 버튼 클릭 시 양식 추가
      function addPetInfo() {
        const signupContainer = document.querySelector(".signup-container");
        const newPetInfo = document.createElement("div");
        newPetInfo.classList.add("signup"); // 양식에 클래스 추가
        newPetInfo.innerHTML = `
            <span class="field">
              <span class="little_title">반려동물 이름</span>
              <div>
                <input type="text" name="pet-name" />
              </div>
            </span>

            <!-- 반려동물 성별 -->
            <span class="field">
              <span class="little_title">반려동물 성별</span>
              <div class="gender">
                <input type="radio" id="male" name="pet-gender" value="male" />
                <label for="male">남</label>
                <input type="radio" id="female" name="pet-gender" value="female" />
                <label for="female">여</label>
              </div>
            </span>

            <!-- 반려동물 사진 -->
            <span class="field" style="display: flex; align-items: center">
              <span class="little_title">반려동물 사진</span>
              <img
              class="preview-image"
              src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"
              alt="프로필 미리보기"
              style="width: 100px; height: 100px"
            />
              <input
                type="file"
                class="file-input"
                accept="image/jpg,image/png,image/jpeg"
              />
              
              <!-- 삭제 버튼 -->
              <button class="delete-btn" onclick="deletePetInfo(this)">
                반려동물 정보 삭제
              </button>
            </span>
          `;
        signupContainer.appendChild(newPetInfo);
      }

      // 양식 삭제 함수
      function deletePetInfo(button) {
        const signupContainer = document.querySelector(".signup-container");
        signupContainer.removeChild(button.parentNode.parentNode);
      }

      // 파일 선택 시 미리보기 업데이트
      const fileInputs = document.querySelectorAll(".file-input");
      fileInputs.forEach(function (fileInput) {
        fileInput.addEventListener("change", function (event) {
          const previewImage =
            event.target.parentNode.querySelector(".preview-image");
          const file = event.target.files[0];
          if (file) {
            const reader = new FileReader();
            reader.onload = function (e) {
              previewImage.src = e.target.result;
            };
            reader.readAsDataURL(file);
          }
        });
      });
    </script>
  </body>
</html>

