<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-Latest.min.js"></script>
<script src="https://code.jquery.com/jquery-Latest.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
body,html{
margin:0 auto;
padding:0;
}
.container{
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


#walkTopEmpty, #walkBottomEmpty  {
	height: 15px;
	margin: 0;
}

#walkMidEmpty {
	height: 80px;
	margin: 0;
}



#exitBtn {
	position: relative;
	float: right;
	right: 50px; margin-top : 10px;
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
margin-top:3px;
	text-align: center;
	font-weight: bold;
	text-decoration: none;
	color: black;
	text-align: center;
}

.walkLocalRec, .walkAllRec{
height: 200px;
margin-left: 5px;
}

h2{
color:white;
-webkit-text-stroke: 1px #2F65DD;
text-shadow: 1px 2px 2px lightgray;
font-weight: bold;
margin-left:5px;
font-family: "JalnanGothic";
}
#RecTable{
width: 480px;
margin: 0 auto;
text-align: center;
}

#trLine{
border-bottom: 2px solid #DFE1E6;
}
#trLike{
color: #2F54DD;
font-weight: bold;
height:40px;
width:40px;
}
#trPlace{
width:140px;
height:40px;
}

#trAddress{
width:400px;
height:40px;

}

</style>
</head>
<body>
<c:set var="path" value="${pageContext.request.contextPath}"/>   
<jsp:include page="/main/header.jsp"/>
<div class="container">
<div class="walkMap" id="walkMap">
<div id="walkMapBar"></div>
<div id="map"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4e8e9a2d83662cba453e26f8150a7147&libraries=services?autoload=true"></script>
<script>
window.onload=function(){
	function mapmaker(){
		console.log(typeof wlat);
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
		<div id="exitBtn">
			<a href="walkBoard">X</a>
		</div>
		<div class="frontWalkDetail">
			<div class="walkDetail">
				<div id="walkTopEmpty"></div>
				<div id="walkContent">
					<div class="walkLocalRec">
						<h2>위치 기반 추천</h2>
						<table id="RecTable">
						<tr id="tr1">
						<th>LIKE</th>
						<th>PLACE</th>
						<th>ADDRESS</th>
						</tr>
						<tr>
						<th colspan="3" id="trLine"></th>
						</tr>
						<tr>
						<td id="trLike">121</td>
						<td id="trPlace">카카오오름</td>
						<td id="trAddress">서울시 어쩌고 그므천구 호서구 호구구</td>
						</tr>
												<tr>
						<td id="trLike">166</td>
						<td id="trPlace">에이바우트커</td>
						<td id="trAddress">카카오시 카카오동 카카오로 카카아파트</td>
						</tr>
												<tr>
						<td id="trLike">64</td>
						<td id="trPlace">제주첨단과학기술단지</td>
						<td id="trAddress">경기도 파주시 금천구 어쩌구 저쩌구</td>
						</tr>
												<tr>
						<th colspan="3" id="trLine"></th>
						</tr>
						</table>
					</div>
					<br>
					<div class="walkAllRec">
							<h2>전체 지역 추천</h2>
													<table id="RecTable">
						<tr id="tr1">
						<th>LIKE</th>
						<th>PLACE</th>
						<th>ADDRESS</th>
						</tr>
						<tr>
						<th colspan="3" id="trLine"></th>
						</tr>
						<tr>
						<td id="trLike">121</td>
						<td id="trPlace">카카오오름</td>
						<td id="trAddress">서울시 어쩌고 그므천구 호서구 호구구</td>
						</tr>
												<tr>
						<td id="trLike">166</td>
						<td id="trPlace">에이바우트커</td>
						<td id="trAddress">카카오시 카카오동 카카오로 카카아파트</td>
						</tr>
												<tr>
						<td id="trLike">64</td>
						<td id="trPlace">제주첨단과학기술단지</td>
						<td id="trAddress">경기도 파주시 금천구 어쩌구 저쩌구</td>
						</tr>
												<tr>
						<th colspan="3" id="trLine"></th>
						</tr>
						</table>
					</div>
				</div>
				</div>

		</div>
	</div>
	</div>
</div>

<br><br>
<div class="walkBtn">
		<a href="walkingList" id="walkList">LIST</a>
		<a href="walkWriteForm" id="walkWriteForm">WRITE</a>	
		</div>
		</div>
</body>
</html>