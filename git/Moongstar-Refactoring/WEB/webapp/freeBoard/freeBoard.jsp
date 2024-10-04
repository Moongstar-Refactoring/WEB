<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
/* @font-face {
	font-family: "JalnanGothic";
	src:
		url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_231029@1.1/JalnanGothic.woff")
		format("woff");
	font-weight: normal;
	font-style: normal;
} */

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

.pageContainer {
	width: 100%;
}

.freeContainer {
	width: 1280px;
	margin: 0 auto;
}

#freeCategory {
	width: 1280px;
	margin: 10px 0;
	font-size: 22px;
/* 	font-family: "JalnanGothic"; */
}

.listContainer {
	width: 1280px;
	margin: 0 auto;
	border-bottom: 2px solid #ddd;
}

.searchContainer {
	float: right;
	display: inline-block;
	align-items: center;
	margin-bottom: 30px;
}

.searchBox input[type="text"] {
	background-color: #F5F5F5;
	width: 330px;
	height: 30px;
	padding: 3px;
	padding-left:13px;
	box-shadow: inset 1px 3px 2px rgba(0, 0, 0, 0.1);
	border: none;
	border-top-left-radius: 12px;
	border-bottom-left-radius: 12px;
}

.searchBox input[type="text"]:focus {
	outline: none;
}

#searchBtn {
	background-color: #2F65DD;
	float: right;
	color: #ffffff;
	width: 76px;
	height: 36px;
	padding: 3px;
	border-width: 0;
	border-top-right-radius: 12px;
	border-bottom-right-radius: 12px;
	box-shadow: inset 1px 3px 2px rgba(0, 0, 0, 0.1);
	font-weight: 700;
	font-size: 14px;
}

.board {
	width: 1280px;
	margin: 0 auto;
	border-collapse: collapse;
	margin-top: 30px;
}

.board th, .board td {
	position: relative;
	padding: 10px;
	text-align: center;
	color: black;
}

.board th {
	background-color: #ffffff;
	border-bottom: 2px solid #ddd;
	font-weight: bold;
}

.like-icon {
	position: absolute;
	left: 70%;
	transform: translateX(-50%);
	top: 50%;
	transform: translateY(-50%);
	width: 20px;
	height: 20px;
	background-image: url('../image/하트(핑).png'); /* 좋아요 아이콘 이미지 경로 */
	background-size: cover;
	margin-left: 5px;
}

.footer {
	height: 200px;
}
</style>
<style>
.pagination {
	margin-top: 20px;
	text-align: center;
}

.pagination a {
	display: inline-block;
	padding: 5px 10px;
	border: 1px solid #ccc;
	color: black;
	text-decoration: none;
}

.pagination a:hover {
	background-color: #f2f2f2;
}

a:link {
	text-decoration: none;
	color: #2F65DD;
}

select {
	display: flex;
	width: 19px;
}

.yellowBtn {
	font-weight: bold;
	margin-left: 8px;
	background-color: #FED74B;
	width: 65px;
	padding: 5px;
	border-radius: 17px;
	border: 0;
	box-shadow: 1px 4px 0px rgba(0, 0, 0, 0.1);
}
</style>
<script src="https://code.jquery.com/jquery-Latest.min.js"></script>
</head>
<body>

	<jsp:include page="/main/header.jsp" />
	<br>
	<div class="pageContainer">
		<div class="freeContainer">
			<div id="freeCategory">
				<h2 style="margin-bottom: 5px; 	font-family: JalnanGothic; font-weight: lighter;">자유게시판</h2>

				<div class="searchContainer">
					<form action="" method="get" style="display: inline-block;">
						<span class="searchBox"> <input type="text"
							name="searchText" placeholder="  검색..." value="" />
							<button id="searchBtn" type="submit">검색</button>
						</span>
					</form>
				</div>

			</div>
		</div>
		<div class="listContainer">
			<table class="board">
				<tr>
					<th>태그
						<div style="display: inline-block;">
							<select class="category" id="category" name="category" size="1">
								<option value="">#전체보기</option>
								<option value="#일상">#일상</option>
								<option value="#전국갱얼쥐자랑">#전국갱얼쥐자랑</option>
								<option value="#정보/공유">#정보/공유</option>
								<option value="#질문">#질문</option>
							</select>
						</div>
					</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
					<th>좋아요</th>
					<c:forEach items="${freeBoard }" var="board">
						<tr>
							<td><a href="freeboard?freeTag=${board.freeTag }">${board.freeTag }</a></td>
							<td><a href="boarddetail?freeNum=${board.freeNum }">${board.freeSub }</a></td>
							<td>${board.freeNick }</td>
							<td>${board.freeWriteDate }</td>
							<td>${board.freeView }</td>
							<td>${board.freeLike}<span class="like-icon"></span></td>
						</tr>
					</c:forEach>
				</tr>
			</table>
		</div>
		<br>
		<!-- 페이지네이션 -->
		<div class="pagination">
			<a>&lt;</a>
			<c:forEach begin="${pageInfo.startPage }" end="${pageInfo.endPage }"
				var="i">
				<c:choose>
					<c:when test="test=${i==psgeInfo.curPage }">
						<a href="freeboard?page=${i }" class="select">${i }</a>
					</c:when>
					<c:otherwise>
						<a href="freeboard?page=${i }" class="select">${i }</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<a>&gt;</a> <a href="freeWriteForm" class="yellowBtn"
				id="writeButton" style="border: 0;">글쓰기</a>
		</div>

	</div>
	<script>
		$(function() {
			$('#category').val('${freeTag}');
			$('#category')
					.change(
							function() {
								var freeTag = $(this).val()
								freeTag = encodeURIComponent(freeTag);
								document.location.href = "http://localhost:8080/MoongStar/freeBoard/freeboard?freeTag="
										+ freeTag;
							})
		})
	</script>

	<div class="footer"></div>
</body>
</html>