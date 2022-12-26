<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sliderbanner.css"/>
</head>

<body>
<div class="slidebox">
	<input type="radio" name="slide" id="slide01" checked>
	<input type="radio" name="slide" id="slide02">
	<input type="radio" name="slide" id="slide03">
	<ul class="slidelist">
		<li class="slideitem">
			<a>
				<label for="slide03" class="prev"></label>
				<img src="./img/slide01.jpg">
				<label for="slide02" class="next"></label>
			</a>
		</li>
		<li class="slideitem">
			<a>
				<label for="slide01" class="prev"></label>
				<img src="./img/slide02.jpg">
				<label for="slide03" class="next"></label>
			</a>
		</li>
		<li class="slideitem">
			<a>
				<label for="slide02" class="prev"></label>
				<img src="./img/slide03.jpg">
				<label for="slide01" class="next"></label>
			</a>
		</li>
	</ul>
</div>
</body>
</html>