<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script> 
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/traveldetail.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
</head>
<body>




<div class="outer">
	<div class="inner">
		<div class="top_title">
			<label class="top_tit">3박4일 서울여행</label>
			<label class="top_date">2022.2.14 - 2022.2.16</label>
			<button class="share_btn" onclick="location.href='<c:url value="/travel/insert"/>'">스크랩</button>
			<button class="update_btn" onclick="location.href='<c:url value="/travel/insert"/>'">수정</button><hr class="uk-divider-vertical"><button id="delete_btn" class="delete_btn" >삭제</button>
		</div>
		<div class="profile">
			<img class="profile__img" src="${pageContext.request.contextPath}/resources/images/user.png" onclick="location.href='<c:url value="/mypage"/>'">
			<label class="profile_label" onclick="location.href='<c:url value="/mypage"/>'" >cncnrkdud99</label><label class="view-info">스크랩 &nbsp; 8</label><label class="view-info">조회 수&nbsp; 15</label>
		</div>

		<div class="menu">
			<div class="items">
				<input type="radio" id="radio1" class="radiobtn" name="radio1" value="schedule" checked>
				<label for="radio1" class="radiolabel" >일정</label>
			</div><div class="items">
				<input type="radio" id="radio2" class="radiobtn" name="radio1" value="weather">
					<label id="weather_radio_button" for="radio2" class="radiolabel">
						날씨
					</label>
			</div>
			<div class="items">
			<input type="radio" id="radio3" class="radiobtn" name="radio1" value="traffic">
			<label for="radio3" class="radiolabel">교통</label>
			</div>
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
				<div class="weather_select"><select name="sido1" id="sido1" class="sido1"></select> 
				<select name="gugun1" id="gugun1" class="gugun1"></select></div>
				<img src="../resources/images/weather.png" class="weather_sample">
			</div>
			<div class="traffic" id="traffic">
				<img src="../resources/images/traffic_sample.png" class="traffic_sample">
			</div>
		</div>
	</div>
</div>

<div class="modal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">게시글 삭제</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>일정을 삭제하시겠습니까?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" onclick="location.href='<c:url value="/mypage"/>'">확인</button>
      </div>
    </div>
  </div>
</div>
<%@ include file="../common/footer.jsp"%>
</body>
<script>
$('#delete_btn').click(function(e){
	e.preventDefault();
	$('.modal').modal("show");
});
	
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
			
			
			jQuery.ajax({
		        url : "${pageContext.request.contextPath}/api/weather",
		        type : "get",
		        contentType: "application/json",
		        dataType : "json",
		        success : function(data, status, xhr) {

		            let dataHeader = data.result.response.header.resultCode;

		            if (dataHeader == "00") {
		               console.log("success == >");
		               console.log(data);
		            } else {
		               console.log("fail == >");
		               console.log(data);               
		            }
		        },
		        error : function(e, status, xhr, data) {
		            console.log("error == >");
		            console.log(e);
		        }
		    });
			$('#weather').show();
			$('#schedule').hide();
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

$(document).ready(function(){
	
	$("#sido1").change(function(){
		 sido = $('#sido1').find(":selected").text();
	});
	  $("#gugun1").change(function(){
		 gugun = $('#gugun1').find(":selected").text();
		 
		 var allData = {"do": sido, "si": gugun};

	});
	

 	  
	   
/* 	  $.ajax({
			url : '${pageContext.request.contextPath}/api/weather?si='+ var1,
			type : 'get',
			data : var1,
			success : function() {
				console.log(data);								
				}, error : function() {
						console.log("실패");
				}
			}); */
	  
});




	
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
	   var area11 = ["계룡시","공주시","논산시","보령시","서산시","아산시","천안시","금산군","당진군","부여군","서천군","예산군","청양군","태안군","홍성군"];
	   var area12 = ["군산시","김제시","남원시","익산시","전주시","정읍시","고창군","무주군","부안군","순창군","완주군","임실군","장수군","진안군"];
	   var area13 = ["광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
	   var area14 = ["경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
	   var area15 = ["거제시","김해시","밀양시","사천시","양산시","진주시","창원시","통영시","거창군","산청군","의령군","창녕군","하동군","합천군"];
	   var area16 = ["제주"];



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
</html>