<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="dto.Hospital" %>
<% Hospital hospiptal = (Hospital)request.getAttribute("hospital"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>${hospital.hosName } 상세 페이지</title>
<script src="https://code.jquery.com/jquery-Latest.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4e8e9a2d83662cba453e26f8150a7147&autoload=true&libraries=services"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 <style type="text/css">
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
#walkListLogout{
z-index:9998;
width: 90px;
	height: 20px;
	border: 0;
	margin-left:120px;
	border-radius: 30px;
	background-color: #FED74B;
	color: white;
	text-align: center;
	box-shadow: 0 3px 1px gray;
}
	.comment{
	z-index:9998;
  	width:1280px;
  	margin:0 auto;

  	}
   .cheader{
   z-index:8888;
      	width: 1280px;
        font-size: 18px;
        font-family: "JalnanGothic";  	
        }
  	.comment_container{
      	margin: 0 auto 160px auto;
      	width: 1280px;
  		padding-top: 30px; padding-bottom:30px;
      	background-color: #f5f5f5;
      	border-radius: 20px;
  		box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.2);
  	}
  	.comment_box{
  		background-color: white;
  		margin: 0 4%; margin-bottom: 15px;
  		padding: 20px 10px 20px 10px;
      	border-radius: 20px;
  	}
  	.writeComm{
  		width: 70%; 
  		float: right;
 		margin-bottom: 10px;
  		padding: 5px;
  		overflow: hidden;
  	}
  	.memComm{
		width: 763.86px; 
  		margin-right: 365px;
  		margin-bottom: 10px;
  		padding: 5px;
  		overflow: hidden;  	
  	}
  	.commContent{
  		padding-top: 5px; padding-bottom: 5px;
  		padding-left: 10px; padding-right: 7px;
  		background-color: #f5f5f5;
  		border-radius: 7px;
  		text-align: right;
		font-size: 15px;
  	}
  	.commNickname{
  		padding-top: 5px; padding-bottom: 5px;
  		padding-left: 10px; padding-right: 7px;
		text-align: right;
		font-size: 12px;
		font-weight: bold;
		color: gray;
  	}
  	
  	
  	
  	.inputDiv{
  		margin: 0 4%;
  		padding: 4px;
  		background-color: white;
  		border-style : solid;
  		border-color: #EFC940;
  		border-width: 4px;
  		border-radius: 20px;
  		box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.2);
  	}
  	.inputComment{
  		display: inline-block;
  		width: 80%;
  		height: 40px;
   		margin-left: 5px;
  		margin-right: 70px; 
  		border-style: none;
  		outline: none;
  		font-size: 15px;
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
  	
  	.commBtn{
  		margin:10px;
		background-color: #FED74B;
  		border: none;
		box-shadow: 0px 2px 0px rgba(0, 0, 0, 0.4);
  		border-radius: 20px;
		padding-left: 20px;
		padding-right: 20px;
		padding-bottom: 5px;
		padding-top: 5px;
		font-size: 15px;
		font-weight: bold;
  	}
  	
  	.mycomm{
  		float: right;
  	}
  	.comm{
  		float: left;
  	}
  	.delete_img{
  		padding: 5px;

  </style>
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


#hosList, #hoskWriteForm{
width:70px;
height:20px;
border: 0;
border-radius: 30px;
background-color:#FED74B;
color:white;
text-align:center;
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
.container {
	position: relative;
	margin-top:60px;
	width: 400px;
	float: right;
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
}

#hosContent {
	width: 510px;
	height: 200px;
	margin: 0 auto;
}


#hosTopEmpty {
	height: 60px;
	margin: 0;
}

#hosMidEmpty, #hosBottomEmpty {
	height: 30px;
	margin: 0;
}
#hosEndEmpty{
height:30px;
}

#hosSub {
	margin: 0;
	float: left;
}


.hosSubject {
	width: 500px;
	height: 35px;
	float: left;
	border-bottom: 3px solid #A9A9A9;
	font-size: 25px;
	font-weight: bold;
	color: #5B5B5B;
}

