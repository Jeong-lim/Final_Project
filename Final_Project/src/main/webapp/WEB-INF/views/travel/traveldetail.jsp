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
    $('#radio2').hide();   
    $('#radio3').hide();	
		
	$("input[name='radio1']").change(function(){
		
		if($("input[name='radio1']:checked").val() == 'schedule'){
			$('#schedule').show();
			$('#weather').hide();
			$('#traffic').hide();
		}	
		
		else if($("input[name='radio1']:checked").val() == 'weather'){
			$('#schedule').hide();
			$('#weather').show();
			$('#traffic').hide();
		}
		
		else if($("input[name='radio1']:checked").val() == 'traffic'){
			$('#schedule').hide();
			$('#weather').hide();
			$('#traffic').show();
		}
	});
		
});

</script>
<script>
$('document').ready(function() {
	 var area0 = ["시/도 선택","서울특별시","인천광역시","대전광역시","광주광역시","대구광역시","울산광역시","부산광역시","경기도","강원도","충청북도","충청남도","전라북도","전라남도","경상북도","경상남도","제주도"];
	  var area1 = ["서울"];
	   var area2 = ["인천"];
	   var area3 = ["대전"];
	   var area4 = ["광주"];
	   var area5 = ["대구"];
	   var area6 = ["울산"];
	   var area7 = ["부산"];
	   var area8 = ["고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
	   var area9 = ["강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
	   var area10 = ["제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];
	   var area11 = ["계룡시","공주시","논산시","보령시","서산시","아산시","천안시","금산군","당진군","부여군","서천군","연기군","예산군","청양군","태안군","홍성군"];
	   var area12 = ["군산시","김제시","남원시","익산시","전주시","정읍시","고창군","무주군","부안군","순창군","완주군","임실군","장수군","진안군"];
	   var area13 = ["광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
	   var area14 = ["경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
	   var area15 = ["거제시","김해시","마산시","밀양시","사천시","양산시","진주시","진해시","창원시","통영시","거창군","고성군","남해군","산청군","의령군","창녕군","하동군","함안군","함양군","합천군"];
	   var area16 = ["제주","서귀포"];



	 $("select[name^=sido]").each(function() {
	  $selsido = $(this);
	  $.each(eval(area0), function() {
	   $selsido.append("<option value='"+this+"'>"+this+"</option>");
	  });
	  $selsido.next().append("<option value=''>구/군 선택</option>");
	 });

	 

	 $("select[name^=sido]").change(function() {
	  var area = "area"+$("option",$(this)).index($("option:selected",$(this))); // 선택지역의 구군 Array
	  var $gugun = $(this).next(); // 선택영역 군구 객체
	  $("option",$gugun).remove(); // 구군 초기화

	  if(area == "area0")
	   $gugun.append("<option value=''>구/군 선택</option>");
	  else {
	   $.each(eval(area), function() {
	    $gugun.append("<option value='"+this+"'>"+this+"</option>");
	   });
	  }
	 });


	});
	

</script>
<style>

	.outer{
		text-align: center;
	}
	.inner{
		width:1000px;
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
	display: inline-block;
    border: 2px solid #E6E6E6;
    border-bottom: none;
    text-align: center;
    border-radius: 16px 16px 0 0;
    background-color: rgb(229, 236, 255);
    font-size: 20px;
    width: 130px;
    height: 42px;
    line-height: 42px;
    margin: 0 1px;
     cursor:pointer;
	}
	.radiobtn:hover + label{
		background-color: #3B82F6;
		color:white;
	}
	.radiobtn:checked + label{
		background-color: #3B82F6;
	    color: white;
	   
	}
	.schedule{
		position:absolute;
		width:1000px;
		margin:auto;
		border: 2px solid #E6E6E6;
	}
	.days:hover{
		box-shadow: 0 3.2px 7.2px 0 rgb(0 0 0 / 13%), 0 0.6px 1.8px 0 rgb(0 0 0 / 11%);
	}
	
	.weather{
		display:none;
		position:absolute;
		margin:auto;
		width:1000px;
		height:800px;
		border: 1px solid black;
	}
	.traffic{
		display:none;
		position:absolute;
		margin:auto;
		width:1000px;
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
	}

	.day{
		font-size: 20px;
    	font-weight: bold;
	}
	.date{
		font-size:18px;
	}
	.content{
		width:800px;
		padding:10px;
		border: 2px solid gray;
		border-radius: 30px;
		margin:0 auto 15px;
	}
	.content_num{
		display: inline-block;
    width: 30px;
    height: 30px;
    border: 2px solid gray;
    border-radius: 50%;
    line-height: 30px;
    text-align: center;
    font-weight: bold;
    color: gray;
    	
	}
	.place{
		font-size: 18px;
    margin-left: 10px;
	}
	.days{
		border:1px solid #E6E6E6;
		padding-bottom:10px;
	}
	.profile{
		height: 50px;
    margin: 20px 0;
    display: flex;
    align-items: center;
    justify-content: flex-start;
	}
	.profile img{
		width: 45px;
    height: 45px;
     cursor:pointer;
	}
	.profile_label{
		display: inline-block;
    line-height: 50px;
    margin-left: 20px;
    font-size: 19px;
     cursor:pointer;
	}
	.view-info{
		font-size: 13px;
    margin-left: 25px;
    }
	.top_title{
		text-align: left;
    align-items: center;
    justify-content: unset;
    display: flex;
	}
	.top_tit{
		font-size: 35px;
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
    height: 35px;
    margin-left: 30px;
    background-color: #3B82F6;
    color: white;
    font-weight: bold;
    font-size: 17px;
    cursor:pointer;
	}
	.top_title button:hover{
		background-color:#205295;
	}
	 ::-webkit-scrollbar {
  		display: none;
	}
	.weather{
		text-align: center;
	}
	.weather_sample{
		width:800px;
		height:700px;
		margin:auto;
	}
	.traffic{
		text-align: center;
	}
	.traffic_sample{
		width:900px;
		height:800px;
		margin:auto;
	}
	.sido1,.gugun1{
		background-color: white;
    cursor: pointer;
    width: 100px;
    height: 35px;
    border-radius: 27px;
    text-align: center;
    margin-right: 10px;
	}
	
	
	
	.sido1 + .gugun1:focus{
		outline:0;
	}
	
	
	
	.weather_select{
		display: flex;
    height: 65px;
    align-items: center;
    justify-content: flex-start;
    box-sizing: border-box;
    padding: 15px;
	}
	
	
</style>

</head>
<body>
<%@ include file="../common/header.jsp"%>


<div class="outer">
	<div class="inner">
		<div class="top_title">
			<label class="top_tit">3박4일 서울여행</label>
			<label class="top_date">2022.2.14 - 2022.2.16</label>
			<button onclick="location.href='<c:url value="/travel/insert"/>'">스크랩</button>
		</div>
		<div class="profile">
			<img class="profile__img" src="${pageContext.request.contextPath}/resources/images/user.png" onclick="location.href='<c:url value="/mypage"/>'">
			<label class="profile_label" onclick="location.href='<c:url value="/mypage"/>'" >cncnrkdud99</label><label class="view-info">스크랩 &nbsp; 8</label><label class="view-info">조회 수&nbsp; 15</label>
		</div>

		<div class="menu">
			<div class="items"><input type="radio" id="radio1" class="radiobtn" name="radio1" value="schedule" checked><label for="radio1" class="radiolabel" >일정</label>
			</div><div class="items"><input type="radio" id="radio2" class="radiobtn" name="radio1" value="weather"><label for="radio2" class="radiolabel">날씨</label>
			</div><div class="items"><input type="radio" id="radio3" class="radiobtn" name="radio1" value="traffic"><label for="radio3" class="radiolabel">교통</label></div>
		</div>
		
		<div class="contentdiv">
			<div class="schedule" id="schedule">
			
				<div class="days">
					<div class="content_title">
						<label class="day">Day 1</label>
						<label class="date">- 2022.2.14</label>
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
						<label class="date">- 2022.2.15</label>
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
						<label class="date">- 2022.2.16</label>
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
			<div class="weather" id="weather">
				<div class="weather_select"><select name="sido1" id="sido1" class="sido1"></select> <select name="gugun1" id="gugun1" class="gugun1"></select></div>
				<img src="../resources/images/weather.png" class="weather_sample">
			</div>
			<div class="traffic" id="traffic">
				<img src="../resources/images/traffic_sample.png" class="traffic_sample">
			</div>
		</div>
	</div>
</div>
<%@ include file="../common/footer.jsp"%>
</body>
</html>