<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/deletemember.css" />
<title>Insert title here</title>
</head>
<body>
	<div class="delete_form_container">
		<a href="<c:url value='/'/>"> <img class="logo_img"
			src="${pageContext.request.contextPath}/resources/images/logo.png" />
		</a>
		<form action="/mypage/delete" method="post">
			<input type="hidden" name="memberId" id="memberId" /> <input
				type="password" name="memberPassword" id="password" /> <input
				type="submit" />
		</form>
	</div>

</body>
</html>