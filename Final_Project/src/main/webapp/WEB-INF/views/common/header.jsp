<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/uikit@3.15.19/dist/css/uikit.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/header.css" />
<title>Nav bar</title>
<!-- UIkit CSS -->


</head>

<body>
	<nav class="navbar">

		<div class="navbar__logo">
			<a href="<c:url value='/'/>"> <img class="logo"
				src="${pageContext.request.contextPath}/resources/images/logo.png" />
			</a>
		</div>
		<ul class="navbar__menu">
			<li class="hvr-underline-from-center"><a class="header__a_tag"
				href="/place">관광지</a></li>
			<li class="hvr-underline-from-center"><a class="header__a_tag"
				href="/travel/list">여행 일정</a></li>
			<li class="hvr-underline-from-center"><a class="header__a_tag"
				href="/travel/insert">여행 일정 등록</a></li>
		</ul>
		<div>
			<div class="uk-inline">
				<button class="uk-button uk-button-default" type="button">
					<img class="header__alarm__img"
						src="${pageContext.request.contextPath}/resources/images/alarm_full.png">
				</button>
				<div class="uk-dropdown-large"
					uk-dropdown="mode: click; offset: 10; bg-scroll: true">
					<ul class="uk-nav uk-dropdown-nav">
						<li class="uk-active"><a href="<c:url value='/mypage'/>">rkdudrhdwn99이 회원님을 팔로우
								하였습니다.</a></li>
						<li class="uk-active"><a href="<c:url value='/mypage'/>">rkdudchlrh99이 회원님을 팔로우
								하였습니다.</a></li>
						<li class="uk-active"><a href="<c:url value='/mypage'/>">dudtjghkdlxld98이 회원님을
								팔로우 하였습니다.</a></li>
						<li class="uk-active"><a href="<c:url value='/mypage'/>">wjdflaqorhvk00이 회원님을
								팔로우 하였습니다.</a></li>
						
					</ul>
				</div>
			</div>

			<span class="navbar__links"> <label class="navbar__links__li"
				onclick="location.href='<c:url value="/mypage"/>'"> <img
					class="user_img"
					src="${pageContext.request.contextPath}/resources/images/default_user.png" />
			</label> <label class="logout_wrapper"
				onclick="location.href='<c:url value="/signin"/>'">로그아웃</label>
			</span>
		</div>

		</div>

		<a href="#" class="navbar__toggleBtn"><i class="fas fa-bars"></i></a>
	</nav>



	<!-- UIkit JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/uikit@3.15.19/dist/js/uikit.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/uikit@3.15.19/dist/js/uikit-icons.min.js"></script>
</body>
</html>