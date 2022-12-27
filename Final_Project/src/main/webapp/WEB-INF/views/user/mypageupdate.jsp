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
	width: 800px;
	border-bottom: 2px solid #A4A4A4;
	padding: 20px;
	height: 160px;
	margin: auto;
}

.profile_img {
	float: left;
	border: 1px solid black;
	width: 140px;
	height: 140px;
	margin: 10px;
}

.profile_image {
	width: 140px;
	height: 140px;
}

.img_button {
	float: left;
	margin: 125px 0 0 20px;
}

.update_form {
	margin: auto;
	margin-top: 10px;
	padding-left: 15px;
	width : 800px;
	flex-direction: column;
	text-align: left;
}

.input_div {
	margin-top: 20px;
}

.input_div button {
	margin-top:40px;
}

label {
	width: 150px;
	display: inline-block;
}

.input {
	display: inline-block;
	height: 25px;
}
</style>
<body>
	<%@ include file="../common/header.jsp"%>
	<br>
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
					<button type="button">기본프로필로 변경</button>
					<button type="button">사진 불러오기</button>
				</div>
			</div>
			<div class="update_form">
				<h3>계정</h3>

				<div class="input_div">
					<label>이름</label> <input type="text" class="input">
				</div>
				<div class="input_div">
					<label>이메일</label> <input type="email" class="input">
				</div>
				<div class="input_div">
					<label>비밀번호</label> <input type="password" class="input">
				</div>
				<div class="input_div">
					<label>비밀번호 확인</label> <input type="password" class="input">
				</div>
				<div class="input_div">
					<label>전화번호</label> <input type="text" class="input">
				</div>
			</div>
			<div class="input_div">
				<a href='/mypage'>
					<button type="button">수정 완료</button>
				</a>
			</div>


		</div>
	</div>



</body>
<%@ include file="../common/footer.jsp"%>
</html>