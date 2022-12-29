<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.container_top {
	text-align: center;
}

.container {
	width: 1000px;
	min-height: 800px;
	margin: auto;
	text-align: center;
}

.mypage_title {
	text-align: center;
}

.profile {
	width: 980px;
	border-bottom: 2px solid #A4A4A4;
	padding: 20px;
	height: 180px;
	margin: auto;
}

.profile_img {
	float: left;
	border: 1px solid black;
	width: 160px;
	height: 160px;
	margin: 10px;
	margin-bottom: 20px;
}

.profile_image {
	width: 160px;
	height: 160px;
}

.imgBtn {
	cursor: pointer;
	border: none;
	box-shadow: 1px 1px 1px 0 black;
	border-radius: 3px;
	width: 100px;
	height: 28px;
	background-color: #3B82F6;
	color: white;
	font-size: 15px;
}

.imgBtn:hover {
	background-color: #205295;
}

.img_button {
	float: left;
	margin: 140px 0 0 20px;
}

.update_form {
	margin: auto;
	margin-top: 30px;
	width: 900px;
	flex-direction: column;
	text-align: left;
}

.input_div {
	margin-top: 20px;
}

.input_div button {
	margin-top: 40px;
}

.account_tit {
	font-size:25px;
	font-weight:500;
}

.profile_lab {
	width: 150px;
	display: inline-block;
}

.input {
	display: inline-block;
	height: 25px;
}

::-webkit-scrollbar {
	display: none;
}
</style>
<body>
	<%@ include file="../common/header.jsp"%>
	<br>
	<br>
	<br>
	<div class="container_top">
		<div class="container">
			<h1 class="mypage_title">회원정보 수정</h1>
			<br>
			<div class="profile">
				<div class="profile_img">
					<img class="profile_image"
						src="${pageContext.request.contextPath}/resources/images/profile.jpg" />
				</div>
				<div class="img_button">
					<button class="imgBtn" type="button">기본프로필</button>
					<button class="imgBtn" type="button">사진 불러오기</button>
				</div>
			</div>
			<div class="update_form">
				<p class="account_tit">계정</p>

				<div class="input_div">
					<label class="profile_lab">이름</label> <input type="text"
						class="input">
				</div>
				<div class="input_div">
					<label class="profile_lab">이메일</label> <input type="email"
						class="input">
				</div>
				<div class="input_div">
					<label class="profile_lab">비밀번호</label> <input type="password"
						class="input">
				</div>
				<div class="input_div">
					<label class="profile_lab">비밀번호 확인</label> <input type="password"
						class="input">
				</div>
				<div class="input_div">
					<label class="profile_lab">전화번호</label> <input type="text"
						class="input">
				</div>
			</div>
			<div class="input_div">
				<a href='/mypage'>
					<button class="imgBtn" type="button">수정 완료</button>
				</a>
			</div>


		</div>
	</div>



</body>
<%@ include file="../common/footer.jsp"%>
</html>