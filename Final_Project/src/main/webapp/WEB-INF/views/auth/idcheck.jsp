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
					<input type="text" id="userName" class="input_text password" name="userName"
						placeholder="이름" maxlength="20" />
				</div>
			</div>
			<div class="wrap_save">

				<br />
				<div class="wrap_button">
					<input id="idFindButton" class="btn_login" value="아이디 찾기"/>
					
				</div>
			</div>
			

				</div>
				</div>
</body>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script> 
<script type="text/javascript">
$("#idFindButton").on("click", function() {
	
	var email = $('#email').val();
	var userName = $('#userName').val();
	
	console.log(email);
	console.log(userName);
	
	$.ajax({
		url : '/member/idFindCheck',
		type : 'get',
		data: {"email": email,
	        "userName": userName},
		success : function(data) {
			console.log(data);							
			
			if (data == 0) {
				Swal.fire({
		            icon: 'warning',
		            title: '회원 정보를 찾을 수 업습니다.',
		            showCancelButton: true,
		            confirmButtonColor: '#3085d6',
		            cancelButtonColor: '#d33',
		            text: '회원가입을 하시겠습니까?',
		            confirmButtonText: '승인',
		            cancelButtonText: '취소'
		        });
				
			} 
			else {
				Swal.fire({
		            icon: 'success',
		            title: '회원님의 아이디는',
		            text: data,
		        });
			  }	
			}, error : function() {
					console.log("실패");
			}
		});
	});

		
</script>
</html>