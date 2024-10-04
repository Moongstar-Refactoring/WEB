<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멍뭉별 미아보호소 게시글</title>
<style>
	body,
    html {
        margin: 0;
        padding: 0;
        font-family: "Pretendard-Regular", sans-serif; /* 전체 글꼴 변경 */
        }
	.text {
		margin: 50px auto 50px auto;
      	width: 1280px;
        font-size: 33px;
        font-family: "JalnanGothic";
      }
      .content_container{
      	margin: 0 auto;
      	width: 1280px;
      	background-color: #f5f5f5;
		height: 620px;
      	display: flex;
   	 	justify-content: center;
      	align-items: center;
      	border-radius: 20px;
  		box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.2);
      }
      .content_box{
      	background-color: white;
      	margin: 0 auto;
      	width: 1180px; height: 530px;
      	border-radius: 20px;
      	overflow: auto;
      }
      .content_box::-webkit-scrollbar{
      	width: 10px;
      	max-height: 460px;
      }
      .content_box::-webkit-scrollbar-thumb{
      	background-color: #D9D9D9;
      	min-height: 10px;
      	border-radius: 10px;
      	background-clip: padding-box;
      }
      .content_box::-webkit-scrollbar-track{
      	background-color: transparent;
      	border-radius: 10px;
      }
      .content_box2{
      	width: 90%; height: 400px;
      	margin: 40px auto 40px;
/*       	background-color: gray;
 */      }
      .write_box{
      	display: inline-block;
/*       	background-color: yellow;
 */      	width: 70%; height: 400px;
      }
      .dogname_box{
      	color: black;
      	font-size: 40px;
      	font-weight: bolder;
      }
      .address{
      	margin-top:10px;
      	font-size: 20px;
      }
      .chars{
      	margin: 2px 0;
      	font-size: 17px;
      }
      .protectDate{
      	font-size: 17px;
      }
      .etc{
      	font-size: 17px;
      }
      .contents{
      	font-size: 20px; color: #7E7E7E;
      	border-bottom: 1px solid #7E7E7E;
      	margin-bottom:10px; margin-top: 10px;
      	padding-bottom: 3px;
      }
      .img_box{
      	display: inline-block;
/*       	background-color: yellow;
 */      	width: 25%; height: 315px;
 		padding: 10px;
      	float: right;
      	border: 1px solid #7E7E7E;
      	border-radius: 10px;
      }
      .lostImg{
      	width: 100%; height: 265px;
      	overflow: hidden;
      	      	border-radius: 10px;
      	
      }
      .state{
      	color: green;
      	margin-top: 10px;
      	font-size: 30px;
		text-align: center;
      }
      .btn_container{
      	margin-top: 30px;
      	display: flex;
   	 	justify-content: center;
      	align-items: center;
      } 
      .Btn{
      	margin:10px;
		background-color: #FED74B;
  		border: none;
		box-shadow: 0px 2px 0px rgba(0, 0, 0, 0.4);
  		border-radius: 20px;
		padding: 7px 22px 7px 22px;
		font-size: 15px;
		font-weight: bold;
      }
      
      .cheader{
      	margin: 20px auto 0 auto;
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
  		width: 1160px; max-height: 500px;
  		margin: 0 50px 15px 50px;
  		padding: 10px 10px 10px 10px;
      	border-radius: 20px;
      	display: inline-block;
      	overflow: auto;
  	}
  	.comment_box::-webkit-scrollbar{
      	width: 10px;
      	max-height: 460px;
    }
    .comment_box::-webkit-scrollbar-thumb{
      	background-color: #D9D9D9;
      	min-height: 10px;
      	border-radius: 10px;
      	background-clip: padding-box;
    }
    .comment_box::-webkit-scrollbar-track{
      	background-color: transparent;
      	border-radius: 10px;
    }
  	.writeComm{
  		width: 70%;
  		margin: 5px 0 5px 0; 
  		float: right;
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
  	}
</style>
</head>
<body>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/main/header.jsp"/>
<div class="text">미아보호소</div>

<div class="content_container">
	<div class="content_box">
		<div class="content_box2">
			<div class="write_box">
				<div class="dogname_box">${lost.lostName}</div>
				<div class="address"><img style="margin-bottom: 5px;" src="${path}/image/place.png" style="">${lost.lostAddress}</div>
				<div id="char_box">
				<div class="contents">특징</div>
				</div>
				<div class="contents">기타사항</div>
				<div class="etc">${lost.lostEtc}</div>
			</div>
			<div class="img_box">
				<div class="lostImg">
				<img class="photo" src="${path}/imageView?num=${lost.lostPhoto}">
				</div>
				<div class="state">찾고있어요</div>
			</div>
		</div>
	</div>
</div>

<div class="btn_container">
	<a href="lostBoard" class="boardBtn Btn">목 록</a>
	<c:if test="${lost.memId eq user.memId}">
	<a href="lostModify?lostNum=${lost.lostNum}" class="boardBtn Btn">수 정</a>
	<span class="boardBtn Btn" id="deleteBtn">삭 제</span>
	</c:if>
</div>

