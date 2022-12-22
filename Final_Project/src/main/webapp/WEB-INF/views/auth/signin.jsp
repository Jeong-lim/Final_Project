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

<img src="${pageContext.request.contextPath}/resources/images/signin.PNG"/>
로그인 페이지
<a href='<c:url value="/signup"/>'><button type="button" class="">회원가입</button></a>
<a href='<c:url value="/"/>'><button type="button" class="">메인페이지</button></a>
</body>
</html>