<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>회원가입</title>
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
	font-family: "Pretendard-Regular", sans-serif; /* 전체 글꼴 변경 */
}

.content {
	width: 1280px;
	margin: 0 auto;
}

.container {
	margin: 0 30px;
}

.container .field {
	margin: 5px 0;
}

.container b {
	display: block;
	margin-bottom: 5px;
}

.container input:not(input[type="radio"]), .container select {
	border: 1px solid #d1d1d1;
	padding: 7px;
	width: 100%;
	margin-bottom: 5px;
}

.container .innner-input input:focus, .container select:focus {
	border: 1px solid #9c9c9c;
	outline: none;
}

.field .tel-number div {
	display: flex;
	flex: 1;
}

.field.tel-number div input:nth-child(1) {
	flex: 1;
}

input:focus {
	outline: none;
}

.field.tel-number div input:nth-child(2) {
	flex: 1;
}

.field {
	display: flex;
	align-items: baseline;
	/* 입력 상자와 텍스트를 같은 기준선에 정렬 */
}

.field .pwd div {
	display: inline;
}

.field input[type="text"], .field input[type="password"], .container select,
	.field input[type="email"], .field input[type="tel"] {
	flex: 1; /* 자동으로 너비를 할당 */
	margin-left: 10px; /* 오른쪽 여백 */
	border-radius: 3px;
}

.field input[type="tel"] {
	
}

.container .field input[type="button"], button {
	margin-left: 3px;
	width: auto;
	border-radius: 3px;
	font-weight: 500;
	font-size: 12px;
	letter-spacing: 2px;
	background-color: #0155b7;
	color: white;
	border: none;
	margin-left: 5px;
	padding: 7px;
	width: auto;
}

.container input[type="submit"] {
	width: auto;
	border-radius: 3px;
	padding: 20 px 15px;
	font-weight: bold;
	font-size: 13px;
	letter-spacing: 2px;
	background-color: #0155b7;
	color: white;
	border: none;
	margin-left: 5px;
}

.inner-input2 .inner-input button {
	margin-left: 3px;
	width: auto;
	border-radius: 3px;
	background-color: #0155b7;
	color: white;
	border: none;
	font-size: 12px;
	padding: 1px 10px;
}

input::placeholder {
	font-size: 12px;
}

.container>h2 {
	font-family: "JalnanGothic";
	font-size: 24px;
	color: #0155b7;
	margin-bottom: 40px;
	font-size: 48px;
	font-weight: 900;
	text-align: center;
}

.signup-container, .petFormTemplate {
	margin: 15px 250px;
	height: auto;
}

.inner-title {
	font-size: 14px;
	font-weight: 700;
	width: 130px;
	display: flex;
}

.inner-input {
	display: flex;
}

.inner-input2 {
	display: grid;
}

.gender {
	padding: 5px 10px;
}

.gender input[type="radio"] {
	display: none;
}

.gender input[type="radio"]+label {
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

.gender input[type="radio"]+label {
	background-color: #fff;
	color: #333;
}

.gender input[type="radio"]:checked+label {
	background-color: #0155b7;
	color: #fff;
}

#warn:hover {
	font-weight: 700;
}

.title {
	font-size: 24px;
	font-weight: 900;
	margin-top: 40px;
}

.centerForm {
	display: flex;
	justify-content: center;
	margin: 10px 0;
}

a:link {
	color: black;
	text-decoration: none;
}

a:hover {
	color: black;
	font-weight: 700;
}

a:visited {
	color: black;
}

hr {
	border-top: 2px solid rgb(221, 224, 224);
	margin-top: 10px; /* 선과 헤더 사이의 여백 조정 */
}

.ValidationMsg {
	font-size: 12px;
	margin-left: 10px;
	color: red;
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function findAddr() {
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일 때
            if(data.userSelectedType === 'R'){
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                document.getElementById("memAddress2").value = extraAddr;
            
            } else {
                document.getElementById("memAddress2").value = '';
            }

            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("memAddress1").value = addr;
            document.getElementById("memAddress1").focus(); // 주소 입력란으로 포커스 이동
        }
    }).open();
}
</script>
<!-- <script>
$(function(){
		$('#doubleId').click(function(e) {
			e.preventDefault();
			$.ajax({
				url:'memberDoubleId',
				type:'post',
				async:true,
				dataType:'text',
				data:{memId:$('#memId').val()},
				success:function(result) {
					if(result=='true') {
						alert("아이디가 중복됩니다");
					} else {
						alert("사용 가능한 아이디입니다");
					}
				},
				error:function(result) {
					
				}
			})
			
		})
});
 
