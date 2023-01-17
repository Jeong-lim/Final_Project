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
	<br>
	<br>
	<br>
	<div class="container_top">
		<div class="container">
			<h1 class="mypage_title">마이페이지</h1>
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
					<p>${member.phoneNumber}</p>
					<p>
						게시글 수 ${travelCount} <label class="openBtnFollower">팔로워 ${followerNum}</label ><label class="openBtnFollowing">팔로우  ${followingNum}</label>
					</p>
				</div>
				<div class="profile_update">
					<c:if test="${member.memberId == sessionScope.memberId }">
						<button class="updateBtn"
							onclick="location.href='<c:url value="/mypage/update"/>'">회원정보수정</button>
					</c:if>
					
					<c:if test="${followStatus == null }">
						<c:if test="${member.memberId != sessionScope.memberId }">
							<button class="updateBtn" id="followBtn">팔로우</button>
						</c:if>
					</c:if>
					<c:if test="${followStatus != null }">
						<c:if test="${followStatus =='N' }">
							<button class="updateBtn" id="followBtn">신청완료</button>
						</c:if>
						<c:if test="${followStatus =='Y' }">
							<button class="updateBtn" id="followBtn">언팔하기</button>
						</c:if>
					</c:if>
				</div>
			</div>
		 
			<div class="mytravel">
				<c:forEach items="${userList}" var="travel">
				<fmt:parseDate var="date_date" value="${ travel.travelStart }" pattern="yyyy-MM-dd" />
				<fmt:formatDate value="${date_date}" pattern="yyyy/MM/dd" var="start_date"/>
				<fmt:parseDate var="date_date2" value="${ travel.travelEnd }" pattern="yyyy-MM-dd" />
				<fmt:formatDate value="${date_date2}" pattern="dd" var="end_date"/>
				<a href='<c:url value="/travel/detail"/>'>
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
						<input type="text" class="select" spellcheck="false"> <img
							src="../resources/images/search.png">
					</div>
					<div class="box">

						<ul class="modal_ul">
							<li class="modal_li"><a href='<c:url value="/mypage"/>'><img
									class="follower_img"
									src="${pageContext.request.contextPath}/resources/images/profile_img.jpg" /><label
									class="follower_id">dudtj1234</label></a>
								<button class="block">차단</button></li>
							
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
						<input type="text" class="select" spellcheck="false"> <img
							src="../resources/images/search.png">
					</div>
					<div class="box">

						<ul class="modal_ul">
							<li class="modal_li"><a href='<c:url value="/mypage"/>'><img
									class="follower_img"
									src="${pageContext.request.contextPath}/resources/images/profile_img.jpg" /><label
									class="follower_id">dudtj1234</label></a>
								<button class="block">차단</button></li>
							
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
  }
  
  const close2 = () => {
	  document.querySelector("#modal2").classList.add("hidden");
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
					
				}
			}
		});
	}
</script>

<%@ include file="../common/footer.jsp"%>
</html>