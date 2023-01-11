<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
					<img class="profile_image"
						src="${pageContext.request.contextPath}/resources/images/profile.jpg" />
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
				<a href='<c:url value="/travel/detail"/>'>
					<div class="card">
						<p class="travel_tit">서울 여행 코스</p>
						<p>2022.12.23 - 25</p>
						<p class="category a">체험/학습</p>
						<div class="icons">
							<img class="views"
								src="${pageContext.request.contextPath}/resources/images/views.png" />
							110 <img class="publish"
								src="${pageContext.request.contextPath}/resources/images/publish.png" />20
						</div>
					</div>
				</a> <a href='<c:url value="/travel/detail"/>'>
					<div class="card">
						<p class="travel_tit">부산 여행 코스</p>
						<p>2022.11.20 - 21</p>
						<p class="category b">스포츠/문화</p>
						<div class="icons">
							<img class="views"
								src="${pageContext.request.contextPath}/resources/images/views.png" />
							118 <img class="publish"
								src="${pageContext.request.contextPath}/resources/images/publish.png" />12
						</div>
					</div>
				</a> <a href='<c:url value="/travel/detail"/>'>
					<div class="card">
						<p class="travel_tit">강원도 여행 코스</p>
						<p>2022.8.13 - 17</p>
						<p class="category">자연/힐링</p>
						<div class="icons">
							<img class="views"
								src="${pageContext.request.contextPath}/resources/images/views.png" />
							225 <img class="publish"
								src="${pageContext.request.contextPath}/resources/images/publish.png" />33
						</div>
					</div>
				</a> <a href='<c:url value="/travel/detail"/>'>
					<div class="card">
						<p class="travel_tit">경주 여행 코스</p>
						<p>2022.5.21 - 22</p>
						<p class="category a">체험/학습</p>
						<div class="icons">
							<img class="views"
								src="${pageContext.request.contextPath}/resources/images/views.png" />
							183 <img class="publish"
								src="${pageContext.request.contextPath}/resources/images/publish.png" />29
						</div>
					</div>
				</a> </a> <a href='<c:url value="/travel/insert"/>'>
					<div class="card last">
						<div class="add">
							<button type="button" class="insert_btn">
								<img class="add_img"
									src="${pageContext.request.contextPath}/resources/images/add.png">
							</button>
							<label class="add_label">일정 추가하기</label>
						</div>
					</div>
				</a>
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