<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<style>
.container_top {
	text-align: center;
}

.container {
	width: 1000px;
	min-height: 1000px;
	margin: auto;
}

.mypage_title {
	text-align: center;
}

.profile {
	width: 800px;
	border-bottom: 2px solid #A4A4A4;
	padding: 20px;
	height: 150px;
	margin: auto;
}

.profile_img {
	float: left;
	border: 1px solid black;
	width: 120px;
	height: 120px;
	margin: 10px;
}

.profile_image {
	width: 120px;
	height: 120px;
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
	width: 800px;
	min-height: 500px;
}

.card {
	width: 150px;
	height: 180px;
	border: 1px solid black;
	float: left;
	margin: 15px;
	padding: 5px;
}

.travel_title {
	font-size: 18px;
	font-weight: 600;
}
a{
	text-decoration: none;
	color:black;
}

.category {
	background-color: #D0A9F5;
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

li {
	line-height: 30px;
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
.follower_img{
	width:30px;
	height:30px;
	margin-left:10px;
	margin-right:20px;
	
}
.follower_id{
	display: inline-block;
    line-height: 30px;
    vertical-align: top;
}
</style>
<body>
	<%@ include file="../common/header.jsp"%>
	<br>
	<br>
	<br>
	<br>
	<div class="container_top">
		<div class="container">
			<h2 class="mypage_title">마이페이지</h2>
			<br>
			<div class="profile">
				<div class="profile_img">
					<img class="profile_image"
						src="${pageContext.request.contextPath}/resources/images/profile.jpg" />
				</div>
				<div class="profile_info">
					<p>홍길동</p>
					<p>honggildong@gmail.com</p>
					<p class="openBtn">게시글 수 4 팔로워 4 팔로우 3</p>
				</div>
				<div class="profile_update">
					<a href='/mypage/update'>
						<button type="button">회원정보수정</button>
					</a>
				</div>
			</div>
			<div class="mytravel">
				<a href='<c:url value="/travel/detail"/>'>
					<div class="card">
						<p>서울 여행 코스</p>
						<p>2022.12.23-25</p>
						<div class="category">
							<p>체험/학습</p>
						</div>
					</div>
				</a> <a href='<c:url value="/travel/detail"/>'>
					<div class="card">
						<p>부산 여행 코스</p>
						<p>2022.11.20-21</p>
						<p class="category">스포츠/문화</p>
					</div>
				</a> <a href='<c:url value="/travel/detail"/>'>
					<div class="card">
						<p>강원도 여행 코스</p>
						<p>2022.8.13-17</p>
						<p class="category">자연/힐링</p>
					</div>
				</a> <a href='<c:url value="/travel/detail"/>'>
					<div class="card">
						<p>경주 여행 코스</p>
						<p>2022.5.21-22</p>
						<p class="category">체험/학습</p>
					</div>
				</a>
			</div>

			<div class="modal hidden">
				<div class="bg"></div>
				<div class="modalBox">
					<div class="follower">
						팔로워
						<div class="close closeBtn"></div>
					</div>
					<ul>
						<li><img class="follower_img"
							src="${pageContext.request.contextPath}/resources/images/profile_img.jpg" /><label class="follower_id">dudtj1234</label>
							<button class="block">차단</button></li>
						<li><img class="follower_img"
							src="${pageContext.request.contextPath}/resources/images/profile_img.jpg" /><label class="follower_id">moomoogayoung</label>
							<button class="block">차단</button></li>
						<li><img class="follower_img"
							src="${pageContext.request.contextPath}/resources/images/profile_img.jpg" /><label class="follower_id">jungrimlee</label>
							<button class="block">차단</button></li>
						<li><img class="follower_img"
							src="${pageContext.request.contextPath}/resources/images/profile_img.jpg" /><label class="follower_id">youngseo98</label>
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
</html>