<div class="cheader">&nbsp;COMMENT</div>
<div class="comment_container">
	<div class="comment_box" id="comment_box">
	<c:forEach items="${comments}" var="comment">
	<c:choose>
	<c:when test="${comment.commNick eq lostNick}">
	<div class="writeComm">
		<img src="${path}/image/delete.png" style="width:18px; height:18px" class="delete_img mycomm" id="${comment.commNick}" data-num="${comment.commNum}" onclick="commentDelete(this)">
		<span class="commNickname mycomm"><img src="${path}/image/logo.png" style="width:15px; height:15px">&nbsp;${comment.commNick}&nbsp;&nbsp;</span>
		<span class="commContent mycomm">${comment.commContent}</span>
	</div>
	</c:when>
	<c:otherwise>
	<div class="memComm">
		<img src="${path}/image/delete.png" style="width:18px; height:18px" class="delete_img comm" id="${comment.commNick}" data-num="${comment.commNum}" onclick="commentDelete(this)">
		<span class="commNickname comm">&nbsp;&nbsp;<img src="${path}/image/logo.png" style="width:15px; height:15px">&nbsp;${comment.commNick}&nbsp;&nbsp;</span>
		<span class="commContent comm" >${comment.commContent}</span>
	</div>
	</c:otherwise>
	</c:choose>
	</c:forEach>     
	</div>
    <div class="inputDiv">
    	<input type="text" class="inputComment" id="comment" name="text" placeholder="댓글"/>
		<button class="commBtn" id="commBtn">등록</button>
	</div>
</div>
</body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
const charBox = document.getElementById('char_box');

var charString='${lost.lostChar}';
console.log(charString);
var chars=charString.split('@');
console.log(chars[0]);


for (var i = 0; i < chars.length-1; i++) {
	const newItem = document.createElement('div'); // 새로운 div 요소 생성
	newItem.className="chars";
	newItem.textContent = '🐶 '+ chars[i]; // 버튼 텍스트 설정
	charBox.appendChild(newItem); // 부모 요소에 새로운 항목 추가
}

$(function(){
	$(".photo").load(function(e) {
		var imageBox = document.querySelector(".lostImg");
		const widthDiff = (this.clientWidth - imageBox.offsetWidth) / 2;
    	const heightDiff = (this.clientHeight - imageBox.offsetHeight) / 2;
    	
    	console.log(widthDiff)
    	this.style.transform = "translate("+ -widthDiff + "px,"+ -heightDiff +"px)";
	})
})

let imageBlob = null;

const handleImgInput = (e) => {
  const config = {
    file: e.target.files[0],
    maxSize: 200,
  };
  resizeImage(config)
    .then((resizedImage) => {   
    	resizedImage.toBlob( blob=> {
    	      const url = window.URL.createObjectURL(blob);
    	      const img = document.createElement("img");
    	      img.setAttribute("src", url);
    	      img.className = "profile-img";
    	      img.style.display = "block";
    	      img.onload = () => {
    	        const widthDiff = (img.clientWidth - imgTag.offsetWidth) / 2;
    	        const heightDiff = (img.clientHeight - imgTag.offsetHeight) / 2;

    	        img.style.transform = "translate("+ -widthDiff + "px,"+ -heightDiff +"px)";
    	      };    	      
    	      
    	      imgTag.innerHTML = "";
    	      imgTag.appendChild(img);
    	      imageBlob = blob;
    	      console.log(imageBlob)
    	}, 'image/webp')
    })
    .catch((err) => {
      console.log(err);
    });
};

$('#commBtn').on("click",function(){
	$.ajax({
		url:"lostCommentList",
		type:"POST",
		asnyc:true,
		data:{commContent:$('#comment').val(), lostNum:'${lost.lostNum}'},
		success:function(result){
			let comment=JSON.parse(result);
			console.log(comment.memNick);
			console.log(comment.commNum);
			if(comment.memNick==='${lostNick}'){
			let div=`<div class="writeComm">
					<img src="${path}/image/delete.png" style="width:18px; height:18px" class="delete_img mycomm" id=\${comment.memNick} data-num=\${comment.commNum} onclick="commentDelete(this)">
					<span class="commNickname mycomm"><img src="${path}/image/logo.png" style="width:15px; height:15px">&nbsp;\${comment.memNick}&nbsp;&nbsp;</span>
					<span class="commContent mycomm">\${comment.commContent}</span>
				</div>`
				$('#comment_box').append(div);
			} else{
				let div=`<div class="memComm">
						<img src="${path}/image/delete.png" style="width:18px; height:18px" class="delete_img comm" id=\${comment.memNick} data-num=\${comment.commNum} onclick="commentDelete(this)">
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
	     window.location.href="lostDelete?lostNum=${lost.lostNum}"
	 }else{   //취소
	     return false;
	 }
})

function commentDelete(delImage) {
	console.log(delImage)
	var writeDiv = delImage.parentNode;
	console.log(delImage.getAttribute('id'))
	if(delImage.getAttribute('id')!='${user.memNick}') return;
	
	if (confirm("댓글을 삭제하시겠습니까??") == true){    //확인
	     $.ajax({
	    	 url:'${path}/lost/lostCommentDelete',
	    	 type:'get',
	    	 async:true,
	    	 data:{commNum:delImage.dataset.num},
	    	 success:function(result) {
	    		 console.log(result)
	    		 if(result=='true') {
	    			 writeDiv.remove()
	    		 }
	    	 }
	     })
	 }else{   //취소
	     return false;
	 }	
}
</script>
</html>