<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypageupdate.css" />
<%@ include file="/WEB-INF/views/common/header.jsp"%>
</head>
<body>
	
	<br>
	<br>
	<br>
	<form action="<c:url value='/mypage/update' />" method="post">
	<div class="container_top">
		<div class="container">
			<h1 class="mypage_title">회원정보 수정</h1>
			<br>
			<div class="profile">
				<div class="profile_img">
					<img class="profile_image"
						src="${pageContext.request.contextPath}/resources/images/profile.jpg" />
				</div>
				<div class="img_button">
					<button class="imgBtn" type="button">기본프로필</button>
					<button class="imgBtn" type="button">사진 불러오기</button>
				</div>
			</div>
			<div class="update_form">
				<p class="account_tit">계정</p>
				<input type="hidden" class="input" name="memberId" value="${member['memberId']}" ${empty member.memberId ? "" : "readonly" } required>
				<div class="input_div">
					<label class="profile_lab">이름</label> 
					<input type="text" class="input" name="memberName"  value="${member.memberName}" required>
				</div>
				<div class="input_div">
					<label class="profile_lab">이메일</label> 
					<input type="email" class="input" name="email"  value="${member.email}">
				</div>
				<div class="input_div">
					<label class="profile_lab">비밀번호</label> 
					<input type="password" id="pw"  class="input" value="${member.memberPassword}" onchange="check_pw()" required>
				</div>
				<div class="input_div">
					<label class="profile_lab">비밀번호 확인</label> 
					<input type="password" id="pw2" class="input" name="memberPassword" onchange="check_pw()" required>
					&nbsp;<span id="check"></span>
				</div>
				<div class="input_div">
					<label class="profile_lab">전화번호</label> 
					<input type="text" class="input" name="phoneNumber" value="${member.phoneNumber}" required>
				</div>
			</div>
			<div class="input_div">
				
				<a href="<c:url value='/mypage/delete'/>">
					<input class="imgBtn_delete" value="회원 탈퇴"/>
				</a>
				<a href='/mypage'>
					<input type="submit" class="imgBtn" value="수정 완료"/>
				</a>
				
			</div>


		</div>
	</div>
</form>

</body>
<script type="text/javascript">
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

<%@ include file="../common/footer.jsp"%>

</html>