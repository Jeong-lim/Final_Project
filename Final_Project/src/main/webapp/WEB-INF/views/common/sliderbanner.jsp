<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.section input[id*="slide"] {
	display: none;
}

.section .slidewrap {
	max-width: 1000px;
	margin: 0 auto;
}

.section .slidelist {
	padding-top: 40px;
	padding-bottom: 40px;
	white-space: nowrap;
	font-size: 0;
	overflow: hidden;
	position: relative;
}

.section .slidelist>li {
	display: inline-block;
	vertical-align: middle;
	width: 100%;
	transition: all .5s;
}

.section .slidelist>li>a {
	position: relative;
}

.section .slidelist>li>a img {
	width: 100%;
}

.section .slidelist label {
	position: absolute;
	z-index: 10;
	top: 50%;
	transform: translateY(-50%);
	padding: 50px;
	cursor: pointer;
}

.section .slidelist .textbox {
	position: absolute;
	z-index: 1;
	top: 50%;
	left: 30%;
	transform: translate(-50%, -50%);
	line-height: 1.6;
	text-align: center;
}



/* input에 체크되면 슬라이드 효과 */
.section input[id="slide01"]:checked ~ .slidewrap .slidelist>li {
	transform: translateX(0%);
}

.section input[id="slide02"]:checked ~ .slidewrap .slidelist>li {
	transform: translateX(-100%);
}

.section input[id="slide03"]:checked ~ .slidewrap .slidelist>li {
	transform: translateX(-200%);
}

.section input[id="slide04"]:checked ~ .slidewrap .slidelist>li {
	transform: translateX(-200%);
}

/* 페이징 */
.slide-pagelist {
	text-align: center;
	padding: 0px;
}

.slide-pagelist>li {
	display: inline-block;
	vertical-align: middle;
}

.slide-pagelist>li>label {
	display: block;
	padding: 8px 8px;
	border-radius: 50px;
	background: #ccc;
	margin: 5px 5px;
	cursor: pointer;
}

.section input[id="slide01"]:checked ~ .slidewrap .slide-pagelist>li:nth-child(1)>label
	{
	background: #999;
}

.section input[id="slide02"]:checked ~ .slidewrap .slide-pagelist>li:nth-child(2)>label
	{
	background: #999;
}

.section input[id="slide03"]:checked ~ .slidewrap .slide-pagelist>li:nth-child(3)>label
	{
	background: #999;
}

.section input[id="slide04"]:checked ~ .slidewrap .slide-pagelist>li:nth-child(4)>label
	{
	background: #999;
}

.img_slideitem {
	width: 150px;
	height: 150px;
	float: left;
	border-radius: 50%;
}

.slidelist {
	box-shadow: 0 25.6px 57.6px 0 rgb(0 0 0/ 22%), 0 4.8px 14.4px 0
		rgb(0 0 0/ 18%);
}

.slide_travel_name {
	font-weight: bold;
	font-size: 30px;
	color: black;
	transform: translateY(70px);
	transition: all .5s;
	padding-left: 300px;
}

.slide_travel_period {
	float: left;
	font-size: 20px;
	color: black;
	transform: translateY(70px);
	transition: all .5s;
	padding-left: 300px;
}

.slide_travel_theme {
	float: left;
	font-size: 20px;
	color: black;
	transform: translateY(70px);
	transition: all .5s;
	padding-left: 300px;
}

</style>
</head>

<body>
<div class="section">
	<input type="radio" name="slide" id="slide01" checked>
	<input type="radio" name="slide" id="slide02">
	<input type="radio" name="slide" id="slide03">
	<input type="radio" name="slide" id="slide04">
	<div class="slidewrap">
		
		<ul class="slidelist">
			<!-- 슬라이드 영역 -->
			<li class="slideitem">
				<img class="img_slideitem" src="${pageContext.request.contextPath}/resources/images/청계천.jpg" />
				<a>
					<div class="textbox">
						<div class="slide_travel_name">12월 여행 일지</div><br />
						<div class="slide_travel_period">2022.12.22 ~ 24</div><br />
						<div class="slide_travel_theme">자연 휴양</div><br />
					</div>
				</a>
			</li>
			<li class="slideitem">
			<img class="img_slideitem" src="${pageContext.request.contextPath}/resources/images/남산타워.jpg" />
				<a>
					<div class="textbox">
						<div class="slide_travel_name">1월 여행 일지</div><br />
						<div class="slide_travel_period">2023.1.22 ~ 24</div><br />
						<div class="slide_travel_theme">자연 휴양</div><br />
					</div>
				</a>
			</li>
			<li class="slideitem">
			<img class="img_slideitem" src="${pageContext.request.contextPath}/resources/images/경복궁.jpg" />
				<a>
					<div class="textbox">
						<div class="slide_travel_name">2월 여행 일지</div><br />
						<div class="slide_travel_period">2023.2.22 ~ 24</div><br />
						<div class="slide_travel_theme">자연 휴양</div><br />
					</div>
				</a>
			</li>


		</ul>
		<!-- 페이징 -->
		<ul class="slide-pagelist">
			<li><label for="slide01"></label></li>
			<li><label for="slide02"></label></li>
			<li><label for="slide03"></label></li>
		</ul>
	</div>

	
</div>

</body>
</html>