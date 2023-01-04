<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sliderbanner.css" />



	<div class="slider__banner">
		<div class="slider__banner__header {
">나의 여행 일지</div>
		<div class="slider__banner__text">TRAVELY에서 작성한 여행 일지를 확인해보세요!</div>
	</div>
	<div class="section">

		<input type="radio" name="slide" id="slide01" checked> <input
			type="radio" name="slide" id="slide02"> <input type="radio"
			name="slide" id="slide03"> <input type="radio" name="slide"
			id="slide04">
		<div class="slidewrap">


			<ul class="slidelist">
				<!-- 슬라이드 영역 -->

				<li class="slideitem"><img class="img_slideitem"
					src="${pageContext.request.contextPath}/resources/images/청계천.jpg" />
					<a href="<c:url value='/travel/detail'/>">
						<div class="textbox">
							<div class="slide_travel_name">12월 여행 일지</div>
							<br />
							<div class="slide_travel_period">2022.12.22 ~ 24</div>
							<br />
							<div class="slide_travel_theme">자연 휴양</div>
							<br />
						</div>
				</a></li>
				<li class="slideitem"><img class="img_slideitem"
					src="${pageContext.request.contextPath}/resources/images/남산타워.jpg" />
					<a href="<c:url value='/travel/detail'/>">
						<div class="textbox">
							<div class="slide_travel_name">1월 여행 일지</div>
							<br />
							<div class="slide_travel_period">2023.1.22 ~ 24</div>
							<br />
							<div class="slide_travel_theme">자연 휴양</div>
							<br />
						</div>
				</a></li>
				<li class="slideitem"><img class="img_slideitem"
					src="${pageContext.request.contextPath}/resources/images/경복궁.jpg" />
					<a href="<c:url value='/travel/detail'/>">
						<div class="textbox">
							<div class="slide_travel_name">2월 여행 일지</div>
							<br />
							<div class="slide_travel_period">2023.2.22 ~ 24</div>
							<br />
							<div class="slide_travel_theme">자연 휴양</div>
							<br />
						</div>
				</a></li>


			</ul>
			<!-- 페이징 -->
			<ul class="slide-pagelist">
				<li><label for="slide01"></label></li>
				<li><label for="slide02"></label></li>
				<li><label for="slide03"></label></li>
			</ul>
		</div>


	</div>
