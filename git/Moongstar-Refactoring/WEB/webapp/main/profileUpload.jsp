<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>My Page</title>

<style>
.myPage-content{
    display: flex;
    width: 1000px;
    min-height: 700px;
    margin: 50px auto;
}

/* 사이드메뉴 */
.left-side{
    width: 25%;
    border-right: 2px solid #ddd;
}

.list-group{
    width: 100%;
    list-style: none;
    padding-right: 20px;
}

.list-group > li{
    height: 50px;
    font-size: 18px;
}

.list-group > li > a{
    color:black;
    text-decoration: none;

    display: flex;
    height: 100%;

    justify-content: center;
    align-items: center;

    border-bottom : 2px solid #ddd;
}

.list-group > li > a:hover{
    background-color: #ccc;
}

/* ********************************* */
/* 마이페이지 공통 */
.myPage-main{
    width: 75%;
    padding: 0 50px;
}

/* 마이페이지 제목 */
.myPage-title{
    margin-bottom: 10px;
    font-size: 30px;
}

/* 마이페이지 부제 */
.myPage-subject{
    display: block;
    margin-bottom: 30px;

    font-size: 14px;
    letter-spacing: -1px;
}

/* 마이페이지 행 단위 스타일 지정 */
.myPage-row{
    width: 500px;
    height: 50px;
    margin-top: 20px;

    display: flex;
    align-items: center;
    border-bottom : 2px solid #ddd;
}

.myPage-row > * {
    font-size: 18px;
    font-weight: bold;
}

/* 행 제목 */
.myPage-row > label{
    width: 30%;
    color: #455ba8;
}

.myPage-row > span{
    width: 70%;
    color: #455ba8;
}

/* 행 내부 input 태그 */
.myPage-row > input{
    width: 100%;
    height: 100%;
    border: none;
    outline: none;
    font-weight: normal;
}

/* 제출 버튼 */
.myPage-submit{
    width: 100%;
    padding: 10px;
    margin: 50px 0;
    
    border: none;
    font-size: 20px;
    font-weight: bold;

    background-color: #455ba8;
    color: white;
    cursor: pointer;
}

/* form태그 */
form[name='myPageFrm']{
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
}

/* 내부 input 요소 focus 시 */
.myPage-row:focus-within{ 
    border-bottom-color: #455ba8;
}


/* ******************************************* */
/* 내 정보 페이지 전용 스타일 */

.info-title{
    border: none;
}

.info-address{
    margin: 0;
}

.info-address > button{
    width: 30%;
    height: 70%;

    font-size: 14px;
    font-weight: normal;

    background-color: white;
    border : 1px solid gray;
    cursor: pointer;
}

/* *********비밀번호 변경 화면*********** */
.myPage-row > input[type='password']{
    width: 70%;
} 

/* **********회원 탈퇴 약관********** */
.secession-terms{
    width: 500px;
    height: 300px;
    border: 1px solid black;
    
    overflow: auto;
    /* 내용이 요소를 벗어나는 경우 방향에 맞춰서 자동으로 스크롤 추가 */

    font-family: sans-serif; /* 돋움체 */
    font-size: 14px;
}

/* ************* 프로필 화면 ************* */
.profile-image-area{
    width: 150px;
    height: 150px;
    border: 3px solid #ccc;
    border-radius: 50%;

    position: relative;

    overflow: hidden;
    display: flex;
    justify-content: center;
    align-content: center;
}

#profileImage{
    height: 100%;
}

/* 삭제버튼 */
form[name='myPageFrm']{position: relative;}

#deleteImage{
    position: absolute;
    top: 0px;
    right: 240px;
    cursor: pointer;
}

/* 이미지 버튼 영역 */
.profile-btn-area{
    width: 230px;
    margin: 20px 0;

    display: flex;
    justify-content: center;
    align-items: center;
}

.profile-btn-area > *{
    width: 110px;
    height: 33px;
    padding: 5px 10px;

    border: 1px solid black;
    background-color: white;
    font-size: 14px;
    cursor: pointer;
    text-align: center;
}

#imageInput{ display: none;}

.profile-btn-area > button{
    background-color: #455ba8;
    color : white;
    margin-left: 2px;
}
</style>
</head>
<body>
    <main>
	<%@ include file="../main/header.jsp"%>

        
        <!-- 마이페이지 - 내 정보 -->
        <section class="myPage-content">
            
			<!-- 사이드메뉴 include -->
			<!-- jsp 액션 태그 -->
