<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage.css" />
<%@ include file="/WEB-INF/views/common/header.jsp"%>

</head>

<body>

<c:if test="${member.memberId eq sessionScope.memberId}">
<div id="floatMenu" style="top: 280px">
<div class="container_1">
		<div class="leaderboard">
				<div class="head">
					<i class="fas fa-crown"></i>
					<div>✈️ 체크리스트 ✈️</div>
				</div>
			

				<div class="body" id="checkListBody">
				
					<c:forEach var="checkList" items="${checkList}" varStatus="status">
					<li id="checkCancle${status.count}" name="checkCancleClass" class="floating__banner_1">
					<input type="hidden" name="checkCancle${status.count}" value="${checkList.checkListId}" />
					<input type="hidden" name="checkInsert${status.count}" value="${checkList.checkListId}" />
					<input type="hidden" name="checkInsert${status.count}" value="${checkList.itemStatus}" />
					<input type="checkbox" id="checkInsert${status.count}" value="${checkList.checkListId}" class="checkbox" ${checkList.itemStatus == "N" ? "checked" : ""} /> 
						<span class="check_text">${checkList.item}</span><div class="cancle_check" name="cancle_check" id="checkCancle${status.count}">✖️</div>	
					</li>
					
					</c:forEach>

					<li class="floating__banner_2"><input type="text" name="item" class="checkList_input" /> 
					<input type="submit" class="check_list_submit" id="check_list_insert" value="저장" />
					</li>

				</div>
	</div>
	</div>
	</div>
	
