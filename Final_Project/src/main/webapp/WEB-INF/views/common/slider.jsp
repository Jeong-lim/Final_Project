<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
	
  <script>
    $(document).ready(function(){
    	$('.bxslider').bxSlider({
    		  auto: true,
    		  autoControls: true,
    		  stopAutoOnClick: true,
    		  pager: true,
    		  slideWidth: 1000
    		});
    	});
  </script>
  
  <style>
  .bxslider {
  	z-index: 1;
  }
  	.slider_img_container {

	 margin: 0px auto;
}

.bx-wrapper .bx-controls-direction a {
	display: none;
}

.bx-wrapper {
	margin-top: 2%;
	border: none;
	box-shadow: none;
	margin: 0 auto;
}

  </style>
</head>
<body>
		
	<div class="bxslider">
		<div class="image_container">
			<img class="slider_img_container" src="${pageContext.request.contextPath}/resources/images/slider1.png" />
		</div>
		<div class="image_container">
			<img class="slider_img_container" src="${pageContext.request.contextPath}/resources/images/slider2.png" />
		</div>
		<div class="image_container">
			<img class="slider_img_container" src="${pageContext.request.contextPath}/resources/images/slider3.png" />
		</div>
	</div>
</body>
</html>