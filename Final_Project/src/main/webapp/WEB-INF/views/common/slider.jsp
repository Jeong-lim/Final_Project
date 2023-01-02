<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slider.css" />

</head>
<body>

	<div class="bxslider">
		<div class="image_container">
			<img class="slider_img_container"
				src="${pageContext.request.contextPath}/resources/images/slider1.png" />
		</div>
		<div class="image_container">
			<img class="slider_img_container"
				src="${pageContext.request.contextPath}/resources/images/slider2.png" />
		</div>
		<div class="image_container">
			<img class="slider_img_container"
				src="${pageContext.request.contextPath}/resources/images/slider3.png" />
		</div>
	</div>
</body>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<script>
    $(document).ready(function(){
    	$('.bxslider').bxSlider({
    		  auto: true,
    		  autoControls: false,
    		  stopAutoOnClick: true,
    		  pager: true,
    		  slideWidth: 1000,
    		  speed: 400
    		});
    	});
  </script>
</html>