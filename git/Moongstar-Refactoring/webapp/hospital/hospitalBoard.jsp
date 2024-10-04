<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>24시 병원 추천</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<style>
.searchBar{
position:relative;
left:40px;
top:75px;
margin: 0 auto;
width:1280px;
}
   .searchInput{
		padding-bottom: 8px; padding-top: 8px;
    	background-color: #F6F6F6;
    	border-radius: 5px;
  		box-shadow: inset 1px 1px 0px rgba(0, 0, 0, 0.2);
  		border: none;
        font-family: "JalnanGothic";
    }
    .searchBtn{
		padding-bottom: 8px; padding-top: 8px;    
    	background-color: #0155B7;
    	border-radius: 5px;
    	color: white;
    	border: none;
        font-family: "JalnanGothic";
    }
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
#hosListLogout{
width: 90px;
	height: 20px;
	border: 0;
	margin-left:30px;
	border-radius: 30px;
	background-color: #FED74B;
	color: white;
	text-align: center;
	box-shadow: 0 3px 1px gray;
}


body, html {
	margin: 0;
	padding: 0;
	font-family: "Pretendard-Regular", sans-serif; /* 전체 글꼴 변경 */
}

.container {
	margin: 0 auto;
	width: 1280px;
}

#map {
z-index:9998;
	width: 570px;
	height: 600px;
	margin-top: 85px;
	margin-left: 30px;
	float: left;
	border-top-right-radius: 3%;
	border-bottom-right-radius: 3%;
	box-shadow: 0px 3px 4px lightgray;
}

#helpMessage {
	margin-top: 110px;
	width: 580px;
}

a {
	display: inline-block;
	text-align: center;
	text-decoration: none;
	color: black;
}

#leftDiv {
	position: relative;
	width: 580px;
	float: right;
}

#hosList, #hosWriteForm {
	width: 70px;
	height: 20px;
	border: 0;
	border-radius: 30px;
	background-color: #FED74B;
	color: white;
	text-align: center;
	box-shadow: 0 3px 1px gray;
}

.hosBtn {
	position: relative;
	top: 10px;
	float: left;
	margin-left: 250px;
	width: 1280px;
	height: 40px;
}

#hosMapBar {
	position: relative;
	float: left;
	width: 30px;
	margin-top: 85px;
	left: 30px;
	height: 600px;
	background-color: #3477c5;
	border-top-left-radius: 30px;
	border-bottom-left-radius: 30px;
}

#hosMapBarOpen {
	position: relative;
	float: left;
	width: 80px;
	margin-top: 85px;
	left: 30px;
	height: 600px;
	background-color: #3477c5;
	border-top-left-radius: 30px;
	border-bottom-left-radius: 30px;
}

#hotplace {
	width: 60px;
	heigth: 60px;
	border-radius: 50%;
	border-width: 0;
	background-color: #FC4444;
	box-shadow: 2px 2px 1px lightgray;
	margin: 10px;
	color: white;
	font-weight: bold;
	font-size: 20px;
	font-family: "Georgia";
}

#like {
positon:absolute;
	width: 60px;
	heigth: 60px;
	border-width: 0;
	border-radius: 50%;
	background-color: #EECA4B;
	box-shadow: 2px 2px 1px lightgray;
	margin: 10px;
	color: white;
	font-weight: bold;
	font-size: 18px;
	font-family: "Georgia";
}

#hotplaces{
position:absolute;
float:right;
left:80px;
top:-70px;
width:300px;
height:250px;
z-index:9999;
font-size:20px;

}

#likes{
position:absolute;
float:right;
left:80px;
top:80px;
width:400px;
height:330px;
z-index:9999;
font-size:20px;

}
#alllikeplace{
position:relative;
top:30px;
left:100px;}

#allhotplace{
position:relative;
top:30px;
left:70px;
}

