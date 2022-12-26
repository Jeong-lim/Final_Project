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
@charset "UTF-8";

.container_top {
	text-align: center;
}

.container {
	margin: auto;
	padding-top: 100px;
	width: 390px;
	margin: auto;
}

.logo_img {
	width: 170px;
	height: 70px;
}

.wrap_insert {
	text-align: left;
	width: 390px;

}

.input_text {
	height: 40px;
	padding: 0 11px;
	font-size: 14px;
	color: #333;
	border: 1px solid #ccc;
	line-height: 40px;
	box-shadow: none;
	width: 366px;
	margin: 10px 0 10px 0;
}

.wrap_button {
	float: none;
	width: auto;
	margin-top: 19px;
	padding-bottom: 15px;
}

.btn_signup {
	display: block;
	width: 100%;
	background: #68B984;
	padding: 17px 0 21px;
	text-align: center;
	color: #fff;
	line-height: 22px;
	font-size: 18px;
	border: none;
}
</style>

<body>
	<div class="container_top">
		<div class="container">
			<div class="title">
				<a href="<c:url value='/'/>"> <img class="logo_img"
					src="${pageContext.request.contextPath}/resources/images/logo.png" />
				</a>
			</div>

			<div class="wrap_insert">
				<span class="span">아이디</span>
				<div class="insert">
					<input type="text" id="userid" class="input_text" placeholder=""
						required="required" />
				</div>
				<span class="span">비밀번호</span>
				<div>
					<input type="password" id="password" class="input_text"
						placeholder="" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}"
						required="required" />
				</div>

				<span class="span">비밀번호 확인</span>
				<div>
					<input type="password" id="password_re" class="input_text"
						pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" required="required" />
				</div>

				<span class="span">이름</span>
				<div>
					<input type="text" id="name" class="input_text" required="required" />
				</div>

				<span class="span">전화번호</span>
				<div>
					<input type="text" id="phonenumber" class="input_text"
						required="required" />
				</div>

				<span class="span">이메일</span>
				<div>
					<input type="email" id="email" class="input_text" />
				</div>

			</div>
			<div class="wrap_button">
				<button class="btn_signup">
					<span>회원가입하기</span>
				</button>

			</div>

		</div>
	</div>
</body>
</html>