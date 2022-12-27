<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script>
$(document).ready(function(){
	console.log("ok");
    $('#radio2').hide();   // 초깃값 설정
    $('#radio3').hide();	// 초깃값 설정
		
	$("input[name='radio1']").change(function(){
		// 휴대폰 결제 선택 시.
		if($("input[name='radio1']:checked").val() == 'schedule'){
			$('#schedule').show();
			$('#weather').hide();
			$('#traffic').hide();
		}	
		// 무통장입금 결제 선택 시.
		else if($("input[name='radio1']:checked").val() == 'weather'){
			$('#schedule').hide();
			$('#weather').show();
			$('#traffic').hide();
		}
		// 신용카드 결제 선택 시.
		else if($("input[name='radio1']:checked").val() == 'traffic'){
			$('#schedule').hide();
			$('#weather').hide();
			$('#traffic').show();
		}
	});
		
});

</script>
<style>
	.outer{
		text-align: center;
	}
	.inner{
		width:800px;
		margin:60px auto; 
		height:auto;
		min-height:1000px;
		
	}
	.menu{
		text-align: left;
	}
	.items{
		display:inline-block;
	}
	.radiobtn{
		display:none;
	}
	.radiolabel{
		display:inline-block;
		width:100px;
		height:40px;
		border:1px solid black;
		line-height: 40px;
		text-align: center;
		border-radius: 16px 16px 0 0;
		background-color:rgb(229, 236, 255);
	}
	.radiobtn:hover + label{
		background-color: rgb(87, 119, 199);
		color:white;
	}
	.radiobtn:checked + label{
		background-color: rgb(87, 119, 199);
	    color:white;
	}
	.schedule{
		position:absolute;
		width:800px;
		margin:auto;
		border: 1px solid black;
	}
	.weather{
		display:none;
		position:absolute;
		margin:auto;
		width:800px;
		height:800px;
		border: 1px solid black;
	}
	.traffic{
		display:none;
		position:absolute;
		margin:auto;
		width:800px;
		height:800px;
		border: 1px solid black;
	}
	.profile__img {
		width: 30px;
		height:30px;
	}
	
	.note__img {
		width: 30px;
		height:30px;
	}
	.content_title{
		text-align: left;
		margin-left:40px;
		padding:20px;
	}
	.contentdiv{
		text-align: left;
	}
	.memo{
		text-align: left;
		margin-left:50px;
		padding:10px;
		height:30px;
	}
	.memo_content{
		position: absolute;
    	display: inline-block;
   		line-height: 30px;
   		font-weight: bold;
	}

	.day{
		font-size: 20px;
    	font-weight: bold;
	}
	.date{
		font-size:13px;
	}
	.content{
		width:600px;
		padding:10px;
		border: 2px solid black;
		border-radius: 30px;
		margin:0 auto 15px;
	}
	.content_num{
		display: inline-block;
    	width: 30px;
    	height: 30px;
    	border: 2px solid black;
    	border-radius: 50%;
    	line-height: 30px;
    	text-align: center;
    	font-weight: bold;
    	
	}
	.place{
		margin-left:10px;
	}
	.days{
		border:1px solid black;
		padding-bottom:10px;
	}
	.profile{
		text-align:left;
		height:50px;
		margin:20px 0;
	}
	.profile img{
		width:50px;
		height:50px;
	}
	.profile label{
		position: absolute;
	    display: inline-block;
	    line-height: 50px;
	    margin-left: 20px;
	    font-size: 20px;
	    font-weight: bold;
	}
	.top_title{
		text-align: left;
	}
	.top_tit{
		font-size:35px;
		font-weight: bold;
	}
	.top_date{
		font-size:18px;
		display: inline-block;
    	margin-left: 20px;
	}
	.top_title button{
		border: none;
	    box-shadow: 1px 1px 1px 0 black;
	    border-radius: 3px;
	    width: 70px;
	    height: 30px;
	    margin-left: 30px;
	    background-color: rgb(87, 119, 199);
	    color:white;
	    font-weight:bold;
	}
	.top_title button:hover{
		background-color:#205295;
	}
	
</style>

</head>
<body>
<%@ include file="../common/header.jsp"%>


<div class="outer">
	<div class="inner">
		<div class="top_title">
			<label class="top_tit">3박4일 서울여행</label>
			<label class="top_date">2022.2.14 ~ 2022.2.16</label>
			<button onclick="location.href='<c:url value="/travel/insert"/>'">스크랩</button>
		</div>
		<div class="profile">
			<img class="profile__img" src="${pageContext.request.contextPath}/resources/images/user.png" onclick="location.href='<c:url value="/mypage"/>'">
			<label onclick="location.href='<c:url value="/mypage"/>'">cncnrkdud99</label>
		</div>

		<div class="menu">
			<div class="items"><input type="radio" id="radio1" class="radiobtn" name="radio1" value="schedule" checked><label for="radio1" class="radiolabel" >일정</label></div>
			<div class="items"><input type="radio" id="radio2" class="radiobtn" name="radio1" value="weather"><label for="radio2" class="radiolabel">날씨</label></div>
			<div class="items"><input type="radio" id="radio3" class="radiobtn" name="radio1" value="traffic"><label for="radio3" class="radiolabel">교통</label></div>
		</div>
		
		<div class="contentdiv">
			<div class="schedule" id="schedule">
			
				<div class="days">
					<div class="content_title">
						<label class="day">Day 1</label>
						<label class="date">- 2.14</label>
					</div>
					<div class="content">
						<span class="content_num">1</span>
						<span class="place">남산타워</span>
					</div>
					<div class="content">
						<span class="content_num">2</span>
						<span class="place">국립 중앙 박물관</span>
					</div>
					<div class="memo">
						<img class="note__img" src="${pageContext.request.contextPath}/resources/images/note.png"><label class="memo_content">남산타워에서 자물쇠 걸기💑</label>
					</div>
				</div>	
					
					
				<div class="days">	
					<div class="content_title">
						<label class="day">Day 2</label>
						<label class="date">- 2.15</label>
					</div>
					<div class="content">
						<span class="content_num">1</span>
						<span class="place">북촌 한옥마을</span>
					</div>
					<div class="content">
						<span class="content_num">2</span>
						<span class="place">경복궁</span>
					</div>
					<div class="memo">
						<img class="note__img" src="${pageContext.request.contextPath}/resources/images/note.png"><label class="memo_content">경복궁에서 한복 빌리기🎀</label>
					</div>
				</div>	
					
					
				<div class="days">	
					<div class="content_title">
						<label class="day">Day 3</label>
						<label class="date">- 2.16</label>
					</div>
					<div class="content">
						<span class="content_num">1</span>
						<span class="place">청계천</span>
					</div>
					<div class="content">
						<span class="content_num">2</span>
						<span class="place">광화문</span>
					</div>
					<div class="memo">
						<img class="note__img" src="${pageContext.request.contextPath}/resources/images/note.png"><label class="memo_content">광화문에서 태극기 들고 있기🙌🙌🙌🙌</label>
					</div>
				</div>
				
				
			</div>
			<div class="weather" id="weather">날씨</div>
			<div class="traffic" id="traffic">교통</div>
		</div>
	</div>
</div>
<%@ include file="../common/footer.jsp"%>
</body>
</html>