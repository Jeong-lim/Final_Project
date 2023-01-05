<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/travellist.css" />
<%@ include file="/WEB-INF/views/common/header.jsp"%>
</head>
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