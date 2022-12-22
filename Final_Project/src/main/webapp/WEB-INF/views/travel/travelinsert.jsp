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
<a href='<c:url value="/travel/detail"/>'>
<button type="button" class="">일정선택완료</button></a>
<img src="${pageContext.request.contextPath}/resources/images/travelInsert1.PNG"/>
<img src="${pageContext.request.contextPath}/resources/images/travelInsert2.PNG"/>
</body>
</html>