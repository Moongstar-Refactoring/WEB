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
<title>산책로 추천</title>
<script src="http://code.jquery.com/jquery-Latest.min.js"></script>

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
}

.container {
	margin: 0 auto;
	width: 1280px;
}

#map {
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

#walkList, #walkWriteForm {
	width: 70px;
	height: 20px;
	border: 0;
	border-radius: 30px;
	background-color: #FED74B;
	color: white;
	text-align: center;
	box-shadow: 0 3px 1px gray;
}

.walkBtn {
	position: relative;
	top: 10px;
	float: left;
	margin-left: 250px;
	width: 1280px;
	height: 40px;
}

#walkMapBar {
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

#walkMapBarOpen {
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
	<div class="container">
		<div class="walkMap" id="walkMap">
			<div id="walkMapBarOpen" style="display: none;">
				<button type="button" id='hotplace' name='hotplace'>
					<p>HOT</p>
				</button>
				<div id="hotplaces" style="display:none; background-image: url('${path}/image/list.png')">
					<table id="allhotplace">			
					<tr>			
					<th></th>
					</tr>
					<tr><th style="font-family: 'Georgia';">PLACE</th>
					<th style="font-family: 'Georgia';">&nbsp;&nbsp;&nbsp;LIKE</th></tr>
					<tr>
					<td style="text-align: center; border-bottom:2px solid lightgray;"><a href="walkingDetail?walkNum=1">111111</a></td>
					<th style="color:#3477c5;">&nbsp;&nbsp;&nbsp;1000</th>
					</tr>
					<tr>
					<td style="text-align: center; border-bottom:2px solid lightgray;"><a>2222</a></td>
					<th style="color:#3477c5;">&nbsp;&nbsp;&nbsp;340</th>
					</tr>
					<tr>
					<td style="text-align: center; border-bottom:2px solid lightgray;"><a>33333</a></td>
					<th style="color:#3477c5;">&nbsp;&nbsp;&nbsp;220</th>
					</tr>
					<tr><td style="text-align: center;  border-bottom:2px solid lightgray;"><a>44444</a></td>
					<th style="color:#3477c5;">&nbsp;&nbsp;&nbsp;110</th></tr>
					<tr><td style="text-align: center; border-bottom:2px solid lightgray;"><a>55555</a></td>
					<th style="color:#3477c5;">&nbsp;&nbsp;&nbsp;20</th>
					</tr>
					</table>
					</div>
				<button type="button" id='like' name='like'>
					<p>LIKE</p>
				</button>
				<div id="likes" style="display:none; background-image: url('${path}/image/list.png')">
					<table id="alllikeplace">			
					<tr>			
					<th>User님의 좋아요 목록</th>
					</tr>
					<tr><td> </td></tr>
					<tr>
					<td style="border-bottom:2px solid lightgray;"><a href="walkingDetail?walkNum=1">111111</a></td>
					</tr>
					<tr>
					<td style="border-bottom:2px solid lightgray;"><a>2222</a></td>
					</tr>
					<tr>
					<td style="border-bottom:2px solid lightgray;"><a>33333</a></td>
					</tr>
					<tr><td style="border-bottom:2px solid lightgray;"><a>44444</a></td></tr>
					<tr><td style="border-bottom:2px solid lightgray;"><a>55555</a></td></tr>
					</table>
					</div>
			</div>
			<div id="walkMapBar"></div>
			<script>
	$("#walkMapBar").on("click",function(){
		$(this).css("display","none");
		$(this).css("overflow","hidden");
		$("#walkMapBarOpen").css("display","block");
		
		
		})
		
$("#walkMapBarOpen").children().not("button").on("click",function(){
$(this).css("display","none");
$(this).css("overflow","hidden");
})
var clicked = false;
$("#hotplace").on("click",function(){
if(clicked == false){
	$("#hotplaces").css("display","block");
	clicked = true;
	
}
else{
	$("#hotplaces").css("display","none");
	clicked = false;
	
}
})

$("#like").on("click",function(){
if(clicked == false){
	$("#likes").css("display","block");
	clicked = true;
	
}
else{
	$("#likes").css("display","none");
	clicked = false;
	
}
})
</script>
			<div id="map"></div>
			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4e8e9a2d83662cba453e26f8150a7147&libraries=services?autoload=true"></script>
			<script>
$(document).ready(function(){
		
	function mapmaker(){
		mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = { 
		    center: new kakao.maps.LatLng(37.54699, 127.09598), // 지도의 중심좌표
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
	
		
		window.onload=function(){

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
		
})

		
		


</script>
			<div id="leftDiv">
				<img id="helpMessage" src='${path}/image/help.png' /> <a
					id="walkingDetail" href=""></a>
			</div>
		</div>
		<br>
		<br>
		<div class="walkBtn">
			<a href="walkingList" id="walkList">LIST</a> <a id="walkWriteForm"
				href="walkWriteForm">WRITE</a>
		</div>
	</div>
</body>
</html>