$(function(){
		$('#doubleNick').click(function(e) {
			e.preventDefault();
			$.ajax({
				url:'memberDoubleNick',
				type:'post',
				async:true,
				dataType:'text',
				data:{memNick:$('#memNick').val()},
				success:function(result) {
					if(result=='true') {
						alert("닉네임이 중복됩니다");
					} else {
						alert("사용 가능한 닉네임입니다");
					}
				},
				error:function(result) {
				}
			})
		})
}); 

</script> -->
<script>
$(function() {
	   $("#checkedemail").click(function(e) {
	      e.preventDefault();
		      var email = $('input[name=Email]').val()+'@'+$('#domain').val();
		      $('input[name=memEmail]').val(email);
	      $.ajax({
	         url:'joinauth',
	         type:'post',
	         async:true,
	         data:{memEmail:email},
	         success:function(result) {
	            alert(result);
	         }
	      }) 
	   });
	   //메일체크
	   $("#checkauth").click(function(e) {
	      e.preventDefault();
	      var authcode = $("#authcode").val();
	      $.ajax({
	         url:'checkauth',
	         type:'post',
	         data:{authcode:authcode},
	         success:function(result) {
	            if (result == 'true'){
	            	$('#authcode').val('인증번호가 일치합니다.');
	            	  $('#authcode').prop('readonly', true);
	            	  $('#authcode').css({
	            		    'color': 'green', // 폰트 색상 변경
	            		    'font-size': '12px', // 폰트 크기 변경
	            		    'background-color': 'light-dark'
	            		});
	            } else {
	            	$('#authcode').val('인증번호가 일치하지 않습니다.');
	            	 $('#authcode').css({
	            		    'color': 'red', // 폰트 색상 변경
	            		    'font-size': '12px', // 폰트 크기 변경
	            		});
	            }
	         }
	      })
	   })
	});

$(function() {
    $('#memId').on('input', function() {
        var memId = $(this).val();
        
        // 영어 소문자와 숫자를 포함하는지 검사하는 정규표현식
        var idRegex = /^[a-z0-9]+$/;
        if (!idRegex.test(memId)) {
            $('#idMsg').text("아이디는 영어 소문자와 숫자로만 이루어져야 합니다.");
             $('#idMsg').css('color', 'red');
            return;
        }
        
        // 길이 검사
        if (memId.length < 6 || memId.length > 20) {
            $('#idMsg').text("아이디는 6자에서 20자 사이여야 합니다.");
            $('#idMsg').css('color', 'red');
            return;
        } else{
        
        // 모든 조건을 만족할 경우 유효성 검사 메시지 제거
        $('#idMsg').text("");
    		$('#doubleId').click(function(e) {
    			e.preventDefault();
    			$.ajax({
    				url:'memberDoubleId',
    				type:'post',
    				async:true,
    				dataType:'text',
    				data:{memId:$('#memId').val()},
    				success:function(result) {
    					if(result=='true') {
    			             $('#idMsg').text("아이디가 중복됩니다");
    			             $('#idMsg').css('color', 'red');
    					} else {
    						  $('#idMsg').text("사용가능한 아이디입니다.");
     			             $('#idMsg').css('color', 'green');
    					}
    				},
    				error:function(result) {
    					
    				}
    			})
    			
    		})
        }
    });
});

$(function() {
    $('#memPw').on('input', function() {
        var memPw = $(this).val();
        
        var pwRegex = /^[a-z0-9]+$/;
        if (!pwRegex.test(memPw)) {
            $('#pwMsg').text("영어 소문자와 숫자로만 이루어져야 합니다.");
             $('#pwMsg').css('color', 'red');
            return;
        }
        // 길이 검사
        if (memPw.length < 8 || memPw.length > 20) {
            $('#pwMsg').text("8자 이상 입력해주세요.");
            $('#pwMsg').css('color', 'red');
            return;
        }
        
        // 모든 조건을 만족할 경우 유효성 검사 메시지 제거
        $('#pwMsg').text("");
    });
});

