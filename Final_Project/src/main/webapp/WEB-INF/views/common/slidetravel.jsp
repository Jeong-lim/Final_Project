<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@media only screen and (min-width: 1100px) {
	#slider-container #slider .slide {
		width: calc(2.5% - 20px);
	}
}

@media only screen and (max-width: 1100px) {
	#slider-container #slider .slide {
		width: calc(3.3333333% - 20px);
	}
}

@media only screen and (max-width: 900px) {
	#slider-container #slider .slide {
		width: calc(5% - 20px);
	}
}

@media only screen and (max-width: 550px) {
	#slider-container #slider .slide {
		width: calc(10% - 20px);
	}
}

.slide {
	display: none;
}

#container {
	margin: 0;
	padding: 0;
	display: grid;
	place-items: center;
	margin-bottom: 100px;
	margin-top: 100px;
}

#slider-container #slider .slide {
	padding-bottom: 40px;
}

#slider-container {
	height: 300px;
	width: 1070px;
	position:relative;
	overflow: hidden;
	padding-bottom: 60px;
}

#slider-container .btn {
	position: absolute;
	top: calc(50%);
	height: 15px;
	width: 15px;
	border-left: 5px solid #3B82F6;
	border-top: 5px solid #3B82F6;
	z-index: 3;
	cursor: pointer;
}

#slider-container .btn:hover {
	transform: scale(1.2);
}

#slider-container .btn.inactive {
	border-color: #1D4ED8;
}

#slider-container .btn:first-of-type {
	transform: rotate(-45deg);
	left: 10px
}

#slider-container .btn:last-of-type {
	transform: rotate(135deg);
	right: 10px;
}

#slider-container #slider {
	display: flex;
	width: 1000%;
	height: 100%;
	transition: all .5s;
}

#slider-container #slider .slide {
	height: 100%;
	margin: auto 10px;
	display: grid;
	place-items: center;
	text-align: center;
}

.image-thumbnail {
	width: 230px;
	height: 350px;
	object-fit: cover;
	border-radius: 20px;
}

.travel_thumbnail_text {
	position: absolute;
	font-size: xx-large;
	color: white;
	font-weight: bolder;
}




.slider__a__ {
	display: block;
	width: auto;
	text-decoration: none;
	margin: 5px;
}

.slider__a__ .screen {
	position: relative;
	overflow: hidden;
}

.slider__a__ .screen .top {
	position: absolute;
	bottom: 150%;
	left: 10px;
	z-index: 2;
	color: #fff;
	font-size: 26px;
	font-weight: 900;
	transition: all .35s;
	text-align: left;
}

.slider__a__ .screen .bottom {
	position: absolute;
	top: 150%;
	left: 20px;
	z-index: 2;
	color: #fff;
	font-size: 12px;
	transition: all .35s;
}



.slider__a__ .screen::after {
	content: '';
	display: block;
	position: absolute;
	top: 0;
	left: 0;
	width: 230px;
	height: 350px;
	background: rgba(0, 0, 0, .5);
	z-index: 1;
	opacity: 0;
	transition: all .35s;
	border-radius: 20px;
}

.slider__a__:hover .top {
	bottom: 52%;
}

.slider__a__:hover .bottom {
	top: 52%;
}

.slider__a__:hover .screen::after {
	opacity: 1;
	border-radius: 20px;
}
.slider__travel {
	width: 1000px;
	margin: 0 auto;
}

.slider__travel__header {
	font-size: 40px;
	font-weight: bold;
	color: #4E4C48;
}

.slider__travel__text {
	font-size: 20px;
	color: #3B82F6;
	margin-top: 10px;
	margin-bottom: 20px;
}

</style>
</head>
<body>


	<div id="container">
			<div class="slider__travel">
	<div class="slider__travel__header">TRAVELY 추천 코스</div>
	<div class="slider__travel__text">TRAVELY에서 추천한 여행코스‼️ 함께 보실래요 ⁉️</div>
	</div>
		<div id="slider-container">
			<span onclick="slideRight()" class="btn"></span>
			<div id="slider">
				<div class="slide">
				<a class="slider__a__" href="">
					<div class="screen">
					<div class="top">닥밭골벽화마을 코스</div>
					<div class="bottom">TRAVELY</div>
					<img class="image-thumbnail" src="${pageContext.request.contextPath}/resources/images/닥밭골벽화마을.jpg" />
