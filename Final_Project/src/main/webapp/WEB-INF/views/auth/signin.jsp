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

.input_text {
	height: 55px;
	padding: 0 11px;
	font-size: 14px;
	color: #333;
	border: 1px solid #ccc;
	line-height: 49px;
	box-shadow: none;
	border-bottom: 0;
	margin: auto;
	width: 326px;
}

.input_text.password {
	border-bottom: 1px solid #ccc;
}

.wrap_save {
	overflow: hidden;
	vertical-align: baseline;
	width: 350px;
}

.box_check {
	margin-top: 19px;
	overflow: hidden;
	position: relative;
	float: left;
	font-size: 12px;
	color: #767676;
}

.save_id {
	line-height: 25px;
}

input[type="checkbox" i] {
	background-color: initial;
	cursor: default;
	appearance: auto;
	box-sizing: border-box;
	margin: 3px 3px 4px 4px;
	vertical-align: middle;
}

.icon {
	display: block;
	position: absolute;
	left: 0;
	top: 1px;
	width: 15px;
	height: 15px;
	background:
		url(//cdnimg.melon.co.kr/resource/image/web/member/bg_checkbox_melon.png)
		no-repeat;
	pointer-events: none;
}

.login_info {
	font-size: 12px;
	padding: 5px 2px;
	color: #767676;
	display: inline-block;
	float: right;
	margin: 20px 0;
	text-decoration: none;
}

.login_info a {
	padding: 2px;
}

.signin {
	text-decoration: none;
	color: #767676;
}

.bar {
	color: #ebebeb;
}

.wrap_button {
	float: none;
	width: auto;
}

.btn_login {
	display: block;
	width: 100%;
	background: #3B82F6;
	padding: 17px 0;
	text-align: center;
	color: #fff;
	line-height: 20px;
	font-size: 18px;
	border: none;
	cursor: pointer;
}

.kakao {
	width: 300px;
	height: 50px;
	font-size: 14px;
	font-weight: 500;
	line-height: 17px;
	margin: auto;
	margin-bottom: 20px;
	border: none;
	border-radius: 4px;
	color: rgb(59, 29, 30);
	display: flex;
	align-items: center;
	justify-content: center;
	background-color: rgb(254, 221, 53);
	font-size: 14px;
	font-weight: 500;
	line-height: 17px;
	margin: auto;
	margin-bottom: 20px;
	border: none;
	border-radius: 4px;
	color: rgb(59, 29, 30);
	display: flex;
	align-items: center;
	justify-content: center;
}

.kakao_img {
	width: 15px;
	height: 15px;
	margin-right: 3px;
}

.login_path {
	text-align: center;
	padding-top: 0px;
	padding-bottom: 60px;
}

.login_images {
	width: 70px;
	height: 70px;
	background-color: white;
	border: none;
}

.line {
	background-color: #E6E6E6;
	border: 1px solid #E6E6E6;
	margin: 30px 0;
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
				<div>
					<input type="text" id="email" class="input_text"
						placeholder="사용자아이디" />
				</div>
				<div>
					<input type="password" id="password" class="input_text password"
						placeholder="비밀번호" />
				</div>
			</div>
			<div class="wrap_save">
				<div class="box_check">
					<label class="save_id"><input type="checkbox">아이디
						저장</label>
				</div>
				<div class="login_info">
					<a>아이디 찾기</a><span class="bar"> | </span><a>비밀번호 찾기</a> <span
						class="bar"> |</span> <a href="<c:url value='/signup'/>"
						class="signin">회원가입</a>
				</div>
				<div class="wrap_button">
					<button class="btn_login">
						<span>로그인</span>
					</button>

				</div>
			</div>

			<div class="line"></div>
			<div class="login_path">
				<button class="kakao">
					<img class="kakao_img"
						src="${pageContext.request.contextPath}/resources/images/speech-bubble.png"><span>
						카카오로 쉬운 시작</span>
				</button>

				<div>
					<button class="login_images">
						<img width="100%"
							src="${pageContext.request.contextPath}/resources/images/email.png">
					</button>
					<button class="login_images">
						<img width="100%"
							src="${pageContext.request.contextPath}/resources/images/naver.png">
					</button>
					<button class="login_images">
						<img width="100%"
							src="${pageContext.request.contextPath}/resources/images/facebook.png">
					</button>
					<button class="login_images">
						<img width="100%"
							src="${pageContext.request.contextPath}/resources/images/google.png">
					</button>
				</div>
			</div>

		</div>
	</div>

</body>
</html>