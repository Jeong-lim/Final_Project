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
					<input type="text" id="userName" class="input_text password" name="userName"
						placeholder="이름" maxlength="20" />
				</div>
			</div>
			<div class="wrap_save">

				<br />
				<div class="wrap_button">
					<input type="submit" id="idFindButton" class="btn_login" value="아이디 찾기"/>
					
				</div>
			</div>
			<button id="alertStart">Alert 실행</button>
			<!-- submit 하고 나서 alert 실행 하면 로그인 하러 가기 버튼 나오게 하기 -->
<%-- 			
			<c:if  test="${userId ne null }">
				
			</c:if>
			
			<c:if  test="${userId eq null }">
				<div>${message}</div>
			</c:if> --%>
			
				</form>
				</div>
				</div>
</body>
<script type="text/javascript">


/* function idCheckAlert() {
        Swal.fire({
            icon: 'success',
            title: '회원님의 아이디는',
            text: '${userId}',
        });
};
 */
$("#idFindButton").on("click", function() {
	
	var email = $('#email').val();
	var userName = $('#userName').val();
	
	$.ajax({
		url : '/member/idFindCheck?email='+ email + '/' + 'userName=' + userName,
		type : 'get',
		success : function(data) {
			console.log(data);							
			if (date != null) {
				 Swal.fire({
			            icon: 'success',                         // Alert 타입
			            title: 'Alert가 실행되었습니다.',         // Alert 제목
			            text: '이곳은 내용이 나타나는 곳입니다.',  // Alert 내용
			      });
			} else {
				Swal.fire({
		            icon: 'success',
		            title: '회원님의 아이디는',
		            text: '회원 정보가 없습니다. 회원가입을 진행합니다.',
		        });
			}
				
			}, error : function() {
					console.log("실패");
			}
		});
	});

		
</script>
</html>