<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="dto.Walking" %>
<% Walking walking = (Walking)request.getAttribute("walking"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>${walking.walkName } 수정</title>
<script src="https://code.jquery.com/jquery-Latest.min.js"></script>
<style>
body,html{
margin:0 auto;
padding:0;
}

.container1{
margin: 0 auto;
width:1280px;}
#map{
width:570px;height:600px;
margin-top:85px;
margin-left:30px;
float:left;
border-top-right-radius:3%;
border-bottom-right-radius:3%;
box-shadow: 0px 3px 4px lightgray;
}

a {
display:inline-block;
margin-left: 5px;
margin-top:3px;
	text-align: center;
	font-weight: bold;
	text-decoration: none;
	color: black;
	text-align: center;
}
#leftDiv{
position:relative;
width:580px;
float:left;
margin-left:40px;
top:60px;
}

#walkList, #walkWriteForm, #walkingDelete{
width:70px;
height:20px;
border: 0;
border-radius: 30px;
background-color:#FED74B;
color:white;
text-align:center;
box-shadow: 0 3px 1px gray;
}
.walkBtn{
position:relative;
top:10px;
left: 180px;
float: left;
width:1280px;
height:40px;
}
#walkMapBar{
position:absolute;
float:left;
width:30px;
margin-top:85px;
height:600px;
background-color:#3477c5;
border-top-left-radius:30px;
border-bottom-left-radius:30px;
}
.container {
	position: relative;
	margin-top:60px;
	width: 400px;
	float: right;
}
.backWalkDetail {
	width: 650px;
	height: 650px;
	background-color: #F5F5F5;
	border-radius: 10%;
}

.frontWalkDetail {
	position: relative;
	top: 40px;
	width: 600px;
	height: 560px;
	background-color: #F5F5F5;
	margin: 0 auto;
	border-radius: 10%;
	border-right: 3px solid #D9D9D9;
}

.walkDetail {
	position: relative;
	top: 15px;
	width: 550px;
	height: 530px;
	background-color: white;
	border-radius: 5%;
	margin: 0 auto;
}

#walkContent {
	width: 510px;
	height: 200px;
	margin: 0 auto;
}


#walkTopEmpty {
	height: 60px;
	margin: 0;
}

#walkMidEmpty, #walkBottomEmpty {
	height: 30px;
	margin: 0;
}
#walkEndEmpty{
height:30px;
}
h3 {
	margin-left: 25px;
}


#walkSub {
	margin: 0;
	float: left;
}

.walkSubject input {
	border-width: 0;
	font-size: 25px;
	font-weight: bold;
	color: #5B5B5B;
	margin: 0;
}

.walkType {
	height: 30px;
	float: left;
	color: #545454;
	width: 500px;
	border-bottom: 2px solid #C5C5C5;
}

.walkType input{
width:500px;
text-align:center;
border-radius:10px;
border-width:0;
background-color: #FED74B;
font-size:20px;
font-weight:bold;
box-shadow: 0 2px 1px gray;
}

.walkSubject {
	width: 500px;
	height: 35px;
	float: left;
	border-bottom: 3px solid #A9A9A9;
}

.walkAddress {
	width: 20px;
}
.walkAddress input{
border-width:0;
	font-size: 20px;
	color: #C5C5C5;
}

#detailAddress{
width: 500px;
}

#walkAddress3 input{
width:500px;

position:relative;
text-align:center;
}
#walkAddress3{
margin-top:5px;
width:470px;
}
#exitBtn {
	position: relative;
	float: right;
	right: 50px;
	margin-top: 10px;
	width: 20px;
	height: 20px;
	border-radius: 50%;
	background-color: #C91C1C;
	box-shadow: 1px 1px 3px #ECECEC inset;
	margin-top: 10px;
}

a {
display:inline-block;
margin-left: 5px;
margin-top:2px;
	text-align: center;
	font-weight: bold;
	text-decoration: none;
	color: black;
	text-align: center;
}

.walkReason {
	width: 500px;
	margin-left: 20px;
}

.walkReason h2 {
	width: 500px;
	border-bottom: 3px solid #A9A9A9;
	color: #5B5B5B;
}

.walkReason input {
	width: 500px;
	border-width: 0;
	color: #C5C5C5;
	font-size: 20px;
	border-bottom: 2px solid #C5C5C5;
}
#submit{
margin-left:260px;
width:70px;
height:30px;
border: 0;
border-radius: 30px;
background-color:#FED74B;
font-weight:bold;
font-size:15px;
text-align:center;
box-shadow: 0 2px 1px gray;
}

