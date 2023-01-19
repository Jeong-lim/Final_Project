<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/signup.css" />
</head>


<body>

	<form action="<c:url value='/signupKakao'/>" method="post">
	<div class="container_top">
		<div class="container">
			<div class="title">
				<a href="<c:url value='/'/>"> <img class="logo_img"
					src="${pageContext.request.contextPath}/resources/images/logo.png" />
				</a>
			</div>
			
			
			<div class="wrap_insert">
				<span class="span">아이디 *</span>
				<button id="idcheckbutton" class="idcheck" type="button">아이디 중복체크</button>
				<div class="insert"><input type="text" id="user_id" class="input_text" name="memberId"
					placeholder="소문자 숫자 포함 4글자 이상 20글자까지" required="required" pattern="(?=.*[a-zA-Z]).{4,20}"/>
				<div class="check_font" id="id_check"></div>
				</div>

				<span class="span">비밀번호 *</span>
				<div>
					<input type="password" name="password" id="pw" class="input_text"
						placeholder="특수문자 포함 6글자 이상" required="required" onchange="check_pw()" />
				</div>

				<span class="span">비밀번호 확인 *</span>
				<div>
					<input type="password" name="memberPassword" id="pw2" class="input_text" required="required" onchange="check_pw()" />
						&nbsp;<span id="check"></span>
				</div>
				
				<span class="span">이름 *</span>
				<div>
					<input type="text" name="memberName" id="name" class="input_text" required="required" />
				</div>


				<span class="span">전화번호 *</span>
				<div>
					<input type="text" name="phoneNumber" id="phonenumber" class="input_text"
						placeholder="01012345678" required="required" />
				</div>

				<div>
					<input type="hidden" value="${sessionScope.email}" name="email" id="email" class="input_text" />
				</div>

			</div>
			<div class="wrap_button">
				<input type="submit" id="reg_submit" class="btn_signup" value="회원가입하기"></input>
				<input type="hidden" name="checked_id" value="">

			</div>
		
		</div>
	</div>
	</form>
</body>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script> 
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
				window.alert('사용 중인 아이디 입니다.');
				$("#reg_submit").attr("disabled", true);
				} 
			else if(data == 0) {
				window.alert('사용 가능한 아이디 입니다.');
				$("#reg_submit").attr("disabled", false);
				}	
			}, error : function() {
					console.log("실패");
			}
		});
	});

function check_pw(){
    var pw = document.getElementById('pw').value;
    var SC = ["!","@","#","$","%"];
    var check_SC = 0;

    if(pw.length < 6 || pw.length>16){
        window.alert('비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다.');
        document.getElementById('pw').value='';
    }
    for(var i=0;i<SC.length;i++){
        if(pw.indexOf(SC[i]) != -1){
            check_SC = 1;
        }
    }
    if(check_SC == 0){
        window.alert('!,@,#,$,% 의 특수문자가 들어가 있지 않습니다.')
        document.getElementById('pw').value='';
    }
    if(document.getElementById('pw').value !='' && document.getElementById('pw2').value!=''){
        if(document.getElementById('pw').value==document.getElementById('pw2').value){
            document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
            document.getElementById('check').style.color='blue';
        }
        else{
            document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
            document.getElementById('check').style.color='red';
        }
    }
}
</script>

</html>