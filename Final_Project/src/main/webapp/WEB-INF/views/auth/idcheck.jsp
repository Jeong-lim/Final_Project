<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/signin.css" />
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</head>
<body>

	<div class="container_top">
		<div class="container">
	<form action="<c:url value='/member/idFindCheck'/>" method="post" id="idCheck">
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
			
			<!-- submit 하고 나서 alert 실행 하면 로그인 하러 가기 버튼 나오게 하기 -->
			
			<c:if  test="${userId ne null }">
				<button id="alertStart">Alert 실행</button>
			</c:if>
			
			<c:if  test="${userId eq null }">
				<div>${message}</div>
			</c:if>
			
				</form>
				</div>
				</div>
</body>
<script type="text/javascript">

document.getElementById("idCheck").onsubmit = function() {idCheckAlert()};

function idCheckAlert() {
    $("#alertStart").click(function () {
        Swal.fire({
            icon: 'success',
            title: '회원님의 아이디는',
            text: '${userId}',
        });
    });
};

		
</script>
</html>