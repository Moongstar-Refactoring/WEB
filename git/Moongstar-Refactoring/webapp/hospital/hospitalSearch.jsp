<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="dto.Walking" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.*" %>
<% String searchTextResult = (String)request.getAttribute("searchText"); %>
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
body,html{
margin:0 auto;
padding:0;
}
    .hosDetail::-webkit-scrollbar{
      	width: 10px;
      	max-height: 460px;
      }
      .hosDetail::-webkit-scrollbar-thumb{
      	background-color: #D9D9D9;
      	min-height: 10px;
      	border-radius: 10px;
      	background-clip: padding-box;
      }
      .hosDetail::-webkit-scrollbar-track{
      	background-color: transparent;
      	border-radius: 10px;
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

.hosBtn{
position:relative;
top:10px;
left: 230px;
float: left;
width:1280px;
height:40px;
}
#hosMapBar{
position:absolute;
float:left;
width:30px;
margin-top:85px;
height:600px;
background-color:#3477c5;
border-top-left-radius:30px;
border-bottom-left-radius:30px;
}
.backHosDetail {
	width: 650px;
	height: 650px;
	background-color: #F5F5F5;
	border-radius: 10%;
}

.frontHosDetail {
	position: relative;
	top: 40px;
	width: 600px;
	height: 560px;
	background-color: #F5F5F5;
	margin: 0 auto;
	border-radius: 10%;
	border-right: 3px solid #D9D9D9;
}

.hosDetail {
	position: relative;
	top: 15px;
	width: 550px;
	height: 530px;
	background-color: white;
	border-radius: 5%;
	margin: 0 auto;
	overflow: auto;
}

#hosContent {
	width: 510px;
	height: 200px;
	margin: 0 auto;
}


#hosTopEmpty, #hosBottomEmpty  {
	height: 15px;
	margin: 0;
}

#hosMidEmpty {
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

.hosLocalRec, .hosAllRec{
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
<div id="map"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4e8e9a2d83662cba453e26f8150a7147&libraries=services?autoload=true"></script>
<script>
window.onload=function(){
	function mapmaker(){
		hsLat = ${hospitals[0].hosLat};
		hsLong = ${hospitals[0].hosLong};
		searchTextResult = "<%= searchTextResult %>";
		console.log(searchTextResult);
		console.log(typeof wlat);
		mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = { 
			
		    center: new kakao.maps.LatLng(hsLong, hsLat), // 지도의 중심좌표
		    level: 10 // 지도의 확대 레벨
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


		
		


</script>
<div id="leftDiv">
	<div class="backHosDetail">
		<div id="exitBtn">
			<a href="hospitalBoard">X</a>
		</div>
		<div class="frontHosDetail">
			<div class="hosDetail">
				<div id="hosTopEmpty"></div>
				<div id="hosContent">
					<div class="hosLocalRec">
					<h2>${searchText } 검색 결과</h2>
											<table id="RecTable">
						<tr id="tr1">
						<th>LIKE</th>
						<th>PLACE</th>
						<th>ADDRESS</th>
						</tr>
						
						<tr>
						<th colspan="3" id="trLine"></th>
						</tr>
					<c:forEach var="hospital" items="${hospitals}">
           <tr>
						<td id="hosLike">${hospital.hosLike }</td>
						<td id="hosName"><a href="hospitalDetail?hosNum=${hospital.hosNum }">${hospital.hosName }</a></td>
						<td id="hosAddress3"><a href="hospitalDetail?hosNum=${hospital.hosNum }">${hospital.hosAddress3 }</a></td>
						</tr>
        </c:forEach>			
												<tr>
						<th colspan="3" id="trLine"></th>
						</tr>
						</table>
					</div>
					<br>
				</div>
				</div>

		</div>
	</div>
	</div>
</div>

<br><br>
		<div class="hosBtn">
			<a href="hospitalList" id="hosListLogout">LIST</a> 
		</div>
		</div>
</body>
</html>