<!-- 오른쪽 마이페이지 주요 내용 부분 -->
            <section class="myPage-main">

                <h1 class="myPage-title">프로필</h1>
                <span class="myPage-subject">프로필 이미지를 변경할 수 있습니다.</span>

                <%--
                - multipart/form-data : 모든 문자를 인코딩하지 않음
				(원본 데이터가 유지되어 이미지, 파일 등을 서버로 전송할 수 있음)
               	--%>

                <form action="profile" method="POST" name="myPageFrm" id="profileFrm" enctype="multipart/form-data">

                    <div class="profile-image-area">

                        <%-- 프로필 이미지가 없으면 기본 이미지 --%>
                        <c:if test="${empty loginMember.profileImage}" >
                            <img src="/resources/images/user.png" id="profileImage">
                        </c:if>

                        <%-- 프로필 이미지가 있으면 있는 이미지 --%>
                        <c:if test="${!empty loginMember.profileImage}" >
                            <img src="${loginMember.profileImage}" id="profileImage">
                        </c:if>

                    </div>
                    <span id="deleteImage">x</span>

                    <div class="profile-btn-area">
                        <label for="imageInput">이미지 선택</label>
                        <input type="file" name="profileImage" id="imageInput" accept="image/*">
                        <button>변경하기</button>
                    </div>
                    
                    <div class="myPage-row">
                        <label>이메일</label>
                        <span>${loginMember.memberEmail}</span>
                    </div>
                    
                    <div class="myPage-row">
                        <label>가입일</label>
                        <span>${loginMember.enrollDate}</span>
                    </div>
                    
                </form>

                

            </section>

        </section>

    </main>



    <%-- myPage.js 연결 --%>
    <script>
    const profileImage = document.getElementById("profileImage"); // img 태그
    const deleteImage = document.getElementById("deleteImage"); // x 버튼
    const imageInput = document.getElementById("imageInput"); // input 태그

    let initCheck; // 초기 프로필 이미지 상태를 저장하는 변수
                   // false == 기본 이미지, true == 이전 업로드 이미지

    let deleteCheck = -1;
    // 프로필 이미지가 새로 업로드되거나 삭제되었음을 나타내는 변수
    // -1 == 초기값, 0 == 프로필 삭제(x버튼), 1 == 새 업로드 이미지

    let originalImage; // 초기 프로필 이미지 파일 경로 저장

    if(imageInput != null){ // 화면에 imageInput이 있을 경우

        // 프로필 이미지가 출력되는 img 태그의 src 속성을 저장
        originalImage = profileImage.getAttribute("src");

        // 회원 프로필 화면 진입 시 
        // 현재 회원의 프로필 이미지 상태를 확인
        if(originalImage == "/resources/images/user.png"){
            // 기본 이미지인 경우
            initCheck = false;

        } else {
            initCheck = true;
        }

        // change 이벤트 : 값이 변했을 때
        // - input type="file", "checkbox", "radio"에서 많이 사용
        // - text/number 형식 사용 가능
        //  -> 이때 input값 입력 후 포커스를 잃었을 때
        //     이전 값과 다르면 change 이벤트 발생

        imageInput.addEventListener("change", e => {

            // 2MB로 최대 크기 제한
            const maxSize = 1 * 1024 * 1024 * 2; // 파일의 최대 크기 지정(바이트 단위)

            console.log(e.target); // input
            console.log(e.target.value); // 업로드된 파일 경로
            console.log(e.target.files); // 업로드된 파일의 정보가 담긴 배열

            const file = e.target.files[0]; // 업로드한 파일의 정보가 담긴 객체

            // 파일을 한 번 선택한 후 취소했을 때
            if(file == undefined){
                console.log("파일 선택이 취소됨");
                deleteCheck = -1; // 취소 == 파일 없음 == 초기 상태

                // 취소 시 기존 프로필 이미지로 변경
                profileImage.setAttribute("src", originalImage);

                return;
            }

            if(file.size > maxSize){ // 선택된 파일의 크기가 최대 크기를 초과한 경우
                alert("2MB 이하의 이미지를 선택해 주세요.");
                imageInput.value = "";
                // input type="file" 태그에 대입할 수 있는 value는 ""(빈칸) 뿐이다!
                
                deleteCheck = -1; // 취소 == 파일 없음 == 초기 상태

                // 기존 프로필 이미지로 변경
                profileImage.setAttribute("src", originalImage);
                
                return;
            }

            // JS에서 파일을 읽는 객체
            // - 파일을 읽고 클라이언트 컴퓨터에 파일을 저장할 수 있음
            const reader = new FileReader();

            reader.readAsDataURL(file);
            // 매개변수에 작성된 파일을 읽어서 저장 후
            // 파일을 나타내는 URL을 result 속성으로 얻어올 수 있게 함

            // 다 읽었을 때
            reader.onload = e => {
                // console.log(e.target);
                // console.log(e.target.result); // 읽은 파일의 URL

                const url = e.target.result;

                // 프로필 이미지(img) 태그에 src 속성으로 추가
                profileImage.setAttribute("src", url);

                deleteCheck = 1;
            }
        
        });

        // x 버튼 클릭 시
        deleteImage.addEventListener("click", () =>{

            // 프로필 이미지를 기본 이미지로 변경
            profileImage.setAttribute("src", "/resources/images/user.png");

            imageInput.value = ""; // input type="file"의 value 삭제

            deleteCheck = 0;
            
        });

        // #profileFrm이 제출되었을 때
        document.getElementById("profileFrm").addEventListener("submit", e=>{

            // let initCheck;
            // 초기 프로필 이미지 상태를 저장하는 변수
            // false == 기본 이미지, true == 이전 업로드 이미지

            // let deleteCheck = -1;
            // 프로필 이미지가 새로 업로드되거나 삭제되었음을 나타내는 변수
            // -1 == 초기값, 0 == 프로필 삭제(x버튼), 1 == 새 업로드 이미지

            let flag = true;

            // 프로필 이미지가 없다 -> 있다
            if(!initCheck && deleteCheck == 1) flag = false;

            // 이전 프로필 이미지가 있다 -> 삭제
            if(initCheck && deleteCheck == 0) flag = false;

            // 이전 프로필 이미지가 있다 -> 새 이미지
            if(initCheck && deleteCheck == 1) flag = false;

            if(flag) { // flag == true -> 제출하면 안 되는 경우
                e.preventDefault(); // form 기본 이벤트 제거
                alert('이미지 변경 후 클릭하세요.');
            }
        })
    }
    </script>

</body>
</html>