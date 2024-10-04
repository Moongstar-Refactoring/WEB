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
<style type="text/css">
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
font-size:15px;
}
#walkModifyForm,#walkingDelete{
position:relative;
top:-20px;
left:520px;
width:70px;
height:20px;
border: 0;
border-radius: 30px;
background-color:#FED74B;
color:white;
text-align:center;
box-shadow: 0 3px 1px gray;
font-size:15px;
}

.walkBtn{
position:relative;
top:10px;
left: 220px;
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
<div class="searchBar">
    		<input type="text" class="searchInput" id="comment searchText" name="searchText" placeholder="검색"/>
			<button id="searchBtn" class="searchBtn Btn" type="submit">검색</button>
			<script>
			$("#searchBtn").on("click",function(){
				searchText = document.getElementById("comment searchText").value;

				$.ajax({
				url:'walkingSearch',
				type:'GET',
				async:true,
				data:{searchText:searchText},
				success:function(result){
					console.log(result);
					window.location.href="http://localhost:8080/MoongStar/walking/walkingSearch?searchText="+searchText;
					
				}
				}) 
				
			})
			</script>
			</div>
<div class="container1">
<div class="walkMap" id="walkMap">
<div id="walkMapBar"></div>
<div id="map"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4e8e9a2d83662cba453e26f8150a7147&libraries=services?autoload=true"></script>
<script>
window.onload=function(){
	center ={lats:37.54699, longs:127.09598};
	
	function mapmaker(){
		console.log(center.lats);
		center.lats=${walking.walkLat };
		console.log(typeof center.lats);
		center.longs=${walking.walkLong };
		mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = { 
			
		    center: new kakao.maps.LatLng(center.longs, center.lats), // 지도의 중심좌표
		    level: 7 // 지도의 확대 레벨
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
		function convertBooleanToNumber(booleanValue) {
	        return booleanValue ? 1 : 0;
	    };
		
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
				
						walking = walkings[i];
						
						console.log(walking.walkBlind);
						lats=walkings[i].walkLat;
				longs=walkings[i].walkLong;
				
				

				 positions =  {title:walkings[i].walkNum,
					latlng: new kakao.maps.LatLng(lats,longs)};	
				 
				
				
				 walkBlinds = walkings[i].walkBlind;
				 console.log(walkBlinds)
				 
				   markers[i] = new kakao.maps.Marker({
					    position: new kakao.maps.LatLng(positions.latlng.La,positions.latlng.Ma),
					    image: markerImage, // 마커이미지 설정 
					    title: positions.title,
					    isAvailable: convertBooleanToNumber(walkings[i].walkBlind)
					});
				   
					 
				   console.log(markers[i].isAvailable);
					 if(walkBlinds == false){
						 markers[i].setMap(map)
					 } else if(walkBlinds == true){
						 markers[i].setMap(null);
					 }
					 			
					}
					
					
					
			
					
					for (const marker of markers) {					
						kakao.maps.event.addListener(marker, "click", function(
						  ) {
					 console.log(marker);
					 console.log(marker.getTitle());
					 num = marker.getTitle();
					 
					  window.location.href="http://localhost:8080/MoongStar/walking/walkingDetail?walkNum="+num;
					  
					 
				});
						
				

						$("#walkModifyForm").on("click",function(){
							 window.location.href="http://localhost:8080/test/walking/walkingModifyForm?walkNum="+num;	
						})
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
							 <span id="likeCount">${walking.walkLike}</span><br>
							<c:choose>
							<c:when test="${walking.walkLike == 0 }">
							<button id="likeButton" style="border-width:0; background-color:transparent;"><img id="like" src="${path }/image/none.png" style="width:45px;"></button>
							</c:when>
							<c:otherwise>
							<button id="likeButton" style="border-width:0; background-color:transparent;"><img id="like" src="${path }/image/like.png" width="45px"/></button>
							</c:otherwise>
							</c:choose>
					<script type="text/javascript">
					
				        $('#likeButton').on("click",function(){
				            $.ajax({
				                url:'walkingLike',
				                type:'POST',
				                async:true,
				                data:{like:JSON.stringify({memId:"${user.memId}", walkNum:"${walking.walkNum}"})},
				                success:function(result){
				                    console.log(result);
				                    if(result === 'liked'){
				                        var likeCount = parseInt($('#likeCount').text());
				                        $('#likeCount').text(likeCount + 1);
				                        $('#unlike').attr('src', '${path}/image/like.png');
				                    } else if (result === 'unliked') {
				                        var likeCount = parseInt($('#likeCount').text());
				                        $('#likeCount').text(likeCount - 1);
				                        $('#unlike').attr('src', '${path}/image/none.png');
				                    }
				                }
				            })
				        });
				

					</script>
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
<c:if test="${user eq null }">
		
		</c:if>
		
					<c:if test="${user ne Empty }">
					<a id="walkList" href="walkBoard">HOME</a>
		<a id="walkWriteForm" href="walkWriteForm">WRITE</a>
		<script>
		$("#walkWriteForm").on("click",function(){
			window.location.href="http://localhost:8080/MoongStar/walking/walkWriteForm";	
		})
		</script>
		
		
				<c:if test="${user.memId eq walking.walkWriter }">
		<a href="walkModifyForm?walkNum=${walking.walkNum }" id="walkModifyForm">MODIFY</a>
				<script>
	$("#walkModifyForm").on("click",function(){
		var url = "http://localhost:8080/test/MoongStar/walkModifyForm?walkNum=" + num;
		window.location.assign(url);
	})
		</script>
		<a href="walkingDelete?walkNum=${walking.walkNum }" id="walkingDelete">DELETE</a>
		
		<script>
		$('#walkingDelete').on("click",function(){
			 if (confirm("게시물을 삭제하시겠습니까?") == true){    //확인
			     window.location.href="walkingDelete?walkNum=${walking.walkNum}"
			 }else{   //취소
			     return false;
			 }
		})
	   <!-- function showConfirmation() {
	    	var result = confirm("삭제하시겠습니까?");
	    	if(result){
				$.ajax({
					url:'walkingDelete',
					type:'POST',
					async:true,
					data:{walkNum:${walking.walkNum} },
					success:function(result){
						console.log(result);
					}
				
					
				})
				alert("삭제되었습니다")
			} else{
			
			};
	    }
		--> 
		</script>
		</c:if>		
		</c:if>
		</div>
</div>
<br><br>
<!-- 여기서부터 코멘트창 -->
			<div class="ememem" style="display:flex; top:700px; height:30px; width:1280px; ">
			</div>
<div class="comment">
			<div class="cheader">&nbsp;COMMENT</div>
<div class="comment_container">
	<div class="comment_box" id="comment_box">
	<c:forEach items="${comments}" var="comment">
	<c:choose>
	<c:when test="${comment.commNick eq walkNick}">
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
		url:"walkCommentList",
		type:"POST",
		asnyc:true,
		data:{commContent:$('#comment').val(), walkNum:'${walking.walkNum}'},
		success:function(result){
			let comment=JSON.parse(result);
			console.log(comment.memNick);
			
			if(comment.memNick==='${walkNick}'){
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

$('#deleteBtn').click(function(){
	 if (confirm("게시물을 삭제하시겠습니까??") == true){    //확인
	     window.location.href="walkingDelete?walkNum=${walking.walkNum}"
	 }else{   //취소
	     return false;
	 }
})

</script>
</div>
</div>
		
			
</body>


</html>