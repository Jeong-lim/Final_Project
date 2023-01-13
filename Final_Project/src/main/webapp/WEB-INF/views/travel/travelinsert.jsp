<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="https://unpkg.com/gijgo@1.9.14/js/gijgo.min.js"
	type="text/javascript"></script>
<link href="https://unpkg.com/gijgo@1.9.14/css/gijgo.min.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/travelinsert.css" />
<%@ include file="/WEB-INF/views/common/header.jsp"%>
</head>
<body>

	<div class="outer">
		<div class="inner">
			<div class="selectdiv1">
				<label class="top_title">여행 일정 등록하기</label> <span> <input
					type="radio" name="open_radio" class="open_radio" id="open_radio1"
					value="all" checked><label for="open_radio1"
					class="open_radio_label">전체 공개</label> <input type="radio"
					name="open_radio" class="open_radio" id="open_radio2"
					value="follow"><label for="open_radio2"
					class="open_radio_label">팔로우 공개</label> <input type="radio"
					name="open_radio" class="open_radio" id="open_radio3"
					value="private"><label for="open_radio3"
					class="open_radio_label">비공개</label>
				</span> <input type="text" name="daterange" class="daterange"
					value="01/01/2023 - 01/02/2023" readonly />
			</div>
			<div class="title_input_box">
				<input type="text" id="title_input" class="title_input"
					placeholder="일정 제목을 입력해주세요"><img class="title_input_img"
					id="title_input_img" src="../resources/images/pen.png">
			</div>

			<hr class="uk-divider-icon">
		
			<a href="<c:url value='/travel/placelist'/>">modal_btn</a>
			<a href="<c:url value='/fileuploadform'/>">사진업로드</a>
			

			<div class="content_wrap" id="test">
				<div class="content_title">
					<label class="dayseq1">DAY </label><label class="firstdate"></label>
					<button type="button" id="modal_btn2">
						<img
							src="${pageContext.request.contextPath}/resources/images/note.png">
					</button>
				</div>
			
				<button type="button" class="modal_btn" id="modal_btn">
					<img
						src="${pageContext.request.contextPath}/resources/images/add.png"><label>일정
						추가하기</label>
				</button>


			</div>


			<div class="content_title">
				<label>DAY 2</label><label>- 2022.2.15</label>
				<button type="button" id="modal_btn2">
					<img
						src="${pageContext.request.contextPath}/resources/images/note.png">
				</button>
			</div>

			<div class="schedule_box">
				<div class="insert_num">1</div>
				<div class="schedule">경복궁</div>
			</div>
			<div class="schedule_box">
				<div class="insert_num">2</div>
				<div class="schedule">남산타워</div>
			</div>
			<div class="schedule_box">
				<div class="insert_num">3</div>
				<div class="schedule">청계천</div>
			</div>
			<div class="schedule_box">
				<div class="insert_num">4</div>
				<div class="schedule">북촌한옥마을</div>
			</div>


			<button type="button" class="modal_btn" id="modal_btn">
				<img
					src="${pageContext.request.contextPath}/resources/images/add.png"><label>일정
					추가하기</label>
			</button>


			<div class="content_title">
				<label>DAY 3</label><label>- 2022.2.16</label>
				<button type="button" id="modal_btn2">
					<img
						src="${pageContext.request.contextPath}/resources/images/note.png">
				</button>
			</div>

			<button type="button" class="modal_btn" id="modal_btn">
				<img
					src="${pageContext.request.contextPath}/resources/images/add.png"><label>일정
					추가하기</label>
			</button>

			<button class="save"
				onclick="location.href='<c:url value="/travel/detail"/>'">확인</button>
				
				
			<!-- 장소모달 -->
			<div class="black_bg" id="black_bg1"></div>
			<div class="modal_wrap">
				<div>
					<div class="modal_wrap_box">
						<div class="place_sel_box">
							<img src="../resources/images/logo.png" class="place_sel_logo"><label
								class="place_title">관광지 선택하기</label><img
								src="../resources/images/x.png" class="place_title_x"
								id="place_title_x">
						</div>
						<div class="place_search_box">
							<span><select name="sido1" id="sido1" class="sido1"></select>
								<select name="gugun1" id="gugun1" class="gugun1"></select>
								<div class="search">
									<input type="text" class="select" spellcheck="false"> <img
										src="../resources/images/search.png">
								</div></span>
							<button type="button" id="modal_close" class="place_btn">확인</button>
						</div>
					</div>
					<div class="place_box">
						<div class="place">
							<img
								src="${pageContext.request.contextPath}/resources/images/경복궁.jpg">
							<div class="place_content">
								<div class="title">
									<label>경복궁</label><input type="checkbox">
								</div>
								<div class="title_s">경복궁입니댱~~</div>
							</div>
						</div>

						<div class="place_list">

							<c:forEach var="place" items="${placeList}">
								<div class="place">
									<div class="image_wrap">
										<img class="place_img"
											src="${pageContext.request.contextPath}/resources/images/경복궁.jpg" />
									</div>
									<div class="place_info">
										<a href='<c:url value="/place/detail"/>'>
											<p class="place_name">${place.placeName}</p>
										</a>
										<p class="place_area">${place.areaName}</p>
										<label class="category_label"> <span>${place.category}</span></label>
									</div>
								</div>
							</c:forEach>

						</div>

					</div>
				</div>
			</div>

			<!-- 메모모달 -->
			<div class="black_bg" id="black_bg2"></div>
			<div class="modal_wrap2" id="modal_wrap2">
				<div>
					<div class="memo_title">
						<img src="../resources/images/logo.png" class="memo_title_logo"><img
							src="../resources/images/x.png" class="memo_title_x"
							id="memo_title_x">
					</div>
					<textarea class="memo_textarea" rows="10" cols="50"
						spellcheck="false"></textarea>
					<button type="button" class="memo_btn" id="modal_close2">확인</button>

				</div>
			</div>



		</div>
	</div>





	<%@ include file="../common/footer.jsp"%>
