<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/uikit@3.15.19/dist/css/uikit.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css" />
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
					uk-dropdown="mode: click; offset: 10; bg-scroll: true">
					<ul class="uk-nav uk-dropdown-nav">
						<li class="uk-active"><a href="<c:url value='/mypage'/>">rkdudrhdwn99이
								회원님을 팔로우 하였습니다.</a></li>
						<li class="uk-active"><a href="<c:url value='/mypage'/>">rkdudchlrh99이
								회원님을 팔로우 하였습니다.</a></li>
						<li class="uk-active"><a href="<c:url value='/mypage'/>">dudtjghkdlxld98이
								회원님을 팔로우 하였습니다.</a></li>
						<li class="uk-active"><a href="<c:url value='/mypage'/>">wjdflaqorhvk00이
								회원님을 팔로우 하였습니다.</a></li>

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
=======
   href="https://cdn.jsdelivr.net/npm/uikit@3.15.19/dist/css/uikit.min.css" />
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/header.css" />
<title>Nav bar</title>
<!-- UIkit CSS -->


</head>

<style>
@font-face {
   font-family: 'Pretendard-Regular';
   src:
      url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff')
      format('woff');
   font-weight: 400;
   font-style: normal;
}

* {
   font-family: 'Pretendard-Regular';
}

body {
   margin: 0;
}

@media screen and (max-width:680px) {
   .navbar {
      flex-direction: column;
      align-items: center;
      width: 100%;
   }
   .navbar_links {
      justify-content: center;
      width: 100%;
   }
}

.uk-h1, .uk-h2, .uk-h3, .uk-h4, .uk-h5, .uk-h6, .uk-heading-2xlarge,
   .uk-heading-large, .uk-heading-medium, .uk-heading-small,
   .uk-heading-xlarge, h1, h2, h3, h4, h5, h6 {
      
}

.uk-dropdown {
   padding: 20px;
}

.uk-nav>li>a {
   padding: 0;
}


a {
   text-decoration: none !important;
   color: black !important;
}

.navbar {
   width: 100%;
   display: flex;
   align-items: center;
   justify-content: space-between;
   box-sizing: border-box;
   padding: 0 30px;
   box-shadow: rgba(149, 157, 165, 0.15) 0px 3px 6px 0px
}

.navbar__menu {
   display: flex;
   width: 300px;
   list-style: none;
   justify-content: space-between;
   align-items: center;
   padding-left: 0;
}

.navbar_logo {
   display: inline-block;
}

.navbar li {
   display: inline-block;
   padding: 8px 0px;
}

.navbar__links {
   list-style: none;
   display: flex;
   align-items: center;
   width: 150px;
   margin-top: 10px;
}

.navbar__toggleBtn {
   display: none;
   position: absolute;
   right: 32px;
   font-size: 24px;
}

.logo {
   width: 150px !important;
   height: 55px !important;
}

.uk-h1, .uk-h2, .uk-h3, .uk-h4, .uk-h5, .uk-h6, .uk-heading-2xlarge,
   .uk-heading-large, .uk-heading-medium, .uk-heading-small,
   .uk-heading-xlarge, h1, h2, h3, h4, h5, h6 {
   font-family: 'Pretendard-Regular';
}

.user_img {
   width: 40px;
   cursor: pointer;
}

*+address, *+dl, *+fieldset, *+figure, *+ol, *+p, *+pre, *+ul {
   margin-top: 0;
}

.logout_wrapper {
   cursor: pointer;
   margin-left: 10px;
}

.uk-inline {
   float: left;
}

.uk-button {
   boader: none;
   padding: 0;
}

.uk-active {
   padding: 0;
}

.uk-button-default {
   border: 0px;
}

/* Underline From Center */
.hvr-underline-from-center {
   display: inline-block;
   vertical-align: middle;
   -webkit-transform: perspective(1px) translateZ(0);
   transform: perspective(1px) translateZ(0);
   box-shadow: 0 0 1px rgba(0, 0, 0, 0);
   position: relative;
   overflow: hidden;
}

.hvr-underline-from-center:before {
   content: "";
   position: absolute;
   z-index: -1;
   left: 51%;
   right: 51%;
   bottom: 0;
   background: #2098D1;
   height: 4px;
   -webkit-transition-property: left, right;
   transition-property: left, right;
   -webkit-transition-duration: 0.3s;
   transition-duration: 0.3s;
   -webkit-transition-timing-function: ease-out;
   transition-timing-function: ease-out;
}

.hvr-underline-from-center:hover:before, .hvr-underline-from-center:focus:before,
   .hvr-underline-from-center:active:before {
   left: 0;
   right: 0;
}

.header__alarm__img {
   width: 60px;
   height: 60px;
}
</style>

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
<script
	src="https://cdn.jsdelivr.net/npm/uikit@3.15.19/dist/js/uikit.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/uikit@3.15.19/dist/js/uikit-icons.min.js"></script>
</html>