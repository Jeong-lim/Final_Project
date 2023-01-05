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
	<c:if test="${empty sessionScope.memberId}">
	<form action="<c:url value='/signin'/>" method="post">
	
	<div class="container_top">
		<div class="container">
			<div class="title">
				<a href="<c:url value='/'/>"> <img class="logo_img"
					src="${pageContext.request.contextPath}/resources/images/logo.png" />
				</a>
			</div>
			<div class="wrap_insert">
				<div>
					<input type="text" id="user_id" class="input_text" name="memberId"
						placeholder="사용자아이디" required />
				</div>
				<div>
					<input type="password" id="password" class="input_text password" name="memberPassword"
						placeholder="비밀번호"  required />
				</div>
			</div>
			<div class="wrap_save">
				<div class="box_check">
					<label class="save_id"><input type="checkbox" >아이디
						저장</label>
				</div>
				<div class="login_info">
					<a>아이디 찾기</a><span class="bar"> | </span><a>비밀번호 찾기</a> <span
						class="bar"> |</span> <a href="<c:url value='/signup'/>"
						class="signin">회원가입</a>
				</div>
				<div class="wrap_button">
					<input type="submit" id="reg_submit" class="btn_login" value="로그인" />
					<input type="hidden" name="checked_id" value="">
				</div>
			</div>

			<div class="line"></div>
			<div class="login_path">
				<button class="kakao">
					<img class="kakao_img"
						src="${pageContext.request.contextPath}/resources/images/speech-bubble.png"><span>
						카카오로 쉬운 시작</span>
				</button>

				<div>
					<button class="login_images">
						<img width="100%"
							src="${pageContext.request.contextPath}/resources/images/email.png">
					</button>
					<button class="login_images">
						<img width="100%"
							src="${pageContext.request.contextPath}/resources/images/naver.png">
					</button>
					<button class="login_images">
						<img width="100%"
							src="${pageContext.request.contextPath}/resources/images/facebook.png">
					</button>
					<button class="login_images">
						<img width="100%"
							src="${pageContext.request.contextPath}/resources/images/google.png">
					</button>
				</div>
			</div>

		</div>
	</div>
	</form>
	</c:if>

</body>




<script type="text/javascript">

//아이디 유효성 검사(1 = 중복 / 0 != 중복)
$("#idcheckbutton").on("click", function() {
	$("input[name=checked_id]").val('y');
	// id = "id_reg" / name = "userId"
	var memberId = $('#user_id').val();
	$.ajax({
		url : '${pageContext.request.contextPath}/member/idCheck?memberId='+ memberId,
		type : 'get',
		success : function(data) {
			console.log(data);							
			
			if (data == 1) {
				window.alert('아이디 혹은 비밀번호가 다릅니다.');
				} 
			else if(data == 0) {
				$("#reg_submit").attr("disabled", false);
				}	
			}, error : function() {
					console.log("실패");
			}
		});
	});


	function checkform() {
		if (document.LoginForm.memberId.value == "") {
			alert("<fmt:message key="Please_enter_your_ID" />");
			form.id.focus();
		} else if (document.LoginForm.password.value == "") {
			alert("<fmt:message key="Please_enter_your_password" />");
			form.pw.focus();
		}
	}
</script>
</html>