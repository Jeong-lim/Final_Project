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
				
					<c:if test="${empty sessionScope.fileSavedName}">
						<img class="profile_image" src="${pageContext.request.contextPath}/resources/images/default_user_img.png" />
					</c:if>

					<c:if test="${not empty sessionScope.fileSavedName}">
						<img class="profile_image"
							src="<spring:url value='/image/${fileSavedName}'/>" />
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
						게시글 수 4 <label class="openBtn">팔로워 9</label> 팔로우 3
					</p>
				</div>
				<div class="profile_update">
					<button class="updateBtn"
						onclick="location.href='<c:url value="/mypage/update"/>'">회원정보수정</button>
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
						
						<c:choose>
							<c:when test="${travel.categoryName eq '자연/휴양'}" >
								<p class="category a">${ travel.categoryName }</p> 
							</c:when>
							
							<c:when test="${travel.categoryName eq '문화/예술'}">
								<p class="category b">${ travel.categoryName }</p>
							</c:when>
							
							<c:when test="${travel.categoryName eq '체험/학습/산업'}">
								<p class="category c">${ travel.categoryName }</p>
							</c:when>
							
							<c:when test="${travel.categoryName eq '캠핑/스포츠'}">
								<p class="category d">${ travel.categoryName }</p> 
							</c:when>
							
							<c:when test="${travel.categoryName eq '종교/역사/전통'}">
								<p class="category e">${ travel.categoryName }</p> 
							</c:when>
							
							<c:when test="${travel.categoryName eq '쇼핑/놀이'}">
								<p class="category f">${ travel.categoryName }</p> 
							</c:when>
						</c:choose>
					
						
						
						
						
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
			<div class="modal hidden">
				<div class="bg"></div>
				<div class="modalBox">
					<div class="follower">
						<img class="modal_logo" src="../resources/images/logo.png">
						<label class="follower_tit">팔로워</label>
						<div class="close closeBtn"></div>
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
							<li class="modal_li"><a href='<c:url value="/mypage"/>'><img
									class="follower_img"
									src="${pageContext.request.contextPath}/resources/images/profile_img.jpg" /><label
									class="follower_id">moomoogayoung</label></a>
								<button class="block">차단</button></li>
							<li class="modal_li"><a href='<c:url value="/mypage"/>'><img
									class="follower_img"
									src="${pageContext.request.contextPath}/resources/images/profile_img.jpg" /><label
									class="follower_id">jungrimlee</label></a>
								<button class="block">차단</button></li>
							<li class="modal_li"><a href='<c:url value="/mypage"/>'><img
									class="follower_img"
									src="${pageContext.request.contextPath}/resources/images/profile_img.jpg" /><label
									class="follower_id">youngseo98</label></a>
								<button class="block">차단</button></li>
							<li class="modal_li"><a href='<c:url value="/mypage"/>'><img
									class="follower_img"
									src="${pageContext.request.contextPath}/resources/images/profile_img.jpg" /><label
									class="follower_id">youngseo98</label></a>
								<button class="block">차단</button></li>
							<li class="modal_li"><a href='<c:url value="/mypage"/>'><img
									class="follower_img"
									src="${pageContext.request.contextPath}/resources/images/profile_img.jpg" /><label
									class="follower_id">youngseo98</label></a>
								<button class="block">차단</button></li>
							<li class="modal_li"><a href='<c:url value="/mypage"/>'><img
									class="follower_img"
									src="${pageContext.request.contextPath}/resources/images/profile_img.jpg" /><label
									class="follower_id">youngseo98</label></a>
								<button class="block">차단</button></li>
							<li class="modal_li"><a href='<c:url value="/mypage"/>'><img
									class="follower_img"
									src="${pageContext.request.contextPath}/resources/images/profile_img.jpg" /><label
									class="follower_id">youngseo98</label></a>
								<button class="block">차단</button></li>
							<li class="modal_li"><a href='<c:url value="/mypage"/>'><img
									class="follower_img"
									src="${pageContext.request.contextPath}/resources/images/profile_img.jpg" /><label
									class="follower_id">youngseo98</label></a>
								<button class="block">차단</button></li>
						</ul>
					</div>

				</div>
			</div>



		</div>
	</div>
</body>
<script>
  const open = () => {
    document.querySelector(".modal").classList.remove("hidden");
    document.body.style.overflow = "hidden";
  }

  const close = () => {
    document.querySelector(".modal").classList.add("hidden");
  }

  document.querySelector(".openBtn").addEventListener("click", open);
  document.querySelector(".closeBtn").addEventListener("click", close);
  document.querySelector(".bg").addEventListener("click", close);
  document.body.style.overflow = "unset";

</script>

<%@ include file="../common/footer.jsp"%>
</html>