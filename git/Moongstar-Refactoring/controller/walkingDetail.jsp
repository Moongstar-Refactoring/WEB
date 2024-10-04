<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
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
<title>${walking.walkName } 상세 페이지</title>
<script src="https://code.jquery.com/jquery-Latest.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4e8e9a2d83662cba453e26f8150a7147&autoload=true&libraries=services"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
body,html{
margin:0;
padding:0;
 font-family: "Pretendard-Regular", sans-serif; /* 전체 글꼴 변경 */

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
}
#leftDiv{
position:relative;
width:580px;
float:left;
margin-left:40px;
top:60px;
}


#walkList, #walkWriteForm{
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
left: 230px;
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

#walkSub {
	margin: 0;
	float: left;
}


.walkSubject {
	width: 500px;
	height: 35px;
	float: left;
	border-bottom: 3px solid #A9A9A9;
	font-size: 25px;
	font-weight: bold;
	color: #5B5B5B;
}

.walkAddress {
	position:relative;
	width:400px;
		font-size: 20px;
		margin-top:5px;	
}

#detailAddress{
width: 400px;
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
	margin-bottom:6px;
	
}


.walkReason span{
font-size:20px;
width:500px;
margin:0;
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
#walkLike {
	height: 40px;
	width: 50px;
	float: right;
	font-size:25px;
	text-align:center;
	margin-top:6px;
}

.comment{
top:50px;
}
</style>
</head>
<body>
<c:set var="path" value="${pageContext.request.contextPath}"/>   
<jsp:include page="/main/header.jsp"/>
<div class="container1">
<div class="walkMap" id="walkMap">
<div id="walkMapBar"></div>
<div id="map"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4e8e9a2d83662cba453e26f8150a7147&libraries=services?autoload=true"></script>
<script>
wlat = JSON.parse(${walking.walkLat });
wlong = JSON.parse(${walking.walkLong });
window.onload=function(){
	console.log(wlat);
	console.log(typeof wlat);
	function mapmaker(){
		console.log(typeof wlat);
		mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = { 
			
		    center: new kakao.maps.LatLng(wlat, wlong), // 지도의 중심좌표
		    level: 4 // 지도의 확대 레벨
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
	
		
			walking = [];
			 markers = [];
			$.ajax({
				url:'walkBoard',
				type:'post',
				async:true,
				success:function(result){
					walkings = JSON.parse(result);

					imageSrc = '${path}/image/mark1.png'; 
					imageSize = new kakao.maps.Size(36, 40), 
					 imageOption = {offset: new kakao.maps.Point(27, 69)};
				    markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
				    
				  
				   
					for(var i=0; i<walkings.length;i++){				
				lats=walkings[i].walkLat;
				longs=walkings[i].walkLong;

				 positions =  {title:walkings[i].walkNum,
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
					  window.location.href="http://localhost:8080/moongstar/walking/walkingDetail?walkNum="+num;
					 
				});
					}
					
					
					
			} //for end
			

		})
		
		
			
	}


		
		


</script>
<div id="leftDiv">

		<div class="backWalkDetail">
			<a href="walkBoard"id="exitBtn">
				X</a>
			<div class="frontWalkDetail">
				<div class="walkDetail">
					<div id="walkTopEmpty"></div>
					<div id="walkContent">
						<div class="walkSubject">
							${walking.walkName }
							<div id="walkLike">
					<b>Like</b><br>
					<img src="${path }/image/none.png" style="width:45px;">
				</div>
						</div>
							<br>
							<br>
						<div class="walkAddress">
						<div id="detailAddress">
							<img src="${path}/image/place.png"
								width="20px">
								${walking.walkAddress3 }
								<br>
						</div>
						</div>
						</div>


									
				<div id="walkBottomEmpty"></div>
					<div class="walkReason">
						<h2>추천 이유</h2>
						<span>${walking.walkReason }</span>
					</div>
				</div>
			</div>
		</div>


</div>
</div>
<br><br>
<div class="walkBtn">
		<a id="walkList" href="walkingList">LIST</a>
		<a id="walkWriteForm" href="walkWriteForm">WRITE</a>
		<script>
		$("#walkWriteForm").on("click",function(){
			window.location.href="http://localhost:8080/moongstar/walking/walkWriteForm";	
		})
		</script>
		</div>
</div>
			<div class="comment">
			<%@ include file="mapComment.jsp" %>
			</div>	
			
</body>


</html>