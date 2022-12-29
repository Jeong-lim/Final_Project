<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>Nav bar</title>  
    <style>
@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
}
* { font-family: 'Pretendard-Regular'; }


body {
	margin: 0;
}

@media screen and (max-width:680px){
	.navbar{
		flex-direction: column;
		align-items: center;
		width:100%;
	}
	
	.navbar_links{
		justify-content: center;
		width:100%;
	}
	
	
}

a {
	text-decoration: none;
	color: black;
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
.navbar_logo{
	display:inline-block;
}

.navbar li{
	display: inline-block;
    padding: 8px 0px;
}



.navbar__links {
	list-style: none;
    display: flex;
    align-items: center;
    width: 110px;
}



.navbar__toggleBtn {
	display: none;
	position: absolute;
	right: 32px;
	font-size: 24px;
}

.logo {
	width: 150px;
	height: 55px;
	
}

.user_img {
	width: 40px;
    padding-right: 14px;
    cursor:pointer;
}

.logout_wrapper {
	cursor:pointer;
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
.hvr-underline-from-center:hover:before, .hvr-underline-from-center:focus:before, .hvr-underline-from-center:active:before {
  left: 0;
  right: 0;
}
</style>

</head>

<body>
    <nav class="navbar">
    
        <div class="navbar__logo">
	             <a href="<c:url value='/'/>">
				<img class="logo"src="${pageContext.request.contextPath}/resources/images/logo.png" />
			</a>
	    </div>    
	        <ul class="navbar__menu">
	            <li class="hvr-underline-from-center"><a href="/place">관광지</a> </li>
	            <li class="hvr-underline-from-center"><a href="/travel/list">여행 일정</a> </li>
	            <li class="hvr-underline-from-center"><a href="/travel/insert">여행 일정 등록</a></li>
	        </ul>
        
        <span class="navbar__links">
            <label class="navbar__links__li" onclick="location.href='<c:url value="/mypage"/>'">
					<img class="user_img" src="${pageContext.request.contextPath}/resources/images/default_user.png" />
				</label>
            <label class="logout_wrapper" onclick="location.href='<c:url value="/signin"/>'">로그아웃</label>
        </span>

        <a href="#" class="navbar__toggleBtn"><i class="fas fa-bars"></i></a>
    </nav>
</body>
</html>