<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="" />
<meta name="author" content="" />

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous" />
<title>멍뭉별 | 비밀번호 찾기</title>
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
	height: 100%;
}

.content {
	display: flex;
	justify-content: center;
	align-items: center;
	height: calc(100vh - 95px); /* 화면 전체 높이에 대한 100% */
}

#btn-Yes {
	background-color: #0155b7;
	border: none;
	margin-top: 10px;
}

.form-signin .form-control {
	/* position: relative;
	height: auto;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box; */
	font-size: 16px;
}

.form-control {
	flex: 1;
	margin-left: 10px;
	height: 40px;
}

.form-control2 {
	display: block;
	width: 100%;
	padding: .375rem .75rem;
	font-size: 1rem;
	line-height: 1.5;
	color: #495057;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid #ced4da;
	transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
	border-radius: 3px 0 0 3px;
	flex: 1;
	margin-left: 10px;
	height: 40px;
}

.lname {
	width: 70px;
	margin-top: 10px;
}

.card-body {
	width: 400px;
	padding: 30px;
	margin-top: 10px;
}

button, input {
	overflow: visible;
}

.links {
	text-align: center;
	margin-top: 10px;
}

a {
	color: #0155b7;
	text-decoration: none;
}

.text2 {
	color: #0155b7;
}

a:link {
	color: rgb(117, 117, 117);
	text-decoration: none;
}

a:hover {
	color: black;
	font-weight: 700;
}

.findP {
	display: flex;
	margin-bottom: 15px;
}

.check {
	margin-top: 20px;
	font-size: 16px;
	font-family: "JalnanGothic";
	text-align: center;
}

placeholder {
	font-size: 10px;
}

.findP input[type="button"] {
	border-radius: 0 3px 3px 0;
	font-weight: 500;
	font-size: 13px;
	background-color: #0155b7;
	color: white;
	border: none;
	height: 40px;
	padding: 0 5px;
}

