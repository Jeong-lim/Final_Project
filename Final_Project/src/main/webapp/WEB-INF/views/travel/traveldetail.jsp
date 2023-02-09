<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
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
			<label class="top_tit">${travelTitle}</label>
			<label class="top_date">${startDate} - ${endDate}</label>
			<c:if test="${travelPrivacy eq 'a' or follow eq 'Y' or writer == sessionScope.memberId }">
				<a href="/travel/scrap?travelId=${travelId}&memberId=${sessionScope.memberId}" role="button" class="share_btn"><button class="scrap">스크랩</button></a>
			</c:if>
		
			<c:if test="${writer == sessionScope.memberId }">
			<button class="update_btn" onclick="location.href='<c:url value="/travel/update/${travelId}/${writer}"/>'">수정</button><hr class="uk-divider-vertical">
			<a href="/travel/delete?travelId=${travelId}" onclick="return confirm('삭제 하시겠습니까?')" role="button" id="delete_btn" class="delete_btn" >삭제</a>
			<input type="hidden" id="travelId" value="${travelId}">
			</c:if>
			<c:if test="${not empty originalTravelId}">
			<div class="original_post">
			<a href='<c:url value="/travel/${originalTravelId}/${originalWriter}"/>'><button class="original_btn">원본 게시글로 이동</button></a>
			</div>
			</c:if>
			
			
		</div>
		<c:if test="${writer == sessionScope.memberId }">
		<div class="profile">
			<img class="profile__img" src="<spring:url value='/image/${userProfile}'/>" onclick="location.href='<c:url value="/memberPage"/>'">
			<label class="profile_label" onclick="location.href='<c:url value="/memberPage"/>'" >${writer}</label><label class="view-info">스크랩 &nbsp; ${shareCnt}</label><label class="view-info">조회 수&nbsp; ${viewCnt}</label>
		</div>
		</c:if>
		
		<c:if test="${writer != sessionScope.memberId }">
		<div class="profile">
			<img class="profile__img" src="<spring:url value='/image/${userProfile}'/>" onclick="location.href='<c:url value="/mypage/${writer}"/>'">
			<label class="profile_label" onclick="location.href='<c:url value="/mypage/${writer}"/>'" >${writer}</label><label class="view-info">스크랩 &nbsp; ${shareCnt}</label><label class="view-info">조회 수&nbsp; ${viewCnt}</label>
		</div>
		</c:if>
		
		<c:if test="${travelPrivacy eq 'a' or follow eq 'Y' or writer == sessionScope.memberId }"> <!-- 팔로우 or 전체공개 보여주기 일 때  -->
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
			<label for="radio3" class="radiolabel">지도</label>
			</div>
		</div>
		
		<div class="contentdiv">
			<div class="schedule" id="schedule">
				
				
			 <c:forEach var="detailList" items="${detailList}" varStatus="status">
				<div class="days">
					<div class="content_title">
						<label class="day">Day ${status.count}</label>
						<label class="date">- ${detailList.travelDate}</label>
					</div>
					
					<c:set var="num1" value="${detailList.travelDate}"></c:set>
					
					
						<c:forEach var="detailTravel" items="${detailTravel}" varStatus="statusNm">
						<c:set var="num2" value="${detailTravel.travelDate }"></c:set>
						<c:if test="${num1 eq num2 }">
						<div class="content">
							<span class="content_num">${detailTravel.NUM}</span>
							<span class="place">${detailTravel.placeName}</span>
						</div>
						
						</c:if>
						
						</c:forEach>	
					<div class="memo">
						<img class="note__img" src="${pageContext.request.contextPath}/resources/images/note.png"><label class="memo_content">${detailList.travelMemo}</label>
					</div>
				</div>	
				
			</c:forEach>

				</div>
				 <div class="travel_review">
				<div class="review_title">💭여행은 즐거우셨나요❓여행 후기를 남겨보세요❗</div>
				<c:if test="${writer == sessionScope.memberId }">
					<input class="review_textarea" id="review" spellcheck="false">${travelReview}</input>
					<c:if test="${travelReview eq null or ''}">
					<button class="review_btn" onclick="travelReview(this)">확인</button>
					</c:if>
					<c:if test="${travelReview ne null}">
					<button class="updatereview_btn" onclick="travelReview(this)">수정</button>
					</c:if>
					
				</c:if>
				<c:if test="${writer ne sessionScope.memberId }">
					<input class="review_textarea" id="review" spellcheck="false" readonly>${travelReview}</input>
				</c:if>
				</div> 
	
			</div>	
			
			
			
			
			
				
			
			<div class="weather" id="weather">
				<div class="weather_select"><select name="sido1" id="sido1" class="sido1"></select> 
				<select name="gugun1" id="gugun1" class="gugun1"></select></div>
				<div id="weatherInfoContainer">
					<div class="weatherImgWrapper">
						<div id="weatherImg"></div>
						
						<div class="weatherTemp"></div>
					</div>
					
					
					<div id="weatherRainamount"></div>
					<div id="weatherWindSpd"></div>
					
					
					<br /><br /><br />
					
					<div id="gauge_wrapper">
						<div class="gauge_title">습도</div>
						<br /><br /><br /><br />
						<span id="gauge"></span>
						<div id="weatherHumid"></div>
					</div>
					<br />
					<br />
					
				</div>
			</div>
			<div class="traffic" id="traffic">
					<div class="map_wrap">
				    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
				
				    <div id="menu_wrap" class="bg_white">
				        <div class="option">
				            <div>
				                <form onsubmit="searchPlaces(); return false;">
				                    키워드 : <input type="text" spellcheck="false" value="혜화역 맛집" id="keyword" size="15"> 
				                    <button class="search_button" type="submit">검색하기</button> 
				                </form>
				            </div>
				        </div>
				        <hr>
				        <ul id="placesList"></ul>
				        <div id="pagination"></div>
				    </div>
				</div>
			</div>
			
			
			
			</c:if>
			
			<c:if test="${travelPrivacy eq 'f'}" >
				<c:if test=" ${follow eq 'N' or follow eq 'U' or follow eq null}">
				<div>팔로우한 유저만 볼 수 있는 페이지 입니다.</div>
				</c:if>
			</c:if>
			
			<c:if test="${travelPrivacy eq 'p' and writer != sessionScope.memberId }">
				<div>글쓴이만 볼 수 있는 페이지 입니다.</div>
			</c:if>
			
			
		
	</div>
	<%@ include file="../common/footer.jsp"%>
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