</div>				
				</a>
				</div>
				
				
 				<div class="slide">
				<a class="slider__a__" href="">
					<div class="screen">
					<div class="top">올 여름은 망상해수욕장으로</div>
					<div class="bottom">TRAVELY</div>
					<img class="image-thumbnail" src="${pageContext.request.contextPath}/resources/images/망상해수욕장역.jpg" />
</div>
				</a>
				</div>
				<div class="slide">
				<a class="slider__a__" href="">
					<div class="screen">
					<div class="top">제주도하면 뭐? 우도</div>
					<div class="bottom">TRAVELY</div>
					<img class="image-thumbnail" src="${pageContext.request.contextPath}/resources/images/우도.jpg" />
</div>
				</a>
				</div>
				<div class="slide">
				<a class="slider__a__" href="">
					<div class="screen">
					<div class="top">월류봉으로 가는 코스</div>
					<div class="bottom">TRAVELY</div>
					<img class="image-thumbnail" src="${pageContext.request.contextPath}/resources/images/월류봉.jpg" />
</div>
				</a>
				</div>
				<div class="slide">
				<a class="slider__a__" href="">
					<div class="screen">
					<div class="top">트리인블루라고 들어보셨나요?</div>
					<div class="bottom">TRAVELY</div>
					<img class="image-thumbnail" src="${pageContext.request.contextPath}/resources/images/트리인블루.jpg" />
</div>
				</a>
				</div>
				</div>
			
			<span onclick="slideLeft()" class="btn"></span>
			</div>
			
		</div>
	</div>
	<script>
	var container = document.getElementById('container')
	var slider = document.getElementById('slider');
	var slides = document.getElementsByClassName('slide').length;
	var buttons = document.getElementsByClassName('btn');


	var currentPosition = 0;
	var currentMargin = 0;
	var slidesPerPage = 0;
	var slidesCount = slides - slidesPerPage;
	var containerWidth = container.offsetWidth;
	var prevKeyActive = false;
	var nextKeyActive = true;

	window.addEventListener("resize", checkWidth);

	function checkWidth() {
	    containerWidth = container.offsetWidth;
	    setParams(containerWidth);
	}

	function setParams(w) {
	    if (w < 551) {
	        slidesPerPage = 1;
	    } else {
	        if (w < 901) {
	            slidesPerPage = 2;
	        } else {
	            if (w < 1101) {
	                slidesPerPage = 3;
	            } else {
	                slidesPerPage = 4;
	            }
	        }
	    }
	    slidesCount = slides - slidesPerPage;
	    if (currentPosition > slidesCount) {
	        currentPosition -= slidesPerPage;
	    };
	    currentMargin = - currentPosition * (100 / slidesPerPage);
	    slider.style.marginLeft = currentMargin + '%';
	    if (currentPosition > 0) {
	        buttons[0].classList.remove('inactive');
	    }
	    if (currentPosition < slidesCount) {
	        buttons[1].classList.remove('inactive');
	    }
	    if (currentPosition >= slidesCount) {
	        buttons[1].classList.add('inactive');
	    }
	}

	setParams();

	function slideRight() {
	    if (currentPosition != 0) {
	        slider.style.marginLeft = currentMargin + (100 / slidesPerPage) + '%';
	        currentMargin += (100 / slidesPerPage);
	        currentPosition--;
	    };
	    if (currentPosition === 0) {
	        buttons[0].classList.add('inactive');
	    }
	    if (currentPosition < slidesCount) {
	        buttons[1].classList.remove('inactive');
	    }
	};

	function slideLeft() {
	    if (currentPosition != slidesCount) {
	        slider.style.marginLeft = currentMargin - (100 / slidesPerPage) + '%';
	        currentMargin -= (100 / slidesPerPage);
	        currentPosition++;
	    };
	    if (currentPosition == slidesCount) {
	        buttons[1].classList.add('inactive');
	    }
	    if (currentPosition > 0) {
	        buttons[0].classList.remove('inactive');
	    }
	};
	</script>
</body>
</html>