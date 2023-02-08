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
<div id="floatMenu" style="top: 280px">
<div class="container_1">
		<div class="leaderboard">
				<div class="head">
					<i class="fas fa-crown"></i>
					<div>✈️ 실시간 여행 인기코스 ✈️</div>
				</div>
				<div class="body">
					<li id="floating_banner_1"><input type="checkbox"
						id="check_btn" /> <label for="check_btn"><span>선택!</span></label></li>

					<li id="floating_banner_1"><input type="text" name="item" class="checkList_input" /> 
					<input type="submit" class="check_list_submit" value="저장" />
					</li>
<%-- 					<c:forEach var="bestPlaceList" items="${bestTravelList}" varStatus="status">
						<a href="<c:url value='travel/${bestPlaceList.travelId}/${bestPlaceList.writer}'/>"><li id="floating__banner_${status.count}">${bestPlaceList.travelTitle}</li></a>
					</c:forEach> --%>
				</div>
	</div>
	</div>
	</div>
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
							<button class="updateBtn" id="unfollowBtn" value="${member.memberId}" onclick="unFollowBlock(this)">언팔하기</button>
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
		console.log("클릭됨");
		follow(true);
	});
	
	function follow(){
		$.ajax({
			type:"POST",
			url:'/follow/${member.memberId}/${sessionScope.memberId}',
			success:function(result){
				console.log("성공"+result);
				if(result == "followOk"){
					$("#followBtn").html("신청완료");
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
						console.log(result[i].fileSavedName);
						if(result[i].fileSavedName == null){
							console.log(result[i].memberId);
							console.log("사진없음");
							str+=`<img class="follower_img" src="${pageContext.request.contextPath}/resources/images/profile_img.jpg" />`;
						}
						if(result[i].fileSavedName!=null){
							console.log("사진있음");
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
						console.log(result[i].fileSavedName);
						if(result[i].fileSavedName == null){
							console.log(result[i].memberId);
							console.log("사진없음");
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
		console.log(deleteUserName);
		$.ajax({
			type:"POST",
			url:'/deleteBlock?value='+deleteUserName,
			success:function(result){
				$(e).html("삭제됨");
				$(e).prop("disabled",true);
				console.log("성공");
			}
			
		}); 
		
	}
	
	function unFollowBlock(e){
		var unFollowName=$(e).val();
		console.log(unFollowName);
		$.ajax({
			type:"POST",
			url:'/unFollowBlock?value='+unFollowName,
			success:function(result){
				$(e).html("팔로우");
				$(e).prop("disabled",true);
			}
		});
	}
	
	function cancelFollow(e){
		var cancelName=$(e).val();
		console.log("신청취소요청");
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
$(".check_list_submit").on("click", function() {
	var checkItem = $("input[name=item]").val();
	
	console.log(checkItem);
 	$.ajax({
		url : '/checkList?checkItem=' + checkItem,
		type : 'POST',
		success : function(data) {
			console.log("받아온 데이터는 " + data);							
		
			}, error : function() {
					console.log("실패");
			}
		}); 
	});

</script>


<%@ include file="../common/footer.jsp"%>
</html>