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
				
				
				 <div class="uk-dropdown-large" uk-dropdown="animation: slide-top; animate-out: true; mode: click; offset: 20; bg-scroll: true; duration: 700">
					<ul class="uk-nav uk-dropdown-nav">
						
						<!-- 알림 리스트 -->
						
					</ul>
				</div> 
				
				
				
				
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
				<c:if test="${empty sessionScope.access_Token}">
					<label class="logout_wrapper"
				onclick="location.href='<c:url value="/logout"/>'">로그아웃</label>
				</c:if>
				
				<c:if test="${not empty sessionScope.access_Token}">
					<label class="logout_wrapper"
				onclick="location.href='<c:url value="/login/logout_proc"/>'">로그아웃</label>
				
				</c:if>
			
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
					console.log("성공");
						for(var i=0; i<length; i++){
							console.log(i);
							if(result[i].alarmCode=='f'){
								
								var str='';
									if(result[i].followStatus=='N' ){
										str+='<div class="follow__wrapper" id='+i+'>';
										/* str+='<li class="uk-active">'+result[i].alarmFromId+'이 회원님을 팔로우 하였습니다.</li>'; */
										str+=`<li class="uk-active"><a href="<c:url value='/mypage/`+result[i].alarmFromId+`'/>">`+result[i].alarmFromId+`</a>이 회원님을 팔로우 하였습니다.</li>`;
										str+='<div class="follow_button__">';
										str+='<button class="alarm_accept_btn" name='+i+' id='+result[i].alarmSeq+' onclick="follow_accept(this)" value='+result[i].alarmFromId+' >수락</button>';
										str+='<button class="alarm_reject_btn" id='+i+' onclick="follow_reject(this)" value='+result[i].alarmFromId+'>거절</button>';
										str+='<img class="follow_cancel" src="${pageContext.request.contextPath}/resources/images/close.png" value='+i+' onclick="closeAlarm(this)"/>';
										str+='</div></div>'; 
									}
									if(result[i].followStatus=='Y'){
										str+='<div class="follow__wrapper" id='+i+'>';
										str+='<input type="hidden" id='+i+' value='+result[i].alarmSeq+'>';
										str+='<li class="uk-active">'+result[i].alarmFromId+'이 회원님을 팔로우 하였습니다.</li>';
										str+='<div class="follow_button__">';
										str+='<button class="alarm_accept_btn" disabled="disabled">수락됨</button>';
										str+='<img class="follow_cancel" src="${pageContext.request.contextPath}/resources/images/close.png" value='+i+' onclick="closeAlarm(this)" />';
										str+='</div></div>'; 
									}
									if(result[i].followStatus=='U'){
										str+='<div class="follow__wrapper" id='+i+'>';
										str+='<input type="hidden" id='+i+' value='+result[i].alarmSeq+'>';
										str+='<li class="uk-active">'+result[i].alarmFromId+'이 회원님을 팔로우 하였습니다.</li>';
										str+='<div class="follow_button__">';
										str+='<button class="alarm_reject_btn" disabled="disabled">취소됨</button>';
										str+='<img class="follow_cancel" src="${pageContext.request.contextPath}/resources/images/close.png" value='+i+' onclick="closeAlarm(this)" />';
										str+='</div></div>'; 
									}
									if(result[i].followStatus==null){
										str+='<div class="follow__wrapper" id='+i+'>';
										str+='<input type="hidden" id='+i+' value='+result[i].alarmSeq+'>';
										str+='<li class="uk-active">'+result[i].alarmFromId+'이 회원님을 팔로우 하였습니다.</li>';
										str+='<img class="follow_cancel" src="${pageContext.request.contextPath}/resources/images/close.png" value='+i+' onclick="closeAlarm(this)" />';
										str+='</div>'; 
									}
									
							}
							$('.uk-nav').append(str);
						}
					
						
						
					}else if(length == 0 ){
						console.log('알림없음');
						var str='';
						str+='<div class="follow__wrapper">';
						str+='<li class="uk-active"> 알림이 없습니다. </li></div>';
						str+='</ul></div>'; 
						$('.uk-nav').append(str);
					}
				}
			})
			//ajax 끝
			
					
			
		
		
)

function follow_accept(e){
	var memberId=$(e).attr('value');
	var num=$(e).attr('name');
	
	$.ajax({
		type:'POST',
		url:'/acceptFollow/${sessionScope.memberId}?value='+memberId,
		success:function(result){
			console.log("승낙완료");
			console.log(num);
			$('button[id='+num+']').prop("disabled",true); 
			$(e).html("수락됨");
			
			
		}
	})
		
}	

function follow_reject(e){
	var memberId=$(e).attr('value');
	var num=$(e).attr('id');
	console.log(num);
	$.ajax({
		type:'POST',
		url:'/rejectFollow/${sessionScope.memberId}?value='+memberId+'&value2='+num,
		success:function(result){
			console.log("거절완료");
			$('button[name='+num+']').prop("disabled",true);
			$(e).html("거절됨");
		}
	})
}

function closeAlarm(e){
	var liId=$(e).attr('value');
	var alarmSeq=$('input[id='+liId+']').val();
	
	 $.ajax({
		type:'POST',
		url:'/removeAlarm?value='+alarmSeq,
		success:function(result){
			$('div[id='+liId+']').remove();
			console.log("알림 삭제완료");
			
		}
	}) 
	
}
	
	
	
	
</script>

<script
	src="https://cdn.jsdelivr.net/npm/uikit@3.15.19/dist/js/uikit.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/uikit@3.15.19/dist/js/uikit-icons.min.js"></script>


