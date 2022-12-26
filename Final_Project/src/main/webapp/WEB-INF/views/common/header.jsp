<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css"/>
</head>
 		<header>
 		<a href="<c:url value='/'/>">
			<img class="logo"src="${pageContext.request.contextPath}/resources/images/logo.png" />
		</a>
			<div class="menu_container">
			<div class="menu">
				<a href="/place">관광지</a> 
				<a href="/travel/list">여행 일정</a> 
				<a href="/travel/insert">여행 일정 등록</a>
			</div>
			</div>
			
			<div class="user_container">
				<div class="user_img_container">
				<a href="<c:url value='/mypage'/>">
					<img class="user_img" src="${pageContext.request.contextPath}/resources/images/default_user.png" />
				</a>
				</div>
				<div class="auth_container">
					<a href="/signin">로그아웃</a>
				</div>
				
			</div>

		</header>
		
		
</html>