</body>
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
<script>
$(function() {
	   $(function() {
	      
	        $('input[name="daterange"]').daterangepicker({
	          opens: 'left'
	       
	        }, function(start, end, label) {
	          console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
	          const getDateDiff = (start, end) => {
	               const date1 = new Date(start);
	               const date2 = new Date(end);
               
	               const diffDate = date1.getTime() - date2.getTime();
	               const days=Math.ceil(Math.abs(diffDate / (1000 * 60 * 60 * 24))); 
	      			
	               
	               //date2.setDate(date2.getDate()+1);
	               //console.log(date2);
	              
	              
	               //console.log(days); //일 수
	               //console.log(date1); //Date 형식으로
	               const date=end.format('YYYY-MM-DD');
	            
	               console.log(date); //문자열식으로 가능
	               //document.querySelector(".dayseq1").append(days);
	               //document.querySelector(".firstdate").append(date);
	               
	                //date2.setDate(date.getDate())
	                
	                
	                
	                
	            
	               
	                 
	           	for(var j=days; j>0; j--){
	                    $(".uk-divider-icon").after('<div class="content_wrap"><div class="content_title"><label class="dayseq">DAY </label><label class="date"></label><button type="button" name="modal_btn2" id="modal_btn2" onclick="openModal()"><img src="${pageContext.request.contextPath}/resources/images/note.png"></button></div><button type="button" class="modal_btn" id="modal_btn" name="modal_btn"><img src="${pageContext.request.contextPath}/resources/images/add.png"><label>일정 추가하기</label></button></div>'   );
	                    const dayseqs=j;
	                    document.querySelector(".dayseq").id=dayseqs;
	                    document.querySelector(".dayseq").append(j);
	                   
	                    date22=date2.toISOString().substring(0,10);
	                    document.querySelector(".date").append(date22);
	                    date2.setDate(date2.getDate()-1);
	                    
	                    
	                    console.log(date22);
	                    //console.log(date2.toISOString().substring(0,10));
	                  
	                  
	        		}
	           		
	              
	             }
	   
	             getDateDiff(start, end);
	        });
	        
	       
	        
	        
	        
	      });

	   
	     
	   
	    
	});



window.onload = function() {
	var btnClear = document.querySelector('#title_input_img');
	btnClear.addEventListener('click', function(){
		console.log("click");
	    document.querySelector('#title_input').value="";
	    
	})
	
	 
    function onClick() {
        document.querySelector('.modal_wrap').style.display ='block';
        document.querySelector('.black_bg').style.display ='block';
        document.body.style.overflow = "hidden";
    }   
    function offClick() {
        document.querySelector('.modal_wrap').style.display ='none';
        document.querySelector('.black_bg').style.display ='none';
        document.body.style.overflow = "unset";
    }
    
    function onClick2(){
    	 document.querySelector('.modal_wrap2').style.display ='block';
         document.querySelector('#black_bg2').style.display ='block';
         document.body.style.overflow = "hidden";
    }
    function offClick2() {
        document.querySelector('.modal_wrap2').style.display ='none';
        document.querySelector('#black_bg2').style.display ='none';
        document.body.style.overflow = "unset";
    }

    document.getElementById('modal_btn').addEventListener('click', onClick);
    document.querySelector('#modal_close').addEventListener('click', offClick);
    document.getElementById('modal_btn2').addEventListener('click', onClick2);
    document.querySelector('#modal_close2').addEventListener('click', offClick2);
    
    document.querySelector('#black_bg1').addEventListener('click', offClick);
    document.querySelector('#black_bg2').addEventListener('click', offClick2);
    
    document.querySelector('#memo_title_x').addEventListener('click',offClick2);
    document.querySelector('#place_title_x').addEventListener('click',offClick);
    
    

   
 
};

</script>
<script type="text/javascript">
   
   
   $(document).ready(function () {
       $(document).on("click", "button[name='modal_btn2']", function () {
           console.log("클릭됨");
          $(".modal_wrap2").show();
          $("#black_bg2").show();
        });
       
       $(document).on("click", "button[name='modal_close2']", function () {
           console.log("클릭됨");
          $(".modal_wrap2").hide();
          $("#black_bg2").hide();
        });
       
      });
   
   
   
   $(document).ready(function () {
       $(document).on("click", "button[name='modal_btn']", function () {
           console.log("클릭됨");
          $(".modal_wrap").show();
          $(".black_bg").show();
        });
       
       $(document).on("click", "button[name='modal_close']", function () {
           console.log("클릭됨");
          $(".modal_wrap").hide();
          $(".black_bg").hide();
        });
       
      });
   
   
   
   
   
</script>

</html>