<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../common/header.jsp"%>
<img src="${pageContext.request.contextPath}/resources/images/mypage.PNG"/>
<a href='/mypage/update'>
<button type="button">회원정보수정</button></a>
<a href='/'>
<button type="button">메인페이지</button></a>
</body>
</html>