<input type="hidden" class="travel_id" value="${travelId}"/>


<script type="text/javascript"  src="//dapi.kakao.com/v2/maps/sdk.js?appkey=812e2e855f4c09a3782d4e48436912b8&libraries=services"></script>
<script>

function travelReview(e) {
    console.log("리뷰");
    
    var travelReview=document.getElementById("review").value;
    var travelId=$('.travel_id').val();
    console.log(travelReview);
    console.log(travelId);
     $.ajax({
        url:"/travel/review?travelReview="+travelReview+"&travelId="+travelId,
        method: "POST",
        success:function(result1){
     	   console.log("리뷰전송");
     	   location.reload();
     	   
    		
        }
        
     }); 
 	 
   
 	}


// 마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.581844984661, 127.00224523303), // 지도의 중심좌표
        level: 2 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

// 키워드로 장소를 검색합니다
searchPlaces();

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
</script>
</body>
<script>
/* 
$('#delete_btn').click(function(e){
	e.preventDefault();
	$('.modal').modal("show");
});
	 */
$(document).ready(function(){
	
	console.log("ok");
    $('#radio2').hide();   
    $('#radio3').hide();	
    $('#traffic').hide();
		
	$("input[name='radio1']").change(function(){
		
		if($("input[name='radio1']:checked").val() == 'schedule'){
			$('#schedule').show();
			$('#weather').hide();
			$('#traffic').hide();
		}	
		
		else if($("input[name='radio1']:checked").val() == 'weather'){
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
	
$('document').ready(function() {
	
	var gugun = '서울특별시';
	
	$.ajax({
		url : '${pageContext.request.contextPath}/api/weather?si='+ gugun,  
		type : 'get',

		success : function(data) {
			
			if(data == null) {
				$("#weatherInfoText").text("날씨를 불러오는 중 오류가 발생했습니다.");
			} else {
				var lastUpdateTime = data.time;
				var temp = data.temp;
				var rainAmount = data.rainAmount;
				var humid = data.humid;
				var rainState = data.rainState;
				var windDir = data.windDir;
				var windSpd = data.windSpd;
				
				if (rainState == 0) {
					sunnyImg = $('<img>', {
						'src' : '${pageContext.request.contextPath}/resources/images/sunny.png'});
					$(sunnyImg).appendTo('#weatherImg');
				} else if ((rainState == 1) && (rainState == 5)) {
					rainImg = $('<img>', {
						'src' : '${pageContext.request.contextPath}/resources/images/rain.png'});
					$(rainImg).appendTo('#weatherImg');
				} else if ((rainState == 2) && (rainState == 6)) {
					rainSnowImg = $('<img>', {
						'src' : '${pageContext.request.contextPath}/resources/images/rainsnow.png'});
					$(rainSnowImg).appendTo('#weatherImg');
				} else if ((rainState == 3) && (rainState == 7)) {
					snowImg = $('<img>', {
						'src' : '${pageContext.request.contextPath}/resources/images/snow.png'});
					$(snowImg).appendTo('#weatherImg');
				}
				
				$(".weatherTemp").text(temp+"°");
				$('#gauge').each(function () {
			        var $this = $(this);
			        $this.animate({
			            width: humid + "%"
			        });
			    });
				
				$('#weatherHumid').text(humid+"%");
				
				$("#weatherRainamount").text("💧  " + rainAmount+"mm");
				$("#weatherWindSpd").text("🚩  " + windSpd + "m/s");
				
				
				 
				
			}
			
			}, error : function() {
					console.log("실패");
			}
		});
	
	   
	 
	   var area0 = ["시/도 선택","서울특별시","인천광역시","대전광역시","광주광역시","대구광역시","울산광역시","부산광역시","경기도","강원도","충청북도","충청남도","전라북도","전라남도","경상북도","경상남도","제주도"];
	   var area1 = ["시 선택", "서울특별시"];
	   var area2 = ["시 선택", "인천광역시"];
	   var area3 = ["시 선택", "대전광역시"];
	   var area4 = ["시 선택", "광주광역시"];
	   var area5 = ["시 선택", "대구광역시"];
	   var area6 = ["시 선택", "울산광역시"];
	   var area7 = ["시 선택", "부산광역시"];
	   var area8 = ["구/군 선택", "고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
	   var area9 = ["구/군 선택", "강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
	   var area10 = ["구/군 선택", "제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];
	   var area11 = ["구/군 선택", "계룡시","공주시","논산시","보령시","서산시","아산시","천안시","금산군","당진군","부여군","서천군","예산군","청양군","태안군","홍성군"];
	   var area12 = ["구/군 선택", "군산시","김제시","남원시","익산시","전주시","정읍시","고창군","무주군","부안군","순창군","완주군","임실군","장수군","진안군"];
	   var area13 = ["구/군 선택", "광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
	   var area14 = ["구/군 선택", "경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
	   var area15 = ["구/군 선택", "거제시","김해시","밀양시","사천시","양산시","진주시","창원시","통영시","거창군","산청군","의령군","창녕군","하동군","합천군"];
	   var area16 = ["시 선택", "제주특별자치도"];
	   
	   
	   $('#sido1').val(area0[1]).prop("selected",true);
	   $('#gugun1').val(area1[1]).prop("selected",true);
	   
	   $("select[name^=gugun]").change(function getItem(){
		   $("#weatherImg *").remove();
		   $(".weatherTemp *").remove();
		   $("#weatherRainamount *").remove();
		   $("#weatherWindSpd *").remove();
		   $("#gauge *").remove();
		   $(".gauge_title").css("display", "block");
		   

		   gugun = $("select[name=gugun1]").val();
			
		   $.ajax({
				url : '${pageContext.request.contextPath}/api/weather?si='+ gugun, // 
				type : 'get',
		
				success : function(data) {
					
					if(data == null) {
						$("#weatherInfoText").text("날씨를 불러오는 중 오류가 발생했습니다.");
					} else {
						var lastUpdateTime = data.time;
						var temp = data.temp;
						var rainAmount = data.rainAmount;
						var humid = data.humid;
						var rainState = data.rainState;
						var windDir = data.windDir;
						var windSpd = data.windSpd;
						
						if (rainState == 0) {
							sunnyImg = $('<img>', {
								'src' : '${pageContext.request.contextPath}/resources/images/sunny.png'});
							$(sunnyImg).appendTo('#weatherImg');
						} else if ((rainState == 1) && (rainState == 5)) {
							rainImg = $('<img>', {
								'src' : '${pageContext.request.contextPath}/resources/images/rain.png'});
							$(rainImg).appendTo('#weatherImg');
						} else if ((rainState == 2) && (rainState == 6)) {
							rainSnowImg = $('<img>', {
								'src' : '${pageContext.request.contextPath}/resources/images/rainsnow.png'});
							$(rainSnowImg).appendTo('#weatherImg');
						} else if ((rainState == 3) && (rainState == 7)) {
							snowImg = $('<img>', {
								'src' : '${pageContext.request.contextPath}/resources/images/snow.png'});
							$(snowImg).appendTo('#weatherImg');
						}
						
						$(".weatherTemp").text(temp+"°");
						$('#gauge').each(function () {
					        var $this = $(this);
					        $this.animate({
					            width: humid + "%"
					        });
					    });
						
						$('#weatherHumid').text(humid+"%");
						
						$("#weatherRainamount").text("💧  " + rainAmount+"mm");
						$("#weatherWindSpd").text("🚩  " + windSpd + "m/s");
						
						
						 
						
					}
					
					}, error : function() {
							console.log("실패");
					}
				});
		  	
		 });
	   



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