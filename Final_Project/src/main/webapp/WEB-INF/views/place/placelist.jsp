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
<a href='<c:url value="/place/detail"/>'>
<button type="button" class="">관광지 상세보기</button></a>
<img src="${pageContext.request.contextPath}/resources/images/place.PNG"/>


</body>
</html>