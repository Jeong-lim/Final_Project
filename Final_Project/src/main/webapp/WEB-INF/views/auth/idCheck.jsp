<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/signin.css" />
</head>
<body>

	<div class="container_top">
		<div class="container">
	<form action="<c:url value='/member/idFindCheck'/>" method="post">
			<div class="title">
				<a href="<c:url value='/'/>"> <img class="logo_img"
					src="${pageContext.request.contextPath}/resources/images/logo.png" />
				</a>
			</div>
			<div class="wrap_insert">
				<div>
					<input type="text" id="email" class="input_text" name="email"
						placeholder="이메일" maxlength="30" />
				</div>
				<div>
					<input type="text" id="password" class="input_text password" name="userName"
						placeholder="이름" maxlength="20" />
				</div>
			</div>
			<div class="wrap_save">

				<br />
				<div class="wrap_button">
					<input type="submit" class="btn_login" value="아이디 찾기"/>
					
				</div>
			</div>
			
			<c:if  test="${userId ne null }">
				<div>${userId}</div>
			</c:if>
			
			<c:if  test="${userId eq null }">
				<div>${message}</div>
			</c:if>
			
				</form>
				</div>
				</div>
</body>
<script type="text/javascript">


		
</script>
</html>