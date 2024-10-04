<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha384-cE1olQMy99vjP0MSZ74F1a8ZClJj4jZG++H5B+zb8BbcX4eXXgGxIScDnTlBkoRU" crossorigin="anonymous">
<style type="text/css">
 	body,html {
        margin: 0;
        padding: 0;
        font-family: "Pretendard-Regular", sans-serif; /* 전체 글꼴 변경 */
      }
 	#manageCategory{
 		width :1000px;
 		margin : 0 16.6%;	
  	}
      .listContainer{
 		width :1000px;
 		margin : 0 16.6%;
 		border-bottom: 2px solid #ddd;
  	}
      .board {
    	width: 1000px;
    	border-collapse: collapse;
    	margin-top: 30px;
  	}
	.board th, .board td {
   		padding: 10px;
    	text-align: center;
    	color: black;
  	}
  	.board th {
    	background-color: #ffffff;
    	border-top: 4px solid #ddd;
    	border-bottom: 2px solid #ddd;
    	font-weight: bold;
    	cursor: pointer; /* 정렬을 위한 커서 속성 추가 */
  	} 
  	.board th:first-child {
  		padding-left: 20px; /* 마지막 열의 우측 여백을 20px로 설정 */
    	padding-right: 8px; /* 마지막 열의 우측 여백을 20px로 설정 */
}
  	.board td:last-child, .board th:last-child {
  		padding-left: 0px; /* 마지막 열의 우측 여백을 20px로 설정 */
}
  	.arrayBtn{
  		border: 0;
  		background-color: transparent;
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
  	a:link{
  	text-decoration: none;
    	color: #2F65DD;
  	}
	select{
		display: flex;
		width: 19px;
	}	
</style>
</head>
<body>
<jsp:include page='<c:url value="/main/header.jsp"/>'/>

	<br>
	<div id = "manageCategory">
		<h2 style="margin-bottom: 5px;">회원관리</h2>
		</div>
<div class="listContainer">

<table class="board">
  <thead>
     <tr>
      <th><input type="checkbox" id="selectAllCheckbox"></th>
      <th data-column="1">아이디&nbsp;<span class="sort-icon">▼</span></th>
      <th data-column="2">닉네임&nbsp;<span class="sort-icon">▼</span></th>
      <th data-column="3">휴대폰&nbsp;<span class="sort-icon">▼</span></th>
      <th data-column="4">주소&nbsp;<span class="sort-icon">▼</span></th>
      <th data-column="5">보유반려견&nbsp;<span class="sort-icon">▼</span></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><input type="checkbox" name="postId" value="post1"></td>
      <td>abc123</td>
      <td>보리발닦개</td>
      <td>010-2345-6789</td>
      <td>서울시 금천구</td>
      <td>2</td>
    </tr>
    <tr>
   	  <td><input type="checkbox" name="postId" value="post1"></td>
      <td>fdbfe21</td>
      <td>사랑</td>
      <td>010-2345-6789</td>
      <td>서울시 금천구</td>
      <td>1</td>
    </tr>
    <tr>
	  <td><input type="checkbox" name="postId" value="post1"></td>
      <td>tjadk2</td>
      <td>율무</td>
      <td>010-2345-6789</td>
      <td>서울시 금천구</td>
      <td>1</td>
    </tr>
    <tr>
      <td><input type="checkbox" name="postId" value="post1"></td>
      <td>dw2</td>
      <td>똥꼬</td>
      <td>010-2345-6789</td>
      <td>서울시 금천구</td>
      <td>1</td>
    </tr>
    <tr>
      <td><input type="checkbox" name="postId" value="post1"></td>
      <td>dwgb2</td>
      <td>언니왔음</td>
      <td>010-2345-6789</td>
      <td>서울시 금천구</td>
      <td>1</td>
    </tr>
    <tr>
      <td><input type="checkbox" name="postId" value="post1"></td>
      <td>bner3</td>
      <td>내새끼최고</td>
      <td>010-2345-6789</td>
      <td>서울시 금천구</td>
      <td>1</td>
    </tr>
     <tr>
      <td><input type="checkbox" name="postId" value="post1"></td>
      <td>e2nbt4</td>
      <td>드르륵카칵</td>
      <td>010-2345-6789</td>
      <td>서울시 금천구</td>
      <td>1</td>
    </tr>
    <tr>
      <td><input type="checkbox" name="postId" value="post1"></td>
      <td>nrtgt6</td>
      <td>우리뭉치</td>
      <td>010-2345-6789</td>
      <td>서울시 금천구</td>
      <td>1</td>
    </tr>
    <tr>
      <td><input type="checkbox" name="postId" value="post1"></td>
      <td>fndfnz2</td>
      <td>먼지언니</td>
      <td>010-1111-2222</td>

      <td>서울시 금천구</td>
      <td>1</td>
    </tr>
    <tr>
      <td><input type="checkbox" name="postId" value="post1"></td>
      <td>fehfn2</td>
      <td>초코는초코맛</td>
      <td>010-2345-6789</td>
      <td>서울시 금천구</td>
      <td>1</td>
    </tr>
    <tr>
      <td><input type="checkbox" name="postId" value="post1"></td>
      <td>kujytg8</td>
      <td>눕고싶다</td>
      <td>010-2345-6789</td>
      <td>서울시 금천구</td>
      <td>1</td>
    </tr>
    <tr>
      <td><input type="checkbox" name="postId" value="post1"></td>
      <td>1dsadb2</td>
      <td>자고싶어</td>
      <td>010-2345-6789</td>
      <td>서울시 금천구</td>
      <td>1</td>
    </tr>
  </tbody>
</table>
</div>

 <!-- 페이지네이션 -->
	<div class="pagination">
  		<a href="#">&laquo;</a>
  		<a href="#">1</a>
  		<a href="#">2</a>
  		<a href="#">3</a>
  		<a href="#">4</a>
  		<a href="#">5</a>
  		<a href="#">6</a>
  		<a href="#">7</a>
  		<a href="#">8</a>
  		<a href="#">9</a>
  		<a href="#">10</a>
  		<a href="#">&raquo;</a>
	</div>


<div class="footer"></div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/js/all.min.js" integrity="sha384-fzVtHQkaAeG+AyCWf0XZ/dwXnJKVlFWL5J2x4ghjHxAgC9V1HPvmNI3b8Dj5VuwN" crossorigin="anonymous"></script>
	<script>
		document.getElementById('selectAllCheckbox').addEventListener('change', function() {
			var checkboxes = document.querySelectorAll('tbody input[type="checkbox"]');
			checkboxes.forEach(function(checkbox) {
				checkbox.checked = this.checked;
			});
		});

		document.getElementById('selectAllCheckbox').addEventListener('change', function() {
			var checkboxes = document.querySelectorAll('.board tbody input[type="checkbox"]');
			checkboxes.forEach(function(checkbox) {
				checkbox.checked = this.checked;
			});
		});

var sortDirection = 1; // 초기 정렬 방향 (1: 오름차순, -1: 내림차순)
document.querySelectorAll('.board th').forEach(function(header, index) {
    if(index > 0) {
        header.addEventListener('click', function() {
            var column = this.getAttribute('data-column');
            sortTable(column);
            updateSortIcons(this, column);
        });
    }
});

function updateSortIcons(header, column) {
    var icon = header.querySelector('.sort-icon');
    icon.textContent = sortDirection === 1 ? '▼' : '▲';
}

function sortTable(columnIndex) {
    var table, rows, switching, i, x, y, shouldSwitch;
    table = document.querySelector(".board");
    switching = true;

    // 현재 정렬 방향에 따라 아이콘 변경
    var iconIndex = sortDirection === 1 ? 0 : 1;
    var ths = table.querySelectorAll("th");
    ths.forEach(function(th, index) {
        th.innerHTML = th.innerText.replace('▲', '').replace('▼', '') + (sortDirection === 1 ? '▼' : '▲');
    });

    while (switching) {
        switching = false;
        rows = table.rows;

        for (i = 1; i < (rows.length - 1); i++) {
            shouldSwitch = false;
            x = rows[i].getElementsByTagName("td")[columnIndex];
            y = rows[i + 1].getElementsByTagName("td")[columnIndex];

            if (sortDirection == 1) {
                if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                    shouldSwitch = true;
                    break;
                }
            } else if (sortDirection == -1) {
                if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
                    shouldSwitch = true;
                    break;
                }
            }
        }

        if (shouldSwitch) {
            rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
            switching = true;
        }
    }
    // 정렬 방향 변경
    sortDirection *= -1;
}
</script>
</body>
</html>
