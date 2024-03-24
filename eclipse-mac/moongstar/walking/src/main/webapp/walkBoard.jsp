<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Insert title here</title>
<style>
body {
	width: 1440px;
}

.walkMap {
	width: 1280px;
	position: relative;
}

#map {
	width: 450px;
	height: 450px;
	margin-left: 220px;
	margin-top: 80px;
	float: left;
	border-left: 30px solid #3477c5;
	border-radius: 3%;
	box-shadow: 0px 3px 4px lightgray;
}

#helpMessage {
	margin-top: 120px;
	width: 400px;
	margin-right: 40px;
}

a {
	margin-top: 5px;
	margin-left: 5px;
	text-align: center;
	font-weight: bold;
	text-decoration: none;
	color: black;
	text-align: center;
}

.leftDiv {
	float: right;
}
</style>
</head>
<body>
	<jsp:include page="/m_header.jsp" />
	<div class="walkMap" id="walkMap">
		<div id="map"></div>
		<div class="leftDiv" id="leftDiv">
			<img id="helpMessage" src="./image/help.png" />
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-Latest.min.js"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4e8e9a2d83662cba453e26f8150a7147"></script>
	<script>
		window.onload = function() {
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(37.54699, 127.09598), // 지도의 중심좌표
				level : 3
			// 지도의 확대 레벨
			};

			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

			var imageSrc = './image/mark.png', // 마커이미지의 주소입니다    
			imageSize = new kakao.maps.Size(36, 40), // 마커이미지의 크기입니다
			imageOption = {
				offset : new kakao.maps.Point(27, 69)
			}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

			//마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
					imageOption), markerPosition = new kakao.maps.LatLng(
					37.54699, 127.09598); // 마커가 표시될 위치입니다

			//마커를 생성합니다
			var marker = new kakao.maps.Marker({
				position : markerPosition,
				image : markerImage,
				clickable: true
			// 마커이미지 설정 
			});
			//일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
			var mapTypeControl = new kakao.maps.MapTypeControl();

			// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
			// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
			map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

			// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
			var zoomControl = new kakao.maps.ZoomControl();
			map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

			marker.setMap(map);

			kakao.maps.event.addListener(marker, 'click', function() {
			    alert('marker click!');
			    $('#helpMessage').remove();
				$('#leftDiv').append(
						`<jsp:include page="/walkingDetail2.jsp"/>`);

			});
		}
	</script>
</body>
</html>