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

.container_top {
	text-align: center;
}

.container {
	margin: auto;
	padding-top: 100px;
	width: 350px;
}

.logo_img {
	width: 200px;
	height: 70px;
	margin: 20px;
}

.wrap_insert {
	float: none;
}

.span {
	font-size: 18px;
	float: left;
	margin: 10px 0;
}

.input_text {
	height: 45px;
	padding: 0 11px;
	font-size: 14px;
	color: #333;
	border: 1px solid #ccc;
	line-height: 45px;
	box-shadow: none;
	margin: auto;
	width: 326px;
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
	background: #3B82F6;
	padding: 17px 0 21px;
	text-align: center;
	color: #fff;
	line-height: 22px;
	font-size: 18px;
	border: none;
	cursor: pointer;
}
.idcheck {
	cursor: pointer;
	border: none;
	box-shadow: 1px 1px 1px 0 black;
	border-radius: 3px;
	width: 90px;
	height: 25px;
	background-color: #3B82F6;
	color: white;
	font-size: 12px;
	float:right;
	margin-top:5px;
	
}

.idcheck:hover {
	background-color: #205295;
}

::-webkit-scrollbar {
	display: none;
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
				<span class="span">아이디 *</span>
				<button class="idcheck" type="button">아이디 중복체크</button>
				<div class="insert"><input type="text" id="userid" class="input_text"
					placeholder="travely123" required="required" />
				</div>

				<span class="span">비밀번호 *</span>
				<div>
					<input type="password" id="password" class="input_text"
						placeholder="대소문자 포함 6글자 이상"
						pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" required="required" />
				</div>

				<span class="span">비밀번호 확인 *</span>
				<div>
					<input type="password" id="password_re" class="input_text"
						pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" required="required" />
				</div>

				<span class="span">이름 *</span>
				<div>
					<input type="text" id="name" class="input_text" required="required" />
				</div>

				<span class="span">전화번호 *</span>
				<div>
					<input type="text" id="phonenumber" class="input_text"
						placeholder="01012345678" required="required" />
				</div>

				<span class="span">이메일</span>
				<div>
					<input type="email" id="email" class="input_text"
						placeholder="travel@travely.com" />
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