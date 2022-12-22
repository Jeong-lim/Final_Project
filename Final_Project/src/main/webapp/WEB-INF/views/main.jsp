<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href='<c:url value="/signin"/>'>
<button type="button" class="">로그인</button></a>
<a href='<c:url value="/mypage"/>'>
<button type="button" class="">마이페이지</button></a>
<a href='<c:url value="/place"/>'>
<button type="button" class="">관광지리스트</button></a>
<a href='<c:url value="/travel/list"/>'>
<button type="button" class="">여행일정리스트</button></a>
<a href='<c:url value="/travel/insert"/>'>
<button type="button" class="">여행일정등록하기</button></a>
<a href='<c:url value="/travel/detail"/>'>
<button type="button" class="">여행일정상세보기</button></a>

<img src="${pageContext.request.contextPath}/resources/images/main1.PNG"/>
<img src="${pageContext.request.contextPath}/resources/images/main2.PNG"/>


</body>
</html>