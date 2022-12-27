<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../common/header.jsp"%>
</head>
<style>
.container_top {
	text-align: center;
}

.container {
	width: 1000px;
	min-height: 800px;
	margin: auto;
}

.mypage_title {
	text-align: center;
}

.profile {
	width: 800px;
	border-bottom: 2px solid #A4A4A4;
	padding: 20px;
	height: 160px;
	margin: auto;
}

.profile_img {
	float: left;
	border: 1px solid black;
	width: 140px;
	height: 140px;
	margin: 10px;
	margin-bottom: 20px;
}

.profile_image {
	width: 140px;
	height: 140px;
}

.profile_info {
	float: left;
	margin: 0 20px 0 20px;
	text-align: left;
}

.profile_info p {
	margin-left: 0;
}

.profile_update {
	float: right;
	margin-right: 20px;
	margin-top: 10px;
}

.mytravel {
	margin: auto;
	margin-top: 20px;
	width: 840px;
	min-height: 500px;
}

.card {
	width: 175px;
	height: 190px;
	border: 1px solid black;
	float: left;
	margin: 10px;
	padding: 5px;
	padding-top: 20px;
}

.card.last {
	border: 1px dashed black;
}

.travel_tit {
	font-size: 20px;
	font-weight: 600;
}

a {
	text-decoration: none;
	color: black;
}

.category {
	background-color: #68B984;
	width: 120px;
	margin: auto;
	padding: 2px;
	border-radius: 15px;
	color: white;
}

.category.a {
	background-color: #FED049;
}

.category.b {
	background-color: #3D5656;
}

.add {
	height: 40px;
	margin-top: 60px;
}

.insert_btn {
	width: 40px;
	height: 40px;
	border: none;
	background-color: white;
	float: left;
}

.add_img {
	width: 39px;
}

.add_label {
	line-height: 40px;
	vertical-align: middle;
}

.modal {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
}

.modal .bg {
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.6);
}

.modalBox {
	position: absolute;
	background-color: #fff;
	width: 400px;
	height: 200px;
	padding: 15px;
}

.modalBox button {
	display: block;
	width: 80px;
	margin: 0 auto;
}

.hidden {
	display: none;
}

.follower {
	width: 100%;
	height: 20px;
}

ul {
	list-style: none;
	padding-left: 0px;
	text-align: left;
}

.block {
	float: right;
}

.close {
	float: right;
	width: 20px;
	height: 20px;
	text-align: center;
}

.closeBtn:after {
	content: "\00d7";
	font-size: 20px;
}

.follower_img {
	width: 30px;
	height: 30px;
	margin-left: 10px;
	margin-right: 20px;
}

.follower_id {
	display: inline-block;
	line-height: 30px;
	vertical-align: top;
}
</style>
<body>
	<br>
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
					<p>홍길동</p>
					<p>honggildong@gmail.com</p>
					<p>010-1234-5678</p>
					<p class="openBtn">게시글 수 4 팔로워 4 팔로우 3</p>
				</div>
				<div class="profile_update">
					<a href='<c:url value="/mypage/update"/>'>
						<button type="button">회원정보수정</button>
					</a>
				</div>
			</div>
			<div class="mytravel">
				<a href='<c:url value="/travel/detail"/>'>
					<div class="card">
						<p class="travel_tit">서울 여행 코스</p>
						<p>2022.12.23-25</p>
						<p class="category a">체험/학습</p>
					</div>
				</a> <a href='<c:url value="/travel/detail"/>'>
					<div class="card">
						<p class="travel_tit">부산 여행 코스</p>
						<p>2022.11.20-21</p>
						<p class="category b">스포츠/문화</p>
					</div>
				</a> <a href='<c:url value="/travel/detail"/>'>
					<div class="card">
						<p class="travel_tit">강원도 여행 코스</p>
						<p>2022.8.13-17</p>
						<p class="category">자연/힐링</p>
					</div>
				</a> <a href='<c:url value="/travel/detail"/>'>
					<div class="card">
						<p class="travel_tit">경주 여행 코스</p>
						<p>2022.5.21-22</p>
						<p class="category a">체험/학습</p>
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
						팔로워
						<div class="close closeBtn"></div>
					</div>
					<ul>
						<li><img class="follower_img"
							src="${pageContext.request.contextPath}/resources/images/profile_img.jpg" /><label
							class="follower_id">dudtj1234</label>
							<button class="block">차단</button></li>
						<li><img class="follower_img"
							src="${pageContext.request.contextPath}/resources/images/profile_img.jpg" /><label
							class="follower_id">moomoogayoung</label>
							<button class="block">차단</button></li>
						<li><img class="follower_img"
							src="${pageContext.request.contextPath}/resources/images/profile_img.jpg" /><label
							class="follower_id">jungrimlee</label>
							<button class="block">차단</button></li>
						<li><img class="follower_img"
							src="${pageContext.request.contextPath}/resources/images/profile_img.jpg" /><label
							class="follower_id">youngseo98</label>
							<button class="block">차단</button></li>
					</ul>

				</div>
			</div>

			<script>
  const open = () => {
    document.querySelector(".modal").classList.remove("hidden");
  }

  const close = () => {
    document.querySelector(".modal").classList.add("hidden");
  }

  document.querySelector(".openBtn").addEventListener("click", open);
  document.querySelector(".closeBtn").addEventListener("click", close);
  document.querySelector(".bg").addEventListener("click", close);

</script>


		</div>
	</div>
</body>
<%@ include file="../common/footer.jsp"%>
</html>