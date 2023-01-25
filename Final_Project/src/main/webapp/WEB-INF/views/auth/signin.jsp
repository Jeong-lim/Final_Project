<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/signin.css" />
</head>

<body>
	
	
	<div class="container_top">
		<div class="container">
		<c:if test="${empty sessionScope.memberId}">
	<form action="<c:url value='/signin'/>" method="post">
			<div class="title">
				<a href="<c:url value='/'/>"> <img class="logo_img"
					src="${pageContext.request.contextPath}/resources/images/logo.png" />
				</a>
			</div>
			<div class="wrap_insert">
				<div>
					<input type="text" id="email" class="input_text" name="memberId"
						placeholder="사용자아이디" />
				</div>
				<div>
					<input type="password" id="password" class="input_text password" name="memberPassword"
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
				
				<br />
				<br />
				
				<c:if test = "${resultMember == 0 }">
                	<div class = "login_warn">아이디 또는 비밀번호를 잘못 입력하셨습니다.</div>
            	</c:if>
				
				<br />
				<div class="wrap_button">
					<input type="submit" class="btn_login" value="로그인" />
				</div>
			</div>
			
				</form>
	</c:if>


			<div class="line"></div>
			<div class="login_path">
			
			<a class="kakao" href="https://kauth.kakao.com/oauth/authorize?client_id=0d1a65de77067d49a955bb898ba9109d&redirect_uri=	
http://192.168.0.29/kakaoLogin&response_type=code">
				<button class="kakao">
					<img class="kakao_img"
						src="${pageContext.request.contextPath}/resources/images/speech-bubble.png"><span>
						카카오로 쉬운 시작</span>
				</button>
			</a>

				<%-- <div>
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
				</div> --%>
			</div>

	
		</div>
	</div>
	


</body>
</html>