.form-control:focus {
	color: #495057;
	background-color: #fff;
	outline: 0;
	box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, .25);
}
</style>
<script>
	$(document).on('focus', '[readonly]', function(e) {
		$(this).blur();
	});
	$(function() {
		// 이메일 인증 버튼 비활성화
		$("#checkedemail").prop("disabled", true);
		$("#checkauth").prop("disabled", true);
		$('#authcode').prop('readonly', true);
		// memId 입력란 이벤트
		$("#memId").on("input", function() {
			checkMemberInfo(); // 회원 정보 확인 함수 호출
		});

		// memEmail 입력란 이벤트
		$("#memEmail").on("input", function() {
			checkMemberInfo(); // 회원 정보 확인 함수 호출
		});

		// 회원 정보 확인 함수
		function checkMemberInfo() {
			var memId = $("#memId").val();
			var memEmail = $("#memEmail").val();

			// 입력값이 빈 문자열인 경우 확인하지 않음
			if (memId === "" || memEmail === "") {
				$("#check").text(""); // 메시지 초기화
				return; // 함수 종료
			}

			$.ajax({
				url : 'findpw', // 아이디 찾기 처리를 하는 서블릿 주소
				type : 'post',
				async : true,
				data : {
					memId : memId,
					memEmail : memEmail
				},
				success : function(result) {
					if (result == "") {
						// DB에서 일치하는 아이디를 찾지 못한 경우
						$("#check").text("일치하는 항목이 없습니다.");
						$("#check").css("color", "red");
						$("#checkedemail").prop("disabled", true); // 이메일 인증 버튼 비활성화
						$("#checkauth").prop("disabled", true); // 이메일 인증 버튼 비활성화
					} else {
						// DB에서 일치하는 아이디를 찾은 경우
						$("#check").text("회원정보가 일치합니다.");
						$("#check").css("color", "green");
						$("#checkedemail").prop("disabled", false); // 이메일 인증 버튼 활성화
					}
				},
				error : function() {
					alert("아이디를 찾는 중에 오류가 발생했습니다.");
				}
			});
		}
		$(function() {
			$("#checkedemail").click(function(e) {
				e.preventDefault();
				var email = $('input[name=memEmail]').val();
				$.ajax({
					url : 'joinauth',
					type : 'post',
					async : true,
					data : {
						memEmail : email
					},
					success : function(result) {
						alert(result);
						$("#checkauth").prop("disabled", false);
						$('#authcode').val('');
						$('#authcode').prop('readonly', false);
						$("#check").text("인증을 진행해주세요.");
					}
				});
			});
			//메일체크
			$("#checkauth").click(function(e) {
				e.preventDefault();
				var authcode = $("#authcode").val();
				$.ajax({
					url : 'checkauth',
					type : 'post',
					data : {
						authcode : authcode
					},
					success : function(result) {
						if (result == 'true') {
							$('#authcode').val('인증번호가 일치합니다.');
							$('#authcode').prop('readonly', true);
							$('#authcode').css({
								'color' : 'green', // 폰트 색상 변경
								'font-size' : '12px', // 폰트 크기 변경
								'background-color' : 'light-dark'
							});
							$("#check").text("비밀번호 재설정이 가능합니다.");
						} else {
							$('#authcode').val('인증번호가 일치하지 않습니다.');
							$('#authcode').css({
								'color' : 'red', // 폰트 색상 변경
								'font-size' : '12px', // 폰트 크기 변경
							});
						}
					}
				})
			});
		});
		// 제출 버튼 클릭 시 이벤트
		$("#btn-Yes").click(function(e) {
			e.preventDefault();
			if ($("#check").text() === "비밀번호 재설정이 가능합니다.") {
				var memId = $("#memId").val();
				var encodedMemId = encodeURIComponent(memId); // memId 값을 인코딩

				// 인코딩된 memId 값을 포함하여 URL로 이동
				window.location.href = '${path}/repw?memId=' + encodedMemId;
			} else {
				if ($("#memId").val() === "") {
					alert("아이디를 입력해주세요.")
				} else if ($("#memEmail").val() === "") {
					alert("이메일을 입력해주세요.")
				} else if ($("#authcode").val() === "") {
					alert("이메일인증을 진행해주세요.")
				}
			}
		});
	});
</script>
</head>

<body>
	<%@ include file="header.jsp"%>
	<div class="content">
		<div class="card" style="width: 25rem;">
			<div class="card-body">
				<form action="findpw" class="form-signin" method="POST">
					<p class="text2"
						style="font-family: 'JalnanGothic'; font-size: 24px">비밀번호 찾기</p>

					<div class="findP">
						<label class="lname">아이디</label> <input type="text" id="memId"
							name="memId" class="form-control" placeholder="아이디를 입력해주세요."
							required autofocus />
					</div>
					<div class="findP">
						<label class="lname">이메일</label> <input type="text" id="memEmail"
							name="memEmail" class="form-control" placeholder="이메일을 입력해주세요."
							style="border-radius: 3px 0 0 3px;" required /> <input
							type="button" value="인증번호 받기" id="checkedemail"
							name="checkedemail" />
					</div>
					<div class="findP">
						<div style="display: flex; margin-left: 70px;">
							<input class="form-control" id="authcode" type="email"
								placeholder="인증번호를 입력하세요"
								style="width: 157px; border-radius: 3px 0 0 3px;" /> <input
								type="button" value="확인" id="checkauth" name="checkauth" />
						</div>
					</div>
					<div class="check" id="check"></div>
					<button id="btn-Yes" class="btn btn-lg btn-primary btn-block"
						type="submit" style="font-weight: 900">비 밀 번 호 재 설 정</button>

				</form>
				<div class="links">
					<a href="${path}/findid">아이디 찾기</a> | <a href="${path}/login">로그인</a>
					| <a href="${path}/signup">회원가입</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

