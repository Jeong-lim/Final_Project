<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../common/header.jsp"%>
</head>
<style>
.container_top {
	text-align: center;
}

.container {
	width: 1000px;
	min-height: 1000px;
	margin: auto;
	text-align: left;
}
.list_tit{
	font-size:30px;
	font-weight:bold;
	margin-top:15px;
}

.select {
	height: 34px;
	margin-right: 5px;
	width: 100px;
	border-radius: 5px;
	border: 2px solid #dfdfdf;
	padding: 3px;
}

.search {
	float: right;
}

.search_bar {
	height: 30px;
	padding: 0;
	margin: 0;
	width: 250px;
	border-radius: 5px;
	border: 2px solid #dfdfdf;
}

.search_btn {
	width: 30px;
	height: 30px;
	padding: 0;
	vertical-align: middle;
	background-color: white;
	border: none;
}

.search_img {
	width: 20px;
	height: 20px;
}

.category {
	margin-top: 10px;
}

.category span {
	width: 60px;
}

.test_obj input[type="radio"] {
	display: none;
}

.test_obj input[type="radio"]+span {
	display: inline-block;
	border: 1px solid #dfdfdf;
	border-radius: 15px;
	background-color: #ffffff;
	text-align: center;
	cursor: pointer;
	font-size: 14px;
	padding: 7px 10px 5px 10px;
	height: 20px;
}

.test_obj input[type="radio"]:checked+span {
	background-color: #3B82F6;
	color: #ffffff;
}

.place {
	border: 2px solid #BDBDBD;
	margin-top: 20px;
	margin-bottom: 20px;
	height: 160px;
	border-radius: 35px;
}

.place_img {
	width: 200px;
	height: 160px;
	float: left;
	margin-right: 50px;
	border-top-left-radius: 32px;
	border-bottom-left-radius: 32px;
}

.place_list {
	margin-top: 30px;
}

.place_info {
	margin: 30px 0 0 30px;
}

.travel_title {
	font-size: 25px;
	margin: 0;
}

.travel_writer {
	font-size: 15px;
}

a {
	text-decoration: none;
	color: black;
	cursor: pointer;
}

.travel_tit {
	margin-bottom: 20px;
}

.scrap {
	cursor: pointer;
	border: none;
	box-shadow: 1px 1px 1px 0 black;
	border-radius: 3px;
	width: 60px;
	height: 28px;
	background-color: #3B82F6;
	color: white;
	font-size: 15px;
}

.scrap:hover {
	background-color: #205295;
}

.icons {
	float: right;
	margin: 10px 30px 55px 10px;
}

.views, .publish {
	width: 20px;
	margin-left: 10px;
	margin-right: 3px;
	vertical-align: middle;
}

.views {
	padding-bottom: 6px
}

::-webkit-scrollbar {
	display: none;
}
</style>
<body>
	
	<div class="container_top">
		<div class="container">
			<br>
			<div>
				<span>TRAVELY가 준비한</span>
			</div>
			<div>
				<p class="list_tit">여행 일정 리스트</p>
			</div>
			<div class="search">
				<select class="select">
					<option value="area">작성자</option>
					<option value="place">제목</option>
				</select> <input type="text" class="search_bar" value=""
					placeholder="search..">
				<button class="search_btn">
					<img class="search_img"
						src="${pageContext.request.contextPath}/resources/images/search.png" />
				</button>
			</div>
			<div class="category">
				<label class="test_obj"> <input type="radio" name="category"
					value=""> <span>최신순</span>
				</label> <label class="test_obj"> <input type="radio"
					name="category" value=""> <span>조회순</span>
				</label> <label class="test_obj"> <input type="radio"
					name="category" value=""> <span>인기순</span>
				</label>
			</div>
			<div class="place_list">

				<div class="place">
					<div class="image_wrap">
						<img class="place_img"
							src="${pageContext.request.contextPath}/resources/images/travellist1.jpg" />
					</div>
					<div class="place_info">
						<a href='<c:url value="/travel/detail"/>'>
							<p class="travel_title">꼭 가봐야 할 3박4일 서울 여행</p>
						</a> <a href='<c:url value="/mypage"/>'>
							<p class="travel_writer">작성자 rkdudrhdwn99</p>
						</a>
						<button class="scrap"
							onclick="location.href='<c:url value="/travel/insert"/>'">스크랩</button>
						<div class="icons">
							<img class="views"
								src="${pageContext.request.contextPath}/resources/images/views.png" />
							114 <img class="publish"
								src="${pageContext.request.contextPath}/resources/images/publish.png" />11
						</div>
					</div>
				</div>

				<div class="place">
					<div class="image_wrap">
						<img class="place_img"
							src="${pageContext.request.contextPath}/resources/images/travellist2.jpg" />
					</div>
					<div class="place_info">
						<a href='<c:url value="/travel/detail"/>'>
							<p class="travel_title">아이들과 가기 좋은 역사 탐방</p>
						</a> <a href='<c:url value="/mypage"/>'>
							<p class="travel_writer">작성자 dudtjahdo98</p>
						</a>
						<button class="scrap"
							onclick="location.href='<c:url value="/travel/insert"/>'">스크랩</button>
						<div class="icons">
							<img class="views"
								src="${pageContext.request.contextPath}/resources/images/views.png" />
							218 <img class="publish"
								src="${pageContext.request.contextPath}/resources/images/publish.png" />17
						</div>
					</div>
				</div>

				<div class="place">
					<div class="image_wrap">
						<img class="place_img"
							src="${pageContext.request.contextPath}/resources/images/travellist3.jpg" />
					</div>
					<div class="place_info">
						<a href='<c:url value="/travel/detail"/>'>
							<p class="travel_title">남산 타워 데이트 코스</p>
						</a> <a href='<c:url value="/mypage"/>'>
							<p class="travel_writer">작성자 wjdflarkwlak00</p>
						</a>
						<button class="scrap"
							onclick="location.href='<c:url value="/travel/insert"/>'">스크랩</button>
						<div class="icons">
							<img class="views"
								src="${pageContext.request.contextPath}/resources/images/views.png" />
							117 <img class="publish"
								src="${pageContext.request.contextPath}/resources/images/publish.png" />10
						</div>
					</div>
				</div>

				<div class="place">
					<div class="image_wrap">
						<img class="place_img"
							src="${pageContext.request.contextPath}/resources/images/travellist4.jpg" />
					</div>
					<div class="place_info">
						<a href='<c:url value="/travel/detail"/>'>
							<p class="travel_title">제주도 먹방투어</p>
						</a> <a href='<c:url value="/mypage"/>'>
							<p class="travel_writer">작성자 helpmeee1717</p>
						</a>
						<button class="scrap"
							onclick="location.href='<c:url value="/travel/insert"/>'">스크랩</button>
						<div class="icons">
							<img class="views"
								src="${pageContext.request.contextPath}/resources/images/views.png" />
							110 <img class="publish"
								src="${pageContext.request.contextPath}/resources/images/publish.png" />20
						</div>
					</div>
				</div>

			</div>
		</div>
		<div></div>
	</div>



</body>
<%@ include file="../common/footer.jsp"%>
</html>