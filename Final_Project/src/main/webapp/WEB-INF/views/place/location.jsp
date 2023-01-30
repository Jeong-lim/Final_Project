<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	location페이지
	도시이름<p id="city"></p>
	--------
	기온<p id="temp"></p>
	--------
	날씨<p id="weather"></p>
	--------
	
	
</body>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
	navigator.geolocation.getCurrentPosition(onGeoOk, onGeoError);

	function onGeoOk(position) {
	  const lat = position.coords.latitude;
	  const lng = position.coords.longitude;
	  console.log(lat);
	  console.log(lng);
	  

       $.ajax({
           url: 'https://api.openweathermap.org/data/2.5/weather?lat='+lat+'&lon='+lng+'&appid=91de9c0159f4971a9cc7231b11927a64',
           dataType: "json",
           type: "GET",
           async: "false",
           success: function(resp) {
               console.log(resp);
               console.log("현재온도 : "+ (resp.main.temp- 273.15) );
               console.log("현재습도 : "+ resp.main.humidity);
               console.log("날씨 : "+ resp.weather[0].main );
               console.log("상세날씨설명 : "+ resp.weather[0].description );
               console.log("날씨 이미지 : "+ resp.weather[0].icon );
               console.log("바람   : "+ resp.wind.speed );
               console.log("나라   : "+ resp.sys.country );
               console.log("도시이름  : "+ resp.name );
               console.log("구름  : "+ (resp.clouds.all) +"%" ); 
               $('#city').html(resp.name);
               $('#temp').html(Math.round((resp.main.temp-273.15) * 10) / 10);
               $('#weather').html(resp.weather[0].main);
           }
       });
   };
	   
	

	function onGeoError() {
	  alert("날씨 정보를 가져오지 못했어요🤔");
	}

</script>
</html>