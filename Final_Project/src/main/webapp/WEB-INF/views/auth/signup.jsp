<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/signup.css" />
</head>


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