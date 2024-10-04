<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-Latest.min.js"></script>

<style>
body{
margin:0;
padding:0;
width:1920px;

}
.walkMap{
position:relative;
margin: 0 auto;
}
#map{
width:570px;height:600px;
margin-left:320px;
margin-top:80px;
float:left;
border-top-right-radius:3%;
border-bottom-right-radius:3%;
box-shadow: 0px 3px 4px lightgray;
}

#helpMessage{
margin-top:100px;
width:600px;
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
margin-right:320px;
float:right;
}

#walkList, #walkWrite{
width:70px;
height:30px;
border: 0;
border-radius: 30px;
background-color:#FED74B;
color:white;
font-weight:bold;
font-size:15px;
text-align:center;
box-shadow: 0 3px 1px gray;
}
.walkBtn{
position: relative;
top: 5px;
left: 570px;
width:1200px;
height:40px;
overflow:hidden;
}
#walkMapBar{
position:relative;
float:left;
width:80px;
height:600px;
background-color:#3477c5;
border-top-left-radius:30px;
border-bottom-left-radius:30px;
margin-top:80px;
left:320px;

}

#hotplace{
width:60px;
heigth:60px;
border-radius:50%;
border-width:0;
background-color:#FC4444;
box-shadow: 2px 2px 1px lightgray;
margin: 10px;
color: white;
font-weight:bold;
font-size:20px;
font-family: "Georgia";
}

#like{
width:60px;
heigth:60px;
border-width:0;
border-radius:50%;
background-color:#EECA4B;
box-shadow: 2px 2px 1px lightgray;
margin: 10px;
color: white;
font-weight:bold;
font-size:18px;
font-family: "Georgia";
}
</style>
</head>
<body>
  <c:set var="path" value="${pageContext.request.contextPath}"/> 
<jsp:include page="/main/header.jsp"/>
<div class="walkMap" id="walkMap">
<div id="walkMapBar">
<button id="hotplace" name="hotplace"><p>HOT</p></button>
<button id="like" name="like"><p>LIKE</p></button>
</div>
<div id="map"></div>
<div id="leftDiv">
<img id="helpMessage" src="${path }/image/help.png"/>
</div>
</div>
<br><br>
<div class="walkBtn">
		<button id="walkList">LIST</button>
		<button id="walkWrite">WRITE</button>
		</div>



</body>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4e8e9a2d83662cba453e26f8150a7147"></script>
<script>
window.onload=function(){
var mapContainer = document.getElementById('map'), 
mapOption = { 
    center: new kakao.maps.LatLng(37.54699, 127.09598), 
    level: 4
};


var map = new kakao.maps.Map(mapContainer, mapOption); 



var imageSrc = '${path}/image/mark1.png',   
imageSize = new kakao.maps.Size(36, 40), 
imageOption = {offset: new kakao.maps.Point(27, 69)};

var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
markerPosition = new kakao.maps.LatLng(37.54699, 127.09598); 


var marker = new kakao.maps.Marker({
position: markerPosition, 
image: markerImage
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


kakao.maps.event.addListener(marker, "click", function() {
    $('#helpMessage').remove();
    // AJAX를 이용하여 페이지를 동적으로 include
    $.ajax({
        url: 'walkingDetail.jsp', // include 하고자 하는 페이지의 URL
        success: function(response) {
            $('#leftDiv').html(response); // include된 페이지의 내용을 leftDiv에 넣음
        },
        error: function(xhr, status, error) {
            console.error(xhr.responseText); // 에러 발생 시 콘솔에 출력
        }
    });
});
$("#walkList").on("click",function(){
	$.ajax({
		url:'walkingList.jsp',
		success:function(response){
			
			$('#leftDiv').html(response);
		}
		
	})	
})
$("#exitBtn").on("click",function(){
$('#leftDiv').empty();
})

$("#walkWrite").on("click",function(){
$.ajax({
	url:'walkingWriteForm.jsp',
	success:function(response){
		
		$('#leftDiv').html(response);
	}
	
})	
})
}
</script>
</html>