</c:if>	
	
	<br>
	<br>
	<br>
	<div class="container_top">
		<div class="container">
			<c:if test="${member.memberId eq sessionScope.memberId}">
				<h1 class="mypage_title">마이페이지</h1>
			</c:if>
			<c:if test="${member.memberId ne sessionScope.memberId}">
				<h1 class="mypage_title">프로필</h1>
			</c:if>
			<br>
			<div class="profile">
				<div class="profile_img">
					<c:if test="${member.memberId == sessionScope.memberId }">
						<c:if test="${empty sessionScope.fileSavedName}">
							<img class="profile_image" src="${pageContext.request.contextPath}/resources/images/default_user_img.png" />
						</c:if>
	
						<c:if test="${not empty sessionScope.fileSavedName}">
							<img class="profile_image"
								src="<spring:url value='/image/${fileSavedName}'/>" />
						</c:if>
					</c:if>	
					<c:if test="${member.memberId != sessionScope.memberId }">
						<c:if test="${member.fileSavedName ne null }">
							<img class="profile_image" src="<spring:url value='/image/${member.fileSavedName }'/>"/>
						</c:if>
						<c:if test="${member.fileSavedName eq null }">
							<img class="profile_image" src="${pageContext.request.contextPath}/resources/images/default_user_img.png" />
						</c:if>
					</c:if>
					
					
						<div></div>
						<div></div>
						<div></div>
						<div></div>
						<div></div>
						<div></div>
					
			
					
				</div>
				<div class="profile_info">
					<p>${member.memberName}</p>
					<p>${member.email}</p>
					<p>
						게시글 수 ${travelCount} <label class="openBtnFollower"> 팔로워 ${followerNum}</label ><label class="openBtnFollowing"> 팔로우  ${followingNum}</label>
					</p>
				</div>
				<div class="profile_update">
					<c:if test="${member.memberId == sessionScope.memberId}">
						<button class="updateBtn"
							onclick="location.href='<c:url value="/mypage/update"/>'">회원정보수정</button>
					</c:if>
					
					<c:if test="${followStatus == null || followStatus =='U' }">
						<c:if test="${member.memberId != sessionScope.memberId }">
							<button class="updateBtn" id="followBtn">팔로우</button>
						</c:if>
					</c:if>
					<c:if test="${followStatus != null }">
						<c:if test="${followStatus =='N' }">
							<button class="updateBtn" id="notfollowBtn" value="${member.memberId }" onclick="cancelFollow(this)">신청완료</button>
						</c:if>
						<c:if test="${followStatus =='Y' }">
							<button class="updateBtn" id="unfollowBtn" value="${member.memberId}" onclick="unFollow(this)">언팔하기</button>
						</c:if>
					</c:if>
				</div>
			</div>
		 
			<div class="mytravel">
				<c:forEach items="${userList}" var="travel">
				<fmt:parseDate var="date_date" value="${ travel.travelStart }" pattern="yyyy/MM/dd" />
				<fmt:formatDate value="${date_date}" pattern="yyyy/MM/dd" var="start_date"/>
				<fmt:parseDate var="date_date2" value="${ travel.travelEnd }" pattern="yyyy/MM/dd" />
				<fmt:formatDate value="${date_date2}" pattern="dd" var="end_date"/>
				<a href='<c:url value="/travel/${travel.travelId}/${travel.writer}"/>'>
					<div class="card">
						<p class="travel_tit">${ travel.travelTitle }</p>
						
						
						<p class="start_date_mypage">${ start_date } ~ ${ end_date }</p>		
						
						<br />
						
							<c:if test="${travel.categoryName eq '자연/힐링'}" >
								<p class="category a">${ travel.categoryName }</p> 
							</c:if>
							<c:if test="${travel.categoryName eq '문화/예술'}" >
								<p class="category b">${ travel.categoryName }</p> 
							</c:if>
							<c:if test="${travel.categoryName eq '체험/학습/산업'}" >
								<p class="category c">${ travel.categoryName }</p> 
							</c:if>
							<c:if test="${travel.categoryName eq '캠핑/스포츠'}" >
								<p class="category d">${ travel.categoryName }</p> 
							</c:if>
							<c:if test="${travel.categoryName eq '종교/역사/전통'}" >
								<p class="category e">${ travel.categoryName }</p> 
							</c:if>
							<c:if test="${travel.categoryName eq '쇼핑/놀이'}" >
								<p class="category f">${ travel.categoryName }</p> 
							</c:if>

						<div class="icons">
							<img class="views"
								src="${pageContext.request.contextPath}/resources/images/views.png" />
							${ travel.viewCount } <img class="publish"
								src="${pageContext.request.contextPath}/resources/images/publish.png" />${ travel.shareCount }
						</div>
					</div>
				</a>
				</c:forEach>
			</div>

			<!-- 팔로워 모달 -->
			<div class="modal hidden" id="modal1">
				<div class="bg"></div>
				<div class="modalBox">
					<div class="follower">
						<img class="modal_logo" src="../resources/images/logo.png">
						<label class="follower_tit">팔로워</label>
						<div class="close closeBtnFollower">x</div>
					</div>
					<div class="search">
						<input type="text" class="select" id="select1" spellcheck="false" maxlength="20"> <img
							src="../resources/images/search.png">
					</div>
					<div class="box">

						<ul class="modal_ul" id="modal_ul_follower">
						
						<c:if test="${not empty followerList}">
							<c:forEach var="follower" items="${followerList}">
								<li class="modal_li"><a href='<c:url value="/mypage/${follower.memberId }"/>'>
									<c:if test="${follower.fileSavedName eq null }">
										<img class="follower_img" src="${pageContext.request.contextPath}/resources/images/profile_img.jpg" />
									</c:if>
									<c:if test="${follower.fileSavedName ne null }">
										 <img class="follower_img"  src="<spring:url value='/image/${follower.fileSavedName}'/>" /> 
									</c:if>							
								<label class="follower_id">${follower.memberId }</label></a>
									<c:if test="${member.memberId == sessionScope.memberId}">
										<button class="block" id="deleteBlock" value="${follower.memberId}" onclick="deleteBlock(this)" >삭제</button></li>
									</c:if>
							</c:forEach>
						</c:if>
						<c:if test="${empty followerList }">
							${msg}
						</c:if>
									
									
									
						
						</ul>
					</div>

				</div>
			</div>
			
			<!-- 팔로우 모달 -->
			<div class="modal hidden" id="modal2">
				<div class="bg" id="bg"></div>
				<div class="modalBox">
					<div class="follower">
						<img class="modal_logo" src="../resources/images/logo.png">
						<label class="follower_tit">팔로우</label>
						<div class="close closeBtnFollowing">x</div>
					</div>
					<div class="search">
						<input type="text" class="select" id="select2" spellcheck="false" maxlength="20"> <img
							src="../resources/images/search.png">
					</div>
					<div class="box">
						<ul class="modal_ul" id="modal_ul_follow">
							<c:if test="${not empty followList}">
								<c:forEach var="follow" items="${followList }">
									<li class="modal_li"><a href='<c:url value="/mypage/${follow.memberId }"/>'>
										<c:if test="${follow.fileSavedName eq null }">
											<img class="follower_img" src="${pageContext.request.contextPath}/resources/images/profile_img.jpg" />
										</c:if>
										<c:if test="${follow.fileSavedName ne null }">
											 <img class="follower_img"  src="<spring:url value='/image/${follow.fileSavedName}'/>" /> 
										</c:if>
									<label class="follower_id">${follow.memberId }</label></a>
									
									<c:if test="${member.memberId == sessionScope.memberId}">
										<button class="block" id="unFollowBlock" value="${follow.memberId }" onclick="unFollowBlock(this)">언팔로우</button></li>
									</c:if>
								</c:forEach>
							</c:if>
							<c:if test="${empty followList }">
								${msg}
							</c:if>
						</ul>
					</div>

				</div>
			</div>



		</div>
	</div>
