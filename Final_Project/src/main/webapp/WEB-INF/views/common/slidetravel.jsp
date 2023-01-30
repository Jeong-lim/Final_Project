<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slidetravel.css" />

	<div id="container">
		<div class="slider__travel">
			<div class="slider__travel__header">TRAVELY 추천 코스</div>
			<div class="slider__travel__text">TRAVELY에서 추천한 여행코스‼️ 함께 보실래요
				⁉️</div>
		</div>
		<div id="slider-container">
			<span onclick="slideRight()" class="btn"></span>
			<div id="slider">
				<div class="slide">
					<a class="slider__a__" href="">
						<div class="screen">
							<div class="top">닥밭골벽화마을 코스</div>
							<div class="bottom">TRAVELY</div>
							<img class="image-thumbnail"
								src="${pageContext.request.contextPath}/resources/images/닥밭골벽화마을.jpg" />
						</div>
					</a>
				</div>


				<div class="slide">
					<a class="slider__a__" href="">
						<div class="screen">
							<div class="top">올 여름은 망상해수욕장으로</div>
							<div class="bottom">TRAVELY</div>
							<img class="image-thumbnail"
								src="${pageContext.request.contextPath}/resources/images/망상해수욕장역.jpg" />
						</div>
					</a>
				</div>
				<div class="slide">
					<a class="slider__a__" href="">
						<div class="screen">
							<div class="top">올 여름은 망상해수욕장으로</div>
							<div class="bottom">TRAVELY</div>
							<img class="image-thumbnail"
								src="${pageContext.request.contextPath}/resources/images/망상해수욕장역.jpg" />
						</div>
					</a>
				</div>
				<div class="slide">
					<a class="slider__a__" href="">
						<div class="screen">
							<div class="top">올 여름은 망상해수욕장으로</div>
							<div class="bottom">TRAVELY</div>
							<img class="image-thumbnail"
								src="${pageContext.request.contextPath}/resources/images/망상해수욕장역.jpg" />
						</div>
					</a>
				</div>
				<div class="slide">
					<a class="slider__a__" href="">
						<div class="screen">
							<div class="top">제주도하면 뭐? 우도</div>
							<div class="bottom">TRAVELY</div>
							<img class="image-thumbnail"
								src="${pageContext.request.contextPath}/resources/images/우도.jpg" />
						</div>
					</a>
				</div>
				<div class="slide">
					<a class="slider__a__" href="">
						<div class="screen">
							<div class="top">월류봉으로 가는 코스</div>
							<div class="bottom">TRAVELY</div>
							<img class="image-thumbnail"
								src="${pageContext.request.contextPath}/resources/images/월류봉.jpg" />
						</div>
					</a>
				</div>
				<div class="slide">
					<a class="slider__a__" href="">
						<div class="screen">
							<div class="top">트리인블루라고 들어보셨나요?</div>
							<div class="bottom">TRAVELY</div>
							<img class="image-thumbnail"
								src="${pageContext.request.contextPath}/resources/images/트리인블루.jpg" />
						</div>
					</a>
				</div>
			</div>

			<span onclick="slideLeft()" class="btn"></span>
		</div>


	</div>
	
</body>
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
			}
			;
			currentMargin = -currentPosition * (100 / slidesPerPage);
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
				slider.style.marginLeft = currentMargin + (100 / slidesPerPage)
						+ '%';
				currentMargin += (100 / slidesPerPage);
				currentPosition--;
			}
			;
			if (currentPosition === 0) {
				buttons[0].classList.add('inactive');
			}
			if (currentPosition < slidesCount) {
				buttons[1].classList.remove('inactive');
			}
		};

		function slideLeft() {
			if (currentPosition != slidesCount) {
				slider.style.marginLeft = currentMargin - (100 / slidesPerPage)
						+ '%';
				currentMargin -= (100 / slidesPerPage);
				currentPosition++;
			}
			;
			if (currentPosition == slidesCount) {
				buttons[1].classList.add('inactive');
			}
			if (currentPosition > 0) {
				buttons[0].classList.remove('inactive');
			}
		};
	</script>
