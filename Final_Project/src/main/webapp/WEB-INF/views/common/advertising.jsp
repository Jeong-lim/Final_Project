<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.ad__wrapper {
	width: 1000px;
	height: 200px;
	margin: 0px auto;
	margin-top: 100px;
}

.ad__main {
	display: inline-block;
	padding-left: 40px;
	display: table-cell;
	float: left;
	padding-right: 10px;
	padding-top: 40px;
	font-size: x-large;
}

.ad__main_text {
	font-size: medium;
}

.ad__container__1 {
	width: 470px;
	height: 150px;
	border: 2px solid #9CA3AF;
	display: inline-block;
	border-radius: 20px;
	float: left;
}

.ad__container__2 {
	width: 470px;
	height: 150px;
	border: 2px solid #9CA3AF;
	border-radius: 20px; 
	display : inline-block;
	float: right;
	display: inline-block;
}

.ad__header {
	font-size: 30px;
	padding-bottom: 20px;
}

.ad__img__container {
	width: 150px;
	height: 150px;
	float: left;
}

.ad__img {
	overflow: hidden;
	display: flex;
	align-items: center;
	justify-content: center;
	width: 150px;
	height: 150px;
	border-top-left-radius: 16px;
	border-bottom-left-radius: 16px;
}

.ad__img-2 {
	overflow: hidden;
	display: flex;
	align-items: center;
	justify-content: center;
	width: 150px;
	height: 150px;
	border-top-left-radius: 16px;
	border-bottom-left-radius: 16px;
}

.ad__header__font {
	font-weight: bolder;
}


</style>
</head>
<body>

	<div class="ad__wrapper">
		<div class="ad__header">
			<span class="ad__header__font">TRAVELY</span> 소식
		</div>
		<div class="ad__container__1">
			<div class="ad__img__container">
				<img class="ad__img"
					src="${pageContext.request.contextPath}/resources/images/ad__img-1.png" />
			</div>
			<span class="ad__main">트래블리 비즈니스<br />
			<span class="ad__main_text">출장부터 복지까지 트래블리 <br /> 비즈니스로 스마트하게
			</span></span>
		</div>
		<div class="ad__container__2">
			<div class="ad__img__container">
				<img class="ad__img-2"
					src="${pageContext.request.contextPath}/resources/images/ad__img-2.png" />
			</div>
			<span class="ad__main">트래블리 비즈니스<br /> <span
				class="ad__main_text">출장부터 복지까지 트래블리 <br /> 비즈니스로 스마트하게
			</span></span>
		</div>
	</div>
</body>
</html>