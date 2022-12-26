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
#container {
	margin: 0;
	padding: 0;
	display: grid;
	place-items: center
}

#slider-container {
	height: 300px;
	width: 1000px;
	position: relative;
	overflow: hidden;
	padding: 20px;
}

#slider-container .btn {
	position: absolute;
	top: calc(50% - 30px);
	height: 30px;
	width: 30px;
	border-left: 8px solid pink;
	border-top: 8px solid pink;
}

#slider-container .btn:hover {
	transform: scale(1.2);
}

#slider-container .btn.inactive {
	border-color: rgb(153, 121, 126)
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
	background-color: #a847a4;
	box-shadow: 2px 2px 4px 2px white, -2px -2px 4px 2px white;
	display: grid;
	place-items: center;
	overflow:hidden;
	text-align: center;
}

.image-thumbnail {
	width: 100%;
	height: 100%;
	object-fit: cover;
	
}

.travel_thumbnail_text {
	position: absolute;
	font-size: xx-large;
	color: white;
	font-weight: bolder;
}

</style>
</head>
<body>
	<div id="container">
		<div id="slider-container">
			<span onclick="slideRight()" class="btn"></span>
			<div id="slider">
				<div class="slide">
					<img class="image-thumbnail" src="${pageContext.request.contextPath}/resources/images/청계천.jpg" />
					<div class="travel_thumbnail_text">당신을 위한 <br />청계천 코스</div>
				</div>
				<div class="slide">
					<img class="image-thumbnail" src="${pageContext.request.contextPath}/resources/images/청계천.jpg" />
					<div class="travel_thumbnail_text">당신을 위한 <br />청계천 코스</div>
				</div>
				<div class="slide">
					<img class="image-thumbnail" src="${pageContext.request.contextPath}/resources/images/청계천.jpg" />
					<div class="travel_thumbnail_text">당신을 위한 <br />청계천 코스</div>
				</div>
				<div class="slide">
					<img class="image-thumbnail" src="${pageContext.request.contextPath}/resources/images/청계천.jpg" />
					<div class="travel_thumbnail_text">당신을 위한 <br />청계천 코스</div>
				</div>
				<div class="slide">
					<img class="image-thumbnail" src="${pageContext.request.contextPath}/resources/images/청계천.jpg" />
					<div class="travel_thumbnail_text">당신을 위한 <br />청계천 코스</div>
				</div>
			</div>
			<span onclick="slideLeft()" class="btn"></span>
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