.hosAddress {
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

.hosReason {
	width: 500px;
	margin-left: 20px;

}

.hosReason h2 {
	width: 500px;
	border-bottom: 3px solid #A9A9A9;
	color: #5B5B5B;
	margin-bottom:6px;
	
}


.hosReason span{
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
#hosLike {
	height: 40px;
	width: 50px;
	float: right;
	font-size:25px;
	text-align:center;
	margin-top:6px;
}

  	.comment{
  	position:relative;
  	top:120px;
  	z-index:9999;
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
<div class="container1">
<div class="hosMap" id="hosMap">
<div id="hosMapBar"></div>
<div id="map"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4e8e9a2d83662cba453e26f8150a7147&libraries=services?autoload=true"></script>
<script>
window.onload=function(){
	center ={lats:37.54699, longs:127.09598};
	
	function mapmaker(){
		console.log(center.lats);
		center.lats=${hospital.hosLat };
		console.log(typeof center.lats);
		center.longs=${hospital.hosLong };
		mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = { 
			
		    center: new kakao.maps.LatLng(center.longs, center.lats), // 지도의 중심좌표
		    level: 1// 지도의 확대 레벨
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
			<a href="hosBoard"id="exitBtn">
				X</a>
			<div class="frontHosDetail">
				<div class="hosDetail">
					<div id="hosTopEmpty"></div>
					<div id="hosContent">
						<div class="hosSubject">
							${hospital.hosName }
							<div id="hosLike">
							<b>${hosiptal.hosLike }</b><br>
	<c:choose>
							<c:when test="${like eq 'true' }">
					
					<img src="${path }/image/none.png" style="width:45px;">
					<img id="like" src="${path }/image/like.png" width="45px"/>
		</c:when>
		<c:otherwise>
		<img id="like" src="${path }/image/none.png" width="45px"/>
		<script>
		
		</script>
		</c:otherwise>
		</c:choose>

					<script>
					<script type="text/javascript">
					$(function(){
					$('#like').click(function(){
						$.ajax({
							url:'hosLike',
							type:'post',
							async:true,
							data:{like:JSON.stringify({memId:"${user.memId }",walkNum:"${hospital.hosNum }"})},
							success:function(result){
								if(result=='true'){
								$('#like').attr("src","image?num=like.png")
								
							} else {
								$('#like').attr("src","image?num=none.png")}
							},
							error:function(result){
								
							}
						})
					})	
					})

					</script>
				</div>
						</div>
							<br>
							<br>
						<div class="hosAddress">
						<div id="detailAddress">
							<img src="${path}/image/place.png"
								width="20px">
								${hospital.hosAddress3 }
								<br>
						</div>
						</div>
						</div>


									
				<div id="hosBottomEmpty"></div>
					<div class="hosReason">
						<h2>전화번호</h2>
						<a href="tel:${hospital.hosDial }">${hospital.hosDial }</a>
					</div>
				</div>
			</div>
		</div>


</div>
		<div class="hosBtn">
				<a href="hospitalBoard" id="hosListLogout">HOME</a>
		</div>
</div>

</div>
<br><br>
			<div class="ememem" style="display:flex; top:700px; height:30px; width:1280px; ">
			</div>
<div class="comment">
			<div class="cheader">&nbsp;COMMENT</div>
<div class="comment_container">
	<div class="comment_box" id="comment_box">
	<c:forEach items="${comments}" var="comment">
	<c:choose>
	<c:when test="${comment.commNick eq hosNick}">
	<div class="writeComm">
		<img src="${path}/image/delete.png" style="width:18px; height:18px" class="delete_img mycomm">
		<span class="commNickname mycomm"><img src="${path}/image/logo.png" style="width:15px; height:15px">&nbsp;${comment.commNick}&nbsp;&nbsp;</span>
		<span class="commContent mycomm">${comment.commContent}</span>
	</div>
	</c:when>
	<c:otherwise>
	<div class="memComm">
		<img src="${path}/image/delete.png" style="width:18px; height:18px" class="delete_img comm">
		<span class="commNickname comm">&nbsp;&nbsp;<img src="${path}/image/logo.png" style="width:15px; height:15px">&nbsp;${comment.commNick}&nbsp;&nbsp;</span>
		<span class="commContent comm" >${comment.commContent}</span>
	</div>
	</c:otherwise>
	</c:choose>
	</c:forEach>     
	</div>
	<c:if test="${user ne null }">
    <div class="inputDiv">
    	<input type="text" class="inputComment" id="comment" name="text" placeholder="댓글"/>
		<button class="commBtn" id="commBtn" style="z-index:9999;">등록</button>
	</div>
	</c:if>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$('#commBtn').on("click",function(){
	$.ajax({
		url:"hosCommentList",
		type:"POST",
		asnyc:true,
		data:{commContent:$('#comment').val(), hosNum:'${hospital.hosNum}'},
		success:function(result){
			 comment=JSON.parse(result);
			console.log(comment.memNick);
			
			if(comment.memNick==='${hosNick}'){
			let div=`<div class="writeComm">
					<img src="${path}/image/delete.png" style="width:18px; height:18px" class="delete_img mycomm">
					<span class="commNickname mycomm"><img src="${path}/image/logo.png" style="width:15px; height:15px">&nbsp;\${comment.memNick}&nbsp;&nbsp;</span>
					<span class="commContent mycomm">\${comment.commContent}</span>
				</div>`
				$('#comment_box').append(div);
			} else{
				let div=`<div class="memComm">
						<img src="${path}/image/delete.png" style="width:18px; height:18px" class="delete_img comm">
						<span class="commNickname comm">&nbsp;&nbsp;<img src="${path}/image/logo.png" style="width:15px; height:15px">&nbsp;\${comment.memNick}&nbsp;&nbsp;</span>
						<span class="commContent comm" >\${comment.commContent}</span>
					</div>`
					$('#comment_box').append(div);
			}
			
			
			
			
			
		},
		error:function(err){
			alert("댓글입력 오류입니다.")
		}	
	})
})


</script>
</div>
</div>
		
		
			
</body>


</html>