</style>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>
<body>
<c:set var="path" value="${pageContext.request.contextPath}"/>   
	<jsp:include page="/main/header.jsp" />
		<div class="searchBar">
    		<input type="text" class="searchInput" id="comment searchText" name="searchText" placeholder="검색"/>
			<button id="searchBtn" class="searchBtn Btn" type="submit">검색</button>
			<script>
			$("#searchBtn").on("click",function(){
				searchText = document.getElementById("comment searchText").value;

				$.ajax({
				url:'hospitalSearch',
				type:'GET',
				async:true,
				data:{searchText:searchText},
				success:function(result){
					console.log(result);
					window.location.href="http://localhost:8080/MoongStar/hospital/hospitalSearch?searchText="+searchText;
					
				}
				}) 
				
			})
			</script>
			</div>
	<div class="container">
		<div class="hosMap" id="hosMap">
			<div id="hosMapBar"></div>
			<div id="usersAddress" data-value="${user.memAddress1 }"></div>
			<div id="map"></div>
								<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4e8e9a2d83662cba453e26f8150a7147&libraries=services"></script>
			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4e8e9a2d83662cba453e26f8150a7147&libraries=services?autoload=true"></script>
			<script>
$(document).ready(function(){
	usersAddress = document.getElementById("usersAddress").getAttribute("data-value");
	function mapmaker(){
		mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = { 
		    center: new kakao.maps.LatLng(37.54699, 127.09598), // 지도의 중심좌표
		    level: 8 // 지도의 확대 레벨
		};

		map = new kakao.maps.Map(mapContainer, mapOption); 

		mapTypeControl = new kakao.maps.MapTypeControl();

		// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
		// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		 zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		     
		}
		mapmaker();
		
function memLoc(){
			
			if(usersAddress != null){
				
				// 로그인한 사람의 주소
				function geocodeAddress(address) {
		            geocoder = new kakao.maps.services.Geocoder();

		            // 주소로 좌표를 검색합니다
		            geocoder.addressSearch(address, function(result, status) {
		                if (status === kakao.maps.services.Status.OK) {
		                     coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		                    lat = result[0].y;
		                    lng = result[0].x;
		                    map.setCenter(new kakao.maps.LatLng(lat,lng));
		                }
		            });
		        }
				
				geocodeAddress(usersAddress);
				
			} else{
				// 비회원 주소
				function navigatorAddress(){
					// 현재 위치 받아오기
			        if (navigator.geolocation) {
			            navigator.geolocation.getCurrentPosition(function(position) {
			               lat = position.coords.latitude; // 위도
			              lng = position.coords.longitude; // 경도	
			              map.setCenter(new kakao.maps.LatLng(lat,lng));
			            })}}
				navigatorAddress();
				
				
			}
			
		}
		     memLoc();
		
		window.onload=function(){

			 markers = [];
			$.ajax({
				url:'hospitalBoard',
				type:'post',
				async:true,
				success:function(result){
					hospitals = JSON.parse(result);
					
					imageSrc = '${path}/image/hospital.png'; 
					imageSize = new kakao.maps.Size(36, 40), 
					 imageOption = {offset: new kakao.maps.Point(27, 69)};
				    markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
				    
				  
				   
					for(var i=0; i<hospitals.length;i++){				
				lats=hospitals[i].hosLat;
				longs=hospitals[i].hosLong;

				 positions =  {title:hospitals[i].hosNum,
					latlng: new kakao.maps.LatLng(lats,longs)};	
				   markers[i] = new kakao.maps.Marker({
					    position: new kakao.maps.LatLng(positions.latlng.La,positions.latlng.Ma),
					    image: markerImage, // 마커이미지 설정 
					    title: positions.title
					});
				 
				  markers[i].setMap(map);
				
				
				  
					

				
					} 
					
			
					
					for (const marker of markers) {					
						kakao.maps.event.addListener(marker, "click", function(
						  ) {
					 console.log(marker);
					 console.log(marker.getTitle());
					 num = marker.getTitle();
					  window.location.href="http://localhost:8080/MoongStar/hospital/hospitalDetail?hosNum="+num;
			
					 
				});
					}
					
					
					
			} //for end
			

		})
		
		
			
	}
		
})

		
		


</script>

			<div id="leftDiv">
				<img id="helpMessage" src='${path}/image/help.png' /> <a
					id="hospitalDetail" href=""></a>
			</div>
		</div>
		<br>
		<br>
		<div class="hosBtn">
				<a href="hospitalBoard" id="hosListLogout">HOME</a>
		</div>
	</div>
	
</body>
</html>