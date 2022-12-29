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
	margin-top: 150px;
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
	display: inline-block;
	border-radius: 20px;
	float: left;
}

.ad__container__2 {
	width: 470px;
	height: 150px;
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
	width: 470px;
    height: 150px;
    object-fit: cover;
    border-radius: 16px;
    box-shadow: 0 25.6px 57.6px 0 rgb(0 0 0 / 22%), 0 4.8px 14.4px 0 rgb(0 0 0 / 18%);
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
				<img class="ad__img"
					src="${pageContext.request.contextPath}/resources/images/ad__img-1.png" />
		</div>
		<div class="ad__container__2">
				<img class="ad__img"
					src="${pageContext.request.contextPath}/resources/images/ad__img-2.png" />
		</div>
	</div>
</body>
</html>