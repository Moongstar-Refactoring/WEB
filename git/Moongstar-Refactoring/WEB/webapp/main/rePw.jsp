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
<meta name="description" content="" />
<meta name="author" content="" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous" />
<title>멍뭉별 | 비밀번호 재설정</title>
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
</style>
<script>
function regist() {
        var memId = '<%=request.getAttribute("memId")%>';
        var memPw = $('#memPw').val();

        // Ajax를 사용하여 서블릿으로 데이터 전송
        $.ajax({
            type: 'POST',
            url: 'repw', // 해당 서블릿의 URL
            data: {
                memId: memId,
                memPw: memPw
            },
            success: function(response) {
                // 서블릿 처리 후의 응답에 따른 작업 수행
                if (response === 'success') {
                    alert('비밀번호가 성공적으로 변경되었습니다.')
					document.location.href='login';
                    // 성공 시 리다이렉트 등의 작업 수행
                } else {
                    alert('비밀번호 변경에 실패하였습니다.');
                    // 실패 시 적절한 에러 처리
                }
            },
            error: function() {
                alert('서버와의 통신 중 오류가 발생했습니다.');
            }
        });
    }
    $(function() {
        $('#memPw').on('input', function() {
            var memPw = $(this).val();
            
            var pwRegex = /^[a-z0-9]+$/;
            if (!pwRegex.test(memPw)) {
                $('#check').text("영어 소문자와 숫자로만 이루어져야 합니다.");
                 $('#check').css('color', 'red');
                return;
            }
            // 길이 검사
            if (memPw.length < 8 || memPw.length > 20) {
                $('#check').text("8자 이상 입력해주세요.");
                $('#check').css('color', 'red');
                return;
            } 
            // 모든 조건을 만족할 경우 유효성 검사 메시지 제거
            $('#check').text("");
        });
    });

    $(function() {
        $('#pwCheck').on('input', function() {
        	var memPw = $('#memPw').val();
            var pwCheck = $(this).val();
            
            if (memPw !== pwCheck) {
                $('#check').text("비밀번호가 일치하지 않습니다.");
                $('#check').css('color', 'red');
            } else {
                $('#check').text("비밀번호가 일치합니다.");
                $('#check').css('color', 'green');
            }
        });
    });
    function regist() {
        var memPw = $('#memPw').val();
        var pwCheck = $('#pwCheck').val();
        
        // 유효성 검사
        var pwRegex = /^[a-z0-9]+$/;
        if (!pwRegex.test(memPw)) {
            alert("비밀번호는 영어 소문자와 숫자로만 이루어져야 합니다.");
            return;
        }
        if (memPw.length < 8 || memPw.length > 20) {
            alert("비밀번호는 8자 이상 20자 이하로 입력해주세요.");
            return;
        }
        if (memPw !== pwCheck) {
            alert("비밀번호가 일치하지 않습니다.");
            return;
        }
        
        // Ajax를 사용하여 서블릿으로 데이터 전송
        $.ajax({
            type: 'POST',
            url: 'repw', // 해당 서블릿의 URL
            data: {
                memId: '<%=request.getAttribute("memId")%>',
                memPw: memPw
            },
            success: function(response) {
                // 서블릿 처리 후의 응답에 따른 작업 수행
                if (response === 'success') {
                    alert('비밀번호가 성공적으로 변경되었습니다.')
                    document.location.href = 'login';
                    // 성공 시 리다이렉트 등의 작업 수행
                } else {
                    alert('비밀번호 변경에 실패하였습니다.');
                    // 실패 시 적절한 에러 처리
                }
            },
            error: function() {
                alert('서버와의 통신 중 오류가 발생했습니다.');
            }
        });
    }
</script>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="content">
		<div class="card" style="width: 25rem">
			<div class="card-body">
				<form action="repw" class="form-signin" method="POST">
					<p class="text2"
						style="font-family: 'JalnanGothic'; font-size: 24px">
						비밀번호 재설정 -
						<%=request.getAttribute("memId")%>님
					</p>

					<input type="hidden" name="memId"
						value="<%=request.getAttribute("memId")%>" /> <input
						type="password" name="memPw" id="memPw" class="form-control"
						placeholder="비밀번호" required /><br /> <input type="password"
						name="pwCheck" id="pwCheck" class="form-control"
						placeholder="비밀번호 재확인" required />
					<p class="check" id="check"></p>
					<button type="button" id="btn-Yes" onclick="regist()"
						class="btn btn-lg btn-primary btn-block">비밀번호 재설정</button>
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
