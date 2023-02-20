<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sliderbanner.css" />
</head>
<body>

	<div id="floatMenu">
		<div class="weather_container">
			<div id="weather_icon">☁️</div>
			<div id="weather_state"></div>
			<div id="weather_air"></div>
		</div>
		<div class="place_container">
			<p class="place_con_tit">Travely가 추천하는 주변 관광지</p>
			<div class="place_con_img">
				<ul class="place_con_ul">
					
				</ul>
			</div>
		</div>
		<div class="container">
			<div class="leaderboard">
				<div class="head">
					<i class="fas fa-crown"></i>
					<div>✈️ 실시간 여행 인기코스 ✈️</div>
				</div>
				<div class="body">
					<c:forEach var="bestPlaceList" items="${bestTravelList}" varStatus="status">
						<a href="<c:url value='travel/${bestPlaceList.travelId}/${bestPlaceList.writer}'/>"><li id="floating__banner_${status.count}">${bestPlaceList.travelTitle}</li></a>
					</c:forEach>
				
					
				
					<%-- <a href="<c:url value='/travel/detail'/>"><li id="floating__banner_1">꼭 가봐야 할 3박4일 서울 여행</li></a>
					<a href="<c:url value='/travel/detail'/>"><li id="floating__banner_2">아이들과 가기 좋은 역사 여행</li></a>
					<a href="<c:url value='/travel/detail'/>"><li id="floating__banner_3">남자친구랑 떠나는 남산 타워 투어</li></a>
					<a href="<c:url value='/travel/detail'/>"><li id="floating__banner_4">부모님과 함께하는 효도 여행 코스</li></a>
					<a href="<c:url value='/travel/detail'/>"><li id="floating__banner_5">겨울에도 함께할 수 있는 여행 코스</li></a> --%>
				</div>
			</div>

		</div>
	</div>
	
	<a href="/" class="top"><img src="${pageContext.request.contextPath}/resources/images/topbutton.png"></a>
	
	<%@ include file="/WEB-INF/views/common/slider.jsp"%>	
	<%@ include file="/WEB-INF/views/common/advertising.jsp"%>
	<%@ include file="/WEB-INF/views/common/information.jsp"%>
	<br /><br />

		<c:if test="${not empty sessionScope.memberId}">
				<div class="slider__banner">
					<div class="slider__banner__header">나의 여행 일지</div>
					<div class="slider__banner__text">TRAVELY에서 작성한 여행 일지를 확인해보세요!</div>
				</div>
				<div class="section">
					<input type="radio" name="slide" id="slide01" checked> <input
						type="radio" name="slide" id="slide02"> <input type="radio"
						name="slide" id="slide03"> <input type="radio" name="slide"
						id="slide04">
					<div class="slidewrap">
			<%@ include file="/WEB-INF/views/common/sliderbanner.jsp"%>
			
			</div>
			<!-- 페이징 -->
			<ul class="slide-pagelist">
				<li><label for="slide01"></label></li>
				<li><label for="slide02"></label></li>
				<li><label for="slide03"></label></li>
			</ul>
		


	</div>
	
</div>
		</c:if>
	<%@ include file="/WEB-INF/views/common/slidetravel.jsp"%>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	