$(function() {
    $('#PwCheck').on('input', function() {
    	var memPw = $('#memPw').val();
        var PwCheck = $(this).val();
        
        if (memPw !== PwCheck) {
            $('#pwCMsg').text("비밀번호가 일치하지 않습니다.");
            $('#pwCMsg').css('color', 'red');
 
        } else {
            $('#pwCMsg').text("비밀번호가 일치합니다.");
            $('#pwCMsg').css('color', 'green');
        }
    });
});
$(function() {
    $('#memNick').on('input', function() {
        var memNick = $(this).val(); 
        // 한글 자음만으로 구성되거나 특수문자와 띄어쓰기를 포함하는지 검사
        var nickRegex = /^[ㄱ-ㅎ]*$|[\s~`!@#$%^&*()\-_=+\\|[\]{};:'",.<>/?]+/;
        if (nickRegex.test(memNick)) {
            $('#nickMsg').text("옳지 않은 닉네임입니다.");
            $('#nickMsg').css('color', 'red');
            if($('#memNick').val() == ""){
                $('#nickMsg').text("");
            }
            if (memNick.length < 2|| memNick.length > 20) {
                $('#nickMsg').text("2자 이상 입력해주세요.");
                $('#nickMsg').css('color', 'red');
                return;
            }
            // 닉네임 중복 체크 메시지 초기화
            $('#doubleNickMsg').text("");
        } else {
            // 모든 조건을 만족할 경우 유효성 검사 메시지 제거
            $('#nickMsg').text("");
            // 닉네임 중복 체크 ajax 호출
            $('#doubleNick').click(function(e) {
			e.preventDefault();
            $.ajax({
                url:'memberDoubleNick',
                type:'post',
                async:true,
                dataType:'text',
                data:{memNick:$('#memNick').val()},
                success:function(result) {
                    if(result=='true') {
                        $('#nickMsg').text("닉네임이 중복됩니다");
                        $('#nickMsg').css('color', 'red');
                    } else {
                        $('#nickMsg').text("사용 가능한 닉네임입니다");
			             $('#nickMsg').css('color', 'green');
                    }
                },
                error:function(result) {
                    $('#nickMsg').text("");
                }
            });
            });
        }
    });
});
$(function() {
    $('#submit').click(function(e) {
        // 이용약관 동의 체크 여부 확인
        if (!$('#agreeCheckbox').is(':checked')) {
            e.preventDefault();
            alert("이용약관에 동의해주세요.");
        }
        var memId = $('#memId').val();
        var memPw = $('#memPw').val();
        var PwCheck = $('#PwCheck').val();
        var memNick = $('#memNick').val();
        var memEmail = $('#memEmail').val();
        var memPhone = $('#memPhone').val();
        var postcode = $('#postcode').val();
        var memAddress1 = $('#memAddress1').val();
        var memAddress2 = $('#memAddress2').val();
        
        if (memId === "" || memPw === "" || PwCheck === "" || memNick === "" || memEmail === "" || memPhone === "" || postcode === "" || memAddress1 === "" || memAddress2 === "") {
            e.preventDefault();
            alert("모든 항목을 입력해주세요.");
        }
        if ($('#idMsg').text() === "") {
            e.preventDefault();
            alert("아이디 중복 조회를 해주세요.");
        }
        if ($('#nickMsg').text() === "") {
            e.preventDefault();
            alert("닉네임 중복조회를 해주세요.");
        }
    });
});
</script>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="content">
		<div class="container">
			<h2>SIGN UP</h2>

			<!-- 개인정보 입력 폼 -->
			<form action="signup" method="post">
				<div class="title">
					개인정보 입력 <span style="font-size: 14px; color: red">(필수)</span>
				</div>
				<hr />
				<div class="signup-container">
					<!-- 아이디 -->
					<div class="field">
						<div class="inner-title">아이디</div>
						<div style="display: grid">
							<div class="inner-input">
								<input type="text" name="memId" id="memId"
									placeholder="아이디 입력(4~25자)" /> <input type="button"
									id="doubleId" name="doubleId" value="중복조회" />
							</div>
							<div class="ValidationMsg" id="idMsg"></div>
						</div>
					</div>

					<!-- 비밀번호 -->
					<div class="field">
						<div class="inner-title">비밀번호</div>
						<div class="inner-input2">
							<div style="width: 230px">
								<input id="memPw" type="password" name="memPw" />
							</div>
							<div class="ValidationMsg" id="pwMsg"></div>
						</div>
					</div>
					<!-- 비밀번호 확인 -->
					<div class="field">
						<div class="inner-title">비밀번호 확인</div>
						<div class="inner-input2">
							<div style="width: 230px">
								<input id="PwCheck" type="password" name="passwordcheck" />
							</div>
							<div class="ValidationMsg" id="pwCMsg"></div>
						</div>
					</div>
					<!-- 닉네임 -->
					<div class="field">
						<div class="inner-title">닉네임</div>
						<div class="inner-input">
							<input type="text" name="memNick" id="memNick"
								placeholder="2~11자 입력" /> <input type="button" id="doubleNick"
								name="doubleNick" value="중복조회" />
						</div>
						<div class="ValidationMsg" id="nickMsg"></div>
					</div>

					<!-- 이메일 -->
					<div class="field">
						<div class="inner-title">이메일</div>
						<div class="inner-input2" style="flex: 1">
							<div class="inner-input">
								<input type="text" name="Email" id="Email" /> <span>&nbsp;
									@ </span> <input class="box" id="domain" type="text" /> <select
									class="box" id="domain-list">
									<option value="type">직접 입력</option>
									<option value="naver.com">naver.com</option>
									<option value="google.com">google.com</option>
									<option value="hanmail.net">hanmail.net</option>
									<option value="nate.com">nate.com</option>
									<option value="kakao.com">kakao.com</option>
								</select> <input type="button" value="인증번호 받기" id="checkedemail"
									name="checkedemail" />
							</div>
							<div class="inner-input">
								<div style="display: flex">
									<input class="diy-width" id="authcode" type="email"
										placeholder="인증번호를 입력하세요" /> <input type="button" value="확인"
										id="checkauth" name="checkauth" />
								</div>
							</div>
						</div>
						    <input type="hidden" id="memEmail" name="memEmail" value="">
					</div>
					<script>
          // 도메인 직접 입력 or domain option 선택
          const domainListEl = document.querySelector("#domain-list");
          const domainInputEl = document.querySelector("#domain");
          // select 옵션 변경 시
          domainListEl.addEventListener("change", (event) => {
            // option에 있는 도메인 선택 시
            if (event.target.value !== "type") {
              // 선택한 도메인을 input에 입력하고 disabled
              domainInputEl.value = event.target.value;
              domainInputEl.disabled = true;
            } else {
              // 직접 입력 시
              // input 내용 초기화 & 입력 가능하도록 변경
              domainInputEl.value = "";
              domainInputEl.disabled = false;
            }
          });
        </script>
					<!-- 휴대전화 -->
					<div class="field tel-number">
						<div class="inner-title">휴대전화</div>
						<div class="inner-input" style="flex: 1">
							<input type="tel" id="memPhone" name="memPhone"
								placeholder="'-'를 제외하고 입력해주세요." />
						</div>
					</div>
					<!-- 주소 -->
					<div class="field">
						<div class="inner-title">주소</div>
						<div class="inner-input2">
							<div class="inner-input">
								<input type="text" id="postcode" placeholder="우편번호" readonly />
								<input type="button" onclick="findAddr()" value="주소 검색" />
							</div>
							<div class="inner-input">
								<input type="text" id="memAddress1" name="memAddress1"
									placeholder="주소" /> <input type="text" id="memAddress2"
									name="memAddress2" placeholder="상세주소" />
							</div>
						</div>
					</div>
				</div>
				<hr
					style="border-top: 1px solid rgb(214, 214, 214); margin-top: 10px;" />
				<div class="centerForm">
					<span> <a href="#" style="font-size: 12px">개인정보 수집/이용동의</a>
					</span> &nbsp; <span id="informationConsent"> <a href="#"
						style="font-size: 12px"> 개인정보 처리방침</a> <!-- 세부내용 중략 -->
					</span> <br />
				</div>
				<div class="centerForm">
					<span class="agree-check" style="display: flex; font-size: 12px">
						이용약관 개인정보 수집 및 이용, 마케팅 활용 선택에 모두 동의합니다. <input type="checkbox"
						id="agreeCheckbox" style="width: 30px" />
					</span>
				</div>
				<!-- 6. 가입하기 버튼 -->
				<div style="display: flex;">
					<input type="submit" name="submit" id="submit"
						style="padding: 15px 0; width: 600px; margin: 0 auto;"
						value="회원가입" />
				</div>
			</form>
		</div>
	</div>
</body>
</html>
