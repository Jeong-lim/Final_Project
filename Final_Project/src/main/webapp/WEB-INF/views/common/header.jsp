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
					uk-dropdown="animation: slide-top; animate-out: true; mode: click; offset: 20; bg-scroll: true; duration: 700">
					<ul class="uk-nav uk-dropdown-nav">
					
						<div class="follow__wrapper">
						<li class="uk-active">rkdudrhdwn99이 회원님을 팔로우 하였습니다.</li>
						<div class="follow_button__">
							<a href="<c:url value='/mypage'/>"><img class="follow_check"
								src="${pageContext.request.contextPath}/resources/images/follow_check.png" /></a>
							<a href="<c:url value='/'/>"><img class="follow_cancel"
								src="${pageContext.request.contextPath}/resources/images/follow_cancel.png" /></a>
						</div>
						</div>
						
						<div class="follow__wrapper">
						<li class="uk-active">rkdudchlrh99이 회원님을 팔로우 하였습니다.</li>
						<div class="follow_button__">
							<a href="<c:url value='/mypage'/>"> <img class="follow_check"
								src="${pageContext.request.contextPath}/resources/images/follow_check.png" /></a>
							<a href="<c:url value='/'/>"> <img class="follow_cancel"
								src="${pageContext.request.contextPath}/resources/images/follow_cancel.png" /></a>
						</div>
						</div>
						
						<div class="follow__wrapper">
						<li class="uk-active">dudtjghkdlxld98이 회원님을 팔로우 하였습니다.</li>
						<div class="follow_button__">
							<a href="<c:url value='/mypage'/>"> <img class="follow_check"
								src="${pageContext.request.contextPath}/resources/images/follow_check.png" /></a>
							<a href="<c:url value='/'/>"> <img class="follow_cancel"
								src="${pageContext.request.contextPath}/resources/images/follow_cancel.png" /></a>
						</div>
						</div>
						
						<div class="follow__wrapper">
						<li class="uk-active">wjdflaqorhvk00이 회원님을 팔로우 하였습니다.</li>
						<div class="follow_button__">
							<a href="<c:url value='/mypage'/>"> <img class="follow_check"
								src="${pageContext.request.contextPath}/resources/images/follow_check.png" /></a>
							<a href="<c:url value='/mypage'/>"> <img
								class="follow_cancel"
								src="${pageContext.request.contextPath}/resources/images/follow_cancel.png" /></a>
						</div>
						</div>

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
	</nav>
</body>
<script
	src="https://cdn.jsdelivr.net/npm/uikit@3.15.19/dist/js/uikit.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/uikit@3.15.19/dist/js/uikit-icons.min.js"></script>
</html>