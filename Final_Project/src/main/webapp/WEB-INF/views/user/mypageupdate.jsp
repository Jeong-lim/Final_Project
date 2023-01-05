<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypageupdate.css" />
<%@ include file="/WEB-INF/views/common/header.jsp"%>
</head>
<body>
	
	<br>
	<br>
	<br>
	<form action="<c:url value='/mypage/update' />" method="post">
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
				<input type="hidden" class="input" name="memberId" value="${member['memberId']}" ${empty member.memberId ? "" : "readonly" } required>
				<div class="input_div">
					<label class="profile_lab">이름</label> 
					<input type="text" class="input" name="memberName"  value="${member.memberName}" required>
				</div>
				<div class="input_div">
					<label class="profile_lab">이메일</label> 
					<input type="email" class="input" name="email"  value="${member.email}">
				</div>
				<div class="input_div">
					<label class="profile_lab">비밀번호</label> 
					<input type="password" class="input" value="${member.memberPassword}" required>
				</div>
				<div class="input_div">
					<label class="profile_lab">비밀번호 확인</label> 
					<input type="password"class="input" name="memberPassword" required>
				</div>
				<div class="input_div">
					<label class="profile_lab">전화번호</label> 
					<input type="text" class="input" name="phoneNumber" value="${member.phoneNumber}" required>
				</div>
			</div>
			<div class="input_div">
				
				<a href="<c:url value='/mypage/delete'/>">
					<input class="imgBtn_delete" value="회원 탈퇴"/>
				</a>
				<a href='/mypage'>
					<input type="submit" class="imgBtn" value="수정 완료"/>
				</a>
				
			</div>


		</div>
	</div>
</form>

</body>
<%@ include file="../common/footer.jsp"%>
</html>