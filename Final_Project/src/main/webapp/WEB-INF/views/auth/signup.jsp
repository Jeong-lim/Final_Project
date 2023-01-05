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

	<form action="<c:url value='/signup'/>" method="post">
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
				<div class="insert"><input type="text" id="memberId" class="input_text" name="memberId"
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
					<input type="password" name="memberPassword" id="password_re" class="input_text"
						pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" required="required" />
				</div>

				<span class="span">이름 *</span>
				<div>
					<input type="text" name="memberName" id="name" class="input_text" required="required" />
				</div>

				<span class="span">전화번호 *</span>
				<div>
					<input type="text" name="phoneNumber" id="phonenumber" class="input_text"
						placeholder="01012345678" required="required" />
				</div>

				<span class="span">이메일</span>
				<div>
					<input type="email" name="email" id="email" class="input_text"
						placeholder="travel@travely.com" />
				</div>

			</div>
			<div class="wrap_button">
				<input type="submit" class="btn_signup" value="회원가입하기" />
				

			</div>
		
		</div>
	</div>
	</form>
</body>
</html>