</body>

	<script>
	navigator.geolocation.getCurrentPosition(onGeoOk, onGeoError);
	var lat;
	var lng;
	var nowTemp;
	var nowHumid;
	var weather;
	var wind;
	var country;
	var cloud;
	var sunrise;
	var sunset;
	var air;
	function onGeoOk(position) {
	  lat = position.coords.latitude; //위도
	  lng = position.coords.longitude;  //경도
       $.ajax({
           url: 'https://api.openweathermap.org/data/2.5/weather?lat='+lat+'&lon='+lng+'&appid=91de9c0159f4971a9cc7231b11927a64',
           dataType: "json",
           type: "GET",
           async: "false",
           success: function(resp) {
        	   
        	   nowTemp = resp.main.temp- 273.15;
               nowHumid = resp.main.humidity;
    		   weather = resp.weather[0].id;
    		   wind = resp.wind.speed;
    		   country = resp.name;
    		   cloud = resp.clouds.all;
    		   sunrise = resp.sys.sunrise;
    		   sunset = resp.sys.sunset;
        	   
        	   $.ajax({
                   url: 'http://api.openweathermap.org/data/2.5/air_pollution?lat='+lat+'&lon='+lng+'&appid=91de9c0159f4971a9cc7231b11927a64',
                   dataType: "json",
                   type: "GET",
                   async: "false",
                   success: function(res) {
                       /* console.log("대기질 심각 레벨 : "+ resp.list[0].main.aqi); // 레벨 5까지 */
                       air = res.list[0].main.aqi;
                       
                       selectWeatherInfo(nowTemp, nowHumid, weather, wind, country, cloud, sunrise, sunset, air);
                       
                       selectPlaceList(resp, air);
                   }
               });
        	  
        	   
        
               
               nowTemp = resp.main.temp- 273.15;
               nowHumid = resp.main.humidity;
    		   weather = resp.weather[0].id;
    		   wind = resp.wind.speed;
    		   country = resp.name;
    		   cloud = resp.clouds.all;
    		   sunrise = resp.sys.sunrise;
    		   sunset = resp.sys.sunset;

           }
       });
       
       
       
       
   };
 
  
	   
	   
	
   
   
   function selectPlaceList(resp, air){
	   
	   $.ajax({
		  
		  type:"POST",
		  url:'/selectPlaceList?city='+resp.name+'&lat='+lat+'&lng='+lng+'&weather='+resp.weather[0].main+'&temp='+(resp.main.temp-273.15)+'&air='+(air),
		  success:function(result){
			  console.log("결과값" + result);
			  for(var i=0; i<result.length; i++){
				  
				  var str='';
				  str+=`<li><a href="<c:url value='/place/detail/`+result[i].placeName+`'/>"><div class="screen"><div class="top">`+result[i].placeName+`</div><div class="bottom">`+result[i].distance+`km</div><img src="<spring:url value='/place/`+result[i].fileSavedName+`'/>"/></div></a></li>`;
				  
				  $(".place_con_ul").append(str);
			  } 
			  
		  }
	   });
	   
   }
	   
	

	function onGeoError() {
	  
	}
	
	/* 날씨 정보 받아오기 */
	   function selectWeatherInfo(nowTemp, nowHumid, weather, wind, country, cloud, sunrise, sunset, air) {
		   
		   
		   var today = new Date();
		   var nowTime = today.getTime();
		   var nowTime2 = nowTime / 1000;
			
		   /* const sunriseDiv = document.getElementById('weather_sunshine'); */
		   const airDiv = document.getElementById('weather_air');
		   const stateDiv = document.getElementById('weather_state');
		   console.log(nowTime2);
		   
		   /* 일몰 일출 */
		  /*  
		   if(nowTime2 <= sunset) {
			   const newText = document.createTextNode('오늘 하루도 힘찬 하루 되세요~');
			   sunriseDiv.appendChild(newText);
		   } else if (nowTime2 >= sunset) {
			   const newText = document.createTextNode('야간 운전 조심하세요~');
			   sunriseDiv.appendChild(newText);
		   } */
		   
		   /* 날씨 */
		   if(nowTemp <= 0) {
			   if(nowHumid <= 70) {
				   if(air <= 3) {
					   const newText = document.createTextNode('날씨가 춥고 건조하지만 미세먼지가 좋아요');
					   airDiv.appendChild(newText);
				   } else if(air == 4) {
					   const newText = document.createTextNode('날씨가 춥고 건조하고 미세먼지가  보통이에요');
					   airDiv.appendChild(newText);
				   } else if(air == 5) {
					   const newText = document.createTextNode('날씨가 춥고 건조하고 미세먼지가 안좋아요');
					   airDiv.appendChild(newText);
				   }  
			   } else if(nowHumid > 70) {
				   if(air <= 3) {
					   const newText = document.createTextNode('날씨가 춥지만 습도가 적당하고 미세먼지가 좋아요');
					   airDiv.appendChild(newText);
				   } else if(air == 4) {
					   const newText = document.createTextNode('날씨가 춥지만 습도가 적당하고 미세먼지가  보통이에요');
					   airDiv.appendChild(newText);
				   } else if(air == 5) {
					   const newText = document.createTextNode('날씨가 춥지만 습도가 적당하고  미세먼지가 안좋아요');
					   airDiv.appendChild(newText);
				   } 
			   }
		   } else if( nowTemp <= 8 ){
			   if(nowHumid < 70) {
				   if(air <= 3) {
					   const newText = document.createTextNode('날씨가 쌀쌀하고 건조하지만 미세먼지가 좋아요');
					   airDiv.appendChild(newText);
				   } else if(air == 4) {
					   const newText = document.createTextNode('날씨가 쌀쌀하고 건조하지만 미세먼지가  보통이에요');
					   airDiv.appendChild(newText);
				   } else if(air == 5) {
					   const newText = document.createTextNode('날씨가 쌀쌀하고 건조하지만  미세먼지가 안좋아요');
					   airDiv.appendChild(newText);
				   } 

			   } else if(nowHumid >= 70) {
				   if(air <= 3) {
					   const newText = document.createTextNode('날씨가 쌀쌀하지만 습도가 적당하고 미세먼지가 좋아요');
					   airDiv.appendChild(newText);
				   } else if(air == 4) {
					   const newText = document.createTextNode('날씨가 쌀쌀하지만 습도가 적당하고 미세먼지가  보통이에요');
					   airDiv.appendChild(newText);
				   } else if(air == 5) {
					   const newText = document.createTextNode('날씨가 쌀쌀하지만 습도가 적당하고  미세먼지가 안좋아요');
					   airDiv.appendChild(newText);
				   } 
			   }
		   } else if( (nowTemp > 8) && (nowTemp <= 18) ){
			   if(nowHumid < 70) {
				   if(air <= 3) {
					   const newText = document.createTextNode('날씨가 선선하고 건조하지만 미세먼지가 좋아요');
					   airDiv.appendChild(newText);
				   } else if(air == 4) {
					   const newText = document.createTextNode('날씨가 선선하고 건조하지만 미세먼지가 보통이에요');
					   airDiv.appendChild(newText);
				   } else if(air == 5) {
					   const newText = document.createTextNode('날씨가 선선하고 건조하지만  미세먼지가 안좋아요');
					   airDiv.appendChild(newText);
				   }
				   
				   
				   
			   } else if(nowHumid >= 70) {
				   if(air <= 3) {
					   const newText = document.createTextNode('날씨가 선선하고 습도가 적당하고 미세먼지가 좋아요');
					   airDiv.appendChild(newText);
				   } else if(air == 4) {
					   const newText = document.createTextNode('날씨가 선선하고 습도가 적당하고 미세먼지가  보통이에요');
					   airDiv.appendChild(newText);
				   } else if(air == 5) {
					   const newText = document.createTextNode('날씨가 선선하고 습도가 적당하고  미세먼지가 안좋아요');
					   airDiv.appendChild(newText);
				   }

			   }
		   } else if( (nowTemp > 18) && (nowTemp <= 25) ){
			   if((nowTemp > 18) && (nowTemp <= 20)) {
				   if(nowHumid < 60) {
					   if(air <= 3) {
						   const newText = document.createTextNode('날씨가 따뜻하지만 건조하고 미세먼지가 좋아요');
						   airDiv.appendChild(newText);
					   } else if(air == 4) {
						   const newText = document.createTextNode('날씨가 따뜻하지만 건조하고 미세먼지가  보통이에요');
						   airDiv.appendChild(newText);
					   } else if(air == 5) {
						   const newText = document.createTextNode('날씨가 따뜻하지만 건조하고  미세먼지가 안좋아요');
						   airDiv.appendChild(newText);
					   }

				   } else if(nowHumid >= 60) {
					   if(air <= 3) {
						   const newText = document.createTextNode('날씨가 따뜻하고 습도도 적당하고 미세먼지가 좋아요');
						   airDiv.appendChild(newText);
					   } else if(air == 4) {
						   const newText = document.createTextNode('날씨가 따뜻하고 습도도 적당하고 미세먼지가  보통이에요');
						   airDiv.appendChild(newText);
					   } else if(air == 5) {
						   const newText = document.createTextNode('날씨가 따뜻하고 습도도 적당하고  미세먼지가 안좋아요');
						   airDiv.appendChild(newText);
					   }

				   }
			   } else if((nowTemp > 21) && (nowTemp <= 23)) {
				   if(nowHumid < 50) {
					   if(air <= 3) {
						   const newText = document.createTextNode('날씨가 따뜻하고 건조하지만 미세먼지가 좋아요');
						   airDiv.appendChild(newText);
					   } else if(air == 4) {
						   const newText = document.createTextNode('날씨가 따뜻하고 건조하지만 미세먼지가  보통이에요');
						   airDiv.appendChild(newText);
					   } else if(air == 5) {
						   const newText = document.createTextNode('날씨가 따뜻하고 건조하지만  미세먼지가 안좋아요');
						   airDiv.appendChild(newText);
					   }

				   } else if(nowHumid >= 50) {
					   if(air <= 3) {
						   const newText = document.createTextNode('날씨도 따뜻하고 습도도 쾌적하고 미세먼지가 좋아요');
						   airDiv.appendChild(newText);
					   } else if(air == 4) {
						   const newText = document.createTextNode('날씨도 따뜻하고 습도도 쾌적하지만 미세먼지가  보통이에요');
						   airDiv.appendChild(newText);
					   } else if(air == 5) {
						   const newText = document.createTextNode('날씨도 따뜻하고 습도도 쾌적하지만  미세먼지가 안좋아요');
						   airDiv.appendChild(newText);
					   }

				   }
			   }
		   } else if( nowTemp >= 30 ){
			   if(nowHumid < 40) {
				   if(air <= 3) {
					   const newText = document.createTextNode('날씨도 덥지만 습도는 건조한 편이고 미세먼지가 좋아요');
					   airDiv.appendChild(newText);
				   } else if(air == 4) {
					   const newText = document.createTextNode('날씨도 덥지만 습도는 건조한 편이고 미세먼지가  보통이에요');
					   airDiv.appendChild(newText);
				   } else if(air == 5) {
					   const newText = document.createTextNode('날씨도 덥지만 습도는 건조한 편이고  미세먼지가 안좋아요');
					   airDiv.appendChild(newText);
				   }
			   } else if(nowHumid >= 40) {
				   if(air <= 3) {
					   const newText = document.createTextNode('날씨도 덥지만 습도는 적당하고 미세먼지가 좋아요');
					   airDiv.appendChild(newText);
				   } else if(air == 4) {
					   const newText = document.createTextNode('날씨도 덥지만 습도는 적당하고 미세먼지가  보통이에요');
					   airDiv.appendChild(newText);
				   } else if(air == 5) {
					   const newText = document.createTextNode('날씨도 덥지만습도는 적당하고  미세먼지가 안좋아요');
					   airDiv.appendChild(newText);
				   }
			   } else if(nowHumid >= 70) {
				   if(air <= 3) {
					   const newText = document.createTextNode('날씨도 덥고 습도가 높지만 미세먼지가 좋아요');
					   airDiv.appendChild(newText);
				   } else if(air == 4) {
					   const newText = document.createTextNode('날씨가 덥고 습도도 높고 미세먼지가  보통이에요');
					   airDiv.appendChild(newText);
				   } else if(air == 5) {
					   const newText = document.createTextNode('날씨도 덥지만 습도도 높고  미세먼지가 안좋아요');
					   airDiv.appendChild(newText);
				   }
			   }
		   }

		   
		   if(weather < 300) {
			   const newText = document.createTextNode('오늘은 번개가 치는 날이네요');
			   stateDiv.appendChild(newText);
		   } else if(weather < 400) {
			   const newText = document.createTextNode('오늘은 이슬비가 오는 날이네요');
			   stateDiv.appendChild(newText);
		   } else if(weather < 600) {
			   const newText = document.createTextNode('오늘은 비가 오는 날이네요');
			   stateDiv.appendChild(newText);
		   } else if(weather < 700) {
			   const newText = document.createTextNode('오늘은 눈이 오는 날이네요');
			   stateDiv.appendChild(newText);
		   } else if(weather < 800) {
			   const newText = document.createTextNode('오늘은 안개가 끼는 날이네요');
			   stateDiv.appendChild(newText);
		   } else if(weather == 800) {
			   const newText = document.createTextNode('오늘은 맑은 날이네요');
			   stateDiv.appendChild(newText);
		   } else if(weather < 900) {
			   const newText = document.createTextNode('오늘은 구름이 낀 날이네요');
			   stateDiv.appendChild(newText);
		   } else if(weather >= 900) {
			   const newText = document.createTextNode('오늘은 날씨가 안좋아요 외출을 삼가해주세요');
			   stateDiv.appendChild(newText);
		   }
		   
	
		   
		  
	   };


