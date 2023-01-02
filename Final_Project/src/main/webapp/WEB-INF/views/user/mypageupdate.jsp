<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypageupdate.css" />

</head>
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