</style>
</head>
<body>
<c:set var="path" value="${pageContext.request.contextPath}"/>   
<jsp:include page="/main/header.jsp"/>
<div class="container1">
<div id="usersAddress" data-value="${user.memAddress1 }"></div>
<div class="walkMap" id="walkMap">
<div id="walkMapBar"></div>
<div id="map"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4e8e9a2d83662cba453e26f8150a7147&autoload=true&libraries=services"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

window.onload=function(){
	walkAddress3 = document.getElementById("walkAddress3").getAttribute("value");
	console.log(walkAddress3);
	console.log(${walking.walkLat});
	function mapMaker(){
		 mapContainer = document.getElementById('map'), 
			mapOption = { 
			    center: new kakao.maps.LatLng(${walking.walkLong},${walking.walkLat}), 
			 draggable: false, 
			 zoomable: false,
			    level: 1
			};
			 imageSrc = '${path}/image/mark1.png',   
			imageSize = new kakao.maps.Size(66, 70), 
			imageOption = {offset: new kakao.maps.Point(27, 69)};

			 markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
			markerPosition = new kakao.maps.LatLng(${walking.walkLong},${walking.walkLat});


			var marker = new kakao.maps.Marker({
			position: markerPosition, 
			image: markerImage
			});
			var map = new kakao.maps.Map(mapContainer, mapOption);
			marker.setMap(map);
		
	}
	mapMaker();

	
}
 

	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function daumPostcode() {
		
	  	var addr;
	      new daum.Postcode({
	          oncomplete: function(data) {
	        	  var geocoder = new kakao.maps.services.Geocoder();
	              // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	              // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	              // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	              var roadAddr = data.roadAddress; // 도로명 주소 변수
	             	var jibunAddr = data.jibunAddress;
	         
	              
	           
	              
	           
	              
	              //사용자가 선택한 주소 타입에 따라 해당 주소값을 가져온다
	              if(data.userSelectedType === 'R'){addr = data.roadAddress;
	              console.log(addr);}
	              else{
	              	addr = data.roadAddress;
	              }
	              	 
	              
	              
	              document.getElementById("walkAddress3").value = addr;
	              document.getElementById("detailAddress").focus();
	              geocoder.addressSearch(addr,function(result,status){
		           	   if(status === kakao.maps.services.Status.OK){
		           		   
		           		  walkLat = document.getElementById('walkLat');
		           		  walkLat.value=result[0].y;
		           		  walkLong = document.getElementById('walkLong');
		           		  walkLong.value=result[0].x;
		           		  console.log(result[0]);
			                    

	          } 
	              })
	          }
	      
	      }).open();
	  }

	
   
</script>
<div id="leftDiv">
		<div class="backWalkDetail">
			<a href="walkBoard"id="exitBtn">
				X</a>
			<section id="./walkModifyForm">
			<div class="frontWalkDetail">
			<form action="walkModifyForm" method="post"  name="walkModifyForm">
			<input type="hidden" name="walkNum" id="walkNum" value="${walking.walkNum }">
			<input type="hidden"name="walkWriter" id="walkWriter" value="${user.memId }">
				<div class="walkDetail">
					<div id="walkTopEmpty"></div>
					<div id="walkContent">
						<div class="walkSubject">
							<input type="text" id="walkName" name="walkName" value="${walking.walkName }">
						</div>
						<br>
						<br>
						<div class="walkAddress">
						<div id="detailAddress">
							<img src="${path }/image/place.png"
								width="20px">
								<input type="text" id="walkAddress3" name="walkAddress3" value="${walking.walkAddress3 }"readOnly />
					
								<br>
						</div>
						</div>
					</div>
					<div id="walkMidEmpty"></div>
					<div class="walkReason">
						<h2>추천 이유</h2>
						<input type="text" id="walkReason" name="walkReason" value="${walking.walkReason }">
					</div>
			
					<div id="walkBottomEmpty"></div>
				</div>
			
				<div id="walkEndEmpty"></div>
								<input type="submit" id="submit" name="submit" value="등록">
								</form>
								
			</div>
			</section>
		</div>

</div>
</div>
<br><br>
<div class="walkBtn">
		<a href="walkingList" id="walkList">LIST</a>
		<a href="walkWriteForm" id="walkWriteForm">WRITE</a>	
		<a href="walkingDelete" id="walkingDelete">DELETE</a>
		</div>
		</div>
</body>


</html>