</body>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>




<script>
  const open = () => {
    document.querySelector("#modal1").classList.remove("hidden");
    document.body.style.overflow = "hidden";
  }
  
  const open2 = () => {
	  document.querySelector("#modal2").classList.remove("hidden");
	    document.body.style.overflow = "hidden";
  }

  const close = () => {
    document.querySelector("#modal1").classList.add("hidden");
    location.reload();
  }
  
  const close2 = () => {
	  document.querySelector("#modal2").classList.add("hidden");
	  location.reload();
  }

  document.querySelector(".openBtnFollower").addEventListener("click", open);
  document.querySelector(".closeBtnFollower").addEventListener("click", close);
  document.querySelector(".bg").addEventListener("click", close);
  
  document.querySelector(".openBtnFollowing").addEventListener("click", open2);
  document.querySelector(".closeBtnFollowing").addEventListener("click", close2);
  document.querySelector("#bg").addEventListener("click", close2);
  
  document.body.style.overflow = "unset";

</script>
<script>
	$("#followBtn").click(function(){
		follow(true);
	});
	
	function follow(){
		$.ajax({
			type:"POST",
			url:'/follow/${member.memberId}/${sessionScope.memberId}',
			success:function(result){
				if(result == "followOk"){
					$("#followBtn").html("신청완료");
					/* $("#followBtn").attr("id","notfollowBtn"); */
					location.reload();
				}
			}
		});
	}
	
	$("#select1").keyup(function(){
		var keyword=$("#select1").val();
		if(keyword ==''){
			$('#modal_ul_follower').html('');
			$('#modal_ul_follower').append("검색어를 입력해주세요");
		}
		else{
			$.ajax({
				type:"POST",
				url:'/userSearch?value='+keyword,
				success:function(result){                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
					$('#modal_ul_follower').html('');
					
					var length= result.length;
					for(var i=0;i<length; i++){
						var str='';
						str+=`<li class="modal_li"><a href='<c:url value="/mypage/`+result[i].memberId+`"/>'>`;
						if(result[i].fileSavedName == null){
							str+=`<img class="follower_img" src="${pageContext.request.contextPath}/resources/images/profile_img.jpg" />`;
						}
						if(result[i].fileSavedName!=null){
							str+=`<img class="follower_img"  src="<spring:url value='/image/` + result[i].fileSavedName + `'/>" />`;
						}
						str+='<label class="follower_id">'+result[i].memberId+'</label></a>';
						
						$('#modal_ul_follower').append(str);
					}
				}
				
			});
		}
	});
	  
	$("#select2").keyup(function(){
		var keyword=$("#select2").val();
		if(keyword ==''){
			$('#modal_ul_follow').html('');
			$('#modal_ul_follow').append("검색어를 입력해주세요");
		}
		else{
			$.ajax({
				type:"POST",
				url:'/userSearch?value='+keyword,
				success:function(result){
					$('#modal_ul_follow').html('');
					
					var length= result.length;
					for(var i=0;i<length; i++){
						var str='';
						str+=`<li class="modal_li"><a href='<c:url value="/mypage/`+result[i].memberId+`"/>'>`;
						if(result[i].fileSavedName == null){
							str+=`<img class="follower_img" src="${pageContext.request.contextPath}/resources/images/profile_img.jpg" />`;
						}
						if(result[i].fileSavedName!=null){
							str+=`<img class="follower_img"  src="<spring:url value='/image/` + result[i].fileSavedName + `'/>" />`;
						}
						str+='<label class="follower_id">'+result[i].memberId+'</label></a>';
						
						$('#modal_ul_follow').append(str);
					}
				}
				
			});
		}
	});
	
	function deleteBlock(e){
		var deleteUserName=$('#deleteBlock').val();
		$.ajax({
			type:"POST",
			url:'/deleteBlock?value='+deleteUserName,
			success:function(result){
				$(e).html("삭제됨");
				$(e).prop("disabled",true);

			}
			
		}); 
		
	}
	
	//언팔하기 (리스트에서 언팔)
	function unFollowBlock(e){
		var unFollowName=$(e).val();
		$.ajax({
			type:"POST",
			url:'/unFollowBlock?value='+unFollowName,
			success:function(result){
				$(e).html("팔로우");
				$(e).prop("disabled",true);

			}
		});
	}
	
	//언팔하기(사용자페이지에서 언팔)
	function unFollow(e){
		var unFollowName=$(e).val();
		$.ajax({
			type:"POST",
			url:'/unFollowBlock?value='+unFollowName,
			success:function(result){
				$(e).html("팔로우");
				location.reload();

			}
		});
	}
	
	//팔로우신청 취소 요청
	function cancelFollow(e){
		var cancelName=$(e).val();
		$.ajax({
			type:"POST",
			url:'/cancelFollow?value='+cancelName,
					success:function(result){
						$(e).html("팔로우");
						location.reload();
					}
		});
	}
	
	
	$(document).ready(function() {

		// 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
		var floatPosition = parseInt($("#floatMenu").css('top'));
		// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );
		$(window).scroll(function() {

			// 현재 스크롤 위치를 가져온다.
			var scrollTop = $(window).scrollTop();
			var newPosition = scrollTop + floatPosition + "px";
			$("#floatMenu").stop().animate({
				"top" : newPosition
			}, 650);

		}).scroll();

	});
	

