<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<title>Insert title here</title>

</head>
<body>
	<form action="/mypage/delete" method="post">
		<input type="hidden" name="memberId" id="memberId" />
		<input type="password" name="memberPassword" id="password" />
		<input type="submit" />
	</form>
</body>
</html>