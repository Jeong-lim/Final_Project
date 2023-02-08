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
			<button type="button" class="chatBtn" onClick="chatStart()">
				<img class="chat_img"
					src="${pageContext.request.contextPath}/resources/images/chat.png">
			</button>
			<div uk-dropdown="mode: click">

				<div class="container2">
					<h4 class="page-header">🚌여행 정보를 공유해보세요!🚌</h4>

					<table class="table table-bordered">
						<tr>
							<td><input type="text" name="user" id="user"
								class="form-control" placeholder="유저명"
								value="${sessionScope.memberId}"></td>
							<td>
								<button type="button" class="btn btn-default" id="btnConnect">연결</button>
								<button type="button" class="btn btn-default" id="btnDisconnect"
									disabled>종료</button>
							</td>
						</tr>
						<tr>
							<td colspan="2"><div id="list"></div></td>
						</tr>
						<tr>
							<td colspan="2"><input type="text" name="msg" id="msg"
								placeholder="대화 내용을 입력하세요." class="form-control" disabled></td>
						</tr>
					</table>

				</div>
			</div>
		</div>
		
		
			<div class="uk-inline">
				<button class="uk-button uk-button-default" id="alarmBtn" type="button" >
					<%-- <img class="header__alarm__img"
						src="${pageContext.request.contextPath}/resources/images/alarm_full.png"> --%>
				</button>
				
				
				 <div class="uk-dropdown-large" uk-dropdown="animation: slide-top; animate-out: true; mode: click; offset: 20; bg-scroll: true; duration: 700">
					<ul class="uk-nav uk-dropdown-nav">
						
						<!-- 알림 리스트 -->
						
					</ul>
				</div> 
				
				
				
				
		    </div>
			
			<c:if test="${empty sessionScope.memberId}">
				<span class="navbar__links_2">
			</c:if>
			
			<c:if test="${not empty sessionScope.memberId}">
				<span class="navbar__links">
			</c:if>
			
			 <label class="navbar__links__li"
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
						var str2='<img class="header__alarm__img" src="${pageContext.request.contextPath}/resources/images/alarm_full.png">';
						$('.uk-button').append(str2);
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
							else if(result[i].alarmCode !='f'){
								var str='';
								str+='<div class="follow__wrapper" id='+i+'>';
								str+='<input type="hidden" id='+i+' value='+result[i].alarmSeq+'>';
								str+=`<li class="uk-active">`+result[i].alarmFromId+`이 <a href="<c:url value='/travel/`+result[i].alarmCode+`/`+result[i].alarmToId+`'/>">게시물</a>을 스크랩 하였습니다.</li>`;
								str+='<img class="follow_cancel" src="${pageContext.request.contextPath}/resources/images/close.png" value='+i+' onclick="closeAlarm(this)" />';
								str+='</div>'; 
							}
							$('.uk-nav').append(str);
						}
					
						
						
					}else if(length == 0 ){
						console.log('알림없음');
						var str='';
						var str2='';
						str2+='<img class="header__alarm__img" src="${pageContext.request.contextPath}/resources/images/alarm.png">';
						$('.uk-button').append(str2);
						
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
         /* $('button[name='+num+']').prop("disabled",true); */
         $('button[name=]'+num+']').remove();
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
         location.reload();
      }
   }) 
   
}

</script>
<script>
function chatStart(e) {
    console.log("채팅");
    
     $.ajax({
        url:'chat.action',
        method: "POST",
        success:function(result){
     	   console.log("채팅채팅");
     	   
    		
        }
        
     }); 
 	 
   
 	}
</script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
//채팅 서버 주소
let url = "ws://192.168.0.29/chatserver";
   		
// 웹 소켓
let ws;

// 연결하기
$('#btnConnect').click(function() {

	// 유저명 확인
   	if ($('#user').val().trim() != '') {
   		// 연결
	   	ws = new WebSocket(url);
	   			
	   	// 소켓 이벤트 매핑
	   	ws.onopen = function (evt) {
	   		// console.log('서버 연결 성공');
	   		print($('#user').val(), '입장했습니다.');
	   				
	   		// 현재 사용자가 입장했다고 서버에게 통지(유저명 전달)
	   		// -> 1#유저명
			ws.send('1#' + $('#user').val() + '#');
					
			$('#user').attr('readonly', true);
			$('#btnConnect').attr('disabled', true);
			$('#btnDisconnect').attr('disabled', false);
			$('#msg').attr('disabled', false);
			$('#msg').focus();
		};
        
		ws.onmessage = function (evt) {
			// print('', evt.data);
			let index = evt.data.indexOf("#", 2);
			let no = evt.data.substring(0, 1); 
			let user = evt.data.substring(2, index);
			let txt = evt.data.substring(index + 1);
	   				
			if (no == '1') {
				print2(user);
			} else if (no == '2') {
				print(user, txt);
			} else if (no == '3') {
				print3(user);
			}
			$('#list').scrollTop($('#list').prop('scrollHeight'));
		};
	   			
		ws.onclose = function (evt) {
			console.log('소켓이 닫힙니다.');
		};

		ws.onerror = function (evt) {
			console.log(evt.data);
		};
	} else {
		alert('유저명을 입력하세요.');
		$('#user').focus();
	}
});

// 메세지 전송 및 아이디
function print(user, txt) {
	let temp = '';
	temp += '<div style="margin-bottom:3px;">';
	temp += '[' + user + '] ';
	temp += txt;
	temp += ' <span style="font-size:11px;color:#777;">' + new Date().toLocaleTimeString() + '</span>';
	temp += '</div>';
			
	$('#list').append(temp);
}
		
// 다른 client 접속		
function print2(user) {
	let temp = '';
	temp += '<div style="margin-bottom:3px;">';
	temp += "'" + user + "' 이(가) 접속했습니다." ;
	temp += ' <span style="font-size:11px;color:#777;">' + new Date().toLocaleTimeString() + '</span>';
	temp += '</div>';
			
	$('#list').append(temp);
}

// client 접속 종료
function print3(user) {
	let temp = '';
	temp += '<div style="margin-bottom:3px;">';
	temp += "'" + user + "' 이(가) 종료했습니다." ;
	temp += ' <span style="font-size:11px;color:#777;">' + new Date().toLocaleTimeString() + '</span>';
	temp += '</div>';
			
	$('#list').append(temp);
}

$('#user').keydown(function() {
	if (event.keyCode == 13) {
		$('#btnConnect').click();
	}
});
		
		
		
$('#msg').keydown(function() {
	if (event.keyCode == 13) {
				
		//서버에게 메시지 전달
		//2#유저명#메시지
		ws.send('2#' + $('#user').val() + '#' + $(this).val()); //서버에게
		print($('#user').val(), $(this).val()); //본인 대화창에
		
        $('#msg').val('');
		$('#msg').focus();
				
	}
});
		
$('#btnDisconnect').click(function() {
	ws.send('3#' + $('#user').val() + '#');
	ws.close();
			
	$('#user').attr('readonly', false);
    $('#user').val('');
			
	$('#btnConnect').attr('disabled', false);
	$('#btnDisconnect').attr('disabled', true);
			
	$('#msg').val('');
	$('#msg').attr('disabled', true);
});
</script>

<script
   src="https://cdn.jsdelivr.net/npm/uikit@3.15.19/dist/js/uikit.min.js"></script>
<script
   src="https://cdn.jsdelivr.net/npm/uikit@3.15.19/dist/js/uikit-icons.min.js"></script>