</script>

<script>
$("#check_list_insert").on("click", function() {
	var checkItem = $("input[name=item]").val();
	
	if(checkItem == ""){
        alert("입력해주세요");
    } else {
    	$.ajax({
    		url : '/checkList?checkItem=' + checkItem,
    		type : 'POST',
    		async: false,
    		success : function(data) {
    			if(data == 'Y') {
    				location.reload();
    			} else {
    				alert("체크박스는 10개까지 입력가능합니다.")
    			}

    			}, error : function() {
    			}
    		});
    }
 	 

	
	});

	


</script>
<script>


	$(document).ready(function() {
		var status_array = Array();
		var chkbox = $(".checkbox");
		var item_array = Array();
		var send_cnt = 0;
		
		$('input[type="checkbox"]').click(function() {

			
			var checkName = $(this).attr('id');
			var checkListId = document.getElementById(checkName).id;

			var obj = document.getElementsByName(checkName);

			
			var checkId = obj[0].value;
			var status = obj[1].value;

			
			
			if(status == 'Y') {
				status = 'N';
			} else {
				status = 'Y';
			}

			var Params = {
					"checkId" : checkId,
					"status" : status
			};
			
			$.ajax({
				url : '/checkList/update',
				type : 'POST',
				data : Params,
				success : function() {
					console.log("성공");
					location.reload();
					}, error : function() {
						console.log("실패");
					}, complete: function() {
						
					}
				});

		});
		

	});
	

	$('div[name="cancle_check"]').click(function(){
		
		var checkName = $(this).attr('id');
		var checkListId = document.getElementById(checkName).id;		
		var obj = document.getElementsByName(checkName);
		var checkId = obj[0].value;
		 
		// checkId 같이 들고와서 삭제해주기
		if(checkName == checkListId) {
			 $.ajax({
				url : '/checkList/delete?checkId=' + checkId,
				type : 'POST',
				success : function(data) {
					location.reload();
					}, error : function() {
						console.log("실패");
					}, complete: function() {

					}
				});
			
		} else {
			alert("둘이 틀려 ~~~~~~~~~");
		}
	});

	
		
</script>


<%@ include file="../common/footer.jsp"%>
</html>