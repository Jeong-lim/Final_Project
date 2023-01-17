<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/uikit@3.15.19/dist/css/uikit.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/header.css" />
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 

	<nav class="navbar">

		<div class="navbar__logo">
			<a href="<c:url value='/'/>"> <img class="logo"
				src="${pageContext.request.contextPath}/resources/images/logo.png" />
			</a>
		</div>
		<ul class="navbar__menu">
			<li class="hvr-underline-from-center"><a class="header__a_tag"
				href="/place">관광지</a></li>
			<li class="hvr-underline-from-center"><a class="header__a_tag"
				href="/travel/list">여행 일정</a></li>
			<li class="hvr-underline-from-center"><a class="header__a_tag"
				href="/travel/insert">여행 일정 등록</a></li>
		</ul>
		
		
		<div>
			<div class="uk-inline">
				<button class="uk-button uk-button-default" id="alarmBtn" type="button" >
					<img class="header__alarm__img"
						src="${pageContext.request.contextPath}/resources/images/alarm_full.png">
				</button>
				
				<!-- <div class="uk-dropdown-large" uk-dropdown="animation: slide-top; animate-out: true; mode: click; offset: 20; bg-scroll: true; duration: 700">
				<ul class="uk-nav uk-dropdown-nav">
						
						

				</ul>
				</div> -->
			</div>
			

			<span class="navbar__links"> <label class="navbar__links__li"
				onclick="location.href='<c:url value="/memberPage"/>'"> 
				<div class="header_user_image">
					<c:if test="${empty sessionScope.fileSavedName}">
						<img class="user_img" src="${pageContext.request.contextPath}/resources/images/default_user_img.png" />
					</c:if>

					<c:if test="${not empty sessionScope.fileSavedName}">
						<img class="user_img" src="<spring:url value='/image/${fileSavedName}'/>" />
					</c:if>
				</div>
				
				
				
			</label> 
			
			
			
			<c:if test="${empty sessionScope.memberId}">
			<label class="logout_wrapper"
				onclick="location.href='<c:url value="/signin"/>'">로그인</label>
			</c:if>
			
			<c:if test="${not empty sessionScope.memberId}">
			<label class="logout_wrapper"
				onclick="location.href='<c:url value="/logout"/>'">로그아웃</label>
			</c:if>
			</span>
			
		</div>
	</nav>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
	$('document').ready(
		
		
			$.ajax({
				type:"POST",
				url:'/follow/${sessionScope.memberId}',
				success:function(result){
					var length=result.length;
					if(length >0){
					var str='';
					str+='<div class="uk-dropdown-large" uk-dropdown="animation: slide-top; animate-out: true; mode: click; offset: 20; bg-scroll: true; duration: 700">';
					str+='<ul class="uk-nav uk-dropdown-nav">'; 
					for(var i=0; i<length; i++){
						if(result[i].alarmCode=='f'){
						str+='<div class="follow__wrapper">';
						str+='<li class="uk-active">'+result[i].alarmFromId+'이 회원님을 팔로우 하였습니다.</li>';
						str+='<div class="follow_button__">';
						str+=`<a href="<c:url value='/mypage'/>"><img class="follow_check" src="${pageContext.request.contextPath}/resources/images/follow_check.png" /></a>`;
						str+=`<a href="<c:url value='/'/>"><img class="follow_cancel" src="${pageContext.request.contextPath}/resources/images/follow_cancel.png" /></a>`;
						str+='</div></div>'; 
						}
						
					}
					str+='</ul></div>'; 
					$('.uk-button').after(str);
					}else if(length==0 ){
						var str='';
						str+='<div class="uk-dropdown-large" uk-dropdown="animation: slide-top; animate-out: true; mode: click; offset: 20; bg-scroll: true; duration: 700">';
						str+='<ul class="uk-nav uk-dropdown-nav">'; 
						str+='<div class="follow__wrapper">';
						str+='<li class="uk-active">알림이 없습니다.</li></div>';
						str+='</ul></div>'; 
						$('.uk-button').after(str);
					}
				}
			})
			
			
		
		
	)
	
	
</script>

<script
	src="https://cdn.jsdelivr.net/npm/uikit@3.15.19/dist/js/uikit.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/uikit@3.15.19/dist/js/uikit-icons.min.js"></script>