</script>
	<script>
		$(function(){
	        $( window ).scroll( function() {
	          if ( $( this ).scrollTop() > 200 ) {
	            $( '.top' ).fadeIn();
	          } else {
	            $( '.top' ).fadeOut();
	          }
	        } );
	        $( '.top' ).click( function() {
	          $( 'html, body' ).animate( { scrollTop : 0 }, 400 );
	          return false;
	        } );
	      } );
		$(function(){
	        $('#news-container').vTicker({ 
	            speed: 500,
	            pause: 3000,
	            animation: 'fade',
	            mousePause: false,
	            showItems: 1
	        
	        });
	    });

		(function(a) {
			a.fn.vTicker = function(b) {
				var c = {
					speed : 700,
					pause : 4000,
					showItems : 3,
					animation : "",
					mousePause : true,
					isPaused : false,
					direction : "up",
					height : 0
				};
				var b = a.extend(c, b);
				moveUp = function(g, d, e) {
					if (e.isPaused) {
						return
					}
					var f = g.children("ul");
					var h = f.children("li:first").clone(true);
					if (e.height > 0) {
						d = f.children("li:first").height()
					}
					f.animate({
						top : "-=" + d + "px"
					}, e.speed, function() {
						a(this).children("li:first").remove();
						a(this).css("top", "0px")
					});
					if (e.animation == "fade") {
						f.children("li:first").fadeOut(e.speed);
						if (e.height == 0) {
							f.children("li:eq(" + e.showItems + ")").hide()
									.fadeIn(e.speed)
						}
					}
					h.appendTo(f)
				};
				moveDown = function(g, d, e) {
					if (e.isPaused) {
						return
					}
					var f = g.children("ul");
					var h = f.children("li:last").clone(true);
					if (e.height > 0) {
						d = f.children("li:first").height()
					}
					f.css("top", "-" + d + "px").prepend(h);
					f.animate({
						top : 0
					}, e.speed, function() {
						a(this).children("li:last").remove()
					});
					if (e.animation == "fade") {
						if (e.height == 0) {
							f.children("li:eq(" + e.showItems + ")").fadeOut(
									e.speed)
						}
						f.children("li:first").hide().fadeIn(e.speed)
					}
				};
				return this.each(function() {
					var f = a(this);
					var e = 0;
					f.css({
						overflow : "hidden",
						position : "relative"
					}).children("ul").css({
						position : "absolute",
						margin : 0,
						padding : 0
					}).children("li").css({
						margin : 0,
						padding : 0
					});
					if (b.height == 0) {
						f.children("ul").children("li").each(function() {
							if (a(this).height() > e) {
								e = a(this).height()
							}
						});
						f.children("ul").children("li").each(function() {
							a(this).height(e)
						});
						f.height(e * b.showItems)
					} else {
						f.height(b.height)
					}
					var d = setInterval(function() {
						if (b.direction == "up") {
							moveUp(f, e, b)
						} else {
							moveDown(f, e, b)
						}
					}, b.pause);
					if (b.mousePause) {
						f.bind("mouseenter", function() {
							b.isPaused = true
						}).bind("mouseleave", function() {
							b.isPaused = false
						})
					}
				})
			}
		})(jQuery);
	</script>
	<script>
	$(document).ready(function() {

		// 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
		var floatPosition = parseInt($("#floatMenu").css('top'));
		// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );
		$(window).scroll(function() {

			// 현재 스크롤 위치를 가져온다.
			var scrollTop = $(window).scrollTop();
			var newPosition = scrollTop + floatPosition + "px";
			$("#floatMenu").stop().animate({
				"top" : newPosition
			}, 650);

		}).scroll();

	});
	
	$(document).ready(function() {

		// 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
		var floatWeather = parseInt($("#floatWeather").css('top'));
		// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );
		$(window).scroll(function() {

			// 현재 스크롤 위치를 가져온다.
			var scrollTop = $(window).scrollTop();
			var newPosition = scrollTop + floatWeather + "px";
			$("#floatWeather").stop().animate({
				"top" : newPosition
			}, 650);

		}).scroll();

	});
</script>
</html>