<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.container_top {
	text-align: center;
}

.container {
	width: 1000px;
	min-height: 1000px;
	margin: auto;
}
</style>
<body>
	<%@ include file="../common/header.jsp"%>
	<div class="container_top">
		<div class="container">
			<img class="slide_img"
				src="${pageContext.request.contextPath}/resources/images/경복궁.jpg" />
		</div>
	</div>
</body>
</html>